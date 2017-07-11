var rootPath = window.location.protocol + '//' +window.location.host + '/telco';


$(document).ready(function(){
    $(".gnb_ul").mouseenter(function(){
        $(".sub_nav").stop().slideDown("slow");
    });
    $(".nav_wrap").mouseleave(function(){
        $(".sub_nav").stop().slideUp("slow");
    });
    
    //출금계좌번호 조회
    $("#findAtcngsByBankbook").click(function(){
    	var findNum = $("#account_num").val();
       	if(findNum == ""){
       		alert("계좌번호를 입력해주세요");
       	} else {
       		$.ajax({
       			url: rootPath + "/automatic/findAtcngsByBankbook.do"
       			,type: "POST"
       			,data: {
       				account_num: findNum
       				,busi_kind: $("#busi_kind").val()
       				,using_or: 'Y'
       			}
       			,success: findAtcngsByBankbookSuccess
       			,error: errorCallback
       		});
       	}
   	});
  
    //입금계좌번호 조회
    $("#depositBankbook").click(function(){
    	var bankname = $("#transfer_bank").val();
    	var findNum = $("#transfer_account_num").val();
    	if(bankname != "01"){
    		alert("타행은 직접 입력하세요");
    		//$("#transfer_customer_name").attr("readonly", true);
    	} else {
    		//$("#transfer_customer_name").removeAttr("readonly");
    		if(findNum == ""){
    			alert("계좌번호를 입력해주세요");
    		} else {
    			$.ajax({
    				url: rootPath + "/automatic/findBankbook.do"
    				,type: "POST"
    				,data: {
    					account_num: findNum
    				}
    				,success: depositBankbookSuccess
    				,error: errorCallback
    			})
    		}
    	}
    });
    
    //변경하기
    $("#modify").click(function(){
    	if(checkValue() == true){
    		console.log("변경하기");
    		$.ajax({
    			url: rootPath + "/automatic/modify.do"
    			,type: "POST"
    			,data: {
    				account_num: $("#account_num").val()
    				,withdrawal_pw: $("#withdrawal_pw").val()
    				
    				,seq_no: $("#seq_no").val()
    				,transfer_bank: bankname($("#transfer_bank").val())
    				,transfer_account_num: $("#transfer_account_num").val()
    				,transfer_customer_name: $("#transfer_customer_name").val()
    				
    				,transfer_day: $("#transfer_day").val()
    				,transfer_interval: $("#transfer_interval").val()
    				,atcng_amount: $("#atcng_amount").val()
    				,transfer_start: $("#transfer_start").val()
    				,transfer_end: $("#transfer_end").val()
    				,summary: checkNull($("#summary").val())
    				,to_summary: checkNull($("#to_summary").val())
    				,from_summary: checkNull($("#from_summary").val())
    			}
    			,success: modifySuccess
    			,error: errorCallback
    		});
    	}
    });
    
});

//출금계좌번호 조회
var findAtcngsByBankbookSuccess = function(resultData){
console.log("결과 - " + resultData);
$.each(resultData, function(key, value){
if(key == "customer_name"){
	if(value == ""){
		alert("찾는 고객이 없습니다");
	}
	$("#customer_name").val(value);
} else if(key == "atcngs"){
	//console.log("atcngs - " + value);
	$("#myTable > tbody").empty();
	$.each(value, function(index, item){
		var sbmTr = sbmHtmlTemplate.makesbmTr(index, item);
		$("#myTable > tbody").append(sbmTr);
	});
}
});
};
var sbmHtmlTemplate = {
makesbmTr : function(index, item){
var sbmTr = "<tr><td><a class='mybtn' onclick='findAtcngBySeqNo(" + item.seq_no + ");'>변경</a></td><td>" + item.app_day + "</td>"
+ "<td>" + item.transfer_bank + "</td><td>" + item.transfer_account_num + "</td>"
+ "<td>" + item.transfer_customer_name + "</td><td>" + item.atcng_amount + "</td>"
+ "<td>" + item.transfer_interval + "</td><td>" + item.transfer_day + "</td>"
+ "<td>" + item.transfer_start + "</td><td>" + item.transfer_end + "</td>"
+ "<td>" + item.to_summary + "</td><td>" + item.from_summary + "</td></tr>";
return sbmTr;
}
};
//변경할 자동이체 정보 조회
var findAtcngBySeqNo = function(seq_no){
$.ajax({
url: rootPath + "/automatic/findAtcngBySeqNo.do"
,type: "POST"
,data: {
	seq_no: seq_no
}
,success: findAtcngBySeqNoSuccess
,error: errorCallback
});
};
var findAtcngBySeqNoSuccess = function(resultData){
console.log("결과 - " + resultData);
if(resultData == ""){
alert("조회가 실패하였습니다");
} else {
$("#seq_no").val(resultData.seq_no);
$("#transfer_bank").val(bankcode(resultData.transfer_bank));
$("#transfer_account_num").val(resultData.transfer_account_num);
$("#transfer_customer_name").val(resultData.transfer_customer_name);
$("#transfer_day").val(resultData.transfer_day);
$("#transfer_interval").val(resultData.transfer_interval);
$("#atcng_amount").val(resultData.atcng_amount);
$("#transfer_start").val(resultData.transfer_start);
$("#transfer_end").val(resultData.transfer_end);
$("#summary").val(resultData.summary);
$("#to_summary").val(resultData.to_summary);
$("#from_summary").val(resultData.from_summary);
}
};
function bankcode(transfer_bank){
switch(transfer_bank){
case "텔코": return "01";
case "국민": return "02";
case "우리": return "03";
case "신한": return "04";
case "기업": return "05";
case "하나": return "06";
case "농협중앙회": return "07";
}
};
function bankname(transfer_bank){
switch(transfer_bank){
case "01": return "텔코";
case "02": return "국민";
case "03": return "우리";
case "04": return "신한";
case "05": return "기업";
case "06": return "하나";
case "07": return "농협중앙회";
}
};
//입금계좌번호 조회
var depositBankbookSuccess = function(resultData){
console.log("결과 - " + resultData);
if(resultData == ""){
alert("찾는 계좌번호가 없습니다.");
} else {
$("#transfer_customer_name").val(resultData);
}
};

