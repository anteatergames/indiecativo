﻿using IndieVisible.Domain.Interfaces.Repository;
using IndieVisible.Domain.Models;
using IndieVisible.Infra.Data.Context;

namespace IndieVisible.Infra.Data.Repository
{
    public class TeamMemberRepositorySql : RepositorySql<TeamMember>, ITeamMemberRepositorySql
    {
        public TeamMemberRepositorySql(IndieVisibleContext context) : base(context)
        {
        }
    }
}
