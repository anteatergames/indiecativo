﻿using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Design;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.IO;
using System.Text;

namespace IndieVisible.Infra.Data.Context
{
    public class IndieVisibleContextFactory : IDesignTimeDbContextFactory<IndieVisibleContext>
    {

        public IndieVisibleContextFactory() : base()
        {
        }

        public IndieVisibleContext CreateDbContext(string[] args)
        {
            var builder = new DbContextOptionsBuilder<IndieVisibleContext>();

            IConfigurationRoot configuration = new ConfigurationBuilder()
                .SetBasePath(Directory.GetCurrentDirectory())
                .AddJsonFile("appsettings.json")
                .AddEnvironmentVariables()
                .Build();

            string connectionString = configuration.GetConnectionString("DefaultConnection");

            builder.UseSqlServer(connectionString, b => b.MigrationsAssembly("IndieVisible.Infra.Data"));

            return new IndieVisibleContext(builder.Options);
        }
    }
}
