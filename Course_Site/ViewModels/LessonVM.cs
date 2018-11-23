using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Course_Site.ViewModels
{
    public class LessonVM
    {
        public int ID { get; set; }
        public string LessonName { get; set; }
        public string CourseName { get; set; }
        public string VideoTitle { get; set; }
        public string VideoPath { get; set; }
        public int CourseID { get; set; }
    }
}