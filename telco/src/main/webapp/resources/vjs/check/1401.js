if( window.location.host =='localhost:8080'){
	  var rootPath = window.location.protocol + '//' + window.location.host+'/telco';  
  }
  else
  var rootPath = window.location.protocol + '//' + window.location.host;



$(document).ready(function(){
    $(".gnb_ul").mouseenter(function(){
        $(".sub_nav").stop().slideDown("slow");
    });
    $(".nav_wrap").mouseleave(function(){
        $(".sub_nav").stop().slideUp("slow");
    });
    
    //채번 등록
    $("#registerCheckNo").click(function(){
    	if(checkValue() == true){
        	//console.log("채번등록 실행");
    		$.ajax({
    			url : rootPath + "/check/registerCheckNo.do"
    			,type: "POST"
    			,data: {
    				check_no: $("#check_no").val()
    				,print_or: $("#print_or").val()
    				
    				,check_sepa1: $("#check_sepa1").val()
    				,number_of_sheet1: checkNull($("#number_of_sheet1").val())
    				,check_num1: checkNull($("#check_num1").val())
    				,check_sepa2: $("#check_sepa2").val()
    				,number_of_sheet2: checkNull($("#number_of_sheet2").val())
    				,check_num2: checkNull($("#check_num2").val())
    				,check_sepa3: $("#check_sepa3").val()
    				,number_of_sheet3: checkNull($("#number_of_sheet3").val())
    				,check_num3: checkNull($("#check_num3").val())
    				,check_sepa4: $("#check_sepa4").val()
    				,number_of_sheet4: checkNull($("#number_of_sheet4").val())
    				,check_num4: checkNull($("#check_num4").val())
    				,check_sepa5: $("#check_sepa5").val()
    				,number_of_sheet5: checkNull($("#number_of_sheet5").val())
    				,check_num5: checkNull($("#check_num5").val())
    			}
    			,success: registerCheckNoSuccess
    			,error: errorCallback
    		});
    	}
    });
    
	//결과 팝업화면
	$('#resultPopup').avgrund({
		height: 350,
		holderClass: 'custom',
		closeByEscape: false,
		closeByDocument: false,
		showClose: true,
		showCloseText: '확인',
		onUnload: function () {
			window.location.reload()
		},
		template: $("#resultPopup")
	});
});

var registerCheckNoSuccess = function(resultData){
$.each(resultData, function(key, value){
if(key == "check_no"){
	$("#resultTable > tbody").append("<tr><th>채번번호</th><td>" + value +"</td></tr>");
} else if(key == "checks"){
	$.each(value, function(index, item){
		$("#resultTable > tbody").append("<tr><th>수표권종 정보</th><td>" + item + "</td></tr>");
	});
} 
});

//팝업실행
$("#resultPopup").show();
$("#resultPopup").trigger('click');
};
//필수항목 등록 전 체크
var checkValue = function(){
if($("#check_no").val() == ""){
alert("채번번호를 등록해주세요");
$("#check_no").focus();
return false;
}

var case1 = $("#case1").val();
var case2 = $("#case2").val();
var case3 = $("#case3").val();
var case4 = $("#case4").val();
var case5 = $("#case5").val();
if((case1 == "input") || (case2 == "input") || (case3 == "input") || (case4 == "input") || (case5 == "input")){
if(case1 == "output"){
	if(!($("#number_of_sheet1").val() != "") || !($("#check_num1").val() != "")){
		//console.log("둘중 하나이상은 없다.");
		if(!($("#number_of_sheet1").val() != "") && !($("#check_num1").val() != "")){
			//console.log("둘다 없다.. 이상무");
		}else {
			alert("매수와 시작번호를 확인하세요");
			return false;
		}
	}	
}
if(case2 == "output"){
	if(!($("#number_of_sheet2").val() != "") || !($("#check_num2").val() != "")){
		//console.log("둘중 하나이상은 없다.");
		if(!($("#number_of_sheet2").val() != "") && !($("#check_num2").val() != "")){
			//console.log("둘다 없다.. 이상무");
		}else {
			alert("매수와 시작번호를 확인하세요");
			return false;
		}
	}	
}
if(case3 == "output"){
	if(!($("#number_of_sheet3").val() != "") || !($("#check_num3").val() != "")){
		//console.log("둘중 하나이상은 없다.");
		if(!($("#number_of_sheet3").val() != "") && !($("#check_num3").val() != "")){
			//console.log("둘다 없다.. 이상무");
		}else {
			alert("매수와 시작번호를 확인하세요");
			return false;
		}
	}	
}
if(case4 == "output"){
	if(!($("#number_of_sheet4").val() != "") || !($("#check_num4").val() != "")){
		//console.log("둘중 하나이상은 없다.");
		if(!($("#number_of_sheet4").val() != "") && !($("#check_num4").val() != "")){
			//console.log("둘다 없다.. 이상무");
		}else {
			alert("매수와 시작번호를 확인하세요");
			return false;
		}
	}	
}
if(case5 == "output"){
	if(!($("#number_of_sheet5").val() != "") || !($("#check_num5").val() != "")){
		//console.log("둘중 하나이상은 없다.");
		if(!($("#number_of_sheet5").val() != "") && !($("#check_num5").val() != "")){
			//console.log("둘다 없다.. 이상무");
		}else {
			alert("매수와 시작번호를 확인하세요");
			return false;
		}
	}	
}
} else {
alert("수표정보 내역을 확인해주세요.");
return false;
}

return true;
}

