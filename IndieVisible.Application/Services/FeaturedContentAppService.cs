﻿using AutoMapper;
using AutoMapper.QueryableExtensions;
using IndieVisible.Application.Formatters;
using IndieVisible.Application.Helpers;
using IndieVisible.Application.Interfaces;
using IndieVisible.Application.ViewModels.Content;
using IndieVisible.Application.ViewModels.FeaturedContent;
using IndieVisible.Application.ViewModels.Home;
using IndieVisible.Domain.Core.Enums;
using IndieVisible.Domain.Interfaces.Infrastructure;
using IndieVisible.Domain.Models;
using IndieVisible.Domain.ValueObjects;
using IndieVisible.Infra.Data.MongoDb.Interfaces;
using IndieVisible.Domain.Interfaces.Repository;
using System;
using System.Collections.Generic;
using System.Linq;

namespace IndieVisible.Application.Services
{
    public class FeaturedContentAppService : BaseAppService, IFeaturedContentAppService
    {
        private readonly IFeaturedContentRepository featuredContentRepository;
        private readonly IUserContentRepository contentRepository;

        public FeaturedContentAppService(IMapper mapper
            , IUnitOfWork unitOfWork
            , ICacheService cacheService
            , IFeaturedContentRepository featuredContentRepository
            , IUserContentRepository contentRepository) : base(mapper, unitOfWork, cacheService)
        {
            this.featuredContentRepository = featuredContentRepository;
            this.contentRepository = contentRepository;
        }

        #region ICrudAppService

        public OperationResultVo<int> Count(Guid currentUserId)
        {
            try
            {
                System.Threading.Tasks.Task<int> task = featuredContentRepository.Count();
                task.Wait();
                int count = task.Result;

                return new OperationResultVo<int>(count);
            }
            catch (Exception ex)
            {
                return new OperationResultVo<int>(ex.Message);
            }
        }

        public OperationResultListVo<FeaturedContentViewModel> GetAll(Guid currentUserId)
        {
            try
            {
                IQueryable<FeaturedContent> allModels = featuredContentRepository.Get();

                IEnumerable<FeaturedContentViewModel> vms = mapper.Map<IEnumerable<FeaturedContent>, IEnumerable<FeaturedContentViewModel>>(allModels);

                return new OperationResultListVo<FeaturedContentViewModel>(vms);
            }
            catch (Exception ex)
            {
                return new OperationResultListVo<FeaturedContentViewModel>(ex.Message);
            }
        }

        public OperationResultVo<FeaturedContentViewModel> GetById(Guid currentUserId, Guid id)
        {
            try
            {
                System.Threading.Tasks.Task<FeaturedContent> task = featuredContentRepository.GetById(id);
                task.Wait();
                FeaturedContent model = task.Result;

                FeaturedContentViewModel vm = mapper.Map<FeaturedContentViewModel>(model);

                return new OperationResultVo<FeaturedContentViewModel>(vm);
            }
            catch (Exception ex)
            {
                return new OperationResultVo<FeaturedContentViewModel>(ex.Message);
            }
        }

        public OperationResultVo<Guid> Save(Guid currentUserId, FeaturedContentViewModel viewModel)
        {
            try
            {
                FeaturedContent model;

                System.Threading.Tasks.Task<FeaturedContent> task = featuredContentRepository.GetById(viewModel.Id);
                task.Wait();
                FeaturedContent existing = task.Result;

                if (existing != null)
                {
                    model = mapper.Map(viewModel, existing);
                }
                else
                {
                    model = mapper.Map<FeaturedContent>(viewModel);
                }

                if (viewModel.Id == Guid.Empty)
                {
                    featuredContentRepository.Add(model);
                    viewModel.Id = model.Id;
                }
                else
                {
                    featuredContentRepository.Update(model);
                }

                unitOfWork.Commit();

                return new OperationResultVo<Guid>(model.Id);
            }
            catch (Exception ex)
            {
                return new OperationResultVo<Guid>(ex.Message);
            }
        }

        public OperationResultVo Remove(Guid currentUserId, Guid id)
        {
            try
            {
                // validate before

                featuredContentRepository.Remove(id);

                unitOfWork.Commit();

                return new OperationResultVo(true);
            }
            catch (Exception ex)
            {
                return new OperationResultVo(ex.Message);
            }
        }

        #endregion ICrudAppService

