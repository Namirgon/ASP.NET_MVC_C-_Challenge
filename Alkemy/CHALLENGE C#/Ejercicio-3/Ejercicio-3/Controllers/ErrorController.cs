﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Ejercicio_3.Controllers
{
    public class ErrorController : Controller
    {
        // GET: Error

            [HttpGet]
        public ActionResult UnauthorizeOperation(string patente, string modulo, string msgError)
        {

            ViewBag.patente = patente;
            ViewBag.modulo = modulo;
            ViewBag.Error = msgError;
           
            return View();
        }
    }
}