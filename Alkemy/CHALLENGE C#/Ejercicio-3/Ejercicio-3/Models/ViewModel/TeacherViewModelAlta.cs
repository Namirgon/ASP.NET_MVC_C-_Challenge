using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Ejercicio_3.Models.ViewModel
{
    public class TeacherViewModelAlta
    {

        public int Id_Teacher { get; set; }

        [Required]
        [Display(Name = "Nombre")]
        public string Name { get; set; }

        [Required]
        [Display(Name = "Apellido")]
        public string Surname { get; set; }


        [Required]
        [Display(Name = "DNI")]
        public int National_Identity_Document { get; set; }
       

        [Required]
        [Display(Name = "Estado")]
        public string Status { get; set; }
     

    }
}