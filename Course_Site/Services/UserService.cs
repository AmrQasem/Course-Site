using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Course_Site.ViewModels;
using CourseSite.Data;


namespace Course_Site.Services
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
    }
}