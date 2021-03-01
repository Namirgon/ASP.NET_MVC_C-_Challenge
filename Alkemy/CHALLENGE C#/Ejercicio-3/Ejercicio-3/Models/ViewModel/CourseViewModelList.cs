using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace Ejercicio_3.Models.ViewModel
{
    public class CourseViewModelList
    {

        public int Id_Course { get; set; }
        [Required]
        [Display(Name = "Materia")]
        public string Name_Course { get; set; }

        [Required]
        [DataType(DataType.Time)]
        [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{HH:mm}")]
        [Display(Name = "Horario")]
        public TimeSpan  Time_Course { get; set; }

        [Required]
        [Display(Name = "Profesor")]
        public int Id_Teacher { get; set; }


        [Required]
        [Display(Name = "Dia")]
        public string Day { get; set; }

        [Required]
        [Display(Name = "Detalle")]
        public string Details { get; set; }

        [Required]
        [Display(Name = "Cupo Maximo de Alumnos")]
        public int Maximun_Number_Of_Students { get; set; }
        [NotMapped]
        public List<Teacher> TeacherCollection { get; set; }
    }
}