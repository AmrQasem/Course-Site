using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Course_Site.ViewModels
{
    public class CoursesVideoVM
    {
        public int ID { get; set; }
        public string Videos { get; set; }
        public int LessonID { get; set; }
        public int CourseID { get; set; }
    }
}