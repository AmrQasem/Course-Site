using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using CourseSite.Data;
using Course_Site.ViewModels;


namespace Course_Site.Services
{
    public class CoursesServices
    {
        CourseSiteEntities _db;
        public CoursesServices()
        {
            _db = new CourseSiteEntities();
        }


    }
}