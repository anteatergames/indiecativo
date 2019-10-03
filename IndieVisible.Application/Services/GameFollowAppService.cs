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

        public OperationResultVo<int> Count()
        {
            OperationResultVo<int> result;

            try
            {
                int count = gameFollowDomainService.Count();

                result = new OperationResultVo<int>(count);
            }
            catch (Exception ex)
            {
                result = new OperationResultVo<int>(ex.Message);
            }

            return result;
        }

        public OperationResultListVo<GameFollowViewModel> GetAll(Guid currentUserId)
        {
            OperationResultListVo<GameFollowViewModel> result;

            try
            {
                IEnumerable<GameFollow> allModels = this.gameFollowDomainService.GetAll();

                IEnumerable<GameFollowViewModel> vms = mapper.Map<IEnumerable<GameFollow>, IEnumerable<GameFollowViewModel>>(allModels);

                result = new OperationResultListVo<GameFollowViewModel>(vms);
            }
            catch (Exception ex)
            {
                result = new OperationResultListVo<GameFollowViewModel>(ex.Message);
            }

            return result;
        }

        public OperationResultListVo<GameFollowViewModel> GetByGameId(Guid gameId)
        {
            OperationResultListVo<GameFollowViewModel> result;

            try
            {
                IEnumerable<GameFollow> allModels = this.gameFollowDomainService.GetByGameId(gameId);

                IEnumerable<GameFollowViewModel> vms = mapper.Map<IEnumerable<GameFollow>, IEnumerable<GameFollowViewModel>>(allModels);

                result = new OperationResultListVo<GameFollowViewModel>(vms);
            }
            catch (Exception ex)
            {
                result = new OperationResultListVo<GameFollowViewModel>(ex.Message);
            }

            return result;
        }

        public OperationResultVo<GameFollowViewModel> GetById(Guid id)
        {
            OperationResultVo<GameFollowViewModel> result;

            try
            {
                GameFollow model = this.gameFollowDomainService.GetById(id);

                GameFollowViewModel vm = mapper.Map<GameFollowViewModel>(model);

                result = new OperationResultVo<GameFollowViewModel>(vm);
            }
            catch (Exception ex)
            {
                result = new OperationResultVo<GameFollowViewModel>(ex.Message);
            }

            return result;
        }

        public OperationResultVo Remove(Guid id)
        {
            OperationResultVo result;

            try
            {
                // validate before

                this.gameFollowDomainService.Remove(id);

                unitOfWork.Commit();

                result = new OperationResultVo(true);
            }
            catch (Exception ex)
            {
                result = new OperationResultVo(ex.Message);
            }

            return result;
        }

        public OperationResultVo<Guid> Save(GameFollowViewModel viewModel)
        {
            OperationResultVo<Guid> result;

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

                result = new OperationResultVo<Guid>(model.Id);
            }
            catch (Exception ex)
            {
                result = new OperationResultVo<Guid>(ex.Message);
            }

            return result;
        }
    }
}
