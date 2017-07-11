	$(document).ready(function(){
        $(".gnb_ul").mouseenter(function(){
            $(".sub_nav").stop().slideDown("slow");
        });
        $(".nav_wrap").mouseleave(function(){
            $(".sub_nav").stop().slideUp("slow");
        });
        
        //이용자 검색 액션
        $(".space2").hide();
        $("#searchTerms").change(function(){
            var term = $("#searchTerms").val();
            if(term == "searchDay") {
            	$(".space1").show();
            	$(".space2").hide();
            } else if(term == "searchName"){
            	$(".space1").hide();
            	$(".space2").show();
            }
        });
       //이용자 검색 submit()
	    $("#searchUsers").click(function(){
	    	if(checkValue1() == true){
		    	$("#searchUsersForm").submit();
	    	}
	    });
    });     //---- end of ready
    
    //이용자 검색 체크포인트
    var checkValue1 = function(){
 	   var term = $("#searchTerms").val();
 	   if(term == "searchDay"){
 		   if(($("#startDay").val()=="") || ($("#endDay").val()=="")){
 			   alert("조회기간을 입력해주세요.") ;
 			   return false;
 		   } 
 	   } else if(term == "searchName"){
 		   if($("#usersName").val() ==""){
 			   alert("성명을 입력해주세요");
 			   return false;
 		   }
 	   }
 	   return true;
    }

    jQuery(function($) {
		var tab = $('.tab_list');
		tab.removeClass('js_off');
		tab.css('height', tab.find('>ul>li>ul:visible').height() + 40);
		function onSelectTab() {
			var t = $(this);
			var myClass = t.parent('li').attr('class');
			t.parents('.tab_list:first').attr('class', 'tab_list ' + myClass);
			tab.css('height', t.next('ul').height() + 40);
		}
		tab.find('>ul>li>a').click(onSelectTab).focus(onSelectTab);
	});