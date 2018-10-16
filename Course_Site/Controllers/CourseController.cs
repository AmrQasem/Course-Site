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
        public ActionResult Index()
        {
            return View();
        }
        //public ActionResult GetAllCourses()
        //{
        //    var model = _CourseService.GetAllCourses();
        //    return PartialView(model);
        //}
    }
}