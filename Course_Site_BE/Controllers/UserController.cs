using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CourseSite.Data;
using Course_Site_BE.Services;
using Course_Site_BE.ViewModels;
using System.Web.Security;
using System.Data.Entity;

namespace Course_Site_BE.Controllers
{
    public class UserController : Controller
    {

        CourseSiteEntities db = new CourseSiteEntities();

        private readonly UserService _userService;
        public UserController()
        {
            _userService = new UserService();
        }

        // GET: User
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(UserVM usr)
        {
            //return View("Index");
            //////string username = Request["email"];
            //////string pass = Request["password"];
            var model = _userService.Login(usr.Email, usr.Password);

            if (model == null)
            {
                ViewBag.CheckUser = "Null";
                Response.Write("<script>alert('invalid user name or password');</script>");
                return View("Login");
            }
            else
            {
                Session["User"] = model;
                return RedirectPermanent("/Instructor/Index/"+ model.ID);
            }
        }

        public ActionResult Register()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Register(UserVM usr)
        {
            if (ModelState.IsValid)
            {
                string username = Request["UserName"];
                string pass = Request["Password"];
                string Email = Request["Email"];
                string Phone = Request["Phone"];
                string FirstName = Request["FirstName"];
                string LastName = Request["LastName"];
                User obj = new User();
                obj.UserName = username;
                obj.Password = pass;
                obj.Phone = Phone;
                obj.Email = Email;
                obj.FirstName = FirstName;
                obj.LastName = LastName;
                obj.IsInstructor = true;

                if (obj.UserName == null || obj.Password == null || obj.Phone == null || obj.Email == null || obj.FirstName == null || obj.LastName == null)
                {
                    Response.Write("<script>alert('Please enter all fields in correct form');</script>");
                    return View("Register");
                }
                else
                {
                    db.Users.Add(obj);
                    db.SaveChanges();
                    return RedirectPermanent("/Instructor/Index");
                }
            }
            Response.Write("<script>alert('Please enter all field in correct form');</script>");
            return View("Register");

        }

        public ActionResult Logout()
        {
            FormsAuthentication.SignOut();
            Session.Abandon(); // it will clear the session at the end of request
            return View("Login");
        }

        public ActionResult Edit(int id)
        {
            var model = _userService.GetUserById(id);
            return View(model);
        }

        [HttpPost]
        public ActionResult Edit(int id, User user)
        {
            try
            {
                using (CourseSiteEntities db = new CourseSiteEntities())
                {
                    db.Entry(user).State = EntityState.Modified;
                    db.SaveChanges();
                }
                return RedirectToAction("/Home/Index");
            }
            catch
            {
                return View();
            }
        }


    }
}