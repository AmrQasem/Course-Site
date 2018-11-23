using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Course_Site_BE.ViewModels
{
    public class UserVM
    {
        public int ID { get; set; }
        public string UserName { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public string Password { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
    }
}