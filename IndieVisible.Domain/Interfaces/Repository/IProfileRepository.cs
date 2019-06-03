﻿using IndieVisible.Domain.Interfaces.Base;
using IndieVisible.Domain.Models;
using System;
using System.Collections.Generic;

namespace IndieVisible.Domain.Interfaces.Repository
{
    public interface IProfileRepository : IRepository<UserProfile>
    {
        IEnumerable<UserProfile> GetByUserId(Guid userId);
    }
}