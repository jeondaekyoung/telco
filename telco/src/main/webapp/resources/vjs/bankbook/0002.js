var rootPath = window.location.protocol + '//' +window.location.host + '/telco';


$(document).ready(function(){
    $(".gnb_ul").mouseenter(function(){
        $(".sub_nav").stop().slideDown("slow");
    });
    $(".nav_wrap").mouseleave(function(){
        $(".sub_nav").stop().slideUp("slow");
    });
    
    //계좌번호 조회
    $("#findBankbook").click(function(){
    	var bankname = $("#bankname").val();
    	var findNum = $("#account_num").val();
    	if(bankname != "01"){
    		alert("타행은 직접 입력하세요");
    	} else {
        	if(findNum == ""){
        		alert("계좌번호를 입력해주세요");
        	} else {
        		$.ajax({
        			url: rootPath + "/bankbook/findBankbook.do"
        			,type: "POST"
        			,data: {
        				account_num: findNum
        			}
        			,success: findBankbookSuccess
        			,error: errorCallback
        		});
        	}
    	}
    });
    
    //입금실행
    $("#deposit").click(function(){
    	if(checkValue() == true){
        	$.ajax({
        		url: rootPath + "/bankbook/deposit.do"
        		,type: "POST"
        		,data: {
        			bankname: $("#bankname").val()
        			,account_num: $("#account_num").val()
        			,customer_name: $("#customer_name").val()
        			,cash: $("#cash").val()
        			,check_alternative: $("#check_alternative").val()
        			,bank_alternative: $("#bank_alternative").val()
        			,summary: checkNull($("#summary").val())
        			,management_point: $("#schoolName").val()
        			,client_name: $("#client_name").val()
        			,client_num: $("#client_num").val()
        			,client_relation: $("#client_relation").val()
        			,sub_name: checkNull($("#sub_name").val())
        			,sub_num: checkNull($("#sub_num").val())
        			
        			,check_amount1: checkNull($("#check_amount1").val())
        			,start_num1: checkNull($("#start_num1").val())
        			,number_of_sheet1: checkNull($("#number_of_sheet1").val())
        			,end_num1: checkNull($("#end_num1").val())
        			,giro_code1: checkNull($("#giro_code1").val())
        			,check_amount2: checkNull($("#check_amount2").val())
        			,start_num2: checkNull($("#start_num2").val())
        			,number_of_sheet2: checkNull($("#number_of_sheet2").val())
        			,end_num2: checkNull($("#end_num2").val())
        			,giro_code2: checkNull($("#giro_code2").val())
        			,check_amount3: checkNull($("#check_amount3").val())
        			,start_num3: checkNull($("#start_num3").val())
        			,number_of_sheet3: checkNull($("#number_of_sheet3").val())
        			,end_num3: checkNull($("#end_num3").val())
        			,giro_code3: checkNull($("#giro_code3").val())

        		}
        		,success: depositSuccess
        		,error: errorCallback
        	});
    	}
    });
    
	//결과 팝업화면
	$('#resultPopup').avgrund({
		height: 230,
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
    
});//-->ready end

var findBankbookSuccess = function(resultData){
console.log("계좌조회 - " + resultData);
/* if(resultData == undefined){
	console.log("undefined");
} 
if(resultData == null){
	console.log("null");
} 
if(resultData == ""){
	console.log("빈문자열");
}  */
if(resultData == ""){
	alert("찾는 계좌번호가 없습니다.");
} else {
	$("#customer_name").val(resultData);
}
};

var depositSuccess = function(resultData){
$.each(resultData, function(key, value){
	if(key == "bankname"){
		$("#resultTable > tbody").append("<tr><th>입금은행</th><td>" + value + "</td></tr>");
	} else if(key == "bankbookInfo"){
		$("#resultTable > tbody").append("<tr><th>입금계좌</th><td>" + value.account_num + "</td></tr>");
	} else if(key == "customer_name"){
		$("#resultTable > tbody").append("<tr><th>예금주</th><td>" + value + "</td><tr>");
	} else if(key == "bankbookTrade"){
		$("#resultTable > tbody").append("<tr><th>입금액</th><td>" + value.trade_amount + "</td></tr>");
	}
});

//팝업실행
$("#resultPopup").show();
$("#resultPopup").trigger('click');
}

//금액정보 합계
function addSum() {
var sum =  Number($("#cash").val()) +  Number($("#check_alternative").val()) +  Number($("#bank_alternative").val());
$("#balance").val( sum );
return;
};

//필수항목 입금 전 체크
var checkValue = function(){
if(($("#account_num").val() == "") || ($("#customer_name").val() == "")){
	alert("계좌번호를 입력 및 조회해주세요");
	$("#account_num").focus();
	return false;
} else if($("#balance").val() == 0){
	alert("입금금액을 확인해주세요");
	return false;
} else if($("#client_num").val() == ""){
	alert("의뢰인 실명번호를 입력해주세요");
	$("#client_num").focus();
	return false;
} else if($("#client_name").val() == ""){
	alert("의뢰인 성명을 입력해주세요");
	$("#client_name").focus();
	return false;
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

//연동대체 계산
var endnum = function(tag){
var checkAmount, startNum, ofSheet, amount;
var amount1 = ($("#amount1").val() == "") ? 0 : parseInt($("#amount1").val());
var amount2 = ($("#amount2").val() == "") ? 0 : parseInt($("#amount2").val());
var amount3 = ($("#amount3").val() == "") ? 0 : parseInt($("#amount3").val());
switch(tag.name){
case "case1":
	checkAmount = $("#check_amount1").val();
	startNum = $("#start_num1").val();
	ofSheet = $("#number_of_sheet1").val();
	amount;
	switch(checkAmount){
		case "01": amount = 100000; break;
		case "02": amount = 300000; break;
		case "03": amount = 500000; break;
		case "04": amount = 1000000; break;
		default:
	}
	
	if((startNum != 0) && (ofSheet != 0)){
		var endNum = parseInt(startNum)+parseInt(ofSheet)-1;
		$("#end_num1").val(endNum);
		$("#amount1").val( amount*ofSheet);
		$("#totalAmount").val(parseInt($("#amount1").val()) + amount2 + amount3);
		$("#bank_alternative").val(parseInt($("#amount1").val()) + amount2 + amount3);
	}
	if(ofSheet == ""){
		$("#amount1").val('');
		$("#totalAmount").val(amount2 + amount3);
		$("#bank_alternative").val(amount2 + amount3);
	} else if(ofSheet == 0){
		$("#amount1").val("");
		$("#totalAmount").val(amount2 + amount3);
		$("#bank_alternative").val(amount2 + amount3);
	}
	if(startNum == ""){
		$("#end_num1").val('');
	} else if(startNum == 0){
		var endNum = parseInt(ofSheet)-1;
		$("#end_num1").val(endNum);
	} 
	
	break;
case "case2":
	checkAmount = $("#check_amount2").val();
	startNum = $("#start_num2").val();
	ofSheet = $("#number_of_sheet2").val();
	amount;
	switch(checkAmount){
		case "01": amount = 100000; break;
		case "02": amount = 300000; break;
		case "03": amount = 500000; break;
		case "04": amount = 1000000; break;
		default:
	}
	if((startNum != 0) && (ofSheet != 0)){
		var endNum = parseInt(startNum)+parseInt(ofSheet)-1;
		$("#end_num2").val(endNum);
		$("#amount2").val( amount*ofSheet);
		$("#totalAmount").val(amount1 + parseInt($("#amount2").val()) + amount3);
		$("#bank_alternative").val(amount1 + parseInt($("#amount2").val()) + amount3);
	}
	if(ofSheet == ""){
		$("#amount2").val('');
		$("#totalAmount").val(amount1 + amount3);
		$("#bank_alternative").val(amount1 + amount3);
	} else if(ofSheet == 0){
		$("#amount2").val("");
		$("#totalAmount").val(amount1 + amount3);
		$("#bank_alternative").val(amount1 + amount3);
	}
	if(startNum == ""){
		$("#end_num2").val('');
	} else if(startNum == 0){
		var endNum = parseInt(ofSheet)-1;
		$("#end_num2").val(endNum);
	}
	break;
case "case3":
	checkAmount = $("#check_amount3").val();
	startNum = $("#start_num3").val();
	ofSheet = $("#number_of_sheet3").val();
	amount;
	switch(checkAmount){
		case "01": amount = 100000; break;
		case "02": amount = 300000; break;
		case "03": amount = 500000; break;
		case "04": amount = 1000000; break;
		default:
	}
	if((startNum != 0) && (ofSheet != 0)){
		var endNum = parseInt(startNum)+parseInt(ofSheet)-1;
		$("#end_num3").val(endNum);
		$("#amount3").val( amount*ofSheet);
		$("#totalAmount").val(amount1 + amount2 + parseInt($("#amount3").val()));
		$("#bank_alternative").val(amount1 + amount2 + parseInt($("#amount3").val()));
	}
	if(ofSheet == ""){
		$("#amount3").val('');
		$("#totalAmount").val(amount1 + amount2);
		$("#bank_alternative").val(amount1 + amount2);
	} else if(ofSheet == 0){
		$("#amount3").val("");
		$("#totalAmount").val(amount1 + amount2);
		$("#bank_alternative").val(amount1 + amount2);
	}
	if(startNum == ""){
		$("#end_num3").val('');
	} else if(startNum == 0){
		var endNum = parseInt(ofSheet)-1;
		$("#end_num3").val(endNum);
	} 
	break;
default: break;
}

addSum();
};

//대리인 항목 출력여부
function relationshipAccountHolder() {
if( $("#client_relation").val()=="01" ) {
	$(".ones").hide();
	$("#sub_name").removeClass("isEssential");
	$("#sub_num").removeClass("isEssential");
}
else {
	$(".ones").show();
	$("#sub_name").addClass("isEssential");
	$("#sub_num").addClass("isEssential");
}
return;
}