        public CarouselViewModel GetFeaturedNow()
        {
            var now = DateTime.Now;
            IQueryable<FeaturedContent> allModels = featuredContentRepository.Get(x => x.StartDate <= now && (!x.EndDate.HasValue || x.EndDate > now));

            if (allModels.Any())
            {
                IEnumerable<FeaturedContentViewModel> vms = allModels.ProjectTo<FeaturedContentViewModel>(mapper.ConfigurationProvider);

                CarouselViewModel model = new CarouselViewModel
                {
                    Items = vms.OrderByDescending(x => x.CreateDate).ToList()
                };

                foreach (var vm in model.Items)
                {
                    var imageSplit = vm.ImageUrl.Split("/");
                    var userId = vm.OriginalUserId == Guid.Empty ? vm.UserId : vm.OriginalUserId;

                    vm.FeaturedImage = ContentHelper.SetFeaturedImage(userId, imageSplit.Last(), ImageType.Full);
                    vm.FeaturedImageLquip = ContentHelper.SetFeaturedImage(userId, imageSplit.Last(), ImageType.LowQuality);
                }

                return model;
            }
            else
            {
                CarouselViewModel fake = FakeData.FakeCarousel();

                return fake;
            }
        }

        public OperationResultVo<Guid> Add(Guid userId, Guid contentId, string title, string introduction)
        {
            try
            {
                FeaturedContent newFeaturedContent = new FeaturedContent
                {
                    UserContentId = contentId
                };

                System.Threading.Tasks.Task<UserContent> task = contentRepository.GetById(contentId);

                task.Wait();

                UserContent content = task.Result;

                newFeaturedContent.Title = string.IsNullOrWhiteSpace(title) ? content.Title : title;
                newFeaturedContent.Introduction = string.IsNullOrWhiteSpace(introduction) ? content.Introduction : introduction;

                newFeaturedContent.ImageUrl = string.IsNullOrWhiteSpace(content.FeaturedImage) || content.FeaturedImage.Equals(Constants.DefaultFeaturedImage) ? Constants.DefaultFeaturedImage : UrlFormatter.Image(content.UserId, BlobType.FeaturedImage, content.FeaturedImage);

                newFeaturedContent.FeaturedImage = content.FeaturedImage;

                newFeaturedContent.StartDate = DateTime.Now;
                newFeaturedContent.Active = true;
                newFeaturedContent.UserId = userId;
                newFeaturedContent.OriginalUserId = content.UserId;

                featuredContentRepository.Add(newFeaturedContent);

                unitOfWork.Commit();

                return new OperationResultVo<Guid>(newFeaturedContent.Id);
            }
            catch (Exception ex)
            {
                return new OperationResultVo<Guid>(ex.Message);
            }
        }

        public IEnumerable<UserContentToBeFeaturedViewModel> GetContentToBeFeatured()
        {
            IQueryable<UserContent> finalList = contentRepository.Get();
            List<FeaturedContent> featured = featuredContentRepository.Get().ToList();

            List<UserContentToBeFeaturedViewModel> viewModels = finalList.ProjectTo<UserContentToBeFeaturedViewModel>(mapper.ConfigurationProvider).ToList();

            foreach (UserContentToBeFeaturedViewModel item in viewModels)
            {
                FeaturedContent featuredNow = featured.FirstOrDefault(x => x.UserContentId == item.Id && x.StartDate.Date <= DateTime.Today && (!x.EndDate.HasValue || (x.EndDate.HasValue && x.EndDate.Value.Date > DateTime.Today)));

                if (featuredNow != null)
                {
                    item.CurrentFeatureId = featuredNow.Id;
                }

                item.IsFeatured = item.CurrentFeatureId.HasValue;

                item.AuthorName = string.IsNullOrWhiteSpace(item.AuthorName) ? Constants.UnknownSoul : item.AuthorName;

                item.TitleCompliant = !string.IsNullOrWhiteSpace(item.Title) && item.Title.Length <= 25;

                item.IntroCompliant = !string.IsNullOrWhiteSpace(item.Introduction) && item.Introduction.Length <= 55;

                item.ContentCompliant = !string.IsNullOrWhiteSpace(item.Content) && item.Content.Length >= 800;

                item.IsArticle = !string.IsNullOrWhiteSpace(item.Title) && !string.IsNullOrWhiteSpace(item.Introduction);
            }

            viewModels = viewModels.OrderByDescending(x => x.IsFeatured).ToList();

            return viewModels;
        }

        public OperationResultVo Unfeature(Guid id)
        {
            try
            {
                System.Threading.Tasks.Task<FeaturedContent> task = featuredContentRepository.GetById(id);
                task.Wait();
                FeaturedContent existing = task.Result;

                if (existing != null)
                {
                    existing.EndDate = DateTime.Now;

                    existing.Active = false;

                    featuredContentRepository.Update(existing);

                    unitOfWork.Commit();
                }

                return new OperationResultVo(true);
            }
            catch (Exception ex)
            {
                return new OperationResultVo(ex.Message);
            }
        }
    }
}