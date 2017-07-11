

$(document).ready(function(){
    $(".gnb_ul").mouseenter(function(){
        $(".sub_nav").stop().slideDown("slow");
    });
    $(".nav_wrap").mouseleave(function(){
        $(".sub_nav").stop().slideUp("slow");
    });
});

function moveUrl(form) {
    var Url=form.options[form.selectedIndex].value;
    if (Url!="") { location.href=Url;
    }
}