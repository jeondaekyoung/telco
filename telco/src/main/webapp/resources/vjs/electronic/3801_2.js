if( window.location.host =='localhost:8080'){
	  var rootPath = window.location.protocol + '//' + window.location.host+'/telco';  
  }
  else
  var rootPath = window.location.protocol + '//' + window.location.host;


var using_elec_id = false;
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
	
	//ID 변경
	$("#searchElecId").click(function(){
		//console.log("아이디 변경");
		if($("#internet_elec_id").prop('disabled') == true){
			alert("인터넷뱅킹 정보 변경이 활성화되어야합니다.");
			return;
		}
		if($("#internet_elec_id").val() == ""){
			alert("아이디를 입력해주세요.");
			$("#internet_elec_id").focus();
			return;
		}
		$.ajax({
			url: rootPath + "/elec/searchElecId.do"
			,type: "POST"
			,data: {
				elec_id: $("#internet_elec_id").val()
			}
			,success: searchElecIdSuccess
			,error: errorCallback
		})
	});
	
	//변경하기
	$("#modify").click(function(){
		if(checkValue() == true){
			console.log("변경");
			$.ajax({
				url: rootPath + "/elec/modify.do"
				,type: "POST"
				,data: {
					customer_no: $("#customer_no").val()
					,security_media_sepa: $("#security_media_sepa").val()
					,security_media_no: checkNull($("#security_media_no").val())
					
					,internet_elec_id: checkNull($("#internet_elec_id").val())
					,internet_elec_pw: checkNull($("#internet_elec_pw").val())
					,internet_elec_transfer_day: checkNull($("#internet_elec_transfer_day").val())
					,internet_elec_transfer_once: checkNull($("#internet_elec_transfer_once").val())
					,phone_elec_pw: checkNull($("#phone_elec_pw").val())
					,phone_elec_transfer_day: checkNull($("#phone_elec_transfer_day").val())
					,phone_elec_transfer_once: checkNull($("#phone_elec_transfer_once").val())
				}
				,success: modifySuccess
				,error: errorCallback
			})
		}
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
	//클릭이벤트 생성
	$("input:checkbox[name='selectbanking']").click(function(){
		checkboxSelect($(this).val());
	});
}
});
}

//ID 조회 결과
var searchElecIdSuccess = function(resultData){
//console.log("ID 조회 결과 -" + resultData);
$("#idResult").empty();
if(resultData == true){
$("#idResult").append("사용가능한 아이디입니다.");
using_elec_id = true;
} else {
$("#idResult").append("사용중인 아이디입니다. ");
using_elec_id = false;
}
}

var sbmHtmlTemplate = {
makesbmTr : function(index, item){
//console.log(index + " / " + sysdate);
var sbmTr = "<tr><td>" + (index+1) + "</td><td><input type='checkbox' name='selectbanking' value='" + item.elec_sepa + item.elec_no + "'></td><td>" + item.elec_sepa + "</td>"
				+ "<td>" + item.elec_id + "</td><td>" + item.state + "</td>" + "<td>" + item.change_date + "</td><td>" 
				+ item.security_media_sepa + "</td><td>" + item.security_media_no + "</td></tr>";
return sbmTr;
}
}

//변경 결과
var modifySuccess = function(resultData){
$.each(resultData, function(key, value){
if(key == "customer_name"){
	console.log("고객명 : " + value);
	$("#resultTable > tbody").append("<tr><th>고객명</th><td>" + value +"</td></tr>");
} else if(key == "elec_info"){
	console.log("공통전자금융 : " + value);
	$("#resultTable > tbody").append("<tr><th>보안매체</th><td>" + codeTochar(value.security_media_sepa) + "," + value.security_media_no + "</td></tr>");
} else if(key == "elec_internet"){
	console.log("인터넷뱅킹 : " + value);
	$("#resultTable > tbody").append("<tr><th>인터넷뱅킹 정보</th><td>" + value.elec_id + "," + value.elec_transfer_day + "," + value.elec_transfer_once + "</td><tr>");
} else if(key == "elec_phone"){
	console.log("폰뱅킹 : " + value);
	$("#resultTable > tbody").append("<tr><th>폰뱅킹 정보</th><td>" + value.elec_transfer_day + "," + value.elec_transfer_once + "</td></tr>");
}
});

//팝업실행
$("#resultPopup").show();
$("#resultPopup").trigger('click');
};
//보안매체 코드->문자로 변환
var codeTochar = function(security_media_sepa){
switch(security_media_sepa){
case "01": return "보안카드";
case "02": return "OTP카드";
}
};

