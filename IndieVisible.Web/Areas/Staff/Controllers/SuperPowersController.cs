﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using IndieVisible.Web.Areas.Staff.Controllers.Base;
using Microsoft.AspNetCore.Mvc;

namespace IndieVisible.Web.Areas.Staff.Controllers
{
    public class SuperPowersController : StaffBaseController
    {
        public IActionResult Index()
        {
            CookieMgrService.Set("user_is_admin", "true", 1);

            ViewData["user_is_admin"] = true;

            return View();
        }
    }
}