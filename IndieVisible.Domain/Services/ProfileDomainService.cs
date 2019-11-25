﻿using IndieVisible.Domain.Interfaces.Service;
using IndieVisible.Domain.Models;
using IndieVisible.Domain.ValueObjects;
using IndieVisible.Infra.Data.MongoDb.Interfaces.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;

namespace IndieVisible.Domain.Services
{
    public class ProfileDomainService : BaseDomainMongoService<UserProfile, IUserProfileRepository>, IProfileDomainService
    {
        private readonly IUserConnectionRepository userConnectionRepository;

        public ProfileDomainService(IUserProfileRepository repository
            , IUserConnectionRepository userConnectionRepository) : base(repository)
        {
            this.userConnectionRepository = userConnectionRepository;
        }

        public IEnumerable<Guid> GetAllUserIds()
        {
            var allIds = Task.Run(async ()=> await repository.GetAllUserIds());

            return allIds.Result;
        }

        public void AddFollow(UserFollow model)
        {
            var task = repository.AddFollow(model.UserId, model.FollowUserId.Value);

            task.Wait();
        }

        public bool CheckFollowing(Guid userId, Guid folloWedUserId)
        {
            var task = repository.GetFollows(userId, folloWedUserId);

            task.Wait();

            var exists = task.Result.Any();

            return exists;
        }

        public int CountFollowers(Guid userId)
        {
            var task = repository.CountFollowers(userId);

            task.Wait();

            return task.Result;
        }

        public UserProfileEssentialVo GetBasicDataByUserId(Guid targetUserId)
        {
            var task = repository.GetBasicDataByUserId(targetUserId);

            task.Wait();

            return task.Result;
        }

        public IEnumerable<UserFollow> GetFollows(Guid userId, Guid followerId)
        {
            var task = Task.Run(async () => await repository.GetFollows(userId, followerId));

            return task.Result;
        }

        public void RemoveFollow(UserFollow existingFollow, Guid userFollowed)
        {
            var task = Task.Run(async () => await repository.RemoveFollower(existingFollow.UserId, userFollowed));

            task.Wait();
        }


        public void UpdateNameOnThePlatform(Guid userId, string newName)
        {
            //repositorySql.UpdateNameOnThePlatform(userId, newName);
        }

        #region Connection
        public int CountConnections(Expression<Func<UserConnection, bool>> where)
        {
            var task = userConnectionRepository.Count(where);
            task.Wait();
            return task.Result;
        }

        public void AddConnection(UserConnection model)
        {
            userConnectionRepository.Add(model);
        }

        public void RemoveConnection(Guid id)
        {
            userConnectionRepository.Remove(id);
        }

        public void UpdateConnection(UserConnection existing)
        {
            userConnectionRepository.Update(existing);
        }

        public IEnumerable<UserConnection> GetConnectionByTargetUserId(Guid targetUserId, bool approvedOnly)
        {
            IQueryable<UserConnection> connections = userConnectionRepository.Get(x => x.TargetUserId == targetUserId);

            if (approvedOnly)
            {
                connections = connections.Where(x => x.ApprovalDate.HasValue);
            }

            return connections.ToList();
        }

        public IEnumerable<UserConnection> GetConnectionByUserId(Guid userId, bool approvedOnly)
        {
            IQueryable<UserConnection> connections = userConnectionRepository.Get(x => x.UserId == userId);

            if (approvedOnly)
            {
                connections = connections.Where(x => x.ApprovalDate.HasValue);
            }

            return connections.ToList();
        }

        public UserConnection GetConnection(Guid originalUserId, Guid connectedUserId)
        {
            UserConnection existingConnection = userConnectionRepository.Get(x => x.UserId == originalUserId && x.TargetUserId == connectedUserId).FirstOrDefault();

            return existingConnection;
        }

        public bool CheckConnection(Guid originalUserId, Guid connectedUserId, bool accepted, bool bothWays)
        {
            bool exists = false;

            if (accepted)
            {
                exists = userConnectionRepository.Get(x => x.UserId == originalUserId && x.TargetUserId == connectedUserId && x.ApprovalDate.HasValue).Any();
            }
            else
            {
                exists = userConnectionRepository.Get(x => x.UserId == originalUserId && x.TargetUserId == connectedUserId && !x.ApprovalDate.HasValue).Any();
            }

            if (bothWays)
            {
                bool existsToMe = false;

                if (accepted)
                {
                    existsToMe = userConnectionRepository.Get(x => x.UserId == connectedUserId && x.TargetUserId == originalUserId && x.ApprovalDate.HasValue).Any();
                }
                else
                {
                    existsToMe = userConnectionRepository.Get(x => x.UserId == connectedUserId && x.TargetUserId == originalUserId && !x.ApprovalDate.HasValue).Any();
                }

                exists = exists || existsToMe;
            }

            return exists;
        }

        public List<UserConnection> GetConnectionsByUserId(Guid userId, bool approvedOnly)
        {
            IQueryable<UserConnection> connections = userConnectionRepository.Get(x => x.UserId == userId || x.TargetUserId == userId);

            if (approvedOnly)
            {
                connections = connections.Where(x => x.ApprovalDate.HasValue);
            }

            return connections.ToList();
        }
        #endregion
    }
}
