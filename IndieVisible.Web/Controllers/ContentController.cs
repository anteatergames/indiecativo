﻿using IndieVisible.Application;
using IndieVisible.Application.Formatters;
using IndieVisible.Application.Interfaces;
using IndieVisible.Application.ViewModels.Content;
using IndieVisible.Application.ViewModels.Game;
using IndieVisible.Application.ViewModels.User;
using IndieVisible.Domain.Core.Enums;
using IndieVisible.Domain.ValueObjects;
using IndieVisible.Infra.CrossCutting.Identity.Models;
using IndieVisible.Web.Controllers.Base;
using IndieVisible.Web.Extensions;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace IndieVisible.Web.Controllers
{
    public class ContentController : SecureBaseController
    {
        private readonly IUserContentAppService service;
        private readonly IGameAppService gameAppService;
        private readonly IGameFollowAppService gameFollowAppService;
        private readonly IUserFollowAppService userFollowAppService;
        private readonly INotificationAppService notificationAppService;

        public ContentController(IUserContentAppService service
            , IGameAppService gameAppService
            , IGameFollowAppService gameFollowAppService
            , IUserFollowAppService userFollowAppService
            , INotificationAppService notificationAppService)
        {
            this.service = service;
            this.gameAppService = gameAppService;
            this.gameFollowAppService = gameFollowAppService;
            this.userFollowAppService = userFollowAppService;
            this.notificationAppService = notificationAppService;
        }

        [Route("content/{id:guid}")]
        public async Task<IActionResult> Details(Guid id, Guid notificationclicked)
        {
            OperationResultVo<UserContentViewModel> serviceResult = service.GetById(id);

            UserContentViewModel vm = serviceResult.Value;

            this.SetAuthorDetails(vm);

            if (vm.GameId.HasValue && vm.GameId.Value != Guid.Empty)
            {
                OperationResultVo<Application.ViewModels.Game.GameViewModel> gameServiceResult = gameAppService.GetById(vm.GameId.Value);

                Application.ViewModels.Game.GameViewModel game = gameServiceResult.Value;

                vm.GameTitle = game.Title;
                vm.GameThumbnail = UrlFormatter.Image(game.UserId, BlobType.GameThumbnail, game.ThumbnailUrl);
            }

            vm.Content = vm.Content.Replace("image-style-align-right", "image-style-align-right float-right p-10");
            vm.Content = vm.Content.Replace("image-style-align-left", "image-style-align-left float-left p-10");
            vm.Content = vm.Content.Replace("<img src=", @"<img class=""img-fluid"" src=");

            if (string.IsNullOrEmpty(vm.Title))
            {
                vm.Title = SharedLocalizer["Content posted on"] + " " + vm.CreateDate.ToString();
            }

            if (string.IsNullOrWhiteSpace(vm.Introduction))
            {
                vm.Introduction = SharedLocalizer["Content posted on"] + " " + vm.CreateDate.ToShortDateString();
            }


            ApplicationUser user = await UserManager.FindByIdAsync(CurrentUserId.ToString());
            bool userIsAdmin = user == null ? false : await UserManager.IsInRoleAsync(user, Roles.Administrator.ToString());
            vm.Permissions.CanEdit = vm.UserId == CurrentUserId || userIsAdmin;

            this.notificationAppService.MarkAsRead(notificationclicked);

            return View(vm);
        }

        [Route("content/edit/{id:guid}")]
        public IActionResult Edit(Guid id)
        {
            OperationResultVo<UserContentViewModel> serviceResult = service.GetById(id);

            UserContentViewModel vm = serviceResult.Value;

            IEnumerable<SelectListItemVo> games = gameAppService.GetByUser(vm.UserId);
            List<SelectListItem> gamesDropDown = games.ToSelectList();
            ViewBag.UserGames = gamesDropDown;

            return View("CreateEdit", vm);
        }

        public IActionResult Add(Guid? gameId)
        {
            UserContentViewModel vm = new UserContentViewModel();
            vm.UserId = CurrentUserId;
            vm.FeaturedImage = Constants.DefaultFeaturedImage;

            IEnumerable<SelectListItemVo> games = gameAppService.GetByUser(vm.UserId);
            List<SelectListItem> gamesDropDown = games.ToSelectList();
            ViewBag.UserGames = gamesDropDown;

            if (gameId.HasValue)
            {
                vm.GameId = gameId;
            }

            return View("CreateEdit", vm);
        }

        [HttpPost]
        public IActionResult Save(UserContentViewModel vm)
        {
            try
            {
                ProfileViewModel profile = this.SetAuthorDetails(vm);

                OperationResultVo<Guid> result = service.Save(vm);

                if (!result.Success)
                {

                    return Json(result);
                }
                else
                {
                    this.NotifyFollowers(this.CurrentUserId, profile, vm.GameId.Value, vm.Id);

                    string url = Url.Action("Index", "Home", new { area = string.Empty, id = vm.Id });

                    return Json(new OperationResultRedirectVo(url));
                }

            }
            catch (Exception ex)
            {
                return Json(new OperationResultVo(ex.Message));
            }
        }

        [HttpPost]
        [Route("content/post")]
        public IActionResult SimplePost(string text, string images)
        {

            UserContentViewModel vm = new UserContentViewModel();
            vm.Language = SupportedLanguage.English; // TODO need to get the user language
            vm.Content = text;

            ProfileViewModel profile = this.SetAuthorDetails(vm);

            this.SetContentImages(vm, images);

            OperationResultVo<Guid> result = service.Save(vm);

            this.NotifyFollowers(this.CurrentUserId, profile, vm.GameId, vm.Id);

            return Json(result);
        }

        public IActionResult Feed(Guid gameId, Guid userId)
        {
            return ViewComponent("UserContent", new { count = 10, gameId = gameId, userId = userId });
        }

        private void SetContentImages(UserContentViewModel vm, string images)
        {
            if (images != null)
            {
                string[] imgSplit = images.Split('|');
                vm.Images = new List<string>();

                for (int i = 0; i < imgSplit.Length; i++)
                {
                    if (!string.IsNullOrWhiteSpace(imgSplit[i]))
                    {
                        if (string.IsNullOrWhiteSpace(vm.FeaturedImage))
                        {
                            vm.FeaturedImage = imgSplit[i];
                        }
                        else
                        {
                            vm.Images.Add(imgSplit[i]);
                        }
                    }
                }
            }
        }

        private void NotifyFollowers(Guid userId, ProfileViewModel profile, Guid? gameId, Guid contentId)
        {
            Dictionary<Guid, FollowType> followers = new Dictionary<Guid, FollowType>();

            string notificationText = SharedLocalizer["{0} has posted a new content!"];
            string notificationUrl = Url.Action("Details", "Content", new { id = contentId });

            string gameName = string.Empty;

            Guid targetId = Guid.Empty;

            OperationResultListVo<UserFollowViewModel> userFollowers = this.userFollowAppService.GetByFollowedId(userId);

            if (userFollowers.Success)
            {
                foreach (UserFollowViewModel userFollower in userFollowers.Value)
                {
                    followers.Add(userFollower.UserId, FollowType.Content);
                }
            }

            if (gameId.HasValue)
            {
                OperationResultListVo<GameFollowViewModel> gameFollowResult = this.gameFollowAppService.GetByGameId(gameId.Value);

                OperationResultVo<GameViewModel> gameResult = gameAppService.GetById(gameId.Value);

                if (gameResult.Success)
                {
                    gameName = gameResult.Value.Title;
                }

                if (gameFollowResult.Success)
                {
                    foreach (GameFollowViewModel gameFollower in gameFollowResult.Value)
                    {
                        if (followers.ContainsKey(gameFollower.UserId))
                        {
                            followers[gameFollower.UserId] = FollowType.Game;
                        }
                        else
                        {
                            followers.Add(gameFollower.UserId, FollowType.Game);
                        }
                    }
                }
            }

            foreach (KeyValuePair<Guid, FollowType> follower in followers)
            {
                switch (follower.Value)
                {
                    case FollowType.Content:
                        this.notificationAppService.Notify(follower.Key, NotificationType.ContentPosted, targetId, String.Format(notificationText, profile.Name), notificationUrl);
                        break;
                    case FollowType.Game:
                        this.notificationAppService.Notify(follower.Key, NotificationType.ContentPosted, targetId, String.Format(notificationText, gameName), notificationUrl);
                        break;
                    default:
                        this.notificationAppService.Notify(follower.Key, NotificationType.ContentPosted, targetId, String.Format(notificationText, profile.Name), notificationUrl);
                        break;
                }
            }
        }
    }
}