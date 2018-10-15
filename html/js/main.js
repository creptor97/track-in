$(document).ready(function(){
    $('.menu-toggle').click(function(){
        $("ul li").slideToggle(500);
    });
    
    $(window).resize(function(){
        if ($(window).width() > 500){
            $('nav li').removeAttr('style');
        }
    });
    
    
    $("#search").focusin(function(){
        $(this).animate({width : '180px'});
    });
    $("#search").focusout(function(){
        $(this).animate({width : '75px'});
    });
    
});


