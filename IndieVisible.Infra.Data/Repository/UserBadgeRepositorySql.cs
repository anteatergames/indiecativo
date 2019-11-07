﻿using IndieVisible.Domain.Interfaces.Repository;
using IndieVisible.Domain.Models;
using IndieVisible.Infra.Data.Context;

namespace IndieVisible.Infra.Data.Repository
{
    public class UserBadgeRepositorySql : RepositorySql<UserBadge>, IUserBadgeRepositorySql
    {
        public UserBadgeRepositorySql(IndieVisibleContext context) : base(context)
        {
        }
    }
}
