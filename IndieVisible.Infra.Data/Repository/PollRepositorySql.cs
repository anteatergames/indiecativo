﻿using IndieVisible.Domain.Interfaces.Repository;
using IndieVisible.Domain.Models;
using IndieVisible.Infra.Data.Context;

namespace IndieVisible.Infra.Data.Repository
{
    public class PollRepositorySql : RepositorySql<Poll>, IPollRepositorySql
    {
        public PollRepositorySql(IndieVisibleContext context) : base(context)
        {
        }
    }
}
