﻿using AutoMapper;
using AutoMapper.QueryableExtensions;
using IndieVisible.Application.Formatters;
using IndieVisible.Application.Interfaces;
using IndieVisible.Application.ViewModels.User;
using IndieVisible.Domain.Core.Attributes;
using IndieVisible.Domain.Core.Enums;
using IndieVisible.Domain.Core.Extensions;
using IndieVisible.Domain.Core.Interfaces;
using IndieVisible.Domain.Interfaces.Infrastructure;
using IndieVisible.Domain.Interfaces.Service;
using IndieVisible.Domain.Models;
using IndieVisible.Domain.Specifications.Follow;
using IndieVisible.Domain.ValueObjects;
using IndieVisible.Infra.Data.MongoDb.Interfaces;
using IndieVisible.Infra.Data.MongoDb.Interfaces.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;

namespace IndieVisible.Application.Services
{
    public class ProfileAppService : ProfileBaseAppService, IProfileAppService
    {
        private readonly IUserContentDomainService userContentDomainService;

        private readonly IGameRepository gameRepository;

        public ProfileAppService(IMapper mapper
            , IUnitOfWork unitOfWork
            , ICacheService cacheService
            , IProfileDomainService profileDomainService
            , IUserContentDomainService userContentDomainService
            , IGameRepository gameRepositoryMongo) : base(mapper, unitOfWork, cacheService, profileDomainService)
        {
            this.userContentDomainService = userContentDomainService;
            gameRepository = gameRepositoryMongo;
        }

        #region ICrudAppService

        public OperationResultVo<int> Count(Guid currentUserId)
        {
            try
            {
                int count = profileDomainService.Count();

                return new OperationResultVo<int>(count);
            }
            catch (Exception ex)
            {
                return new OperationResultVo<int>(ex.Message);
            }
        }

        public OperationResultListVo<ProfileViewModel> GetAll(Guid currentUserId)
        {
            try
            {
                List<UserProfile> profiles = new List<UserProfile>();
                IEnumerable<Guid> allIds = profileDomainService.GetAllUserIds();

                foreach (Guid id in allIds)
                {
                    UserProfile profile = cacheService.Get<Guid, UserProfile>(id);
                    if (profile == null)
                    {
                        UserProfile userProfile = profileDomainService.GetByUserId(id).FirstOrDefault();

                        if (userProfile != null)
                        {
                            profile = userProfile;
                            cacheService.Set(id, profile);
                        }
                    }
                    profiles.Add(profile);
                }

                IEnumerable<ProfileViewModel> vms = mapper.Map<IEnumerable<UserProfile>, IEnumerable<ProfileViewModel>>(profiles);

                foreach (ProfileViewModel vm in vms)
                {
                    UserProfile model = profiles.First(x => x.UserId == vm.UserId);

                    vm.ProfileImageUrl = UrlFormatter.ProfileImage(vm.UserId, 84);
                    vm.CoverImageUrl = UrlFormatter.ProfileCoverImage(vm.UserId, vm.Id, vm.LastUpdateDate, model.HasCoverImage, 300);
                }

                return new OperationResultListVo<ProfileViewModel>(vms);
            }
            catch (Exception ex)
            {
                return new OperationResultListVo<ProfileViewModel>(ex.Message);
            }
        }

        public OperationResultVo<ProfileViewModel> GetById(Guid currentUserId, Guid id)
        {
            try
            {
                UserProfile model = profileDomainService.GetById(id);

                ProfileViewModel vm = mapper.Map<ProfileViewModel>(model);

                return new OperationResultVo<ProfileViewModel>(vm);
            }
            catch (Exception ex)
            {
                return new OperationResultVo<ProfileViewModel>(ex.Message);
            }
        }

        public OperationResultVo Remove(Guid currentUserId, Guid id)
        {
            try
            {
                profileDomainService.Remove(id);

                unitOfWork.Commit();

                return new OperationResultVo(true);
            }
            catch (Exception ex)
            {
                return new OperationResultVo(ex.Message);
            }
        }

