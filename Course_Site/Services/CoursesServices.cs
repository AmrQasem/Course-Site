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

        public CourseVM GetCourseDetails(int CourseID)
        {
            try
            {
                var model = (from n in _db.GetCourseDetails(CourseID)
                             select new CourseVM
                             {
                                 ID = n.ID,
                                 CourseName = n.CourseName,
                                 CourseDescription = n.CourseDescription,
                                 Duration = n.Duration,
                                 Price = n.Price,
                                 CategoryName = n.CategoryName,
                                 Instructor = n.Instructor
                             }).FirstOrDefault();
                return (model);
            }
            catch
            {
                return new CourseVM();
            }
        }

        public List<LessonVM> GetCourseLessons(int CourseID)
        {
            try
            {
                var model = (from n in _db.GetCourseLesson(CourseID)
                             select new LessonVM
                             {
                                 ID = n.ID,
                                 CourseName = n.CourseName,
                                 LessonName = n.LessonName
                             }).ToList();
                return (model);
            }
            catch
            {
                return new List<LessonVM>();
            }
        }

        public List<LessonVideoVM> GetLessonsVideo(int LessonID)
        {
            try
            {
                var model = (from n in _db.GetLessonVideos(LessonID)
                             select new LessonVideoVM
                             {
                                 ID = n.ID,
                                 VideoPath = n.VideoPath,
                                 VideoTitle = n.VideoTitle,
                             }).ToList();
                return (model);
            }
            catch
            {
                return new List<LessonVideoVM>();
            }
        }

        public List<LessonVideoVM> GetCourseVideo(int CourseID)

        {
            try
            {
                var model = (from n in _db.GetVideoByCourses(CourseID)
                             select new LessonVideoVM
                             {
                                 ID = n.ID,
                                 LessonID = n.LessonID,
                                 VideoPath = n.VideoPath,
                                 VideoTitle = n.VideoTitle,
                                 CourseName = n.CourseName
                             }).ToList();
                return (model);
            }
            catch
            {
                return new List<LessonVideoVM>();
            }
        }
    }
}