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
    public class HomeController : Controller
    {
        private readonly CategoryServices _CatService;
        public HomeController()
        {
            _CatService = new CategoryServices();
        }
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult GetAllCategories()
        {
            var model = _CatService.GetAllCats();
            return PartialView(model);
        }

        public ActionResult GetCoursesByCategories(int CatId)
        {
            var model = _CatService.GetCategoryCourses(CatId);
            return View(model);
        }

    }
}