        public OperationResultVo<Guid> Save(Guid currentUserId, ProfileViewModel viewModel)
        {
            try
            {
                UserProfile model;

                if (viewModel.Bio.Contains(Constants.DefaultProfileDescription))
                {
                    viewModel.Bio = String.Format("{0} {1}", viewModel.Name, Constants.DefaultProfileDescription);
                }

                viewModel.ExternalLinks.RemoveAll(x => String.IsNullOrWhiteSpace(x.Value));

                UserProfile existing = profileDomainService.GetById(viewModel.Id);
                if (existing != null)
                {
                    SetFollowers(currentUserId, existing);

                    model = mapper.Map(viewModel, existing);
                }
                else
                {
                    model = mapper.Map<UserProfile>(viewModel);
                }

                if (model.Type == 0)
                {
                    model.Type = ProfileType.Personal;
                }

                model.HasCoverImage = !viewModel.CoverImageUrl.Equals(Constants.DefaultProfileCoverImage);

                if (viewModel.Id == Guid.Empty)
                {
                    profileDomainService.Add(model);
                    viewModel.Id = model.Id;
                }
                else
                {
                    profileDomainService.Update(model);
                }

                unitOfWork.Commit();

                cacheService.Set(viewModel.UserId, model);

                return new OperationResultVo<Guid>(model.Id);
            }
            catch (Exception ex)
            {
                return new OperationResultVo<Guid>(ex.Message);
            }
        }

        #endregion ICrudAppService

        #region IProfileAppService

        public UserProfileEssentialVo GetBasicDataByUserId(Guid userId)
        {
            UserProfileEssentialVo profile = profileDomainService.GetBasicDataByUserId(userId);

            return profile;
        }

        public ProfileViewModel GetByUserId(Guid userId, ProfileType type)
        {
            return GetByUserId(userId, userId, type, false);
        }

        public ProfileViewModel GetByUserId(Guid userId, ProfileType type, bool forEdit)
        {
            return GetByUserId(userId, userId, type, forEdit);
        }

        public ProfileViewModel GetByUserId(Guid currentUserId, Guid userId, ProfileType type)
        {
            return GetByUserId(currentUserId, userId, type, false);
        }

        public ProfileViewModel GetByUserId(Guid currentUserId, Guid userId, ProfileType type, bool forEdit)
        {
            ProfileViewModel vm = new ProfileViewModel();

            IEnumerable<UserProfile> profiles = profileDomainService.GetByUserId(userId);

            UserProfile model = profiles.FirstOrDefault(x => x.Type == type);

            if (profiles.Any() && model != null)
            {
                vm = mapper.Map(model, vm);
            }
            else
            {
                return null;
            }

            SetImages(vm, model.HasCoverImage);

            vm.Counters.Games = gameRepository.Count(x => x.UserId == vm.UserId).Result;
            vm.Counters.Posts = userContentDomainService.Count(x => x.UserId == vm.UserId);
            vm.Counters.Comments = userContentDomainService.CountComments(x => x.UserId == vm.UserId);

            vm.Counters.Followers = model.Followers.SafeCount();
            vm.Counters.Following = profileDomainService.CountFollows(userId);
            int connectionsToUser = profileDomainService.CountConnections(x => x.TargetUserId == vm.UserId && x.ApprovalDate.HasValue);
            int connectionsFromUser = profileDomainService.CountConnections(x => x.UserId == vm.UserId && x.ApprovalDate.HasValue);

            vm.Counters.Connections = connectionsToUser + connectionsFromUser;

            if (vm.UserId != currentUserId)
            {
                vm.CurrentUserFollowing = model.Followers.SafeAny(x => x.UserId == currentUserId);
                vm.ConnectionControl.CurrentUserConnected = profileDomainService.CheckConnection(currentUserId, vm.UserId, true, true);
                vm.ConnectionControl.CurrentUserWantsToFollowMe = profileDomainService.CheckConnection(vm.UserId, currentUserId, false, false);
                vm.ConnectionControl.ConnectionIsPending = profileDomainService.CheckConnection(currentUserId, vm.UserId, false, true);
            }

            if (forEdit)
            {
                FormatExternalLinksForEdit(vm);
            }

            FormatExternaLinks(vm);

            return vm;
        }

        #endregion IProfileAppService

        public ProfileViewModel GenerateNewOne(ProfileType type)
        {
            ProfileViewModel profile = new ProfileViewModel();

            RandomNumberGenerator randomGenerator = RandomNumberGenerator.Create();
            byte[] data = new byte[4];
            randomGenerator.GetBytes(data);
            int randomNumber = BitConverter.ToInt32(data);

            profile.Type = ProfileType.Personal;

            profile.Name = String.Format("NPC {0}", Math.Abs(randomNumber));
            profile.Motto = "It is dangerous out there, take this...";

            profile.Bio = String.Format("{0} {1}", profile.Name, Constants.DefaultProfileDescription);

            profile.StudioName = "Awesome Game Studio";
            profile.Location = "Atlantis";

            profile.ProfileImageUrl = Constants.DefaultAvatar;
            profile.CoverImageUrl = Constants.DefaultGameCoverImage;

            return profile;
        }

