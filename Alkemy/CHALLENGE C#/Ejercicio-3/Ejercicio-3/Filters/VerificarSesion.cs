using Ejercicio_3.Controllers;
using Ejercicio_3.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Ejercicio_3.Filters
{
    public class VerificarSesion: ActionFilterAttribute 
    {
        private Student OUsuario;

        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            try
            {
                base.OnActionExecuting(filterContext);

                OUsuario = (Student)HttpContext.Current.Session ["Usuario"];

                if (OUsuario == null)
                {

                    if(filterContext.Controller is AccesoController == false)
                    {

                        filterContext.HttpContext.Response.Redirect("~/Acceso/Login");

                    }

                }

            }
            catch(Exception )
            {

                filterContext.Result = new RedirectResult("~/Acceso/Login");

            }
           
        }
    }
}