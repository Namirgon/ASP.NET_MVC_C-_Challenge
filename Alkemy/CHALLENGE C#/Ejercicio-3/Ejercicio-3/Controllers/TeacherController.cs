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
    public class TeacherController : Controller
    {
        // GET: Teacher
        [AuthorizeUser(IdPatente: 12)]
        public ActionResult Index()
        {

            List<TeacherViewModel> Teachers;


            using (CollegeEntities bd = new CollegeEntities())
            {

                Teachers = (from t in bd.Teacher
                            select new TeacherViewModel
                            {
                                Id_Teacher = t.Id_Teacher,
                                Name = t.Name,
                                Surname = t.Surname,
                                National_Identity_Document = t.National_Identity_Document ,
                                Status = t.Status


                            }).ToList();

            }
            return View(Teachers);
           
        }
        [AuthorizeUser(IdPatente: 13)]
        public ActionResult Nuevo()
        {

            return View();
        }
        [HttpPost]
        public ActionResult Nuevo(TeacherViewModelAlta model)
        {
            try
            {

                if ( ModelState.IsValid)
                {
                    using (CollegeEntities bd= new CollegeEntities())
                    {
                        var oTeacher = new Teacher();

                        oTeacher.Name = model.Name;
                        oTeacher.Surname = model.Surname;
                        oTeacher.National_Identity_Document = model.National_Identity_Document;
                        oTeacher.Status = model.Status;


                        bd.Teacher.Add(oTeacher);
                        bd.SaveChanges();


                    }
                    return Redirect("~/Teacher/Index");
                }

                return View(model);
            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message);

            }
            return View();
        }
        [AuthorizeUser(IdPatente: 14)]
        public ActionResult Editar(int  Id)
        {
            TeacherViewModelAlta model = new TeacherViewModelAlta();

            using (CollegeEntities bd= new CollegeEntities())
            {
                var oTeacher = bd.Teacher.Find(Id);

                model.Name = oTeacher.Name;
                model.Surname = oTeacher.Surname;
                model.National_Identity_Document = oTeacher.National_Identity_Document;
                model.Status = oTeacher.Status;
                model.Id_Teacher = oTeacher.Id_Teacher;

            }


                return View(model);
        }

        [HttpPost]
        public ActionResult Editar(TeacherViewModelAlta model)
        {
            try
            {

                if (ModelState.IsValid)
                {
                    using (CollegeEntities bd = new CollegeEntities())
                    {
                        var oTeacher = bd.Teacher.Find(model.Id_Teacher);

                        oTeacher.Name = model.Name;
                        oTeacher.Surname = model.Surname;
                        oTeacher.National_Identity_Document = model.National_Identity_Document;
                        oTeacher.Status = model.Status;


                        bd.Entry(oTeacher).State = System.Data.Entity.EntityState.Modified;
                        bd.SaveChanges();


                    }
                    return Redirect("~/Teacher/Index");
                }

                return View(model);
            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message);

            }
            return View();
        }
        [AuthorizeUser(IdPatente: 15)]
        [HttpGet]
        public ActionResult Eliminar(int Id)
        {

            using (CollegeEntities bd = new CollegeEntities())
            {
                var oTeacher = bd.Teacher.Find(Id);
                bd.Teacher.Remove(oTeacher);
                bd.SaveChanges();
            }

            return Redirect("~/Teacher/Index");
        }
    }

}