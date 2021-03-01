using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Ejercicio_3.Models.ViewModel
{
    public class TeacherViewModel
    {

        public int Id_Teacher { get; set; }

        public string Name { get; set; }

        public string Surname { get; set; }

        
        public int National_Identity_Document { get; set; }

        public string Status { get; set; }
    }
}