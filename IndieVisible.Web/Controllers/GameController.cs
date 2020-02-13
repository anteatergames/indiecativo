﻿using IndieVisible.Application;
using IndieVisible.Application.Formatters;
using IndieVisible.Application.Interfaces;
using IndieVisible.Application.ViewModels.Game;
using IndieVisible.Application.ViewModels.User;
using IndieVisible.Domain.Core.Attributes;
using IndieVisible.Domain.Core.Enums;
using IndieVisible.Domain.Core.Extensions;
using IndieVisible.Domain.ValueObjects;
using IndieVisible.Infra.CrossCutting.Identity.Models;
using IndieVisible.Web.Controllers.Base;
using IndieVisible.Web.Enums;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace IndieVisible.Web.Controllers
{
    public class GameController : SecureBaseController
    {
        private readonly IGameAppService gameAppService;
        private readonly INotificationAppService notificationAppService;
        private readonly ITeamAppService teamAppService;

        public GameController(IGameAppService gameAppService
            , INotificationAppService notificationAppService
            , ITeamAppService teamAppService) : base()
        {
            this.gameAppService = gameAppService;
            this.notificationAppService = notificationAppService;
            this.teamAppService = teamAppService;
        }

        [Route("game/{id:guid}")]
        public async Task<IActionResult> Details(Guid id, int? pointsEarned, Guid notificationclicked)
        {
            notificationAppService.MarkAsRead(notificationclicked);

            OperationResultVo<GameViewModel> serviceResult = gameAppService.GetById(CurrentUserId, id);

            GameViewModel vm = serviceResult.Value;

            SetGameTeam(vm);

            SetImages(vm);

            FormatExternalLinks(vm);

            bool isAdmin = false;

            if (!CurrentUserId.Equals(Guid.Empty))
            {
                ApplicationUser user = await UserManager.FindByIdAsync(CurrentUserId.ToString());
                bool userIsAdmin = await UserManager.IsInRoleAsync(user, Roles.Administrator.ToString());

                isAdmin = user != null && userIsAdmin;
            }

            vm.Permissions.CanEdit = vm.UserId == CurrentUserId || isAdmin;
            vm.Permissions.CanPostActivity = vm.UserId == CurrentUserId;

            SetGamificationMessage(pointsEarned);

            return View(vm);
        }

        [Route("games/{genre:alpha?}")]
        public IActionResult List(GameGenre genre)
        {
            IEnumerable<GameListItemViewModel> latest = gameAppService.GetLatest(CurrentUserId, 99, Guid.Empty, null, genre);

            ViewBag.Games = latest;
            ViewData["Genre"] = genre;

            return View();
        }

        public IActionResult Add()
        {
            GameViewModel vm = new GameViewModel
            {
                Engine = GameEngine.Unity,
                UserId = CurrentUserId,
                CoverImageUrl = Constants.DefaultGameCoverImage,
                ThumbnailUrl = Constants.DefaultGameThumbnail
            };

            FormatExternalLinksForEdit(vm);

            SetMyTeamsSelectList();

            return View("CreateEdit", vm);
        }

        [Authorize]
        public IActionResult Edit(Guid id)
        {
            OperationResultVo<GameViewModel> serviceResult = gameAppService.GetById(CurrentUserId, id);

            GameViewModel vm = serviceResult.Value;

            FormatExternalLinksForEdit(vm);

            SetImages(vm);

            SetMyTeamsSelectList();

            return View("CreateEdit", vm);
        }

        [HttpPost]
        [Authorize]
        public IActionResult Save(GameViewModel vm, IFormFile thumbnail)
        {
            try
            {
                SetAuthorDetails(vm);
                ClearImagesUrl(vm);

                OperationResultVo<Guid> saveResult = gameAppService.Save(CurrentUserId, vm);

                if (!saveResult.Success)
                {
                    return Json(saveResult);
                }
                else
                {
                    string url = Url.Action("Details", "Game", new { area = string.Empty, id = vm.Id.ToString(), pointsEarned = saveResult.PointsEarned });

                    return Json(new OperationResultRedirectVo(url));
                }
            }
            catch (Exception ex)
            {
                return Json(new OperationResultVo(ex.Message));
            }
        }

        public IActionResult Latest(int qtd, Guid userId)
        {
            if (userId != Guid.Empty)
            {
                qtd = 10;
            }

            return ViewComponent("LatestGames", new { qtd, userId });
        }

        #region Game Like/Unlike

        [HttpPost]
        [Route("game/like")]
        public IActionResult LikeGame(Guid likedId)
        {
            OperationResultVo response = gameAppService.GameLike(CurrentUserId, likedId);

            OperationResultVo<GameViewModel> gameResult = gameAppService.GetById(CurrentUserId, likedId);

            string fullName = GetSessionValue(SessionValues.FullName);

            string text = String.Format(SharedLocalizer["{0} loves your game {1}!"], fullName, gameResult.Value.Title);

            string url = Url.Action("Details", "Game", new { id = likedId });

            notificationAppService.Notify(CurrentUserId, gameResult.Value.UserId, NotificationType.ContentLike, likedId, text, url);

            return Json(response);
        }

        [HttpPost]
        [Route("game/unlike")]
        public IActionResult UnLikeGame(Guid likedId)
        {
            OperationResultVo response = gameAppService.GameUnlike(CurrentUserId, likedId);

            return Json(response);
        }

        #endregion Game Like/Unlike

        #region Game Follow/Unfollow

        [HttpPost]
        [Route("game/follow")]
        public IActionResult FollowGame(Guid gameId)
        {
            OperationResultVo response = gameAppService.GameFollow(CurrentUserId, gameId);

            OperationResultVo<GameViewModel> gameResult = gameAppService.GetById(CurrentUserId, gameId);

            string fullName = GetSessionValue(SessionValues.FullName);

            string text = String.Format(SharedLocalizer["{0} is following your game {1} now!"], fullName, gameResult.Value.Title);

            string url = Url.Action("Details", "Profile", new { id = CurrentUserId });

            notificationAppService.Notify(CurrentUserId, gameResult.Value.UserId, NotificationType.ContentLike, gameId, text, url);

            return Json(response);
        }

        [HttpPost]
        [Route("game/unfollow")]
        public IActionResult UnFollowGame(Guid gameId)
        {
            OperationResultVo response = gameAppService.GameUnfollow(CurrentUserId, gameId);

            return Json(response);
        }

        #endregion Game Follow/Unfollow

        [Route("game/byteam/{teamId:guid}")]
        public IActionResult ByTeam(Guid teamId)
        {
            IEnumerable<GameListItemViewModel> games = gameAppService.GetLatest(CurrentUserId, 99, Guid.Empty, teamId, 0);

            return View("_Games", games);
        }

        private void SetImages(GameViewModel vm)
        {
            vm.ThumbnailUrl = string.IsNullOrWhiteSpace(vm.ThumbnailUrl) || Constants.DefaultGameThumbnail.NoExtension().Contains(vm.ThumbnailUrl.NoExtension()) ? Constants.DefaultGameThumbnail : UrlFormatter.Image(vm.UserId, BlobType.GameThumbnail, vm.ThumbnailUrl);

            vm.CoverImageUrl = string.IsNullOrWhiteSpace(vm.CoverImageUrl) || Constants.DefaultGameCoverImage.Contains(vm.CoverImageUrl) ? Constants.DefaultGameCoverImage : UrlFormatter.Image(vm.UserId, BlobType.GameCover, vm.CoverImageUrl);

            vm.AuthorPicture = UrlFormatter.ProfileImage(vm.UserId, 90);
        }

        private void SetAuthorDetails(GameViewModel vm)
        {
            if (vm.Id == Guid.Empty || vm.UserId == Guid.Empty || vm.UserId == CurrentUserId)
            {
                vm.UserId = CurrentUserId;
                ProfileViewModel profile = ProfileAppService.GetByUserId(CurrentUserId, ProfileType.Personal);

                if (profile != null)
                {
                    vm.AuthorName = profile.Name;
                    vm.AuthorPicture = profile.ProfileImageUrl;
                }
            }
        }

        private void ClearImagesUrl(GameViewModel vm)
        {
            vm.ThumbnailUrl = GetUrlLastPart(vm.ThumbnailUrl);
            vm.CoverImageUrl = GetUrlLastPart(vm.CoverImageUrl);
        }

        private static string GetUrlLastPart(string url)
        {
            if (string.IsNullOrWhiteSpace(url))
            {
                return url;
            }
            else
            {
                string[] split = url.Split('/');
                return split[split.Length - 1];
            }
        }

        private static void FormatExternalLinksForEdit(GameViewModel vm)
        {
            foreach (ExternalLinkProvider provider in Enum.GetValues(typeof(ExternalLinkProvider)))
            {
                GameExternalLinkViewModel existingProvider = vm.ExternalLinks.FirstOrDefault(x => x.Provider == provider);
                ExternalLinkInfoAttribute uiInfo = provider.GetAttributeOfType<ExternalLinkInfoAttribute>();

                if (uiInfo.Type != ExternalLinkType.ProfileOnly)
                {
                    if (existingProvider == null)
                    {
                        GameExternalLinkViewModel placeHolder = new GameExternalLinkViewModel
                        {
                            GameId = vm.Id,
                            UserId = vm.UserId,
                            Type = uiInfo.Type,
                            Provider = provider,
                            Display = uiInfo.Display,
                            IconClass = uiInfo.Class,
                            ColorClass = uiInfo.ColorClass,
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
            }

            vm.ExternalLinks = vm.ExternalLinks.OrderByDescending(x => x.Type).ThenBy(x => x.Provider).ToList();
        }

        private void FormatExternalLinks(GameViewModel vm)
        {
            ProfileViewModel authorProfile = ProfileAppService.GetWithCache(vm.UserId);
            UserProfileExternalLinkViewModel itchProfile = authorProfile.ExternalLinks.FirstOrDefault(x => x.Provider == ExternalLinkProvider.ItchIo);

            foreach (GameExternalLinkViewModel item in vm.ExternalLinks)
            {
                ExternalLinkInfoAttribute uiInfo = item.Provider.GetAttributeOfType<ExternalLinkInfoAttribute>();
                item.Display = uiInfo.Display;
                item.IconClass = uiInfo.Class;
                item.ColorClass = uiInfo.ColorClass;
                item.IsStore = uiInfo.IsStore;

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
                        item.Value = UrlFormatter.XboxLiveGame(item.Value);
                        break;

                    case ExternalLinkProvider.PlaystationStore:
                        item.Value = UrlFormatter.PlayStationStoreGame(item.Value);
                        break;

                    case ExternalLinkProvider.Steam:
                        item.Value = UrlFormatter.SteamGame(item.Value);
                        break;

                    case ExternalLinkProvider.GameJolt:
                        item.Value = UrlFormatter.GameJoltGame(item.Value);
                        break;

                    case ExternalLinkProvider.ItchIo:
                        item.Value = UrlFormatter.ItchIoGame(itchProfile?.Value, item.Value);
                        break;

                    case ExternalLinkProvider.GamedevNet:
                        item.Value = UrlFormatter.GamedevNetGame(item.Value);
                        break;

                    case ExternalLinkProvider.IndieDb:
                        item.Value = UrlFormatter.IndieDbGame(item.Value);
                        break;

                    case ExternalLinkProvider.UnityConnect:
                        item.Value = UrlFormatter.UnityConnectGame(item.Value);
                        break;

                    case ExternalLinkProvider.GooglePlayStore:
                        item.Value = UrlFormatter.GooglePlayStoreGame(item.Value);
                        break;

                    case ExternalLinkProvider.AppleAppStore:
                        item.Value = UrlFormatter.AppleAppStoreGame(item.Value);
                        break;

                    case ExternalLinkProvider.IndiExpo:
                        item.Value = UrlFormatter.IndiExpoGame(item.Value);
                        break;
                }
            }
        }

        private void SetMyTeamsSelectList()
        {
            OperationResultVo teamResult = teamAppService.GetSelectListByUserId(CurrentUserId);

            if (teamResult.Success)
            {
                OperationResultListVo<SelectListItemVo> result = (OperationResultListVo<SelectListItemVo>)teamResult;
                List<SelectListItemVo> items = result.Value.ToList();
                items.Add(new SelectListItemVo(SharedLocalizer["Create a new team (you can edit it later)"], Guid.Empty.ToString()));

                SelectList selectList = new SelectList(items, "Value", "Text");

                ViewData["MyTeams"] = selectList;
            }
        }

        private void SetGameTeam(GameViewModel vm)
        {
            if (vm.Team == null && vm.TeamId.HasValue)
            {
                OperationResultVo<Application.ViewModels.Team.TeamViewModel> teamResult = teamAppService.GetById(CurrentUserId, vm.TeamId.Value);

                if (teamResult.Success)
                {
                    vm.Team = teamResult.Value;
                    vm.Team.Permissions.CanEdit = vm.Team.Permissions.CanDelete = false;
                }
            }
        }
    }
}