//최종번호 계산
var endnum = function(tag){
switch(tag.name){
case "case1":
if(($("#number_of_sheet1").val() != "") && ($("#check_num1").val() != "")){
	//console.log("case1 최종번호 입력");
	var ofSheet1 = ($("#number_of_sheet1").val() == "") ? 0 : parseInt($("#number_of_sheet1").val());
	var checkNum1 = ($("#check_num1").val() == "") ? 0 : parseInt($("#check_num1").val());
	$("#endNum1").val(checkNum1+ofSheet1-1);
	$("#case1").val("input");
} else {
	//console.log("case1 최종번호 지우기");
	$("#endNum1").val("");
	$("#case1").val("output");
}
break;
case "case2":
if(($("#number_of_sheet2").val() != "") && ($("#check_num2").val() != "")){
	//console.log("case2 최종번호 입력");
	var ofSheet2 = ($("#number_of_sheet2").val() == "") ? 0 : parseInt($("#number_of_sheet2").val());
	var checkNum2 = ($("#check_num2").val() == "") ? 0 : parseInt($("#check_num2").val());
	$("#endNum2").val(checkNum2+ofSheet2-1);
	$("#case2").val("input");
} else {
	//console.log("case1 최종번호 지우기");
	$("#endNum2").val("");
	$("#case2").val("output");
}
break;
case "case3":
if(($("#number_of_sheet3").val() != "") && ($("#check_num3").val() != "")){
	var ofSheet3 = ($("#number_of_sheet3").val() == "") ? 0 : parseInt($("#number_of_sheet3").val());
	var checkNum3 = ($("#check_num3").val() == "") ? 0 : parseInt($("#check_num3").val());
	$("#endNum3").val(checkNum3+ofSheet3-1);
	$("#case3").val("input");
} else {
	$("#endNum3").val("");
	$("#case3").val("output");
}
break;
case "case4":
if(($("#number_of_sheet4").val() != "") && ($("#check_num4").val() != "")){
	var ofSheet4 = ($("#number_of_sheet4").val() == "") ? 0 : parseInt($("#number_of_sheet4").val());
	var checkNum4 = ($("#check_num4").val() == "") ? 0 : parseInt($("#check_num4").val());
	$("#endNum4").val(checkNum4+ofSheet4-1);
	$("#case4").val("input");
} else {
	$("#endNum4").val("");
	$("#case4").val("output");
}
break;
case "case5":
if(($("#number_of_sheet5").val() != "") && ($("#check_num5").val() != "")){
	var ofSheet5 = ($("#number_of_sheet5").val() == "") ? 0 : parseInt($("#number_of_sheet5").val());
	var checkNum5 = ($("#check_num5").val() == "") ? 0 : parseInt($("#check_num5").val());
	$("#endNum5").val(checkNum5+ofSheet5-1);
	$("#case5").val("input");
} else {
	$("#endNum5").val("");
	$("#case5").val("output");
}
break;
default: break;
}
};
//Ajax 데이터 널체크
var checkNull = function(data){
if(data==""){
return undefined;
} else {
return data;
}
};
//Ajax 에러 콜백함수
var errorCallback = function(){
alert("수행 중 오류가 발생했습니다.");
};