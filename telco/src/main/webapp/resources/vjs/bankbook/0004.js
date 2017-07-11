var rootPath = window.location.protocol + '//' +window.location.host + '/telco';


$(document).ready(function(){
    $(".gnb_ul").mouseenter(function(){
        $(".sub_nav").stop().slideDown("slow");
    });
    $(".nav_wrap").mouseleave(function(){
        $(".sub_nav").stop().slideUp("slow");
    });
    
    //계좌번호 조회
    $("#findBankbookPay").click(function(){
    	var findNum = $("#account_num").val();
    	//console.log(findNum);
      	if(findNum == ""){
      		alert("계좌번호를 입력해주세요");
      	} else {
      		$.ajax({
      			url: rootPath + "/bankbook/findBankbookPay.do"
      			,type: "POST"
      			,data: {
      				account_num: findNum
      			}
      			,success: findBankbookPaySuccess
      			,error: errorCallback
      		});
      	}
       });
    
    //연동 계좌번호 조회
    $("#telcoFindBankbook").click(function(){
     	var findNum = $("#telco_account_num").val();
    	if(findNum == ""){
    		alert("계좌번호를 입력해주세요");
    	} else {
    		$.ajax({
    			url: rootPath + "/bankbook/findBankbook.do"
    			,type: "POST"
    			,data: {
    				account_num: findNum
    			}
    			,success: telcoFindBankbookSuccess
    			,error: errorCallback
    		});
    	}
     });
    
    //해지실행
    $("#cancel").click(function(){
    	if(checkValue() == true){
    		console.log("해지실행");
    		$.ajax({
    			url: rootPath + "/bankbook/cancel.do"
    			,type: "POST"
    			,data: {
    				account_num: $("#account_num").val()
    				,cancel_message: $("#cancel_message").val()
    				,cash: $("#cash").val()
				 	,check_alternative: $("#check_alternative").val()
				 	,bank_alternative: $("#bank_alternative").val()
				 	,bankbook_pw: $("#bankbook_pw").val()
				 	,cancel_why_sepa: $("#cancel_why_sepa").val()
				 	,summary: checkNull($("#summary").val())
				 	,management_point: $("#schoolName").val()
				 	
				 	,check_no1: checkNull($("#check_no1").val())
    				,check_amount1: $("#check_amount1").val()
    				,number_of_sheet1: checkNull($("#number_of_sheet1").val())
    				,check_no2: checkNull($("#check_no2").val())
    				,check_amount2: $("#check_amount2").val()
    				,number_of_sheet2: checkNull($("#number_of_sheet2").val())
    				,check_no3: checkNull($("#check_no3").val())
    				,check_amount3: $("#check_amount3").val()
    				,number_of_sheet3: checkNull($("#number_of_sheet3").val())
    				,check_no4: checkNull($("#check_no4").val())
    				,check_amount4: $("#check_amount4").val()
    				,number_of_sheet4: checkNull($("#number_of_sheet4").val())
    				,check_no5: checkNull($("#check_no5").val())
    				,check_amount5: $("#check_amount5").val()
    				,number_of_sheet5: checkNull($("#number_of_sheet5").val())
    				
    				,telco_account_num: checkNull($("#telco_account_num").val())
    				,telco_summary: checkNull($("#telco_summary").val())
    				,telco_trade_amount: checkNull($("#telco_trade_amount").val())
    				,anot_bankname: $("#bankname").val()
    				,anot_account_num: checkNull($("#anot_account_num").val())
    				,anot_customer_name: checkNull($("#anot_customer_name").val())
    				,anot_summary: checkNull($("#anot_summary").val())
    				,anot_trade_amount: checkNull($("#anot_trade_amount").val())
    			}
    			,success: cancelSuccess
    			,error: errorCallback
    		});
    	}
    });
});


//계좌조회 결과
var findBankbookPaySuccess = function(resultData){
$.each(resultData, function(key, value){
//console.log(key + " / " + value);
if(key == "customer_name"){
	if(value == ""){
		alert("찾는 계좌번호가 없습니다.");
	}
	$("#customer_name").val(value);
} else if(key == "nowBalance"){
	$("#nowBalance").val(value);
	$("#nowBalance1").val(value);
}
});
};

//연동 계좌조회 결과
var telcoFindBankbookSuccess = function(resultData){
console.log("연동 계좌조회 - " + resultData);
if(resultData == ""){
alert("찾는 계좌번호가 없습니다.");
} else {
$("#telco_customer_name").val(resultData);
}
};

