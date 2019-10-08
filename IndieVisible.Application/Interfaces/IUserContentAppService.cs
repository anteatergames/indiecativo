﻿using IndieVisible.Application.ViewModels.Content;
using IndieVisible.Application.ViewModels.Search;
using IndieVisible.Domain.Core.Enums;
using IndieVisible.Domain.ValueObjects;
using System;
using System.Collections.Generic;

namespace IndieVisible.Application.Interfaces
{
    public interface IUserContentAppService : ICrudAppService<UserContentViewModel>
    {
        IEnumerable<UserContentListItemViewModel> GetActivityFeed(Guid currentUserId, int count, Guid? gameId, Guid? userId, List<SupportedLanguage> languages, Guid? oldestId, DateTime? oldestDate, bool? articlesOnly);

        int CountArticles();

        OperationResultListVo<UserContentSearchViewModel> Search(Guid currentUserId, string q);
    }
}
