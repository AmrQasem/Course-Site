$(function(){
    var lessons = [],
        lessonNumber = 0;
    
    $('.addNewLesson').click(()=>{
        //if(lessonName.value.trim() != "")
        var courseName = $('#course-name').val();
        var instructorName = $('#instructor-name').val();
        var courseImage = $('#choose-course-image').val();
        var details = $('#details').val();

        if(courseName.trim() == ""){
            alert("Please enter course name");
        }
        
        else if(instructorName.trim() == ""){
            alert("Please enter instructor name");
        }

        else if(courseImage.trim() == ""){
            alert("Please enter course image");
        }

        else if(details.trim() == ""){
            alert("Please enter course details");
        }
    })

})