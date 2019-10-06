﻿using AutoMapper;
using IndieVisible.Application.Interfaces;
using IndieVisible.Application.ViewModels.Game;
using IndieVisible.Domain.Interfaces.Base;
using IndieVisible.Domain.Interfaces.Service;
using IndieVisible.Domain.Models;
using IndieVisible.Domain.ValueObjects;
using System;
using System.Collections.Generic;

namespace IndieVisible.Application.Services
{
    public class GameFollowAppService : BaseAppService, IGameFollowAppService
    {
        private readonly IMapper mapper;
        private readonly IUnitOfWork unitOfWork;
        private readonly IGameFollowDomainService gameFollowDomainService;

        public GameFollowAppService(IMapper mapper, IUnitOfWork unitOfWork
            , IGameFollowDomainService gameFollowDomainService)
        {
            this.mapper = mapper;
            this.unitOfWork = unitOfWork;
            this.gameFollowDomainService = gameFollowDomainService;
        }

        #region ICrudAppService
        public OperationResultVo<int> Count(Guid currentUserId)
        {
            try
            {
                int count = gameFollowDomainService.Count();

                return new OperationResultVo<int>(count);
            }
            catch (Exception ex)
            {
                return new OperationResultVo<int>(ex.Message);
            }
        }

        public OperationResultListVo<GameFollowViewModel> GetAll(Guid currentUserId)
        {
            try
            {
                IEnumerable<GameFollow> allModels = this.gameFollowDomainService.GetAll();

                IEnumerable<GameFollowViewModel> vms = mapper.Map<IEnumerable<GameFollow>, IEnumerable<GameFollowViewModel>>(allModels);

                return new OperationResultListVo<GameFollowViewModel>(vms);
            }
            catch (Exception ex)
            {
                return new OperationResultListVo<GameFollowViewModel>(ex.Message);
            }
        }

        public OperationResultVo<GameFollowViewModel> GetById(Guid currentUserId, Guid id)
        {
            try
            {
                GameFollow model = this.gameFollowDomainService.GetById(id);

                GameFollowViewModel vm = mapper.Map<GameFollowViewModel>(model);

                return new OperationResultVo<GameFollowViewModel>(vm);
            }
            catch (Exception ex)
            {
                return new OperationResultVo<GameFollowViewModel>(ex.Message);
            }
        }

        public OperationResultVo Remove(Guid currentUserId, Guid id)
        {
            try
            {
                // validate before

                this.gameFollowDomainService.Remove(id);

                unitOfWork.Commit();

                return new OperationResultVo(true);
            }
            catch (Exception ex)
            {
                return new OperationResultVo(ex.Message);
            }
        }

        public OperationResultVo<Guid> Save(Guid currentUserId, GameFollowViewModel viewModel)
        {
            try
            {
                GameFollow model;

                GameFollow existing = this.gameFollowDomainService.GetById(viewModel.Id);
                if (existing != null)
                {
                    model = mapper.Map(viewModel, existing);
                }
                else
                {
                    model = mapper.Map<GameFollow>(viewModel);
                }

                if (viewModel.Id == Guid.Empty)
                {
                    this.gameFollowDomainService.Add(model);
                    viewModel.Id = model.Id;
                }
                else
                {
                    this.gameFollowDomainService.Update(model);
                }

                unitOfWork.Commit();

                return new OperationResultVo<Guid>(model.Id);
            }
            catch (Exception ex)
            {
                return new OperationResultVo<Guid>(ex.Message);
            }
        } 
        #endregion

        public OperationResultListVo<GameFollowViewModel> GetByGameId(Guid gameId)
        {
            try
            {
                IEnumerable<GameFollow> allModels = this.gameFollowDomainService.GetByGameId(gameId);

                IEnumerable<GameFollowViewModel> vms = mapper.Map<IEnumerable<GameFollow>, IEnumerable<GameFollowViewModel>>(allModels);

                return new OperationResultListVo<GameFollowViewModel>(vms);
            }
            catch (Exception ex)
            {
                return new OperationResultListVo<GameFollowViewModel>(ex.Message);
            }
        }
    }
}
