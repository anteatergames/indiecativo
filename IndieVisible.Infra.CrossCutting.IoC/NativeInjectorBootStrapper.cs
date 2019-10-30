﻿using IndieVisible.Application.Interfaces;
using IndieVisible.Application.Services;
using IndieVisible.Domain.Interfaces.Base;
using IndieVisible.Domain.Interfaces.Repository;
using IndieVisible.Domain.Interfaces.Service;
using IndieVisible.Domain.Services;
using IndieVisible.Infra.CrossCutting.Identity.Services;
using IndieVisible.Infra.Data.Context;
using IndieVisible.Infra.Data.MongoDb.Context;
using IndieVisible.Infra.Data.MongoDb.Interfaces;
using IndieVisible.Infra.Data.MongoDb.Interfaces.Repository;
using IndieVisible.Infra.Data.MongoDb.Repository;
using IndieVisible.Infra.Data.MongoDb.UoW;
using IndieVisible.Infra.Data.Repository;
using IndieVisible.Infra.Data.UoW;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.DependencyInjection;

namespace IndieVisible.Infra.CrossCutting.IoC
{
    public static class NativeInjectorBootStrapper
    {
        public static void RegisterServices(IServiceCollection services)
        {
            // ASP.NET HttpContext dependency
            services.AddSingleton<IHttpContextAccessor, HttpContextAccessor>();

            #region Game
            services.AddScoped<IGameAppService, GameAppService>();
            services.AddScoped<IGameRepositorySql, GameRepositorySql>();
            services.AddScoped<IGameRepository, GameRepository>();
            #endregion

            #region Profile
            services.AddScoped<IProfileAppService, ProfileAppService>();
            services.AddScoped<IProfileDomainService, ProfileDomainService>();
            services.AddScoped<IProfileRepositorySql, ProfileRepository>();
            services.AddScoped<IUserProfileRepository, UserProfileRepository>();
            #endregion

            #region Content
            services.AddScoped<IUserContentAppService, UserContentAppService>();
            services.AddScoped<IUserContentDomainService, UserContentDomainService>();
            services.AddScoped<IUserContentRepositorySql, UserContentRepositorySql>();
            services.AddScoped<IUserContentRepository, UserContentRepository>();
            #endregion

            #region Brainstorm
            services.AddScoped<IBrainstormAppService, BrainstormAppService>();
            services.AddScoped<IBrainstormSessionRepositorySql, BrainstormSessionRepositorySql>();
            services.AddScoped<IBrainstormIdeaRepositorySql, BrainstormIdeaRepositorySql>();
            services.AddScoped<IBrainstormVoteRepositorySql, BrainstormVoteRepositorySql>();
            services.AddScoped<IBrainstormCommentRepositorySql, BrainstormCommentRepository>();
            services.AddScoped<IBrainstormRepository, BrainstormRepository>();
            #endregion

            #region Featuring
            services.AddScoped<IFeaturedContentAppService, FeaturedContentAppService>();
            services.AddScoped<IFeaturedContentRepositorySql, FeaturedContentRepositorySql>();
            services.AddScoped<IFeaturedContentRepository, FeaturedContentRepository>();
            #endregion

            #region Preferences
            services.AddScoped<IUserPreferencesAppService, UserPreferencesAppService>();
            services.AddScoped<IUserPreferencesRepositorySql, UserPreferencesRepositorySql>();
            services.AddScoped<IUserPreferencesRepository, UserPreferencesRepository>();
            #endregion

            #region Notifications
            services.AddScoped<INotificationAppService, NotificationAppService>();
            services.AddScoped<INotificationRepositorySql, NotificationRepositorySql>();
            services.AddScoped<INotificationRepository, NotificationRepository>();
            #endregion

            #region Gamification
            services.AddScoped<IUserBadgeAppService, UserBadgeAppService>();
            services.AddScoped<IUserBadgeDomainService, UserBadgeDomainService>();
            services.AddScoped<IUserBadgeRepository, UserBadgeRepository>();
            services.AddScoped<IGamificationAppService, GamificationAppService>();
            services.AddScoped<IGamificationDomainService, GamificationDomainService>();
            services.AddScoped<IGamificationRepositorySql, GamificationRepositorySql>();
            services.AddScoped<IGamificationRepository, GamificationRepository>();
            services.AddScoped<IGamificationActionRepositorySql, GamificationActionRepositorySql>();
            services.AddScoped<IGamificationActionRepository, GamificationActionRepository>();
            services.AddScoped<IGamificationLevelRepositorySql, GamificationLevelRepositorySql>();
            services.AddScoped<IGamificationLevelRepository, GamificationLevelRepository>();
            #endregion

            #region Interactions
            services.AddScoped<IUserContentCommentAppService, UserContentCommentAppService>();
            services.AddScoped<IUserContentCommentRepositorySql, UserContentCommentRepository>();

            services.AddScoped<ILikeAppService, LikeAppService>();
            services.AddScoped<IUserContentLikeRepositorySql, UserContentLikeRepository>();
            services.AddScoped<IGameLikeRepositorySql, GameLikeRepositorySql>();

            services.AddScoped<IGameFollowAppService, GameFollowAppService>();
            services.AddScoped<IGameFollowDomainService, GameFollowDomainService>();
            services.AddScoped<IGameFollowRepositorySql, GameFollowRepositorySql>();

            services.AddScoped<IUserFollowAppService, UserFollowAppService>();
            services.AddScoped<IUserFollowDomainService, UserFollowDomainService>();
            services.AddScoped<IUserFollowRepositorySql, UserFollowRepository>();

            services.AddScoped<IUserConnectionAppService, UserConnectionAppService>();
            services.AddScoped<IUserConnectionDomainService, UserConnectionDomainService>();
            services.AddScoped<IUserConnectionRepository, UserConnectionRepository>();
            #endregion

            #region Poll
            services.AddScoped<IPollAppService, PollAppService>();
            services.AddScoped<IPollDomainService, PollDomainService>();
            services.AddScoped<IPollRepository, PollRepository>();
            services.AddScoped<IPollOptionRepository, PollOptionRepository>();
            services.AddScoped<IPollVoteRepository, PollVoteRepository>();
            #endregion

            #region Team
            services.AddScoped<ITeamAppService, TeamAppService>();
            services.AddScoped<ITeamDomainService, TeamDomainService>();
            services.AddScoped<ITeamMemberRepository, TeamMemberRepository>();
            services.AddScoped<ITeamRepository, TeamRepository>();
            #endregion

            // Infra - Data
            services.AddScoped<IndieVisibleContext>();
            services.AddScoped<IUnitOfWorkSql, UnitOfWorkSql>();

            // Infra - Identity Services
            services.AddTransient<IEmailSender, SendGridEmailService>();

            services.AddTransient<IImageStorageService, ImageStorageService>();

            services.AddScoped<IMongoContext, MongoContext>();
            services.AddScoped<IUnitOfWork, UnitOfWork>();
        }
    }
}
