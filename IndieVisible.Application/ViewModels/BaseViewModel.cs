﻿using IndieVisible.Domain.Core.Interfaces;
using IndieVisible.Domain.ValueObjects;
using System;

namespace IndieVisible.Application.ViewModels
{
    public abstract class BaseViewModel : IEntity
    {
        public Guid Id { get; set; }

        public Guid UserId { get; set; }

        public DateTime CreateDate { get; set; }

        public DateTime? LastUpdateDate { get; set; }

        public bool CurrentUserLiked { get; set; }

        public bool CurrentUserFollowing { get; set; }

        public PermissionsVo Permissions { get; set; }

        protected BaseViewModel()
        {
            Permissions = new PermissionsVo();
            CreateDate = DateTime.Now;
        }
    }
}