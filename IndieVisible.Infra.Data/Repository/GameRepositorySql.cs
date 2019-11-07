﻿using IndieVisible.Domain.Interfaces.Repository;
using IndieVisible.Domain.Models;
using IndieVisible.Infra.Data.Context;
using Microsoft.EntityFrameworkCore;
using System;
using System.Linq;

namespace IndieVisible.Infra.Data.Repository
{
    public class GameRepositorySql : RepositorySql<Game>, IGameRepositorySql
    {
        public GameRepositorySql(IndieVisibleContext context) : base(context)
        {
        }

        public override Game GetById(Guid id)
        {
            return DbSet.Where(x => x.Id == id).Include(x => x.ExternalLinks).FirstOrDefault();

        }

        public override IQueryable<Game> GetByUserId(Guid userId)
        {
            return DbSet.Where(x => x.UserId == userId).Include(x => x.ExternalLinks);
        }

        public override IQueryable<Game> GetAll()
        {
            return DbSet.Include(x => x.ExternalLinks);
        }
    }
}
