﻿using IndieVisible.Domain.Interfaces.Repository;
using IndieVisible.Domain.Models;
using IndieVisible.Infra.Data.Context;

namespace IndieVisible.Infra.Data.Repository
{
    public class NotificationRepositorySql : Repository<Notification>, INotificationRepositorySql
    {
        public NotificationRepositorySql(IndieVisibleContext context) : base(context)
        {

        }
    }
}
