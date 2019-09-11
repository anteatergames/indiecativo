﻿using AutoMapper;
using AutoMapper.QueryableExtensions;
using IndieVisible.Application.Formatters;
using IndieVisible.Application.Interfaces;
using IndieVisible.Application.ViewModels.Content;
using IndieVisible.Application.ViewModels.Poll;
using IndieVisible.Application.ViewModels.Search;
using IndieVisible.Domain.Core.Enums;
using IndieVisible.Domain.Core.Extensions;
using IndieVisible.Domain.Interfaces.Base;
using IndieVisible.Domain.Interfaces.Repository;
using IndieVisible.Domain.Interfaces.Service;
using IndieVisible.Domain.Models;
using IndieVisible.Domain.ValueObjects;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;

namespace IndieVisible.Application.Services
{
    public class UserContentAppService : BaseAppService, IUserContentAppService
    {
        private readonly IMapper mapper;
        private readonly IUnitOfWork unitOfWork;
        private readonly IUserContentDomainService userContentDomainService;
        private readonly IUserContentLikeRepository likeRepository;
        private readonly IGamificationDomainService gamificationDomainService;
        private readonly IPollDomainService pollDomainService;
        private readonly IPollVoteDomainService pollVoteDomainService;

        public UserContentAppService(IMapper mapper, IUnitOfWork unitOfWork
            , IUserContentDomainService userContentDomainService
            , IUserContentLikeRepository likeRepository
            , IGamificationDomainService gamificationDomainService
            , IPollDomainService pollDomainService
            , IPollVoteDomainService pollVoteDomainService)
        {
            this.mapper = mapper;
            this.unitOfWork = unitOfWork;
            this.userContentDomainService = userContentDomainService;
            this.likeRepository = likeRepository;
            this.gamificationDomainService = gamificationDomainService;
            this.pollDomainService = pollDomainService;
            this.pollVoteDomainService = pollVoteDomainService;
        }

        public OperationResultVo<int> Count()
        {
            OperationResultVo<int> result;

            try
            {
                int count = userContentDomainService.GetAll().Count();

                result = new OperationResultVo<int>(count);
            }
            catch (Exception ex)
            {
                result = new OperationResultVo<int>(ex.Message);
            }

            return result;
        }

        public OperationResultListVo<UserContentViewModel> GetAll()
        {
            OperationResultListVo<UserContentViewModel> result;

            try
            {
                IEnumerable<UserContent> allModels = userContentDomainService.GetAll();

                IEnumerable<UserContentViewModel> vms = mapper.Map<IEnumerable<UserContent>, IEnumerable<UserContentViewModel>>(allModels);

                result = new OperationResultListVo<UserContentViewModel>(vms);
            }
            catch (Exception ex)
            {
                result = new OperationResultListVo<UserContentViewModel>(ex.Message);
            }

            return result;
        }

        public OperationResultVo<UserContentViewModel> GetById(Guid id)
        {
            OperationResultVo<UserContentViewModel> result;

            try
            {
                UserContent model = userContentDomainService.GetById(id);

                UserContentViewModel vm = mapper.Map<UserContentViewModel>(model);

                vm.UserContentType = UserContentType.Post;

                bool isYoutube = false;

                if (!string.IsNullOrWhiteSpace(vm.FeaturedImage))
                {
                    string youtubePattern = @"(https?\:\/\/)?(www\.youtube\.com|youtu\.?be)\/.+";

                    isYoutube = Regex.IsMatch(vm.FeaturedImage, youtubePattern);
                }

                vm.HasFeaturedImage = !string.IsNullOrWhiteSpace(vm.FeaturedImage) && !vm.FeaturedImage.Contains(Constants.DefaultFeaturedImage) && !isYoutube;

                vm.FeaturedMediaType = GetMediaType(vm.FeaturedImage);

                if (vm.FeaturedMediaType != MediaType.Youtube)
                {
                    vm.FeaturedImage = SetFeaturedImage(vm.UserId, vm.FeaturedImage);
                }


                vm.Poll = SetPoll(this.CurrentUserId, vm.Id);


                result = new OperationResultVo<UserContentViewModel>(vm);
            }
            catch (Exception ex)
            {
                result = new OperationResultVo<UserContentViewModel>(ex.Message);
            }

            return result;
        }

        public OperationResultVo Remove(Guid id)
        {
            OperationResultVo result;

            try
            {
                userContentDomainService.Remove(id);

                unitOfWork.Commit();

                result = new OperationResultVo(true);
            }
            catch (Exception ex)
            {
                result = new OperationResultVo(ex.Message);
            }

            return result;
        }

