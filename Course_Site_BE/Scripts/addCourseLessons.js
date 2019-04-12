$(function(){
    var lessons = [],
        lessonNumber = 0;
    
    $('.addNewLesson').click(()=>{
        //var lessonName = $('input[name="course-name"]').val();

        //Add form to add lesson
        var newLesson = `<div class="addlesson">
                            <input id="lesson-Name" class="lesson-Name form-control" type="text" placeholder="Lesson Name">
                            <input id="lesson-number" class="lesson-number form-control" type="text" placeholder="Lesson Number">
                            <input id="choose-lesson${lessonNumber} lesson-vids-to-add" class="lesson-vids form-control" type="text" name="course-videos" placeholder="Lessons Links">
                            <div class="text-center">
                                <input class="lesson-added btn btn-success" value="Done" type="button">
                                <input class="lesson-canceled btn btn-warning" value="Cancel" type="button">
                            </div>
                        </div>`;
        $('.course-content').append(newLesson);

        //add event lestinet when press Done
        var addedLesson = document.getElementsByClassName('lesson-added');
        
        addedLesson[addedLesson.length-1].onclick = function(){
           //console.log($(this).parent().parent().find('#lesson-Name').val());
            //vidsTitle = $(this).parent().parent().find('.lesson-vids');
            var lessonName = this.parentElement.parentElement.getElementsByClassName('lesson-Name')[0];
            var lessonNumber = this.parentElement.parentElement.getElementsByClassName('lesson-number')[0].value;
            var vidsInfo = this.parentElement.parentElement.getElementsByClassName('lesson-vids')[0];

            //check if lesson name not empty
            if(lessonName.value.trim() != ""){
                /*console.log(lessonName.value);
                console.log(vidsInfo);*/

                /* check if lesson inserted before */
                var isfound=-1;
                for(var i =0; i<lessons.length; i++){
                    if(lessons[i]["name"] == lessonName.value){
                        isfound = i;
                        break;
                    }
                }
                if(isfound!=-1){
                    alert("This lesson is allready exist");
                    return;
                }

                //check if lesson number >0
                if(lessonNumber <= 0){
                    alert("Lesson number must start from 1");
                    return;
                }

                //check if videos are entered
                if(vidsInfo.value.trim() != ""){

                    var vidsName = vidsInfo.value.split(',');
                    for(var i =0; i<vidsInfo.length; i++){
                        vidsName[vidsName.length] = vidsInfo[i].name;
                    }
                    var lesson = {
                        "name" : lessonName.value,
                        "number" : lessonNumber,
                        "lessons" : vidsName
                    }

                    lessons[lessonNumber-1] = lesson;
                    var contentList = document.getElementsByClassName('content')[0];
                    contentList.innerHTML="";
                    
                    for(var i =0; i<lessons.length; i++){
                        //if lesson index is empty
                        if(lessons[i] == undefined){
                            continue;
                        }
                        var lessonNameNode = document.createElement('li');
                        lessonNameNode.setAttribute('class', 'lesson');
                        var lessonNameNodeText = document.createTextNode(lessons[i]["name"]);
                        lessonNameNode.appendChild(lessonNameNodeText);

                        var lessonVideos = document.createElement('ul');

                        for(var j =0; j<lessons[i]["lessons"].length; j++){
                            var lessonVideosElements = document.createElement('li');
                            var lessonVideosElementsName = document.createTextNode(lessons[i]["lessons"][j]);
                            lessonVideosElements.appendChild(lessonVideosElementsName);
                            lessonVideos.appendChild(lessonVideosElements);
                        }
                        lessonNameNode.appendChild(lessonVideos);
                        contentList.appendChild(lessonNameNode);
                    }
                }
                else{
                    alert("Please Choose videos")
                }
            }
            else{
                alert("Please Enter Lesson Name")
            }
        }

        //add event lestinet when press cancel
        var removedLesson = document.getElementsByClassName('lesson-canceled');
        removedLesson[removedLesson.length-1].onclick = function(){
            //console.log($(this).parent().parent().find('input').eq(1).attr('id'));
            var lessonName = this.parentElement.parentElement.getElementsByClassName('lesson-Name')[0];
            var lessonIndex = -1;
            for(var i =0; i<lessons.length; i++){
                //if lesson index is empty
                if(lessons[i] == undefined){
                    continue;
                }

                if(lessons[i]["name"] == lessonName.value){
                    lessonIndex = i;
                    break;
                }
            }
            if (lessonIndex > -1) {
                lessons.splice(lessonIndex, 1);
            }
            else{
                alert("lesson name not found")
            }

            var contentList = document.getElementsByClassName('content')[0];
            contentList.innerHTML="";

            for(var i =0; i<lessons.length; i++){
                //if lesson index is empty
                if(lessons[i] == undefined){
                    continue;
                }
                var lessonNameNode = document.createElement('li');
                lessonNameNode.setAttribute('class', 'lesson');
                var lessonNameNodeText = document.createTextNode(lessons[i]["name"]);
                lessonNameNode.appendChild(lessonNameNodeText);

                var lessonVideos = document.createElement('ul');

                for(var j =0; j<lessons[i]["lessons"].length; j++){
                    var lessonVideosElements = document.createElement('li');
                    var lessonVideosElementsName = document.createTextNode(lessons[i]["lessons"][j]);
                    lessonVideosElements.appendChild(lessonVideosElementsName);
                    lessonVideos.appendChild(lessonVideosElements);
                }
                lessonNameNode.appendChild(lessonVideos);
                contentList.appendChild(lessonNameNode);
            }
        }
        
        lessonNumber++;
    })

})