        public OperationResultVo Search(string term)
        {
            try
            {
                IQueryable<UserProfile> results = profileDomainService.Search(x => x.Name.ToLower().Contains(term.ToLower()));

                IQueryable<ProfileSearchViewModel> vms = results.ProjectTo<ProfileSearchViewModel>(mapper.ConfigurationProvider);

                return new OperationResultListVo<ProfileSearchViewModel>(vms);
            }
            catch (Exception ex)
            {
                return new OperationResultVo(ex.Message);
            }
        }

        public OperationResultVo UserFollow(Guid currentUserId, Guid userId)
        {
            try
            {
                UserFollow model = new UserFollow
                {
                    UserId = currentUserId,
                    FollowUserId = userId
                };

                ISpecification<UserFollow> spec = new IdNotEmptySpecification()
                    .And(new UserNotTheSameSpecification(userId));

                if (!spec.IsSatisfiedBy(model))
                {
                    return new OperationResultVo(false, spec.ErrorMessage);
                }

                bool alreadyFollowing = profileDomainService.CheckFollowing(currentUserId, userId);

                if (alreadyFollowing)
                {
                    return new OperationResultVo(false, "User already followed");
                }
                else
                {
                    profileDomainService.AddFollow(model);

                    unitOfWork.Commit();

                    int newCount = profileDomainService.CountFollows(userId);

                    return new OperationResultVo<int>(newCount);
                }
            }
            catch (Exception ex)
            {
                return new OperationResultVo(ex.Message);
            }
        }

        public OperationResultVo UserUnfollow(Guid currentUserId, Guid userId)
        {
            try
            {
                if (currentUserId == Guid.Empty)
                {
                    return new OperationResultVo("You must be logged in to unfollow a user.");
                }
                else
                {
                    UserFollow existingFollow = profileDomainService.GetFollows(userId, currentUserId).FirstOrDefault();

                    if (existingFollow == null)
                    {
                        return new OperationResultVo(false, "You are not following this user.");
                    }
                    else
                    {
                        profileDomainService.RemoveFollow(existingFollow, userId);

                        unitOfWork.Commit();

                        int newCount = profileDomainService.CountFollows(userId);

                        return new OperationResultVo<int>(newCount);
                    }
                }
            }
            catch (Exception ex)
            {
                return new OperationResultVo(ex.Message);
            }
        }

        #region UserConnection

        public OperationResultVo GetConnectionsByUserId(Guid userId)
        {
            try
            {
                List<UserConnection> connectionsFromDb = profileDomainService.GetConnectionsByUserId(userId, true);

                List<UserConnectionViewModel> connections = mapper.Map<List<UserConnectionViewModel>>(connectionsFromDb);

                List<UserConnectionViewModel> connectionsFormatted = FormatConnections(userId, connections);

                return new OperationResultListVo<UserConnectionViewModel>(connectionsFormatted);
            }
            catch (Exception ex)
            {
                return new OperationResultVo(ex.Message);
            }
        }

        public OperationResultVo Connect(Guid currentUserId, Guid userId)
        {
            try
            {
                UserConnection model = new UserConnection
                {
                    UserId = currentUserId,
                    TargetUserId = userId
                };

                UserConnection existing = profileDomainService.GetConnection(currentUserId, userId);

                if (existing != null)
                {
                    return new OperationResultVo("You are already connected to this user!");
                }
                else
                {
                    profileDomainService.AddConnection(model);
                }

                unitOfWork.Commit();

                int newCount = profileDomainService.CountConnections(x => x.TargetUserId == userId || x.UserId == userId && x.ApprovalDate.HasValue);

                return new OperationResultVo<int>(newCount);
            }
            catch (Exception ex)
            {
                return new OperationResultVo(ex.Message);
            }
        }

        public OperationResultVo Disconnect(Guid currentUserId, Guid userId)
        {
            try
            {
                // validate before

                UserConnection toMe = profileDomainService.GetConnection(currentUserId, userId);
                UserConnection fromMe = profileDomainService.GetConnection(userId, currentUserId);

                if (toMe == null && fromMe == null)
                {
                    return new OperationResultVo("You are not connected to this user!");
                }
                else
                {
                    if (toMe != null)
                    {
                        profileDomainService.RemoveConnection(toMe.Id);
                    }
                    if (fromMe != null)
                    {
                        profileDomainService.RemoveConnection(fromMe.Id);
                    }
                }

                unitOfWork.Commit();

                int newCount = profileDomainService.CountConnections(x => x.TargetUserId == userId);

                return new OperationResultVo<int>(newCount);
            }
            catch (Exception ex)
            {
                return new OperationResultVo(ex.Message);
            }
        }

