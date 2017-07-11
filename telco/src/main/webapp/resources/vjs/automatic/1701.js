var rootPath = window.location.protocol + '//' +window.location.host + '/telco';

$(document).ready(function(){
    $(".gnb_ul").mouseenter(function(){
        $(".sub_nav").stop().slideDown("slow");
    });
    $(".nav_wrap").mouseleave(function(){
        $(".sub_nav").stop().slideUp("slow");
    });
    
    //출금계좌번호 조회
    $("#findBankbook").click(function(){
    	var findNum = $("#account_num").val();
       	if(findNum == ""){
       		alert("계좌번호를 입력해주세요");
       	} else {
       		$.ajax({
       			url: rootPath + "/automatic/findBankbook.do"
       			,type: "POST"
       			,data: {
       				account_num: findNum
       			}
       			,success: findBankbookSuccess
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
    
    //내용추가 
    $("#addContent").click(function(){
    	//console.log("내용추가");
    	if(checkValue() == true){
    		var sbmTr = sbmHtmlTemplate.makesbmTr();
    		$("#myTable > tbody").append(sbmTr);
    	}
    });
    
    //자동이체 등록
    $("#register").click(function(){
    	console.log("자동이체 등록 - " + $("#myTable > tbody > tr").length);
    	if($("#myTable > tbody > tr").length <= 0){
    		alert("자동이체를 입력해주세요");
    		return ;
    	}
    	
    	//tr갯수
    	var trs = $("#myTable > tbody > tr").length;
    	var datas = new Array();
    	for(i=1; i<=trs; i++){
    		var data = "";
    		var td = "#no_" + i + " > td";
    		var tds = $(td).length;
    		//console.log("td갯수 - " + tds);
    		for(j=0; j<tds; j++){
    			data += "," + $(td)[j].innerHTML;
    		}
    		datas.push(data);
    	}
    	
    	console.log("결과 - " + datas);
    	$.ajax({
    		url: rootPath + "/automatic/register.do"
    		,type: "POST"
    		,data: {
    			busi_kind: $("#busi_kind").val()
    			,account_num: $("#account_num").val()
    			,withdrawal_pw: $("#withdrawal_pw").val()
    			
    			,trs: trs
    			,datas: datas
    		}
    		,success: registerSuccess
    		,error: errorCallback
    	});
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

//출금계좌번호 조회
var findBankbookSuccess = function(resultData){
console.log("결과 - " + resultData);
if(resultData == ""){
alert("찾는 계좌번호가 없습니다.");
} else {
$("#customer_name").val(resultData);
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
//자동이체 등록
var registerSuccess = function(resultData){
$.each(resultData, function(key, value){
if(key == "account_num"){
	if(value == "pwInvalid"){
		$("#resultTable > tbody").append("<tr><td>비밀번호가 잘못되었습니다</td></tr>");
	} else {
		$("#resultTable > tbody").append("<tr><th>출금계좌</th><td>" + value +"</td></tr>");
	}
} else if(key == "transfer"){
	$.each(value, function(index, item){
		$("#resultTable > tbody").append("<tr><th>입금계좌</th><td>" + item + "</td></tr>");
		
	});
} 
});

//팝업실행
$("#resultPopup").show();
$("#resultPopup").trigger('click');
}

//내용추가 전 체크
var checkValue = function(){
if($("#account_num").val() == "" || $("#customer_name").val() == ""){
alert("출금계좌를 입력해주세요");
$("#account_num").focus();
return false;
}
if($("#withdrawal_pw").val() == ""){
alert("출금계좌 비밀번호를 입력해주세요");
$("#withdrawal_pw").focus();
return false;
}
if($("#transfer_account_num").val() == "" || $("#transfer_customer_name").val() == ""){
alert("입금계좌를 입력해주세요");
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

return true;
};

//내용추가 템플릿
var sbmHtmlTemplate = {
makesbmTr : function(){
	//오늘날짜
	var today = new Date(); 
	var app_day = leadingZeros(today.getFullYear(),4) + "-" + leadingZeros(today.getMonth()+1, 2) + "-" + leadingZeros(today.getDate(), 2);
	//console.log(day);
	
	var transfer_bank = bankname($("#transfer_bank").val());
	var transfer_account_num = $("#transfer_account_num").val();
	var transfer_customer_name = $("#transfer_customer_name").val();
	var transfer_day = $("#transfer_day").val();
	var transfer_interval = intervalname($("#transfer_interval").val());
	var atcng_amount = $("#atcng_amount").val();
	var transfer_start = $("#transfer_start").val();
	var transfer_end = $("#transfer_end").val();
	var to_summary = $("#to_summary").val();
	var from_summary = $("#from_summary").val();
	var summary = $("#summary").val();

	var trs = '#myTable>tbody>tr';
	var sbmTr = "<tr id='no_" + ($(trs).length+1) + "'><td>" + ($(trs).length+1) +  "</td>"
					+ "<td>" +  app_day + "</td>"
					+ "<td>" + transfer_bank + "</td>"
					+ "<td>" + transfer_account_num	 + "</td>"
					+ "<td>" + transfer_customer_name + "</td>"
					+ "<td>" + atcng_amount + "</td>"
					+ "<td>1개월</td>"
					+ "<td>" + transfer_day + "</td>"
					+ "<td>" + transfer_start + "</td>"
					+ "<td>" + transfer_end + "</td>"
					+ "<td>" + to_summary + "</td>"
					+ "<td>" + from_summary + "</td>"
					+ "<td style='display:none;'>" + summary + "</td>";
	return sbmTr;
}
}
function leadingZeros(n, digits){
var zero = '';
n = n.toString();
if(n.length < digits){
for(i=0;i<digits-n.length; i++){
	zero += '0';
}
}
return zero + n;
}
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
}
function intervalname(transfer_interval){
switch(transfer_interval){
case "01": return "1개월";
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