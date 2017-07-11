        $(document).ready(function(){
            $(".gnb_ul").mouseenter(function(){
                $(".sub_nav").stop().slideDown("slow");
            });
            $(".nav_wrap").mouseleave(function(){
                $(".sub_nav").stop().slideUp("slow");
            });
        });