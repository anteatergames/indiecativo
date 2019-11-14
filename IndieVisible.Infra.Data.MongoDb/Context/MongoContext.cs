﻿using IndieVisible.Infra.Data.MongoDb.Interfaces;
using Microsoft.Extensions.Configuration;
using MongoDB.Driver;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;

namespace IndieVisible.Infra.Data.MongoDb.Context
{
    public sealed class MongoContext : IMongoContext
    {
        private IMongoDatabase Database { get; set; }
        public MongoClient MongoClient { get; set; }
        private readonly List<Func<Task>> _commands;
        public IClientSessionHandle Session { get; set; }

        public bool HasPendingCommands => _commands.Any();

        private readonly IConfiguration _configuration;

        public MongoContext(IConfiguration configuration)
        {
            _configuration = configuration;

            _commands = new List<Func<Task>>();
        }

        private void ConfigureMongo()
        {
            if (MongoClient != null)
                return;

            var cs = _configuration["MongoSettings:Connection"];
            MongoClient = new MongoClient(cs);

            var dbName = _configuration["MongoSettings:DatabaseName"];
            Database = MongoClient.GetDatabase(dbName);

        }

        public async Task<int> SaveChanges()
        {
            ConfigureMongo();

            using (Session = await MongoClient.StartSessionAsync())
            {
                Session.StartTransaction();

                var commandTasks = _commands.Select(c => c());

                await Task.WhenAll(commandTasks);

                await Session.CommitTransactionAsync();
            }

            var count = _commands.Count;

            _commands.Clear();

            return count;
        }

        public IMongoCollection<T> GetCollection<T>(string name)
        {
            ConfigureMongo();
            return Database.GetCollection<T>(name);
        }

        public void Dispose()
        {
            Session?.Dispose();
            GC.SuppressFinalize(this);
        }

        public void AddCommand(Func<Task> func)
        {
            _commands.Add(func);
        }
    }
}
