﻿using IndieVisible.Application.Interfaces;
using IndieVisible.Application.ViewModels.Content;
using IndieVisible.Application.ViewModels.Team;
using IndieVisible.Domain.Core.Enums;
using IndieVisible.Domain.ValueObjects;
using IndieVisible.Web.Controllers.Base;
using IndieVisible.Web.Enums;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;

namespace IndieVisible.Web.Controllers
{
    [Route("team")]
    public class TeamController : SecureBaseController
    {
        private readonly ITeamAppService teamAppService;
        private readonly INotificationAppService notificationAppService;
        private readonly IUserContentAppService userContentAppService;

        public TeamController(ITeamAppService teamAppService
            , INotificationAppService notificationAppService
            , IUserContentAppService userContentAppService)
        {
            this.teamAppService = teamAppService;
            this.notificationAppService = notificationAppService;
            this.userContentAppService = userContentAppService;
        }

        public IActionResult Index()
        {
            return View();
        }

        [Route("list")]
        public IActionResult List()
        {
            OperationResultListVo<TeamViewModel> serviceResult = teamAppService.GetAll(this.CurrentUserId);

            List<TeamViewModel> model = serviceResult.Value.ToList();

            return PartialView("_List", model);
        }

        [Route("list/user/{userId:guid}")]
        public IActionResult ListByUser(Guid userId)
        {
            OperationResultListVo<TeamViewModel> serviceResult = (OperationResultListVo<TeamViewModel>)teamAppService.GetByUserId(userId);

            List<TeamViewModel> model = serviceResult.Value.ToList();

            return PartialView("_List", model);
        }

        [Route("list/mine")]
        public IActionResult ListMyTeams()
        {
            OperationResultListVo<TeamViewModel> serviceResult = (OperationResultListVo<TeamViewModel>)teamAppService.GetByUserId(CurrentUserId);

            List<TeamViewModel> model = serviceResult.Value.ToList();

            return PartialView("_ListMine", model);
        }

        [Route("{teamId:guid}")]
        public IActionResult Details(Guid teamId, Guid notificationclicked)
        {
            notificationAppService.MarkAsRead(notificationclicked);

            OperationResultVo<TeamViewModel> serviceResult = teamAppService.GetById(this.CurrentUserId, teamId);

            if (!serviceResult.Success)
            {
                TempData["Message"] = SharedLocalizer["Team not found!"].Value;
                return RedirectToAction("Index");
            }

            TeamViewModel model = serviceResult.Value;

            foreach (TeamMemberViewModel member in model.Members)
            {
                member.Permissions.IsMe = member.UserId == CurrentUserId;
            }

            return View(model);
        }

        [Authorize]
        [Route("edit/{teamId:guid}")]
        public IActionResult Edit(Guid teamId)
        {
            OperationResultVo<TeamViewModel> service = teamAppService.GetById(this.CurrentUserId, teamId);

            TeamViewModel model = service.Value;

            return PartialView("_CreateEdit", model);
        }

        [Authorize]
        [Route("new")]
        public IActionResult New()
        {
            OperationResultVo<TeamViewModel> service = (OperationResultVo<TeamViewModel>)teamAppService.GenerateNewTeam(CurrentUserId);

            return PartialView("_CreateEdit", service.Value);
        }

        [Authorize]
        [HttpPost("save")]
        public IActionResult Save(TeamViewModel vm)
        {
            try
            {
                vm.UserId = CurrentUserId;

                IEnumerable<Guid> oldMembers = vm.Members.Where(x => x.Id != Guid.Empty).Select(x => x.Id);

                var saveResult = teamAppService.Save(this.CurrentUserId, vm);

                if (saveResult.Success)
                {
                    string url = Url.Action("Index", "Team", new { area = string.Empty, id = vm.Id.ToString() });

                    Notify(vm, oldMembers);
                    GenerateTeamPost(vm);

                    return Json(new OperationResultRedirectVo(url));
                }
                else
                {
                    return Json(new OperationResultVo(false));
                }
            }
            catch (Exception ex)
            {
                return Json(new OperationResultVo(ex.Message));
            }
        }

        [Route("{teamId:guid}/invitation/accept")]
        public IActionResult AcceptInvitation(Guid teamId, string quote)
        {
            OperationResultVo serviceResult = teamAppService.AcceptInvite(teamId, CurrentUserId, quote);

            return Json(serviceResult);
        }


        [Route("{teamId:guid}/invitation/reject")]
        public IActionResult RejectInvitation(Guid teamId)
        {
            OperationResultVo serviceResult = teamAppService.RejectInvite(teamId, CurrentUserId);

            return Json(serviceResult);
        }


        [HttpDelete("{teamId:guid}")]
        public IActionResult DeleteTeam(Guid teamId)
        {
            OperationResultVo serviceResult = teamAppService.Remove(this.CurrentUserId, teamId);

            return Json(serviceResult);
        }


        [HttpDelete("{teamId:guid}/{userId:guid}")]
        public IActionResult RemoveMember(Guid teamId, Guid userId)
        {
            OperationResultVo serviceResult = teamAppService.RemoveMember(this.CurrentUserId, teamId, userId);

            return Json(serviceResult);
        }

        private void Notify(TeamViewModel vm, IEnumerable<Guid> oldMembers)
        {
            string notificationText = SharedLocalizer["{0} has invited you to join a team!"];
            string notificationUrl = Url.Action("Details", "Team", new { teamId = vm.Id });

            TeamMemberViewModel meAsMember = vm.Members.FirstOrDefault(x => x.UserId == CurrentUserId);

            foreach (TeamMemberViewModel member in vm.Members.Where(x => !x.Leader))
            {
                if (!oldMembers.Contains(member.Id))
                {
                    notificationAppService.Notify(member.UserId, NotificationType.TeamInvitation, vm.Id, String.Format(notificationText, meAsMember?.Name), notificationUrl);
                }
            }
        }

        private void GenerateTeamPost(TeamViewModel vm)
        {
            if (vm.Members.Count > 1)
            {
                var newContent = new UserContentViewModel
                {
                    AuthorName = GetSessionValue(SessionValues.FullName),
                    UserId = this.CurrentUserId,
                    UserContentType = UserContentType.TeamCreation,
                    Content = String.Format("{0}|{1}|{2}|{3}", vm.Id, vm.Name, vm.Motto, vm.Members.Count)
                };

                userContentAppService.Save(this.CurrentUserId, newContent);
            }
        }
    }
}