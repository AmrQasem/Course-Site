using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using CourseSite.Data;
using Course_Site_BE.ViewModels;

namespace Course_Site_BE.Services
{
    public class CategoryServices
    {
        CourseSiteEntities _db;
        public CategoryServices()
        {
            _db = new CourseSiteEntities();
        }
        public List<CategoryVM> GetAllCats()
        {
            try
            {
                //var EncryptPassword = Encrypt(Password);
                var model = (from n in _db.GetAllCategories()
                             select new CategoryVM
                             {
                                 ID = n.ID,
                                 CategoryName = n.CategoryName,
                                 CourseID = n.CourseID,
                                 CourseName = n.CourseName,
                                 Duration = n.Duration,
                             }).ToList();
                return (model);
            }
            catch
            {
                return new List<CategoryVM>();
            }
        }

        //public List<CourseVM> GetCategoryCourses(int CatID)
        //{
        //    try
        //    {
        //        var model = (from n in _db.GetCategoryCourses(CatID)
        //                     select new CourseVM
        //                     {
        //                         ID = n.ID,
        //                         CourseName = n.CourseName,
        //                         CourseDescription = n.CourseDescription,
        //                         Duration = n.Duration,
        //                         Price = n.Price,
        //                         CategoryName = n.CategoryName,
        //                         //InstructorID = n.Instructor
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