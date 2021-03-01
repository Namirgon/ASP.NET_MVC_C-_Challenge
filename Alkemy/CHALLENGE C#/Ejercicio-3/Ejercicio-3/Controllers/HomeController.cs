using Ejercicio_3.Filters;
using Ejercicio_3.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace Ejercicio_3.Controllers
{
  
    public class HomeController : Controller
    {
        [AuthorizeUser(IdPatente: 1)]
        public ActionResult Index(string v)
        {
            Session["user"] = null;
            return View();
        }


        [AuthorizeUser(IdPatente: 2)]
        public ActionResult LogOut()
        {
            FormsAuthentication.SignOut();
            return RedirectToAction("Index", "Home");
        }
        [AuthorizeUser(IdPatente: 3)]
        public ActionResult Contact()
        {
            ViewBag.Message = "Iniciar Sesión";

            return View();
        }
    }
}