using Ejercicio_3.Filters;
using Ejercicio_3.Models;
using Ejercicio_3.Models.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Ejercicio_3.Controllers
{
    public class CourseController : Controller
    {
        // GET: Course
        [AuthorizeUser(IdPatente: 16)]
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
                              Day = t.Day,
                              Id_Teacher = t.Id_Teacher.Value,
                              Maximun_Number_Of_Students = t.Maximun_Number_Of_Students.Value,
                              Details = t.Detail,
                               

                            }).ToList();

            }
            return View(Cursos);
           
        }
        [AuthorizeUser(IdPatente: 17)]
        public ActionResult Nuevo()
        {
            List<TeacherViewModelAlta> lst = null;
            using (CollegeEntities bd = new CollegeEntities())
            {
                lst =
                    (from t in bd.Teacher
                     select new TeacherViewModelAlta
                     {
                         Id_Teacher = t.Id_Teacher,
                         Name = t.Name,
                         Surname = t.Surname
                     }).ToList();

            }
            List<SelectListItem> items = lst.ConvertAll(t => {

                return new SelectListItem()
                {
                    Text = t.Name.ToString() + ' ' + t.Surname.ToString(),
                    Value = t.Id_Teacher.ToString(),
                

                };

            });

            ViewBag.items = items;

            return View();
        }
        [HttpPost]
        [AuthorizeUser(IdPatente: 18)]
        public ActionResult Nuevo(CourseViewModelList model)
        {
            
            try
            {

              
                if (ModelState.IsValid)
                {

                    using (CollegeEntities bd = new CollegeEntities())
                    {

                        
                        var oCourse = new Course();

                        oCourse.Name_Course = model.Name_Course;
                        oCourse.Time_Course = model.Time_Course;
                        oCourse.Day = model.Day;
                        oCourse.Id_Teacher = model.Id_Teacher;
                        oCourse.Maximun_Number_Of_Students = model.Maximun_Number_Of_Students;
                        oCourse.Detail = model.Details;


                        bd.Course.Add(oCourse);
                        bd.SaveChanges();
                    }
                       
                     
                    return Redirect("~/Course/Index");
                }

                return View(model);
            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message);

            }
            return View();
        }

        [AuthorizeUser(IdPatente: 19)]
        public ActionResult Editar(int Id)
        {
            CourseViewModelList model = new CourseViewModelList ();

            using (CollegeEntities bd = new CollegeEntities())
            {
                var oCourse = bd.Course.Find(Id);

                model.Id_Course = oCourse.Id_Course;
                model.Name_Course = oCourse.Name_Course;
                model.Day = oCourse.Day;
                model.Time_Course =  oCourse.Time_Course.Value;
                model.Id_Teacher = oCourse.Id_Teacher.Value;
                
                model.Maximun_Number_Of_Students = oCourse.Maximun_Number_Of_Students.Value;
                model.Details = oCourse.Detail;

               

            }


            return View(model);
        }
        [AuthorizeUser(IdPatente: 20)]
        [HttpPost]
        public ActionResult Editar(CourseViewModelList model)
        {
            try
            {

                if (ModelState.IsValid)
                {
                    using (CollegeEntities bd = new CollegeEntities())
                    {
                        var oCourse = bd.Course.Find(model.Id_Course);

                        oCourse.Id_Course = model.Id_Course;
                        oCourse.Name_Course = model.Name_Course  ;
                        oCourse.Day = model.Day;
                        oCourse.Time_Course =   model.Time_Course ;
                        oCourse.Id_Teacher = model.Id_Teacher;
                        oCourse.Maximun_Number_Of_Students = model.Maximun_Number_Of_Students;


                        bd.Entry(oCourse).State = System.Data.Entity.EntityState.Modified;
                        bd.SaveChanges();


                    }
                    return Redirect("~/Course/Index");
                }

                return View(model);
            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message);

            }
            return View();
        }

    }
}