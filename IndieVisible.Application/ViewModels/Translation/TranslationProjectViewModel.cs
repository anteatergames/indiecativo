﻿using IndieVisible.Domain.Core.Enums;
using System;
using System.Collections.Generic;
using System.Text;

namespace IndieVisible.Application.ViewModels.Translation
{
    public class TranslationProjectViewModel : UserGeneratedBaseViewModel
    {
        public Guid GameId { get; set; }

        public SupportedLanguage PrimaryLanguage { get; set; }

        public List<TranslationTermViewModel> Terms { get; set; }

        public List<TranslationEntryViewModel> Entries { get; set; }
    }
}
