﻿using IndieVisible.Domain.Interfaces.Repository;
using IndieVisible.Domain.Interfaces.Service;
using IndieVisible.Domain.Models;
using System;
using System.Collections.Generic;
using System.Linq;

namespace IndieVisible.Domain.Services
{
    public class UserConnectionDomainService : BaseDomainService<UserConnection, IUserConnectionRepository>, IUserConnectionDomainService
    {
        public UserConnectionDomainService(IUserConnectionRepository repository) : base(repository)
        {
        }

        public IEnumerable<UserConnection> GetByTargetUserId(Guid targetUserId)
        {
            IQueryable<UserConnection> connnections = this.repository.Get(x => x.TargetUserId == targetUserId);

            return connnections.ToList();
        }

        public UserConnection Get(Guid originalUserId, Guid connectedUserId)
        {
            UserConnection existingConnection = this.repository.Get(x => x.UserId == originalUserId && x.TargetUserId == connectedUserId).FirstOrDefault();

            return existingConnection;
        }

        public bool CheckConnection(Guid originalUserId, Guid connectedUserId, bool accepted, bool bothWays)
        {
            var exists = this.repository.Get(x => x.UserId == originalUserId && x.TargetUserId == connectedUserId && x.ApprovalDate.HasValue == accepted).Any();

            if (bothWays)
            {
                var existsToMe = this.repository.Get(x => x.UserId == connectedUserId && x.TargetUserId == originalUserId && x.ApprovalDate.HasValue == accepted).Any();

                exists = exists || existsToMe;
            }

            return exists;
        }
    }
}
