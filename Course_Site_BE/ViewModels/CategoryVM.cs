using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Course_Site_BE.ViewModels
{
    public class CategoryVM
    {
        public int ID { get; set; }
        public string CategoryName { get; set; }
        public int CourseID { get; set; }
        public string CourseName { get; set; }
        public int Duration { get; set; }
        public string Instructor { get; set; }


    }
}