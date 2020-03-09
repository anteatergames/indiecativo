﻿using IndieVisible.Application.ViewModels.Translation;
using IndieVisible.Domain.Core.Enums;
using IndieVisible.Domain.ValueObjects;
using System;

namespace IndieVisible.Application.Interfaces
{
    public interface ITranslationAppService : ICrudAppService<TranslationProjectViewModel>, IPermissionControl<TranslationProjectViewModel>
    {
        OperationResultVo GenerateNew(Guid currentUserId);

        OperationResultVo GetByUserId(Guid currentUserId, Guid userId);

        OperationResultVo GetMyUntranslatedGames(Guid currentUserId);

        OperationResultVo GetTranslations(Guid currentUserId, Guid projectId, SupportedLanguage language);
    }
}