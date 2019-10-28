﻿using AutoMapper;
using AutoMapper.QueryableExtensions;
using IndieVisible.Application.Formatters;
using IndieVisible.Application.Interfaces;
using IndieVisible.Application.ViewModels.Brainstorm;
using IndieVisible.Application.ViewModels.Content;
using IndieVisible.Domain.Core.Enums;
using IndieVisible.Domain.Interfaces.Service;
using IndieVisible.Domain.Models;
using IndieVisible.Domain.ValueObjects;
using System;
using System.Collections.Generic;
using System.Linq;

namespace IndieVisible.Application.Services
{
    public class BrainstormAppService : BaseAppService, IBrainstormAppService
    {
        private readonly IMapper mapper;
        private readonly Infra.Data.MongoDb.Interfaces.IUnitOfWork unitOfWork;
        private readonly IGamificationDomainService gamificationDomainService;

        private readonly Infra.Data.MongoDb.Interfaces.Repository.IBrainstormRepository brainstormRepository;

        public BrainstormAppService(IMapper mapper
            , Infra.Data.MongoDb.Interfaces.IUnitOfWork unitOfWork
            , IGamificationDomainService gamificationDomainService
            , Infra.Data.MongoDb.Interfaces.Repository.IBrainstormRepository brainstormRepository)
        {
            this.mapper = mapper;
            this.unitOfWork = unitOfWork;
            this.gamificationDomainService = gamificationDomainService;

            this.brainstormRepository = brainstormRepository;
        }

        #region ICrudAppService
        public OperationResultVo<int> Count(Guid currentUserId)
        {
            try
            {
                int count = brainstormRepository.Count().Result;

                return new OperationResultVo<int>(count);
            }
            catch (Exception ex)
            {
                return new OperationResultVo<int>(ex.Message);
            }
        }

        public OperationResultListVo<BrainstormIdeaViewModel> GetAll(Guid currentUserId)
        {
            return new OperationResultListVo<BrainstormIdeaViewModel>("Not Implemented");
        }

        public OperationResultVo<BrainstormIdeaViewModel> GetById(Guid currentUserId, Guid id)
        {
            try
            {
                BrainstormIdea idea = brainstormRepository.GetIdea(id).Result;
                BrainstormSession session = brainstormRepository.GetById(idea.SessionId).Result; // TODO get just session userId

                BrainstormIdeaViewModel vm = mapper.Map<BrainstormIdeaViewModel>(idea);

                vm.UserContentType = UserContentType.Idea;
                vm.VoteCount = brainstormRepository.CountVotesByIdea(vm.Id).Result;
                vm.Score = brainstormRepository.SumVotesByIdea(vm.Id).Result;
                vm.CurrentUserVote = brainstormRepository.GetVote(id, currentUserId).Result?.VoteValue ?? VoteValue.Neutral;

                vm.CommentCount = brainstormRepository.CountCommentsByIdea(vm.Id).Result;

                IQueryable<BrainstormComment> comments = brainstormRepository.GetCommentsByIdea(vm.Id).Result.AsQueryable();

                IQueryable<BrainstormCommentViewModel> commentsVm = comments.ProjectTo<BrainstormCommentViewModel>(mapper.ConfigurationProvider);

                vm.Comments = commentsVm.OrderBy(x => x.CreateDate).ToList();

                foreach (BrainstormCommentViewModel comment in vm.Comments)
                {
                    comment.AuthorName = string.IsNullOrWhiteSpace(comment.AuthorName) ? "Unknown soul" : comment.AuthorName;
                    comment.AuthorPicture = UrlFormatter.ProfileImage(comment.UserId);
                    comment.Text = string.IsNullOrWhiteSpace(comment.Text) ? "this is the sound... of silence..." : comment.Text;
                }

                vm.Permissions.CanEdit = currentUserId == session.UserId;

                return new OperationResultVo<BrainstormIdeaViewModel>(vm);
            }
            catch (Exception ex)
            {
                return new OperationResultVo<BrainstormIdeaViewModel>(ex.Message);
            }
        }

        public OperationResultVo Remove(Guid currentUserId, Guid id)
        {
            return new OperationResultVo("Not Implemented");
        }

