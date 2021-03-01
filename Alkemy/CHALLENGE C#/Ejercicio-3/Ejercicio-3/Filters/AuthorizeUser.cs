using Ejercicio_3.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Ejercicio_3.Filters
{
    [AttributeUsage(AttributeTargets.Method, AllowMultiple = false)]
    public class AuthorizeUser: AuthorizeAttribute
    {

        private Student oUsuario;
        private CollegeEntities bd = new CollegeEntities();
        private int IdPatente;

        public AuthorizeUser(int IdPatente = 0)
        {


            this.IdPatente = IdPatente;

        }

        public override void OnAuthorization(AuthorizationContext filterContext)
        {
            
            string NombrePatente = "";
            string NombreModulo = "";

            try
            {
                oUsuario = (Student)HttpContext.Current.Session["Usuario"];

                
                                    var MisPermisos =  (from m in bd.Patent_Family
                                    where m.Id_Family== oUsuario.IdFamilia
                                    && m.Id_Patent  == IdPatente
                                    select m).ToList();

                     if (MisPermisos.ToList().Count()==0)
                     {
                       var oPatente = bd.Patent.Find(IdPatente);
                       int? IdModulo = oPatente.Id_Module;
                       NombrePatente = GetNombrePatente(IdPatente);
                       NombreModulo = GetNombreModulo(IdModulo);
                    
           
                       filterContext.Result = new RedirectResult("~/Error/UnauthorizeOperation?patente="+ NombrePatente +" &modulo= "+ NombreModulo );

                     }
                
            }
            catch (Exception ex)
            {

                filterContext.Result = new RedirectResult("~/Error/UnauthorizeOperation?patente=" + NombrePatente + " &modulo= " + NombreModulo + "&msgError" + ex.Message);

            }

        }

        public string GetNombreModulo(int ? IdModulo)
        {
            var Modulo = from m in bd.Module
                          where m.Id_module == IdModulo
                          select m.Name_Module ;
            string NombreModulo;

            try
            {
                NombreModulo = Modulo.First();
            }
            catch (Exception)
            {

                NombreModulo = "";
            }

            return NombreModulo;
        }

        public string GetNombrePatente (int? IdPatente)
        {
            var Patente = from m in bd.Patent
                          where m.Id_Patent == IdPatente
                          select m.Patent_Name;
            string NombrePatente;

            try
            {
                NombrePatente = Patente.First();
            }
            catch (Exception)
            {

                NombrePatente = "";
            }

            return NombrePatente;
        }

    }

   
}