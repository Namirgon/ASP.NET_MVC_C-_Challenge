using Ejercicio_3.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Ejercicio_3.Controllers
{
    public class AccesoController : Controller
    {
        // GET: Acceso
       
        public ActionResult Login(String message = "")
        {

            ViewBag.Message = message;
            return View();
        }
        //iniciar sesion
        [HttpPost]
        public ActionResult Login(string Legajo, string DNI)
        {
            using (CollegeEntities bd = new CollegeEntities())
            {


                if (!string.IsNullOrEmpty(Legajo) && !string.IsNullOrEmpty(DNI))
                {
                    var AlumnoLegajo = System.Convert.ToInt32(Legajo);
                    var AlumnoDNI = System.Convert.ToInt32(DNI);
                    var user = bd.Student.FirstOrDefault(e => e.Docket == AlumnoLegajo && e.National_Identity_Document == AlumnoDNI);
                    // existe el usuario?

                    if (user == null)
                    {

                        ViewBag.message = "usuario o contraseña invalida";
                        return View();

                    }
                    Session["Usuario"] = user;

                    return RedirectToAction("Index", "Home");
                }

               
            }



            return View();
        }

    }
}