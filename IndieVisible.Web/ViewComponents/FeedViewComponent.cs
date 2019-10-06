﻿using IndieVisible.Application.Interfaces;
using IndieVisible.Application.ViewModels.Content;
using IndieVisible.Application.ViewModels.UserPreferences;
using IndieVisible.Domain.Core.Enums;
using IndieVisible.Infra.CrossCutting.Identity.Models;
using IndieVisible.Web.Helpers;
using IndieVisible.Web.ViewComponents.Base;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace IndieVisible.Web.ViewComponents
{
    public class FeedViewComponent : BaseViewComponent
    {
        private UserManager<ApplicationUser> _userManager;
        public UserManager<ApplicationUser> UserManager => _userManager ?? (_userManager = HttpContext?.RequestServices.GetService<UserManager<ApplicationUser>>());

        private readonly IUserPreferencesAppService _userPreferencesAppService;

        private readonly IUserContentAppService _userContentAppService;

        public FeedViewComponent(IHttpContextAccessor httpContextAccessor, IUserContentAppService userContentAppService, IUserPreferencesAppService userPreferencesAppService) : base(httpContextAccessor)
        {
            _userContentAppService = userContentAppService;
            _userPreferencesAppService = userPreferencesAppService;
        }

        public async Task<IViewComponentResult> InvokeAsync(int count, Guid? gameId, Guid? userId, Guid? oldestId, DateTime? oldestDate)
        {
            UserPreferencesViewModel preferences = _userPreferencesAppService.GetByUserId(CurrentUserId);

            List<SupportedLanguage> languages = preferences.Languages;

            List<UserContentListItemViewModel> model = _userContentAppService.GetActivityFeed(CurrentUserId, count, gameId, userId, languages, oldestId, oldestDate).ToList();

            ApplicationUser user = await UserManager.FindByIdAsync(CurrentUserId.ToString());
            bool userIsAdmin = user != null && await UserManager.IsInRoleAsync(user, Roles.Administrator.ToString());

            foreach (UserContentListItemViewModel item in model)
            {
                item.Content = ContentHelper.FormatContentToShow(item.Content);

                item.Permissions.CanEdit = !item.HasPoll && (item.UserId == CurrentUserId || userIsAdmin);

                item.Permissions.CanDelete = item.UserId == CurrentUserId || userIsAdmin;
            }

            if (model.Any())
            {
                UserContentListItemViewModel oldest = model.OrderByDescending(x => x.CreateDate).Last();

                ViewData["OldestPostGuid"] = oldest.Id;
                ViewData["OldestPostDate"] = oldest.CreateDate.ToString("o");
            }

            ViewData["IsMorePosts"] = oldestId.HasValue;

            ViewData["UserId"] = userId;

            return await Task.Run(() => View(model));
        }
    }
}
