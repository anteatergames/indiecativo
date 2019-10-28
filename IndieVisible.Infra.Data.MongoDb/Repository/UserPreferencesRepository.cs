﻿using IndieVisible.Domain.Models;
using IndieVisible.Infra.Data.MongoDb.Interfaces;
using IndieVisible.Infra.Data.MongoDb.Interfaces.Repository;
using IndieVisible.Infra.Data.MongoDb.Repository.Base;
using System;
using System.Collections.Generic;
using System.Text;

namespace IndieVisible.Infra.Data.MongoDb.Repository
{
    public class UserPreferencesRepository : BaseRepository<UserPreferences>, IUserPreferencesRepository
    {
        public UserPreferencesRepository(IMongoContext context) : base(context)
        {
        }
    }
}
