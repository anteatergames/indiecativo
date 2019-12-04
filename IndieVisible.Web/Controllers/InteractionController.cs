﻿using IndieVisible.Application.Interfaces;
using IndieVisible.Domain.ValueObjects;
using IndieVisible.Web.Controllers.Base;
using Microsoft.AspNetCore.Mvc;
using System;

namespace IndieVisible.Web.Controllers
{
    [Route("interact")]
    public class InteractionController : SecureBaseController
    {
        private readonly IPollAppService pollAppService;

        public InteractionController(IPollAppService pollAppService)
        {
            this.pollAppService = pollAppService;
        }

        #region Poll

        [HttpPost]
        [Route("poll/vote")]
        public IActionResult PollVote(Guid pollOptionId)
        {
            OperationResultVo response = pollAppService.PollVote(CurrentUserId, pollOptionId);

            return Json(response);
        }

        #endregion Poll

        #region Private Methods

        #endregion Private Methods
    }
}