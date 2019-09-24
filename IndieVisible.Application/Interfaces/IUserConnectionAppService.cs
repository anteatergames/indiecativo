﻿using IndieVisible.Application.ViewModels.User;
using IndieVisible.Domain.ValueObjects;
using System;

namespace IndieVisible.Application.Interfaces
{
    public interface IUserConnectionAppService : ICrudAppService<UserConnectionViewModel>
    {
        OperationResultListVo<UserConnectionViewModel> GetByTargetUserId(Guid targetUserId);
        OperationResultListVo<UserConnectionViewModel> GetByUserId(Guid userId);
        OperationResultVo Connect(Guid currentUserId, Guid userId);
        OperationResultVo Disconnect(Guid currentUserId, Guid userId);
        OperationResultVo Allow(Guid currentUserId, Guid userId);
        OperationResultVo Deny(Guid currentUserId, Guid userId);
    }
}
