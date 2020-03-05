﻿using AutoMapper;
using IndieVisible.Application.Formatters;
using IndieVisible.Application.Interfaces;
using IndieVisible.Application.ViewModels.Translation;
using IndieVisible.Domain.Core.Enums;
using IndieVisible.Domain.Core.Extensions;
using IndieVisible.Domain.Interfaces;
using IndieVisible.Domain.Interfaces.Infrastructure;
using IndieVisible.Domain.Interfaces.Service;
using IndieVisible.Domain.Models;
using IndieVisible.Domain.ValueObjects;
using System;
using System.Collections.Generic;
using System.Linq;

namespace IndieVisible.Application.Services
{
    public class TranslationAppService : ProfileBaseAppService, ITranslationAppService
    {
        private readonly ITranslationDomainService translationDomainService;
        private readonly IGameDomainService gameDomainService;
        private readonly IGamificationDomainService gamificationDomainService;

        public TranslationAppService(IMapper mapper
            , IUnitOfWork unitOfWork
            , ICacheService cacheService
            , IProfileDomainService profileDomainService
            , ITranslationDomainService translationDomainService
            , IGameDomainService gameDomainService
            , IGamificationDomainService gamificationDomainService) : base(mapper, unitOfWork, cacheService, profileDomainService)
        {
            this.translationDomainService = translationDomainService;
            this.gameDomainService = gameDomainService;
            this.gamificationDomainService = gamificationDomainService;
        }

        #region ICrudAppService
        public OperationResultVo<int> Count(Guid currentUserId)
        {
            try
            {
                int count = translationDomainService.Count();

                return new OperationResultVo<int>(count);
            }
            catch (Exception ex)
            {
                return new OperationResultVo<int>(ex.Message);
            }
        }

        public OperationResultListVo<TranslationProjectViewModel> GetAll(Guid currentUserId)
        {
            try
            {
                IEnumerable<TranslationProject> allModels = translationDomainService.GetAll();

                List<TranslationProjectViewModel> vms = mapper.Map<IEnumerable<TranslationProject>, IEnumerable<TranslationProjectViewModel>>(allModels).ToList();

                foreach (var item in vms)
                {
                    item.TermCount = item.Terms.Count;


                    var game = GetGameWithCache(gameDomainService, item.Game.Id);

                    item.Game.ThumbnailUrl = SetFeaturedImage(game.UserId, game?.ThumbnailUrl, ImageType.Full);
                    item.Game.ThumbnailResponsive = SetFeaturedImage(game.UserId, game?.ThumbnailUrl, ImageType.Responsive);
                    item.Game.ThumbnailLquip = SetFeaturedImage(game.UserId, game?.ThumbnailUrl, ImageType.LowQuality);
                    item.Game.DeveloperImageUrl = UrlFormatter.ProfileImage(game.UserId, 40);

                    UserProfile authorProfile = GetCachedProfileByUserId(item.UserId);
                    item.Game.DeveloperName = authorProfile.Name;

                    SetPermissions(currentUserId, item);
                }

                return new OperationResultListVo<TranslationProjectViewModel>(vms);
            }
            catch (Exception ex)
            {
                return new OperationResultListVo<TranslationProjectViewModel>(ex.Message);
            }
        }

        public OperationResultVo<TranslationProjectViewModel> GetById(Guid currentUserId, Guid id)
        {
            try
            {
                TranslationProject model = translationDomainService.GetById(id);

                if (model == null)
                {
                    return new OperationResultVo<TranslationProjectViewModel>("Translation Project not found!");
                }

                TranslationProjectViewModel vm = mapper.Map<TranslationProjectViewModel>(model);

                foreach (TranslationTermViewModel term in vm.Terms)
                {
                    UserProfile profile = GetCachedProfileByUserId(term.UserId);
                    if (profile != null)
                    {
                        term.AuthorName = profile.Name;
                        term.AuthorPicture = UrlFormatter.ProfileImage(term.UserId, 84);
                    }
                }

                SetPermissions(currentUserId, vm);

                return new OperationResultVo<TranslationProjectViewModel>(vm);
            }
            catch (Exception ex)
            {
                return new OperationResultVo<TranslationProjectViewModel>(ex.Message);
            }
        }

        public OperationResultVo Remove(Guid currentUserId, Guid id)
        {
            try
            {
                // validate before

                translationDomainService.Remove(id);

                unitOfWork.Commit();

                return new OperationResultVo(true, "That Translation Project is gone now!");
            }
            catch (Exception ex)
            {
                return new OperationResultVo(ex.Message);
            }
        }

        public OperationResultVo<Guid> Save(Guid currentUserId, TranslationProjectViewModel viewModel)
        {
            int pointsEarned = 0;

            try
            {
                TranslationProject model;

                TranslationProject existing = translationDomainService.GetById(viewModel.Id);
                if (existing != null)
                {
                    model = mapper.Map(viewModel, existing);
                }
                else
                {
                    model = mapper.Map<TranslationProject>(viewModel);
                }

                if (viewModel.Id == Guid.Empty)
                {
                    translationDomainService.Add(model);
                    viewModel.Id = model.Id;

                    pointsEarned += gamificationDomainService.ProcessAction(currentUserId, PlatformAction.JobPositionPost);
                }
                else
                {
                    translationDomainService.Update(model);
                }

                unitOfWork.Commit();

                viewModel.Id = model.Id;

                return new OperationResultVo<Guid>(model.Id, pointsEarned);
            }
            catch (Exception ex)
            {
                return new OperationResultVo<Guid>(ex.Message);
            }
        }
        #endregion


        public OperationResultVo GenerateNew(Guid currentUserId)
        {
            try
            {
                TranslationProject newJobPosition = translationDomainService.GenerateNewProject(currentUserId);

                TranslationProjectViewModel newVm = mapper.Map<TranslationProjectViewModel>(newJobPosition);

                return new OperationResultVo<TranslationProjectViewModel>(newVm);
            }
            catch (Exception ex)
            {
                return new OperationResultVo(ex.Message);
            }
        }

        public void SetPermissions(Guid currentUserId, TranslationProjectViewModel vm)
        {
            SetBasePermissions(currentUserId, vm);
        }

        private static string SetFeaturedImage(Guid userId, string thumbnailUrl, ImageType imageType)
        {

            if (string.IsNullOrWhiteSpace(thumbnailUrl) || Constants.DefaultGameThumbnail.NoExtension().Contains(thumbnailUrl.NoExtension()))
            {
                return Constants.DefaultGameThumbnail;
            }
            else
            {

                switch (imageType)
                {
                    case ImageType.LowQuality:
                        return UrlFormatter.Image(userId, BlobType.GameThumbnail, thumbnailUrl, 278, 10);
                    case ImageType.Responsive:
                        return UrlFormatter.Image(userId, BlobType.GameThumbnail, thumbnailUrl, 0, 0, true);
                    case ImageType.Full:
                    default:
                        return UrlFormatter.Image(userId, BlobType.GameThumbnail, thumbnailUrl, 278);
                }
            }
        }
    }
}
