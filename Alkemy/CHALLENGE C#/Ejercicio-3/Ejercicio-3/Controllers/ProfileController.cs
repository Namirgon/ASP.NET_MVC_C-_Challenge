using Ejercicio_3.Filters;
using Ejercicio_3.Models;
using Ejercicio_3.Models.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace Ejercicio_3.Controllers
{

    public class ProfileController : Controller
    {
        private Student oUsuario;

        [AuthorizeUser(IdPatente: 4)]
        public ActionResult Index()
        {

            List<CourseViewModelList> Cursos;

            using (CollegeEntities bd = new CollegeEntities())
            {
        

                Cursos = (from t in bd.Course
                          select new CourseViewModelList
                          {
                              Id_Course = t.Id_Course,
                              Name_Course = t.Name_Course,
                              Time_Course = t.Time_Course.Value,
                              Id_Teacher= t.Id_Teacher.Value,


                         }).ToList();

            }
            return View(Cursos);

        }
        [AuthorizeUser(IdPatente: 5)]
        public ActionResult Detalle(int Id)
        {
            CourseViewModelList model = new CourseViewModelList();

            using (CollegeEntities bd = new CollegeEntities())
            {
                var oDetalle = bd.Course.Find(Id);

                model.Id_Course = oDetalle.Id_Course;
                model.Details = oDetalle.Detail;
               

            }


            return View(model);
        }

        
        [AuthorizeUser(IdPatente: 6)]
        [HttpGet]

       
        public ActionResult Inscripcion(int Id)
        {


            oUsuario = (Student)HttpContext.Session["Usuario"];

            InscripcionViewModel model = new InscripcionViewModel();
    
          
                using (CollegeEntities bd = new CollegeEntities())
                {

                                
                                 var materia = bd.Course.Find(Id);
                                 Course curso = materia;
                                 var CountInscriptos = (from m in bd.Course_Student
                                                        where m.Id_Course == curso.Id_Course
                                                       
                                                        select m.Id_Course).ToList();
                                 int Inscriptos = CountInscriptos.Count();

                              if ( Inscriptos < materia.Maximun_Number_Of_Students)
                              {
        
                                 var OInscripcion = new Course_Student();

                                  OInscripcion.Id_Course = materia.Id_Course;
                                  OInscripcion.Id_Student = oUsuario.Id_Student ;

                                  bd.Course_Student.Add(OInscripcion);
                                  bd.SaveChanges();
                    
                                    return RedirectToAction("Index", new { message = "se inscribio correctamente" });
                                   
                              }
                              else
                              {
                                 
                                            return RedirectToAction("Index", new { message = "cupo completo" });

                              }


                        

                }
                    

        }
    }
}