        public OperationResultVo<Guid> Save(UserContentViewModel viewModel)
        {
            OperationResultVo<Guid> result;

            try
            {
                UserContent model;

                bool isSpam = CheckSpam(viewModel.Id, viewModel.Content);

                if (isSpam)
                {
                    return new OperationResultVo<Guid>("Calm down! You cannot post the same content twice in a row.");
                }

                string youtubePattern = @"(https?\:\/\/)?(www\.youtube\.com|youtu\.?be)\/.+";

                viewModel.Content = Regex.Replace(viewModel.Content, youtubePattern, delegate (Match match)
                {
                    string v = match.ToString();
                    if (match.Index == 0 && String.IsNullOrWhiteSpace(viewModel.FeaturedImage))
                    {
                        viewModel.FeaturedImage = v;
                    }
                    return v;
                });

                UserContent existing = userContentDomainService.GetById(viewModel.Id);
                if (existing != null)
                {
                    model = mapper.Map(viewModel, existing);
                }
                else
                {
                    model = mapper.Map<UserContent>(viewModel);

                    PlatformAction action = viewModel.IsComplex || (viewModel.HasPoll && viewModel.Poll.PollOptions.Any()) ? PlatformAction.ComplexPost : PlatformAction.SimplePost;

                    this.gamificationDomainService.ProcessAction(viewModel.UserId, action);
                }

                if (viewModel.Id == Guid.Empty)
                {
                    userContentDomainService.Add(model);
                    viewModel.Id = model.Id;


                    if (viewModel.Poll != null && viewModel.Poll.PollOptions != null && viewModel.Poll.PollOptions.Any())
                    {
                        this.CreatePoll(viewModel);
                    }
                }
                else
                {
                    userContentDomainService.Update(model);
                }

                unitOfWork.Commit();

                result = new OperationResultVo<Guid>(model.Id);
            }
            catch (Exception ex)
            {
                result = new OperationResultVo<Guid>(ex.Message);
            }

            return result;
        }

        private bool CheckSpam(Guid id, string content)
        {
            IEnumerable<UserContent> all = userContentDomainService.GetAll();

            if (all.Any())
            {
                UserContent latest = all.OrderBy(x => x.CreateDate).Last();
                bool sameContent = latest.Content.Trim().ToLower().Replace(" ", string.Empty).Equals(content.Trim().ToLower().Replace(" ", string.Empty));
                bool sameId = latest.Id == id;

                return sameContent && !sameId;
            }
            else
            {
                return false;
            }
        }

        private void CreatePoll(UserContentViewModel contentVm)
        {
            List<PollOption> options = new List<PollOption>();

            foreach (PollOptionViewModel o in contentVm.Poll.PollOptions)
            {
                PollOption newOption = new PollOption
                {
                    UserId = contentVm.UserId,
                    Text = o.Text
                };

                options.Add(newOption);
            }

            Poll newPoll = new Poll
            {
                UserId = contentVm.UserId,
                UserContentId = contentVm.Id,
                Options = options
            };

            pollDomainService.Add(newPoll);
        }

        public int CountArticles()
        {
            int count = userContentDomainService.Count(x => !string.IsNullOrWhiteSpace(x.Title) && !string.IsNullOrWhiteSpace(x.Introduction));

            return count;
        }

        public IEnumerable<UserContentListItemViewModel> GetActivityFeed(Guid currentUserId, int count, Guid? gameId, Guid? userId, List<SupportedLanguage> languages, Guid? oldestId, DateTime? oldestDate)
        {
            IQueryable<UserContent> allModels = userContentDomainService.GetActivityFeed(gameId, userId, languages, oldestId, oldestDate);

            IOrderedQueryable<UserContent> orderedList = allModels
                .OrderByDescending(x => x.CreateDate);

            IQueryable<UserContent> finalList = orderedList.Take(count);

            List<UserContentListItemViewModel> viewModels = finalList.ProjectTo<UserContentListItemViewModel>(mapper.ConfigurationProvider).ToList();

            foreach (UserContentListItemViewModel item in viewModels)
            {
                item.AuthorName = string.IsNullOrWhiteSpace(item.AuthorName) ? "Unknown soul" : item.AuthorName;
                item.AuthorPicture = UrlFormatter.ProfileImage(item.UserId);

                item.IsArticle = !string.IsNullOrWhiteSpace(item.Title) && !string.IsNullOrWhiteSpace(item.Introduction);

                item.HasFeaturedImage = !string.IsNullOrWhiteSpace(item.FeaturedImage) && !item.FeaturedImage.Contains(Constants.DefaultFeaturedImage);

                item.FeaturedImageType = this.GetMediaType(item.FeaturedImage);

                if (item.FeaturedImageType != MediaType.Youtube)
                {
                    item.FeaturedImage = SetFeaturedImage(item.UserId, item.FeaturedImage);
                }

                item.LikeCount = likeRepository.GetAll().Count(x => x.ContentId == item.Id);

                item.CommentCount = userContentDomainService.CountComments(x => x.UserContentId == item.Id);

                LoadAuthenticatedData(currentUserId, item);

                item.UserContentType = UserContentType.Post;

                item.Poll = SetPoll(currentUserId, item.Id);
            }

            return viewModels;
        }

