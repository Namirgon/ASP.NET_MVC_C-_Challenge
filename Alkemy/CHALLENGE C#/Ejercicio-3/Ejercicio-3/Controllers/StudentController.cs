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
    public class StudentController : Controller
    {
        // GET: Student
        [AuthorizeUser(IdPatente: 7)]
        public ActionResult Index()
        {


            List<StudentViewModel> Students;


            using (CollegeEntities bd = new CollegeEntities())
            {

                Students = (from t in bd.Student
                            where t.IdFamilia == 1 
                            select new StudentViewModel
                            {
                                Id_Student = t.Id_Student,
                                Name = t.Name,
                                Surname = t.Surname,
                                National_Identity_Document = t.National_Identity_Document.Value,
                                Docket = t.Docket.Value,
                                Email = t.Email,
                                Password= t.Password,
                               



                            } ).ToList();

            }
            return View(Students);
        }
        [AuthorizeUser(IdPatente: 8)]
        public ActionResult Nuevo()
        {

            return View();
        }
        [HttpPost]
        public ActionResult Nuevo(StudentViewModel model)
        {
            try
            {

                if (ModelState.IsValid)
                {
                    using (CollegeEntities bd = new CollegeEntities())
                    {
                        var oStudent = new Student();

                        oStudent.Name = model.Name;
                        oStudent.Surname = model.Surname;
                        oStudent.National_Identity_Document = model.National_Identity_Document;
                        oStudent.Docket = model.Docket;
                        oStudent.Email = model.Email;
                        oStudent.Password = model.Password;
                        oStudent.IdFamilia = 1;
                        bd.Student.Add(oStudent);
                        bd.SaveChanges();

                       
                    }
                    return Redirect("~/Student/Index");
                }

                return View(model);
            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message);

            }
            return View();
        }

        [AuthorizeUser(IdPatente: 9)]
        public ActionResult Editar(int Id)
        {
            StudentViewModel model = new StudentViewModel();

            using (CollegeEntities bd = new CollegeEntities())
            {
                var oStudent = bd.Student.Find(Id);

                model.Id_Student = oStudent.Id_Student;
                model.Name = oStudent.Name;
                model.Surname = oStudent.Surname;
                model.National_Identity_Document = oStudent.National_Identity_Document.Value;
                model.Docket = oStudent.Docket.Value;
                model.Email = oStudent.Email;
                model.Password = oStudent.Password;

            }


            return View(model);
        }

        [AuthorizeUser(IdPatente: 10)]
        [HttpPost]
        public ActionResult Editar(StudentViewModel model)
        {
            try
            {

                if (ModelState.IsValid)
                {
                    using (CollegeEntities bd = new CollegeEntities())
                    {
                        var oStudent = bd.Student.Find(model.Id_Student);

                        oStudent.Name = model.Name;
                        oStudent.Surname = model.Surname;
                        oStudent.National_Identity_Document = model.National_Identity_Document;
                        oStudent.Docket = model.Docket;
                        oStudent.Email = model.Email;
                        oStudent.Password = model.Password;


                        bd.Entry(oStudent).State = System.Data.Entity.EntityState.Modified;
                        bd.SaveChanges();


                    }
                    return Redirect("~/Student/Index");
                }

                return View(model);
            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message);

            }
            return View();
        }

        [HttpGet]
        [AuthorizeUser(IdPatente: 11)]
        public ActionResult Eliminar(int Id)
        {

            using (CollegeEntities bd = new CollegeEntities())
            {
                var oStudent = bd.Student.Find(Id);
                bd.Student.Remove(oStudent);
                bd.SaveChanges();
            }

            return Redirect("~/Student/Index");
        }

    }
}