        public OperationResultVo<Guid> Save(Guid currentUserId, BrainstormIdeaViewModel viewModel)
        {
            try
            {
                BrainstormSession session = brainstormRepository.Get(x => x.Id == viewModel.SessionId).FirstOrDefault();

                BrainstormIdea model;

                BrainstormIdea existing = brainstormRepository.GetIdea(viewModel.Id).Result;
                if (existing != null)
                {
                    model = mapper.Map(viewModel, existing);
                }
                else
                {
                    model = mapper.Map<BrainstormIdea>(viewModel);
                }

                model.SessionId = session.Id;

                if (model.Id == Guid.Empty)
                {
                    brainstormRepository.AddIdea(model);
                }
                else
                {
                    brainstormRepository.UpdateIdea(model);
                }

                gamificationDomainService.ProcessAction(viewModel.UserId, PlatformAction.IdeaSuggested);

                unitOfWork.Commit();

                return new OperationResultVo<Guid>(model.Id);
            }
            catch (Exception ex)
            {
                return new OperationResultVo<Guid>(ex.Message);
            }
        }
        #endregion

        public OperationResultVo Vote(Guid userId, Guid ideaId, VoteValue vote)
        {
            try
            {
                BrainstormVote model;
                BrainstormIdea idea = brainstormRepository.GetIdea(ideaId).Result;

                BrainstormVote existing = brainstormRepository.GetVote(ideaId, userId).Result;
                if (existing != null)
                {
                    model = existing;
                    model.VoteValue = vote;
                }
                else
                {
                    model = new BrainstormVote
                    {
                        UserId = userId,
                        IdeaId = ideaId,
                        SessionId = idea.SessionId,
                        VoteValue = vote
                    };
                }

                if (model.Id == Guid.Empty)
                {
                    brainstormRepository.AddVote(model);
                }
                else
                {
                    brainstormRepository.UpdateVote(model);
                }

                unitOfWork.Commit();

                return new OperationResultVo<Guid>(model.Id);
            }
            catch (Exception ex)
            {
                return new OperationResultVo<Guid>(ex.Message);
            }
        }

        public OperationResultVo Comment(UserContentCommentViewModel vm)
        {
            try
            {
                BrainstormIdea idea = brainstormRepository.GetIdea(vm.UserContentId).Result;
                BrainstormComment model = new BrainstormComment
                {
                    UserId = vm.UserId,
                    IdeaId = vm.UserContentId,
                    SessionId = idea.SessionId,
                    Text = vm.Text,
                    AuthorName = vm.AuthorName,
                    AuthorPicture = vm.AuthorPicture
                };

                brainstormRepository.AddComment(model);

                unitOfWork.Commit();

                return new OperationResultVo<Guid>(model.Id);
            }
            catch (Exception ex)
            {
                return new OperationResultVo<Guid>(ex.Message);
            }
        }

        public OperationResultVo<BrainstormSessionViewModel> GetSession(Guid sessionId)
        {
            try
            {
                IQueryable<BrainstormSession> allMain = brainstormRepository.Get(x => x.Id == sessionId);

                BrainstormSession main = allMain.FirstOrDefault();

                BrainstormSessionViewModel vm = mapper.Map<BrainstormSessionViewModel>(main);

                return new OperationResultVo<BrainstormSessionViewModel>(vm);
            }
            catch (Exception ex)
            {
                return new OperationResultVo<BrainstormSessionViewModel>(ex.Message);
            }
        }

        /// <summary>
        /// Get the most recent session of type
        /// </summary>
        /// <param name="userId"></param>
        /// <param name="type"></param>
        /// <returns></returns>
        public OperationResultVo<BrainstormSessionViewModel> GetSession(Guid userId, BrainstormSessionType type)
        {
            try
            {
                BrainstormSession model = brainstormRepository.GetAll().Result.LastOrDefault(x => x.Type == type);

                BrainstormSessionViewModel vm = mapper.Map<BrainstormSessionViewModel>(model);

                return new OperationResultVo<BrainstormSessionViewModel>(vm);
            }
            catch (Exception ex)
            {
                return new OperationResultVo<BrainstormSessionViewModel>(ex.Message);
            }
        }

