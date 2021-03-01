using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Ejercicio_3.Models.ViewModel
{
    public class StudentViewModel
    {

        public int Id_Student { get; set; }

        [Required]
        [Display(Name = "Nombre")]
        public string Name { get; set; }

        [Required]
        [Display(Name = "Apellido")]
        public string Surname { get; set; }

        [Required]
        [Display(Name = "Legajo")]
        public int Docket { get; set; }

        [Required]
        [Display(Name = "DNI")]
        public int National_Identity_Document { get; set; }

        [Required]
        [EmailAddress]
        [Display(Name = "Correo Electronico")]
        public string Email { get; set; }

        [Required]
        [Display(Name = "Contraseña")]
        public string Password { get; set; }

        public int IdFamilia { get; set; }
    }
}