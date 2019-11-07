﻿using IndieVisible.Domain.Models;
using IndieVisible.Domain.ValueObjects;
using System;
using System.Collections.Generic;
using System.Linq.Expressions;

namespace IndieVisible.Domain.Interfaces.Service
{
    public interface IProfileDomainService : IDomainService<UserProfile>
    {
        int CountFollow(Expression<Func<UserFollow, bool>> where);

        IEnumerable<UserFollow> GetFollows(Expression<Func<UserFollow, bool>> where);

        void UpdateNameOnThePlatform(Guid userId, string newName);
        bool CheckFollowing(Guid userId, Guid folloWedUserId);
        void AddFollow(UserFollow model);
        void RemoveFollow(UserFollow existingFollow);
        UserProfileEssentialVo GetBasicDataByUserId(Guid targetUserId);

        #region UserConnection
        IEnumerable<UserConnection> GetConnectionByTargetUserId(Guid targetUserId, bool approvedOnly);
        IEnumerable<UserConnection> GetConnectionByUserId(Guid userId, bool approvedOnly);
        UserConnection GetConnection(Guid originalUserId, Guid connectedUserId);
        bool CheckConnection(Guid originalUserId, Guid connectedUserId, bool accepted, bool bothWays);
        int CountConnections(Expression<Func<UserConnection, bool>> where);
        void AddConnection(UserConnection model);
        void RemoveConnection(Guid id);
        void UpdateConnection(UserConnection existing);
        List<UserConnection> GetConnectionsByUserId(Guid userId, bool approvedOnly);
        #endregion
    }
}
