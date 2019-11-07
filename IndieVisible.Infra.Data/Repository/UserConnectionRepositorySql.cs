﻿using IndieVisible.Domain.Interfaces.Repository;
using IndieVisible.Domain.Models;
using IndieVisible.Infra.Data.Context;

namespace IndieVisible.Infra.Data.Repository
{
    public class UserConnectionRepositorySql : RepositorySql<UserConnection>, IUserConnectionRepositorySql
    {
        public UserConnectionRepositorySql(IndieVisibleContext context) : base(context)
        {

        }
    }
}