        public OperationResultVo Allow(Guid currentUserId, Guid userId)
        {
            try
            {
                UserConnection existing = profileDomainService.GetConnection(userId, currentUserId);

                if (existing == null)
                {
                    return new OperationResultVo("There is no connection requested by this user.");
                }
                else
                {
                    existing.ApprovalDate = DateTime.Now;

                    profileDomainService.UpdateConnection(existing);
                }

                unitOfWork.Commit();

                int newCount = profileDomainService.CountConnections(x => x.TargetUserId == userId || x.UserId == userId && x.ApprovalDate.HasValue);

                return new OperationResultVo<int>(newCount);
            }
            catch (Exception ex)
            {
                return new OperationResultVo(ex.Message);
            }
        }

        public OperationResultVo Deny(Guid currentUserId, Guid userId)
        {
            try
            {
                UserConnection existing = profileDomainService.GetConnection(userId, currentUserId);

                if (existing == null)
                {
                    return new OperationResultVo("There is no connection requested by this user.");
                }
                else
                {
                    profileDomainService.RemoveConnection(existing.Id);
                }

                unitOfWork.Commit();

                int newCount = profileDomainService.CountConnections(x => x.TargetUserId == userId || x.UserId == userId && x.ApprovalDate.HasValue);

                return new OperationResultVo<int>(newCount);
            }
            catch (Exception ex)
            {
                return new OperationResultVo(ex.Message);
            }
        }

        #endregion UserConnection

        private static void SetFollowers(Guid currentUserId, UserProfile existing)
        {
            if (existing.Followers != null)
            {
                foreach (UserFollow follower in existing.Followers)
                {
                    if (follower.FollowUserId.HasValue && follower.FollowUserId != Guid.Empty && follower.UserId == currentUserId)
                    {
                        follower.UserId = follower.FollowUserId.Value;
                    }
                }
            }
        }

        private void SetImages(ProfileViewModel vm, bool hasCoverImage)
        {
            vm.ProfileImageUrl = UrlFormatter.ProfileImage(vm.UserId, vm.LastUpdateDate, 84);
            vm.CoverImageUrl = UrlFormatter.ProfileCoverImage(vm.UserId, vm.Id, vm.LastUpdateDate, hasCoverImage, 1110);
        }

        private static void FormatConnectionImages(UserConnectionViewModel item, UserProfileEssentialVo profile)
        {
            item.ProfileImageUrl = UrlFormatter.ProfileImage(item.TargetUserId);
            item.CoverImageUrl = UrlFormatter.ProfileCoverImage(item.TargetUserId, profile.Id, profile.LastUpdateDate, profile.HasCoverImage);
        }

        private List<UserConnectionViewModel> FormatConnections(Guid userId, IEnumerable<UserConnectionViewModel> connections)
        {
            List<UserConnectionViewModel> newList = new List<UserConnectionViewModel>();

            IEnumerable<UserConnectionViewModel> connectionsFromMe = connections.Where(x => x.UserId == userId && x.ApprovalDate.HasValue).ToList();
            IEnumerable<UserConnectionViewModel> connectionsToMe = connections.Where(x => x.TargetUserId == userId && x.ApprovalDate.HasValue).ToList();

            foreach (UserConnectionViewModel item in connectionsFromMe)
            {
                if (!newList.Any(x => x.UserId == item.TargetUserId))
                {
                    UserProfileEssentialVo profile = profileDomainService.GetBasicDataByUserId(item.TargetUserId);

                    item.UserId = userId;
                    item.TargetUserName = profile.Name;
                    item.Location = profile.Location;
                    item.CreateDate = profile.CreateDate;

                    FormatConnectionImages(item, profile);

                    newList.Add(item);
                }
            }

            foreach (UserConnectionViewModel item in connectionsToMe)
            {
                if (!newList.Any(x => x.UserId == item.UserId))
                {
                    UserProfileEssentialVo profile = profileDomainService.GetBasicDataByUserId(item.UserId);

                    item.TargetUserId = item.UserId;
                    item.UserId = userId;
                    item.TargetUserName = profile.Name;
                    item.ProfileId = profile.Id;
                    item.Location = profile.Location;
                    item.CreateDate = profile.CreateDate;

                    FormatConnectionImages(item, profile);

                    newList.Add(item);
                }
            }

            return newList;
        }

