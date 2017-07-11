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
    
    //실명번호 조회
    $("#findCustomer").click(function(){
		var findNum = $("#realname_num").val();
		if(findNum == ""){
			alert("실명번호를 입력해주세요");
		} else {
			$.ajax({
				url: rootPath + "/elec/findCustomer.do?realname_num=" + findNum
				,type: "POST"
				,success: findCustomerSuccess
				,error: errorCallback
			})
		}
	});
    
    //해지 실행
    $("#cancel").click(function(){
    	var sel1, index_cancel1, sel2, index_cancel2;
    	$("input:checkbox[name='selectbanking']:checked").each(function(index){
    		if(index == 0){
        		//console.log($(this).val());
        		var select = "#" + $(this).val();
        		//console.log("선택 - " + select);
        		//console.log("해지신청 - " + $(select).val());
        		sel1 = $(this).val();
        		index_cancel1 = $(select).val();
    		}
    		if(index == 1){
    			var select = "#" + $(this).val();
    			sel2 = $(this).val();
    			index_cancel2 = $(select).val();
    		}
    		
    	});
    	//console.log(sel1 + " / " + index_cancel1 + " / " + sel2 + " / " + index_cancel1);
    	$.ajax({
    		url: rootPath + "/elec/cancel.do"
    			,type: "POST"
    			,data: {
    				customer_no: $("#customer_no").val()
    				,cancel_branch: $("#schoolName").val()
    				
    				,sel1: sel1
    				,index_cancel1: index_cancel1
    				,sel2: sel2
    				,index_cancel2: index_cancel2
    			}
    			,success: cancelSuccess
    			,error: errorCallback
    	});
    });
    
    //결과 팝업화면
    $('#resultPopup').avgrund({
		height: 200,
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

//해지 결과
var cancelSuccess = function(resultData){
$.each(resultData, function(key, value){
if(key == "customer_name"){
	$("#resultTable > tbody").append("<tr><th>고객명</th><td>" + value +"</td></tr>");
} else if(key == "security_media1"){
	$("#resultTable > tbody").append("<tr><th>해지서비스</th><td>" + value + "</td></tr>");
} else if(key == "security_media2"){
	$("#resultTable > tbody").append("<tr><th>해지서비스</th><td>" + value + "</td><tr>");
}
});

//팝업실행
$("#resultPopup").show();
$("#resultPopup").trigger('click');
};

//실명번호 조회결과
var findCustomerSuccess = function(resultData){
//console.log("조회 결과 - " + resultData);
$.each(resultData, function(key, value){
if(key == "customer_name"){
	if(value == ""){
		alert("찾는 고객이 없습니다.");
	}
	$("#customer_name").val(value);
} else if(key == "customer_no"){
	$("#customer_no").val(value);
} else if(key == "elecs"){
	$("#myTable > tbody").empty();
	$.each(value, function(index, item){
		var sbmTr = sbmHtmlTemplate.makesbmTr(index, item);
		$("#myTable > tbody").append(sbmTr);
	});
}
});
}

var sbmHtmlTemplate = {
makesbmTr : function(index, item){
//console.log(index + " / " + sysdate);
var sbmTr = "<tr><td>" + (index+1) + "</td><td><input type='checkbox' name='selectbanking' value='" + item.elec_sepa + item.elec_no + "'></td><td>" + item.elec_sepa + "</td>"
				+ "<td>" + item.elec_id + "</td><td>" + item.state + "</td><td>" 
				+ "<select title='해지신청' id='" + item.elec_sepa + item.elec_no + "'><option value='01' selected>01:해지(인증서폐기)</option><option value='02'>02:해지(인증서폐기안함)</option></select>"
				+ 	"</td></tr>";
return sbmTr;
}
}


//페이지 이동
function moveUrl(form) {
var Url=form.options[form.selectedIndex].value;
if (Url!="") { location.href=Url;
}
}
//Ajax 에러 콜백함수
var errorCallback = function(){
alert("수행 중 오류가 발생했습니다.");
};