        private PollViewModel SetPoll(Guid currentUserId, Guid contentId)
        {
            PollViewModel pollVm = null;
            Poll poll = pollDomainService.GetByUserContentId(contentId);

            if (poll != null)
            {
                pollVm = new PollViewModel();
                IEnumerable<PollOption> options = pollDomainService.GetOptionsByPollId(poll.Id);

                int totalVotes = pollVoteDomainService.Count(x => x.PollId == poll.Id);
                pollVm.TotalVotes = totalVotes;

                foreach (PollOption o in options)
                {
                    PollOptionViewModel loadedOption = new PollOptionViewModel
                    {
                        Id = o.Id,
                        Text = o.Text
                    };

                    loadedOption.Votes = pollVoteDomainService.Count(x => x.PollOptionId == o.Id);
                    loadedOption.VotePercentage = loadedOption.Votes > 0 ? (loadedOption.Votes / (decimal)totalVotes) * 100 : 0;
                    loadedOption.CurrentUserVoted = pollVoteDomainService.CheckUserVoted(currentUserId, o.Id);

                    pollVm.PollOptions.Add(loadedOption);
                }
            }

            return pollVm;
        }

        private void LoadAuthenticatedData(Guid currentUserId, UserContentListItemViewModel item)
        {
            if (currentUserId != Guid.Empty)
            {
                item.CurrentUserLiked = likeRepository.GetAll().Any(x => x.ContentId == item.Id && x.UserId == currentUserId);

                IOrderedQueryable<UserContentComment> comments = userContentDomainService.GetComments(x => x.UserContentId == item.Id).OrderBy(x => x.CreateDate);

                IQueryable<UserContentCommentViewModel> commentsVm = comments.ProjectTo<UserContentCommentViewModel>(mapper.ConfigurationProvider);

                item.Comments = commentsVm.ToList();

                foreach (UserContentCommentViewModel comment in item.Comments)
                {
                    comment.AuthorName = string.IsNullOrWhiteSpace(comment.AuthorName) ? "Unknown soul" : comment.AuthorName;
                    comment.AuthorPicture = UrlFormatter.ProfileImage(comment.UserId);
                    comment.Text = string.IsNullOrWhiteSpace(comment.Text) ? "this is the sound... of silence..." : comment.Text;
                }
            }
        }

        private static string SetFeaturedImage(Guid userId, string featuredImage)
        {
            return string.IsNullOrWhiteSpace(featuredImage) || featuredImage.Equals(Constants.DefaultFeaturedImage) ? Constants.DefaultFeaturedImage : UrlFormatter.Image(userId, BlobType.FeaturedImage, featuredImage);
        }

        public OperationResultListVo<UserContentSearchViewModel> Search(Guid currentUserId, string q)
        {
            try
            {
                IQueryable<UserContent> all = userContentDomainService.Get(x => x.Content.Contains(q) || x.Introduction.Contains(q)).AsQueryable();

                IQueryable<UserContentSearchVo> selected = all.OrderByDescending(x => x.CreateDate)
                    .Select(x => new UserContentSearchVo
                    {
                        ContentId = x.Id,
                        Title = x.Title,
                        FeaturedImage = x.FeaturedImage,
                        Content = (string.IsNullOrWhiteSpace(x.Introduction) ? x.Content : x.Introduction).GetFirstWords(20),
                        Language = x.Language
                    });

                IQueryable<UserContentSearchViewModel> vms = selected.ProjectTo<UserContentSearchViewModel>(mapper.ConfigurationProvider);

                return new OperationResultListVo<UserContentSearchViewModel>(vms);
            }
            catch (Exception ex)
            {
                return new OperationResultListVo<UserContentSearchViewModel>(ex.Message);
            }
        }
    }
}