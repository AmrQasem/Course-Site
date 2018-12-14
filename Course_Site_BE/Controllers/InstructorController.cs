using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CourseSite.Data;
using Course_Site_BE.Services;
using Course_Site_BE.ViewModels;
using System.Data.Entity;

namespace Course_Site_BE.Controllers
{
    public class InstructorController : Controller
    {
        CourseSiteEntities db = new CourseSiteEntities();

        private readonly UserService _userService;
        public InstructorController()
        {
            _userService = new UserService();
        }

        // GET: Instructor
        public ActionResult Index(int ID)
        {
            //var model = _userService.GetCourseByInstructor(ID);
            return View();
        }

        [HttpGet]
        public ActionResult Create()
        {
            ViewBag.Sources = _userService.GetCategoryName().ToList().Select(x => new SelectListItem { Value = x.ID.ToString(), Text = x.CategoryName });

            return View();
        }

        [HttpPost]
        public ActionResult Create(Cours course)
        {
            if (ModelState.IsValid)
            {
                //ViewBag.Sources = _userService.GetCategoryName().ToList().Select(x => new SelectListItem { Value = x.ID.ToString(), Text = x.CategoryName });
                string CourseName = Request["course-name"];
                string CourseDetails = Request["details"];
                int Price = Convert.ToInt16(Request["price"]);
                int Duration = Convert.ToInt16(Request["duration"]);
                //string CategoryName = Request["CategName"];
                string InstructorName = Request["instructor-name"];

                Cours obj = new Cours();
                obj.CourseName = CourseName;
                obj.CourseDescription = CourseDetails;
                obj.Price = Price;
                obj.Duration = Duration;
                //obj.CategoryName = CategoryName;
                obj.Instructor = InstructorName;
                obj.CategoryID = course.CategoryID;

                db.Courses.Add(obj);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View("Index");
        }

        public ActionResult Edit(int id)
        {
            return View();
        }

        [HttpPost]
        public ActionResult Edit(int id, Cours Course)
        {
            try
            {

                db.Entry(Course).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}