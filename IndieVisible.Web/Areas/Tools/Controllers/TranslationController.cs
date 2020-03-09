﻿using IndieVisible.Application.Interfaces;
using IndieVisible.Application.ViewModels.Translation;
using IndieVisible.Domain.Core.Enums;
using IndieVisible.Domain.ValueObjects;
using IndieVisible.Web.Areas.Tools.Controllers.Base;
using IndieVisible.Web.Extensions;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using System;
using System.Collections.Generic;
using System.Linq;

namespace IndieVisible.Web.Areas.Tools.Controllers
{
    public class TranslationController : ToolsBaseController
    {
        private readonly ITranslationAppService translationAppService;
        private readonly IGameAppService gameAppService;

        public TranslationController(ITranslationAppService translationAppService, IGameAppService gameAppService)
        {
            this.translationAppService = translationAppService;
            this.gameAppService = gameAppService;
        }

        public IActionResult Index()
        {
            OperationResultVo gamesResult = translationAppService.GetMyUntranslatedGames(CurrentUserId);
            if (gamesResult.Success)
            {
                OperationResultListVo<SelectListItemVo> castResultGames = gamesResult as OperationResultListVo<SelectListItemVo>;

                IEnumerable<SelectListItemVo> games = castResultGames.Value;

                List<SelectListItem> gamesDropDown = games.ToSelectList();
                ViewData["CanRequest"] = games.Any();
            }
            else
            {
                ViewData["CanRequest"] = false;
            }

            return View();
        }

        [Route("tools/translation/list")]
        public PartialViewResult List()
        {
            IEnumerable<TranslationProjectViewModel> model;
            OperationResultVo serviceResult;

            serviceResult = translationAppService.GetAll(CurrentUserId);

            if (serviceResult != null && serviceResult.Success)
            {
                OperationResultListVo<TranslationProjectViewModel> castResult = serviceResult as OperationResultListVo<TranslationProjectViewModel>;

                model = castResult.Value;
            }
            else
            {
                model = new List<TranslationProjectViewModel>();
            }

            foreach (TranslationProjectViewModel item in model)
            {
                SetLocalization(item);
            }

            ViewData["ListDescription"] = SharedLocalizer["These are translation projects available to help."].ToString();

            return PartialView("_List", model);
        }

        [Route("tools/translation/listmine")]
        public PartialViewResult ListMine()
        {
            IEnumerable<TranslationProjectViewModel> model;
            OperationResultVo serviceResult;

            serviceResult = translationAppService.GetByUserId(CurrentUserId, CurrentUserId);

            if (serviceResult != null && serviceResult.Success)
            {
                OperationResultListVo<TranslationProjectViewModel> castResult = serviceResult as OperationResultListVo<TranslationProjectViewModel>;

                model = castResult.Value;
            }
            else
            {
                model = new List<TranslationProjectViewModel>();
            }

            foreach (TranslationProjectViewModel item in model)
            {
                SetLocalization(item);
            }

            ViewData["ListDescription"] = SharedLocalizer["These are translation projects available to help."].ToString();

            return PartialView("_ListByUser", model);
        }

        [Route("tools/translation/details/{id:guid}")]
        public IActionResult Details(Guid id, int? pointsEarned)
        {
            OperationResultVo<TranslationProjectViewModel> op = translationAppService.GetById(CurrentUserId, id);

            TranslationProjectViewModel vm = op.Value;

            SetLocalization(vm);
            SetAuthorDetails(vm);

            SetGamificationMessage(pointsEarned);

            return View("_Details", vm);
        }

        [Authorize]
        [Route("tools/translation/new/")]
        public IActionResult New()
        {
            OperationResultVo serviceResult = translationAppService.GenerateNew(CurrentUserId);

            if (serviceResult.Success)
            {
                OperationResultVo<TranslationProjectViewModel> castResult = serviceResult as OperationResultVo<TranslationProjectViewModel>;

                TranslationProjectViewModel model = castResult.Value;

                SetLocalization(model);

                OperationResultVo gamesResult = translationAppService.GetMyUntranslatedGames(CurrentUserId);
                if (gamesResult.Success)
                {

                    OperationResultListVo<SelectListItemVo> castResultGames = gamesResult as OperationResultListVo<SelectListItemVo>;

                    IEnumerable<SelectListItemVo> games = castResultGames.Value;

                    List<SelectListItem> gamesDropDown = games.ToSelectList();
                    ViewBag.UserGames = gamesDropDown;
                }
                else
                {
                    ViewBag.UserGames = new List<SelectListItem>();
                }

                return PartialView("_CreateEdit", model);
            }
            else
            {
                return PartialView("_CreateEdit", new TranslationProjectViewModel());
            }
        }


        [Authorize]
        [Route("tools/translation/edit/{id:guid}")]
        public IActionResult Edit(Guid id)
        {
            OperationResultVo serviceResult = translationAppService.GetById(CurrentUserId, id);

            if (serviceResult.Success)
            {
                OperationResultVo<TranslationProjectViewModel> castResult = serviceResult as OperationResultVo<TranslationProjectViewModel>;

                TranslationProjectViewModel model = castResult.Value;

                SetLocalization(model, true);

                if (Request.IsAjaxRequest())
                {
                    return View("_CreateEdit", model);
                }
                else
                {
                    return View("_CreateEditWrapper", model);
                }

            }
            else
            {
                return null;
            }
        }

        [Authorize]
        [HttpPost("tools/translation/save")]
        public IActionResult Save(TranslationProjectViewModel vm)
        {
            bool isNew = vm.Id == Guid.Empty;

            try
            {
                vm.UserId = CurrentUserId;

                OperationResultVo<Guid> saveResult = translationAppService.Save(CurrentUserId, vm);

                if (saveResult.Success)
                {
                    //GenerateFeedPost(vm);

                    string url = Url.Action("Details", "Translation", new { area = "tools", id = vm.Id });

                    if (isNew)
                    {
                        url = Url.Action("Edit", "Translation", new { area = "tools", id = vm.Id, pointsEarned = saveResult.PointsEarned });
                    }

                    return Json(new OperationResultRedirectVo(saveResult, url));
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

        [Authorize]
        [HttpPost("tools/translation/gettranslation/{projectId:guid}")]
        public IActionResult GetTranslation(Guid projectId, SupportedLanguage language)
        {
            try
            {
                OperationResultVo result = translationAppService.GetTranslations(CurrentUserId, projectId, language);

                if (result.Success)
                {

                    OperationResultListVo<TranslationEntryViewModel> castResult = result as OperationResultListVo<TranslationEntryViewModel>;

                    return Json(castResult);
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

        private void SetLocalization(TranslationProjectViewModel item)
        {
            SetLocalization(item, false);
        }

        private void SetLocalization(TranslationProjectViewModel item, bool editing)
        {
            if (item != null)
            {
            }
        }
    }
}