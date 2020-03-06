﻿using IndieVisible.Domain.Models;
using System;
using System.Linq;
using System.Threading.Tasks;

namespace IndieVisible.Domain.Interfaces.Repository
{
    public interface ITranslationRepository : IRepository<TranslationProject>
    {
        int CountTerms(Func<TranslationTerm, bool> where);

        IQueryable<TranslationTerm> GetTerms(Guid translationProjectId);

        Task<bool> AddTerm(Guid translationProjectId, TranslationTerm term);

        Task<bool> RemoveTerm(Guid translationProjectId, Guid termId);

        Task<bool> UpdateTerm(Guid translationProjectId, TranslationTerm term);

               
        int CountEntries(Func<TranslationEntry, bool> where);

        IQueryable<TranslationEntry> GetEntries(Guid translationProjectId);

        Task<bool> AddEntry(Guid translationProjectId, TranslationEntry entry);

        Task<bool> RemoveEntry(Guid translationProjectId, Guid entryId);

        Task<bool> UpdateEntry(Guid translationProjectId, TranslationEntry entry);
    }
}