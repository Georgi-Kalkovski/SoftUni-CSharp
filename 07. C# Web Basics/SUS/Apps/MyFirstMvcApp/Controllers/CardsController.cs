﻿using SUS.HTTP;
using SUS.MvcFramework;
using System;
using System.Collections.Generic;
using System.Text;

namespace MyFirstMvcApp.Controllers
{
    public class CardsController : Controller
    {
        public HttpResponse Add(HttpRequest request)
        {
            return View();
        }

        public HttpResponse All(HttpRequest request)
        {
            return View();
        }

        public HttpResponse Collection(HttpRequest request)
        {
            return View();
        }
    }
}
