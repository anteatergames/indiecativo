﻿using IndieVisible.Domain.Models;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace IndieVisible.Domain.Interfaces.Repository
{
    public interface IJobPositionRepository : IRepository<JobPosition>
    {
        Task<bool> AddApplicant(Guid jobPositionId, JobApplicant applicant);
    }
}