//인터넷뱅킹, 폰뱅킹 입력창 활성화
var checkboxSelect = function(value){
//console.log("선택-" + value);
if(value.indexOf("인터넷뱅킹") == 0){
var str = "input:checkbox[value='" + value + "']";
if($(str).prop('checked') == true){
	$("#internet_elec_id").removeAttr("disabled");
	$("#internet_elec_pw").removeAttr("disabled");
	$("#internet_elec_transfer_day").removeAttr("disabled");
	$("#internet_elec_transfer_once").removeAttr("disabled");
	$("#internet_elec_id").removeAttr("disabled");
} else {
	$("#internet_elec_id").attr("disabled", true).val("");
	$("#internet_elec_pw").attr("disabled", true).val("");
	$("#internet_elec_transfer_day").attr("disabled", true).val("");
	$("#internet_elec_transfer_once").attr("disabled", true).val("");
	$("#internet_elec_id").attr("disabled", true).val("");
}
}
if(value.indexOf("폰뱅킹") == 0){
var str = "input:checkbox[value='" + value + "']";
//console.log("text - " + $(str).prop('checked'));
if($(str).prop('checked') == true){
	$("#phone_elec_pw").removeAttr("disabled");
	$("#phone_elec_transfer_day").removeAttr("disabled");
	$("#phone_elec_transfer_once").removeAttr("disabled");
} else {
	$("#phone_elec_pw").attr("disabled", true).val("");
	$("#phone_elec_transfer_day").attr("disabled", true).val("");
	$("#phone_elec_transfer_once").attr("disabled", true).val("");
}
} 
}


//변경 전 체크
var checkValue = function(){
if($("#realname_num").val() == "" || $("#customer_name").val() == ""){
alert("실명번호를 조회해주세요");
$("#realname_num").focus();
return false;
}
//console.log("시작");
var eachResult = true;
$("input:checkbox[name='selectbanking']:checked").each(function(){
var select = $(this).val();
if(select.indexOf("인터넷뱅킹") == 0){
	if($("#internet_elec_pw").val() == "" || $("#internet_elec_transfer_day").val() == "" || 
			$("#internet_elec_transfer_once").val() == "" || $("#internet_elec_id").val() == ""){
		alert("인터넷뱅킹 정보 변경사항을 입력해주세요");
		eachResult = false;
	} else {
		//console.log("ID 변경 가능 - " + using_elec_id);
		if(using_elec_id == false){
			alert("ID 변경을 확인해주세요");
			eachResult = false;
		}
	}
}
if(select.indexOf("폰뱅킹") == 0){
	if($("#phone_elec_pw").val() == "" || $("#phone_elec_transfer_day").val() == "" || 
			$("#phone_elec_transfer_once").val() == ""){
		alert("폰뱅킹 정보 변경사항을 입력해주세요");
		eachResult = false;
	}
}
});
//console.log("끝 " + eachResult);
if(eachResult == false){
return false;
} else {
if($("#security_media_no").val() == ""){
	alert("보안매체를 입력해주세요");
	return false;
}
}
return true;
}

//페이지 이동
function moveUrl(form) {
var Url=form.options[form.selectedIndex].value;
if (Url!="") { location.href=Url;
}
}

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