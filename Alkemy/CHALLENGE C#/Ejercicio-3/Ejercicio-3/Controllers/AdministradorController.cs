using Ejercicio_3.Filters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Ejercicio_3.Controllers
{
    public class AdministradorController : Controller
    {
        // GET: Administrador

        [AuthorizeUser(IdPatente: 20)]
        public ActionResult Index()
        {
            return View();
        }
    }
}