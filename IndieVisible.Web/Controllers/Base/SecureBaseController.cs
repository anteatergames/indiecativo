﻿using IndieVisible.Application;
using IndieVisible.Application.Formatters;
using IndieVisible.Application.Interfaces;
using IndieVisible.Application.ViewModels;
using IndieVisible.Application.ViewModels.User;
using IndieVisible.Domain.Core.Enums;
using IndieVisible.Infra.CrossCutting.Identity.Models;
using IndieVisible.Web.Enums;
using IndieVisible.Web.Services;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Security.Claims;
using System.Threading.Tasks;

namespace IndieVisible.Web.Controllers.Base
{
    public class SecureBaseController : BaseController
    {
        private UserManager<ApplicationUser> _userManager;
        public UserManager<ApplicationUser> UserManager => _userManager ?? (_userManager = HttpContext?.RequestServices.GetService<UserManager<ApplicationUser>>());


        private IImageStorageService _imageStorageService;
        public IImageStorageService ImageStorageService => _imageStorageService ?? (_imageStorageService = HttpContext?.RequestServices.GetService<IImageStorageService>());


        private ICookieMgrService _cookieMgrService;
        public ICookieMgrService CookieMgrService => _cookieMgrService ?? (_cookieMgrService = HttpContext?.RequestServices.GetService<ICookieMgrService>());


        private IProfileAppService _profileAppService;
        public IProfileAppService ProfileAppService => _profileAppService ?? (_profileAppService = HttpContext?.RequestServices.GetService<IProfileAppService>());


        public Guid CurrentUserId { get; set; }

        public override void OnActionExecuting(ActionExecutingContext context)
        {
            base.OnActionExecuting(context);

            if (ViewBag.Username == null)
            {
                string username = Constants.DefaultUsername;

                if (User != null && User.Identity.IsAuthenticated)
                {
                    string userId = this.User.FindFirstValue(ClaimTypes.NameIdentifier);
                    CurrentUserId = new Guid(userId);

                    username = this.User.FindFirstValue(ClaimTypes.Name);

                    string sessionUserName = GetSessionValue(SessionValues.Username);

                    if (sessionUserName != null && !sessionUserName.Equals(username))
                    {
                        SetSessionValue(SessionValues.Username, username);
                    }

                    ViewBag.Username = username ?? Constants.DefaultUsername;
                    ViewBag.ProfileImage = UrlFormatter.ProfileImage(CurrentUserId);
                }
            }

            ViewBag.BaseUrl = base.GetBaseUrl();
        }

        protected string GetAvatar()
        {
            //userprofileimageurl = GetSessionValue(SessionValues.UserProfileImageUrl);
            return GetCookieValue(SessionValues.UserProfileImageUrl);
        }

        protected void SetAvatar(string profileImageUrl)
        {
            //SetSessionValue(SessionValues.UserProfileImageUrl, profile.ProfileImageUrl);
            SetCookieValue(SessionValues.UserProfileImageUrl, profileImageUrl, 7);
        }


        protected ProfileViewModel SetAuthorDetails(UserGeneratedBaseViewModel vm)
        {
            if (vm.Id == Guid.Empty || vm.UserId == Guid.Empty)
            {
                vm.UserId = CurrentUserId;
            }

            ProfileViewModel profile = ProfileAppService.GetByUserId(this.CurrentUserId, vm.UserId, ProfileType.Personal);

            if (profile != null)
            {
                vm.AuthorName = profile.Name;
                vm.AuthorPicture = UrlFormatter.ProfileImage(vm.UserId);
            }

            return profile;
        }


        #region Upload Management
        #region Main Methods
        private string UploadImage(Guid userId, string imageType, string filename, byte[] fileBytes)
        {
            Task<string> op = ImageStorageService.StoreImageAsync(userId.ToString(), imageType.ToLower() + "_" + filename, fileBytes);
            op.Wait();

            if (!op.IsCompletedSuccessfully)
            {
                throw op.Exception;
            }

            string url = op.Result;

            return url;
        }
        private string DeleteImage(Guid userId, string filename)
        {
            Task<string> op = ImageStorageService.DeleteImageAsync(userId.ToString(), filename);
            op.Wait();

            if (!op.IsCompletedSuccessfully)
            {
                throw op.Exception;
            }

            string url = op.Result;

            return url;
        }

        private string DeleteImage(Guid userId, string imageType, string filename)
        {
            Task<string> op = ImageStorageService.DeleteImageAsync(userId.ToString(), imageType.ToLower() + "_" + filename);
            op.Wait();

            if (!op.IsCompletedSuccessfully)
            {
                throw op.Exception;
            }

            string url = op.Result;

            return url;
        }
        #endregion


        protected string UploadImage(Guid userId, BlobType container, string filename, byte[] fileBytes)
        {
            string containerName = container.ToString().ToLower();

            return this.UploadImage(userId, containerName, filename, fileBytes);
        }

        protected string UploadGameImage(Guid userId, BlobType type, string filename, byte[] fileBytes)
        {
            var result = this.UploadImage(userId, type.ToString().ToLower(), filename, fileBytes);

            return result;
        }

        protected string UploadContentImage(Guid userId, string filename, byte[] fileBytes)
        {
            var type = BlobType.ContentImage.ToString().ToLower();
            var result = this.UploadImage(userId, type, filename, fileBytes);

            return result;
        }

        protected string UploadFeaturedImage(Guid userId, string filename, byte[] fileBytes)
        {
            var type = BlobType.FeaturedImage.ToString().ToLower();
            var result = this.UploadImage(userId, type, filename, fileBytes);

            return result;
        }

        protected string DeleteGameImage(Guid userId, BlobType type, string filename)
        {
            var result = this.DeleteImage(userId, filename);

            return result;
        }

        protected string DeleteFeaturedImage(Guid userId, string filename)
        {
            var type = BlobType.FeaturedImage.ToString().ToLower();
            var result = this.DeleteImage(userId, filename);

            return result;
        }
        #endregion


        #region Cookie Management
        protected string GetCookieValue(SessionValues key)
        {
            string value = CookieMgrService.Get(key.ToString());

            return value;
        }

        protected void SetCookieValue(SessionValues key, string value, int? expireTime)
        {
            CookieMgrService.Set(key.ToString(), value, expireTime);
        }
        #endregion
    }
}