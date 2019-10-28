﻿using IndieVisible.Domain.Interfaces.Base;
using IndieVisible.Domain.Models;
using System.Linq;

namespace IndieVisible.Domain.Interfaces.Repository
{
    public interface IUserContentRepository : IRepositorySql<UserContent>
    {
        new IQueryable<UserContent> GetAll();
    }
}
