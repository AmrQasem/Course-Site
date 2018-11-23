using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Course_Site_BE.ViewModels
{
    public class LessonVideoVM
    {
        public int ID { get; set; }
        public string VideoTitle { get; set; }
        public string VideoPath { get; set; }
        public int LessonID { get; set; }
        public int CourseID { get; set; }
        public string CourseName { get; set; }

    }
}