//변경하기
var modifySuccess = function(resultData){
console.log("결과 - " + resultData);
if(resultData == "pwInvalid"){
alert("비밀번호가 잘못되었습니다");
} else if(resultData != "false"){
alert("정상 처리되었습니다");
}
};

//변경하기 전 체크
var checkValue = function(){
if($("#account_num").val() == "" || $("#customer_name").val() == ""){
alert("출금계좌를 입력해주세요");
$("#account_num").focus();
return false;
}
if($("#withdrawal_pw").val() == ""){
alert("비밀번호를 입력해주세요");
$("#withdrawal_pw").focus();
return false;
}
if($("#seq_no").val() == ""){
alert("자동이체 정보 변경내용을 확인해주세요");
return false;
} else {
if($("#transfer_account_num").val() == "" || $("#transfer_customer_name").val() == ""){
	alert("입금계좌를 확인해주세요");
	$("#transfer_account_num").focus();
	return false;
}
if($("#transfer_day").val() == ""){
	alert("이체 기일을 입력해주세요");
	$("#transfer_day").focus();
	return false;
}
if($("#atcng_amount").val() == ""){
	alert("이체금액을 입력해주세요");
	$("#atcng_amount").focus();
	return false;
}
if($("#transfer_start").val() == ""){
	alert("이체개시일을 입력해주세요");
	$("#transfer_start").focus();
	return false;
}
if($("#transfer_end").val() == ""){
	alert("이체만료일을 입력해주세요");
	$("#transfer_end").focus();
	return false;
}
}

return true;
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
//페이지 이동
function moveUrl(form) {
var Url = form.options[form.selectedIndex].value;
if (Url != "") {
location.href = Url;
}
};
//달력
$(function() {
$("#transfer_start, #transfer_end").datepicker({ 
 inline: true, 
 dateFormat: "yy-mm-dd",    /* 날짜 포맷 */ 
 prevText: 'prev', 
 nextText: 'next', 
 showButtonPanel: true,    /* 버튼 패널 사용 */ 
 changeMonth: true,        /* 월 선택박스 사용 */ 
 changeYear: true,        /* 년 선택박스 사용 */ 
showOtherMonths: true,    /* 이전/다음 달 일수 보이기 */ 
selectOtherMonths: true,    /* 이전/다음 달 일 선택하기 */ 
showOn: "button", 
buttonImage: rootPath + "/resources/image/icon/calendar.png",
buttonImageOnly: true, 
minDate: '-30y', 
closeText: '닫기', 
currentText: '오늘', 
showMonthAfterYear: true,        /* 년과 달의 위치 바꾸기 */ 
/* 한글화 */ 
monthNames : ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'], 
monthNamesShort : ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'], 
dayNames : ['일', '월', '화', '수', '목', '금', '토'],
dayNamesShort : ['일', '월', '화', '수', '목', '금', '토'],
dayNamesMin : ['일', '월', '화', '수', '목', '금', '토'],
showAnim: 'slideDown', 
/* 날짜 유효성 체크 */ 
onClose: function( selectedDate ) { 
    $('#fromDate').datepicker("option","minDate", selectedDate); 
} 
}); 
});