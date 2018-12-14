using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Course_Site_BE.ViewModels;
using CourseSite.Data;

namespace Course_Site_BE.Services
{
    public class UserService
    {
        CourseSiteEntities _db;
        public UserService()
        {
            _db = new CourseSiteEntities();
        }

        public UserVM Login(string UserName, string Password)
        {
            try
            {
                //var EncryptPassword = Encrypt(Password);
                var model = (from n in _db.UserLogin(UserName.ToLower(), Password)
                             select new UserVM
                             {
                                 ID = n.ID,
                                 UserName = n.UserName,
                             }).FirstOrDefault();
                return (model);
            }
            catch
            {
                return new UserVM();
            }
        }

        public List<CategoryVM> GetCategoryName()
        {
            try
            {
                var model = (from n in _db.Categories
                             select new CategoryVM
                             {
                                 ID = n.ID,
                                 CategoryName = n.CategoryName
                             }).ToList();
                return (model);
            }
            catch
            {
                return new List<CategoryVM>();
            }
        }

        public UserVM GetUserById(int UserID)
        {
            try
            {
                var model = (from n in _db.GetUserByID(UserID)
                             select new UserVM
                             {
                                 ID = n.ID,
                                 Email = n.Email,
                                 FirstName = n.FirstName,
                                 LastName = n.LastName,
                                 Password = n.Password,
                                 Phone = n.Phone,
                                 UserName = n.UserName
                             }).FirstOrDefault();
                return (model);
            }
            catch
            {
                return new UserVM();
            }
        }

        //public List<CourseVM> GetCourseByInstructor(int InstID)
        //{
        //    try
        //    {
        //        var model = (from n in _db.GetCoursesByInstructor(InstID)
        //                     select new CourseVM
        //                     {
        //                         ID = n.ID,
        //                         CategoryID = n.CategoryID,
        //                         CourseDescription = n.CourseDescription,
        //                         CourseName = n.CourseName,
        //                         Duration = n.Duration,
        //                         Instructor = n.Instructor,
        //                         Price = n.Price
        //                     }).ToList();
        //        return (model);
        //    }
        //    catch
        //    {
        //        return new List<CourseVM>();
        //    }
        //}


    }
}