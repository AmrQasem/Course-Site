using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CourseSite.Data;
using Course_Site_BE.Services;
using Course_Site_BE.ViewModels;

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
        public ActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Create(Cours course)
        {
            if (ModelState.IsValid)
            {
                ViewBag.countrydrop = GetCategoryName().Select(x => new SelectListItem { Text = x.CategoryName, Value = x.ID.ToString() }).ToList();

                //var list = GetCategoryName();
                //ViewBag.CategoryList = new SelectList(list, "ID", "CategoryName");
                db.Courses.Add(course);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(course);
        }

        public List<CategoryVM> GetCategoryName()
        {
            // Customer DropDown
            using (CourseSiteEntities _context = new CourseSiteEntities())
            {
                return (from c in _context.Categories
                        select new CategoryVM
                        {
                            ID = c.ID,
                            CategoryName = c.CategoryName
                        }).ToList<CategoryVM>();
            }
        }
    }
}