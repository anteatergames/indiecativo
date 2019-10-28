﻿using IndieVisible.Domain.Interfaces.Base;
using IndieVisible.Domain.Models;
using System;

namespace IndieVisible.Domain.Interfaces.Repository
{
    public interface IProfileRepository : IRepositorySql<UserProfile>
    {
        void UpdateNameOnThePlatform(Guid userId, string newName);
    }
}
