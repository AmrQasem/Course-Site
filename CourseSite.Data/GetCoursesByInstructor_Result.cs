//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace CourseSite.Data
{
    using System;
    
    public partial class GetCoursesByInstructor_Result
    {
        public int ID { get; set; }
        public string CourseName { get; set; }
        public string CourseDescription { get; set; }
        public Nullable<int> Price { get; set; }
        public int Duration { get; set; }
        public int InstructorID { get; set; }
        public int CategoryID { get; set; }
    }
}