//해지 결과
var cancelSuccess = function(resultData){
console.log("해지 - " + resultData);
if(resultData == "pwInvalid"){
alert("비밀번호가 잘못되었습니다.");
} else if(resultData != "false"){
alert("정상 처리되었습니다.");
}
}

//필수항목 해지 전 체크
var checkValue = function(){
if(($("#account_num").val() == "") || ($("#customer_name").val() == "")){
alert("계좌번호를 입력 및 조회해주세요");
$("#account_num").focus();
return false;
}
var sum =  Number($("#cash").val()) +  Number($("#check_alternative").val()) +  Number($("#bank_alternative").val());
//console.log(sum);
if($("#nowBalance1").val() != sum){
alert("해지예상금액과 지급금액이 맞지않습니다");
$("#cash").focus();
return false;
}
if($("#bankbook_pw").val() == ""){
alert("비밀번호를 입력해주세요");
$("#bankbook_pw").focus();
return false;
}


return true;
}

//금액정보 합계
function addSum() {
var totalAmount = ($("#totalAmount").val() == "") ? 0 : parseInt($("#totalAmount").val());
var telcoTradeAmount = ($("#telco_trade_amount").val() == "") ? 0 : parseInt($("#telco_trade_amount").val());
var anotTradeAmount = ($("#anot_trade_amount").val() == "") ? 0 : parseInt($("#anot_trade_amount").val());
$("#check_alternative").val(totalAmount);
$("#bank_alternative").val(telcoTradeAmount + anotTradeAmount);
//var sum =  Number($("#cash").val()) +  Number($("#check_alternative").val()) +  Number($("#bank_alternative").val());

return;
};
//순대체 계산
var endnum = function(tag){	
var checkNo1 = ($("#check_no1").val() == "") ? 0 : parseInt($("#check_no1").val());
var checkAmount1 = $("#check_amount1").val();
var ofSheet1 = ($("#number_of_sheet1").val() == "") ? 0 : parseInt($("#number_of_sheet1").val());
var amount1;
switch(checkAmount1){
case "01": amount1 = 100000; break;
case "02": amount1 = 300000; break;
case "03": amount1 = 500000; break;
case "04": amount1 = 1000000; break;
default:
}
var checkNo2 = ($("#check_no2").val() == "") ? 0 : parseInt($("#check_no2").val());
var checkAmount2 = $("#check_amount2").val();
var ofSheet2 = ($("#number_of_sheet2").val() == "") ? 0 : parseInt($("#number_of_sheet2").val());
var amount2;
switch(checkAmount2){
case "01": amount2 = 100000; break;
case "02": amount2 = 300000; break;
case "03": amount2 = 500000; break;
case "04": amount2 = 1000000; break;
default:
}
var checkNo3 = ($("#check_no3").val() == "") ? 0 : parseInt($("#check_no3").val());
var checkAmount3 = $("#check_amount3").val();
var ofSheet3 = ($("#number_of_sheet3").val() == "") ? 0 : parseInt($("#number_of_sheet3").val());
var amount3;
switch(checkAmount3){
case "01": amount3 = 100000; break;
case "02": amount3 = 300000; break;
case "03": amount3 = 500000; break;
case "04": amount3 = 1000000; break;
default:
}
var checkNo4 = ($("#check_no4").val() == "") ? 0 : parseInt($("#check_no4").val());
var checkAmount4 = $("#check_amount4").val();
var ofSheet4 = ($("#number_of_sheet4").val() == "") ? 0 : parseInt($("#number_of_sheet4").val());
var amount4;
switch(checkAmount4){
case "01": amount4 = 100000; break;
case "02": amount4 = 300000; break;
case "03": amount4 = 500000; break;
case "04": amount4 = 1000000; break;
default:
}
var checkNo5 = ($("#check_no5").val() == "") ? 0 : parseInt($("#check_no5").val());
var checkAmount5 = $("#check_amount5").val();
var ofSheet5 = ($("#number_of_sheet5").val() == "") ? 0 : parseInt($("#number_of_sheet5").val());
var amount5;
switch(checkAmount5){
case "01": amount5 = 100000; break;
case "02": amount5 = 300000; break;
case "03": amount5 = 500000; break;
case "04": amount5 = 1000000; break;
default:
}

$("#totalAmount").val((amount1*ofSheet1)+(amount2*ofSheet2) + (amount3*ofSheet3) + (amount4*ofSheet4) + (amount5*ofSheet5));

addSum();
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