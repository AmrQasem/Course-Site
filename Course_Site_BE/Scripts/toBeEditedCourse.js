$(function(){
    $('#toBeEdited').on('change', function(){
        if($(this).val() == "Delete lesson"){
            $('.deleteLesson').removeClass('hidden');
        }
        else{
            $('.deleteLesson').addClass('hidden');
        }

        if($(this).val() == "Add video"){
            $('.addVideo').removeClass('hidden');
        }
        else{
            $('.addVideo').addClass('hidden');
        }

        if($(this).val() == "Delete video"){
            $('.deleteVideo').removeClass('hidden');
        }
        else{
            $('.deleteVideo').addClass('hidden');
        }

    })
})