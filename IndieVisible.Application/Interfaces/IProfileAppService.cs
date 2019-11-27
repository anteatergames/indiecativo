﻿using IndieVisible.Application.ViewModels.User;
using IndieVisible.Domain.Core.Enums;
using IndieVisible.Domain.ValueObjects;
using System;

namespace IndieVisible.Application.Interfaces
{
    public interface IProfileAppService : ICrudAppService<ProfileViewModel>
    {
        UserProfileEssentialVo GetBasicDataByUserId(Guid userId);

        ProfileViewModel GetByUserId(Guid userId, ProfileType type);

        ProfileViewModel GetByUserId(Guid userId, ProfileType type, bool forEdit);

        ProfileViewModel GetByUserId(Guid currentUserId, Guid userId, ProfileType type);

        ProfileViewModel GetByUserId(Guid currentUserId, Guid userId, ProfileType type, bool forEdit);

        ProfileViewModel GenerateNewOne(ProfileType type);

        OperationResultVo Search(string term);

        OperationResultVo UserFollow(Guid currentUserId, Guid userId);

        OperationResultVo UserUnfollow(Guid currentUserId, Guid userId);

        #region Connections

        OperationResultVo Connect(Guid currentUserId, Guid userId);

        OperationResultVo Disconnect(Guid currentUserId, Guid userId);

        OperationResultVo Allow(Guid currentUserId, Guid userId);

        OperationResultVo Deny(Guid currentUserId, Guid userId);

        OperationResultVo GetConnectionsByUserId(Guid userId);

        void SetCache(Guid key, ProfileViewModel viewModel);

        ProfileViewModel GetWithCache(Guid userId);

        #endregion Connections
    }
}