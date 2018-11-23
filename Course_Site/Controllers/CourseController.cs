using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CourseSite.Data;
using Course_Site.Services;
using Course_Site.ViewModels;

namespace Course_Site.Controllers
{
    public class CourseController : Controller
    {
        CourseSiteEntities db = new CourseSiteEntities();

        private readonly CoursesServices _CourseService;
        public CourseController()
        {
            _CourseService = new CoursesServices();
        }
        // GET: Course
        public ActionResult Index(int CourseID)
        {
            var model = _CourseService.GetCourseDetails(CourseID);
            return View(model);
        }

        public ActionResult GetCourseLessons(int CourseID)
        {
            var model = _CourseService.GetCourseLessons(CourseID);
            return PartialView(model);
        }

        public ActionResult GetLessonsVideo(int LessonID)
        {
            var model = _CourseService.GetLessonsVideo(LessonID);
            return PartialView(model);
        }

        public ActionResult GetVideoOfTheCourse(int CourseID)
        {
            var model = _CourseService.GetCourseVideo(CourseID);
            return PartialView(model);
        }

    }
}