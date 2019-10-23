﻿using IndieVisible.Domain.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace IndieVisible.Infra.Data.MongoDb.Interfaces.Repository
{
    public interface IUserProfileRepository : IRepositorySql<UserProfile>
    {
    }
}