        public OperationResultListVo<BrainstormSessionViewModel> GetSessions(Guid userId)
        {
            try
            {
                IEnumerable<BrainstormSession> allModels = brainstormRepository.GetAll().Result;

                IEnumerable<BrainstormSessionViewModel> vms = mapper.Map<IEnumerable<BrainstormSession>, IEnumerable<BrainstormSessionViewModel>>(allModels);

                vms = vms.OrderBy(x => x.Type).ThenBy(x => x.CreateDate);

                return new OperationResultListVo<BrainstormSessionViewModel>(vms);
            }
            catch (Exception ex)
            {
                return new OperationResultListVo<BrainstormSessionViewModel>(ex.Message);
            }
        }

        public OperationResultVo<Guid> SaveSession(BrainstormSessionViewModel vm)
        {
            try
            {
                BrainstormSession model;

                BrainstormSession existing = brainstormRepository.GetById(vm.Id).Result;
                if (existing != null)
                {
                    model = mapper.Map(vm, existing);
                }
                else
                {
                    model = mapper.Map<BrainstormSession>(vm);
                }

                if (vm.Id == Guid.Empty)
                {
                    brainstormRepository.Add(model);
                    vm.Id = model.Id;
                }
                else
                {
                    brainstormRepository.Update(model);
                }

                unitOfWork.Commit();

                return new OperationResultVo<Guid>(model.Id);
            }
            catch (Exception ex)
            {
                return new OperationResultVo<Guid>(ex.Message);
            }
        }

        public OperationResultListVo<BrainstormIdeaViewModel> GetAllBySessionId(Guid userId, Guid sessionId)
        {
            try
            {
                BrainstormSession session = brainstormRepository.GetById(sessionId).Result;
                IEnumerable<BrainstormIdea> allIdeas = brainstormRepository.GetIdeasBySession(sessionId).Result;
                IEnumerable<BrainstormVote> allVotes = brainstormRepository.GetVotesBySession(sessionId).Result;
                IEnumerable<BrainstormVote> currentUserVotes = allVotes.Where(y => y.UserId == userId);
                IEnumerable<BrainstormComment> allComments = brainstormRepository.GetCommentsBySession(sessionId).Result;

                IEnumerable<BrainstormIdeaViewModel> vms = mapper.Map<IEnumerable<BrainstormIdea>, IEnumerable<BrainstormIdeaViewModel>>(allIdeas);

                foreach (BrainstormIdeaViewModel item in vms)
                {
                    item.UserContentType = UserContentType.Idea;
                    item.VoteCount = allVotes.Count(x => x.IdeaId == item.Id);
                    item.Score = allVotes.Where(x => x.IdeaId == item.Id).Sum(x => (int)x.VoteValue);
                    item.CurrentUserVote = currentUserVotes.FirstOrDefault(x => x.IdeaId == item.Id)?.VoteValue ?? VoteValue.Neutral;

                    item.CommentCount = allComments.Count(x => x.IdeaId == item.Id);
                }

                vms = vms.OrderByDescending(x => x.Score).ThenByDescending(x => x.CreateDate);

                return new OperationResultListVo<BrainstormIdeaViewModel>(vms);
            }
            catch (Exception ex)
            {
                return new OperationResultListVo<BrainstormIdeaViewModel>(ex.Message);
            }
        }

        public OperationResultVo<BrainstormSessionViewModel> GetMainSession()
        {
            try
            {
                IQueryable<BrainstormSession> allMain = brainstormRepository.Get(x => x.Type == BrainstormSessionType.Main);

                BrainstormSession main = allMain.FirstOrDefault();

                BrainstormSessionViewModel vm = mapper.Map<BrainstormSessionViewModel>(main);

                return new OperationResultVo<BrainstormSessionViewModel>(vm);
            }
            catch (Exception ex)
            {
                return new OperationResultVo<BrainstormSessionViewModel>(ex.Message);
            }
        }

        public OperationResultVo ChangeStatus(Guid currentUserId, Guid ideaId, BrainstormIdeaStatus selectedStatus)
        {
            try
            {
                BrainstormIdea idea = brainstormRepository.GetIdea(ideaId).Result;

                if (idea == null)
                {
                    return new OperationResultVo("Idea not found!");
                }

                idea.Status = selectedStatus;

                brainstormRepository.UpdateIdea(idea);

                unitOfWork.Commit();

                return new OperationResultVo(true);
            }
            catch (Exception ex)
            {
                return new OperationResultVo(ex.Message);
            }
        }
    }
}