        private void FormatExternaLinks(ProfileViewModel vm)
        {
            foreach (UserProfileExternalLinkViewModel item in vm.ExternalLinks)
            {
                ExternalLinkInfoAttribute uiInfo = item.Provider.GetAttributeOfType<ExternalLinkInfoAttribute>();
                item.Display = uiInfo.Display;
                item.IconClass = uiInfo.Class;
                item.ColorClass = uiInfo.ColorClass;

                switch (item.Provider)
                {
                    case ExternalLinkProvider.Website:
                        item.Value = UrlFormatter.Website(item.Value);
                        break;

                    case ExternalLinkProvider.Facebook:
                        item.Value = UrlFormatter.Facebook(item.Value);
                        break;

                    case ExternalLinkProvider.Twitter:
                        item.Value = UrlFormatter.Twitter(item.Value);
                        break;

                    case ExternalLinkProvider.Instagram:
                        item.Value = UrlFormatter.Instagram(item.Value);
                        break;

                    case ExternalLinkProvider.Youtube:
                        item.Value = UrlFormatter.Youtube(item.Value);
                        break;

                    case ExternalLinkProvider.XboxLive:
                        item.Value = UrlFormatter.XboxLiveProfile(item.Value);
                        break;

                    case ExternalLinkProvider.PlaystationStore:
                        item.Value = UrlFormatter.PlayStationStoreProfile(item.Value);
                        break;

                    case ExternalLinkProvider.Steam:
                        item.Value = UrlFormatter.SteamGame(item.Value);
                        break;

                    case ExternalLinkProvider.GameJolt:
                        item.Value = UrlFormatter.GameJoltProfile(item.Value);
                        break;

                    case ExternalLinkProvider.ItchIo:
                        item.Value = UrlFormatter.ItchIoProfile(item.Value);
                        break;

                    case ExternalLinkProvider.GamedevNet:
                        item.Value = UrlFormatter.GamedevNetProfile(item.Value);
                        break;

                    case ExternalLinkProvider.IndieDb:
                        item.Value = UrlFormatter.IndieDbPofile(item.Value);
                        break;

                    case ExternalLinkProvider.UnityConnect:
                        item.Value = UrlFormatter.UnityConnectProfile(item.Value);
                        break;

                    case ExternalLinkProvider.GooglePlayStore:
                        item.Value = UrlFormatter.GooglePlayStoreProfile(item.Value);
                        break;

                    case ExternalLinkProvider.AppleAppStore:
                        item.Value = UrlFormatter.AppleAppStoreProfile(item.Value);
                        break;

                    case ExternalLinkProvider.IndiExpo:
                        item.Value = UrlFormatter.IndiExpoProfile(item.Value);
                        break;
                }
            }
        }

        private static void FormatExternalLinksForEdit(ProfileViewModel vm)
        {
            foreach (ExternalLinkProvider provider in Enum.GetValues(typeof(ExternalLinkProvider)))
            {
                UserProfileExternalLinkViewModel existingProvider = vm.ExternalLinks.FirstOrDefault(x => x.Provider == provider);
                ExternalLinkInfoAttribute uiInfo = provider.GetAttributeOfType<ExternalLinkInfoAttribute>();

                if (existingProvider == null)
                {
                    UserProfileExternalLinkViewModel placeHolder = new UserProfileExternalLinkViewModel
                    {
                        UserProfileId = vm.Id,
                        UserId = vm.UserId,
                        Type = uiInfo.Type,
                        Provider = provider,
                        Display = uiInfo.Display,
                        IconClass = uiInfo.Class,
                        IsStore = uiInfo.IsStore
                    };

                    vm.ExternalLinks.Add(placeHolder);
                }
                else
                {
                    existingProvider.Display = uiInfo.Display;
                    existingProvider.IconClass = uiInfo.Class;
                }
            }

            vm.ExternalLinks = vm.ExternalLinks.OrderByDescending(x => x.Type).ThenBy(x => x.Provider).ToList();
        }

        public void SetCache(Guid key, ProfileViewModel viewModel)
        {
            UserProfile model = mapper.Map<UserProfile>(viewModel);

            base.SetCache(viewModel.UserId, model);
        }

        public ProfileViewModel GetWithCache(Guid userId)
        {
            UserProfile model = base.GetFromCache(userId);

            if (model == null)
            {
                model = profileDomainService.GetById(userId);
            }

            ProfileViewModel viewModel = mapper.Map<ProfileViewModel>(model);

            return viewModel;
        }
    }
}