
$(document).ready(function(){
    $(".gnb_ul").mouseenter(function(){
        $(".sub_nav").stop().slideDown("slow");
        //$(this).toggleClass("active"); return false;
    });
    $(".nav_wrap").mouseleave(function(){
        $(".sub_nav").stop().slideUp("slow");
        //$(this).toggleClass("active"); return false;
    });
    
  	$('.bxslider').bxSlider();
});