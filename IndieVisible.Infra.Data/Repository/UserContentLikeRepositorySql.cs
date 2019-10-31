﻿using IndieVisible.Domain.Interfaces.Repository;
using IndieVisible.Domain.Models;
using IndieVisible.Infra.Data.Context;

namespace IndieVisible.Infra.Data.Repository
{
    public class UserContentLikeRepositorySql : Repository<UserContentLike>, IUserContentLikeRepositorySql
    {
        public UserContentLikeRepositorySql(IndieVisibleContext context) : base(context)
        {

        }
    }
}