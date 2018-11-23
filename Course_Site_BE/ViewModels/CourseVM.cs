using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace Course_Site_BE.ViewModels
{
    public class CourseVM
    {
        public int ID { get; set; }
        public string CourseName { get; set; }
        public string CourseDescription { get; set; }
        public int? Price { get; set; }
        public int Duration { get; set; }
        public string CategoryName { get; set; }
        public string Instructor { get; set; }

        [NotMapped]
        public List<int> CategoriesID { get; set; }

    }
}