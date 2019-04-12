$(function(){
   
    'use strict';
    var myurl = $('.musicList .list ul .active').attr('url');

    var width = $("#player").width();
    var height = $("#player").height();
    

    var myoudio = document.getElementById('player');
    myoudio.innerHTML = `<iframe 
                            width="${width}" 
                            height="${height}" 
                            src="https://www.youtube.com/embed/${myurl}" 
                            frameborder="0" allow="accelerometer; autoplay; 
                            encrypted-media; gyroscope; picture-in-picture" 
                            allowfullscreen>
                        </iframe>`;
    

    //click on track
    $('.musicList .list ul li').click(function() {
        $('.musicList .list ul .active').removeClass('active');
        $(this).addClass('active');
        var myurl = $('.musicList .list ul .active').attr('url');

        
        
        var myoudio = document.getElementById('player');
        myoudio.innerHTML = `<iframe 
                                width="${width}" 
                                height="${height}" 
                                src="https://www.youtube.com/embed/${myurl}" 
                                frameborder="0" allow="accelerometer; autoplay; 
                                encrypted-media; gyroscope; picture-in-picture" 
                                allowfullscreen>
                            </iframe>`;
    });      
        
});