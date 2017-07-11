var rootPath = window.location.protocol + '//' +window.location.host + '/telco';


$(document).ready(function(){
    $(".gnb_ul").mouseenter(function(){
        $(".sub_nav").stop().slideDown("slow");
    });
    $(".nav_wrap").mouseleave(function(){
        $(".sub_nav").stop().slideUp("slow");
    });
    
    //지급실행
    $("#payment").click(function(){
    	if(checkValue() == true){
    		//console.log("자기앞수표지급실행");
    		$.ajax({
    			url: rootPath + "/check/payment.do"
    			,type: "POST"
    			,data: {
    				cash: $("#cash").val()
    				,check_alternative: $("#check_alternative").val()
    				,bank_alternative: $("#bank_alternative").val()
    				,client_realname_num: $("#client_realname_num").val()
    				,client_name: $("#client_name").val()
    				,client_relation: $("#client_relation").val()
    				,sub_num: checkNull($("#sub_num").val())
    				,sub_name: checkNull($("#sub_name").val())
    				,management_point: $("#schoolName").val()
    				
    				,check_sepa1: $("#check_sepa1").val()
    				,number_of_sheet1: checkNull($("#number_of_sheet1").val())
    				,start_num1: checkNull($("#start_num1").val())
    				,giro_code1: checkNull($("#giro_code1").val())
    				,check_sepa2: $("#check_sepa2").val()
    				,number_of_sheet2: checkNull($("#number_of_sheet2").val())
    				,start_num2: checkNull($("#start_num2").val())
    				,giro_code2: checkNull($("#giro_code2").val())
    				,check_sepa3: $("#check_sepa3").val()
    				,number_of_sheet3: checkNull($("#number_of_sheet3").val())
    				,start_num3: checkNull($("#start_num3").val())
    				,giro_code3: checkNull($("#giro_code3").val())
    				,check_sepa4: $("#check_sepa4").val()
    				,number_of_sheet4: checkNull($("#number_of_sheet4").val())
    				,start_num4: checkNull($("#start_num4").val())
    				,giro_code4: checkNull($("#giro_code4").val())
    				,check_sepa5: $("#check_sepa5").val()
    				,number_of_sheet5: checkNull($("#number_of_sheet5").val())
    				,start_num5: checkNull($("#start_num5").val())
    				,giro_code5: checkNull($("#giro_code5").val())
    				
    				,check_no11: checkNull($("#check_no11").val())
    				,check_sepa11: $("#check_sepa11").val()
    				,number_of_sheet11: checkNull($("#number_of_sheet11").val())
    				,check_no12: checkNull($("#check_no12").val())
    				,check_sepa12: $("#check_sepa12").val()
    				,number_of_sheet12: checkNull($("#number_of_sheet12").val())
    				,check_no13: checkNull($("#check_no13").val())
    				,check_sepa13: $("#check_sepa13").val()
    				,number_of_sheet13: checkNull($("#number_of_sheet13").val())
    				,check_no14: checkNull($("#check_no14").val())
    				,check_sepa14: $("#check_sepa14").val()
    				,number_of_sheet14: checkNull($("#number_of_sheet14").val())
    				,check_no15: checkNull($("#check_no15").val())
    				,check_sepa15: $("#check_sepa15").val()
    				,number_of_sheet15: checkNull($("#number_of_sheet15").val())
    				
    				,telco_account_num: checkNull($("#telco_account_num").val())
    				,telco_summary: checkNull($("#telco_summary").val())
    				,telco_trade_amount: checkNull($("#telco_trade_amount").val())
    				,anot_bankname: $("#bankname").val()
    				,anot_account_num: checkNull($("#anot_account_num").val())
    				,anot_customer_name: checkNull($("#anot_customer_name").val())
    				,anot_summary: checkNull($("#anot_summary").val())
    				,anot_trade_amount: checkNull($("#anot_trade_amount").val())
    				
    				
    			}
    			,success: paymentSuccess
    			,error: errorCallback
    		})
    		
    	}
    });
    
    //연동 계좌번호 조회
    $("#telcoFindBankbook").click(function(){
    	var findNum = $("#telco_account_num").val();
    	if(findNum == ""){
    		alert("계좌번호를 입력해주세요.");
    	} else {
    		$.ajax({
    			url: rootPath + "/check/findBankbook.do"
    			,type: "POST"
    			,data: {
    				account_num: findNum
    			}
    			,success: telcoFindBankbookSuccess
    			,error: errorCallback
    		})
    	}
    })
    
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

//자기앞수표 지급 결과
var paymentSuccess = function(resultData){
$.each(resultData, function(key, value){
if(key == "amount"){
	$("#resultTable > tbody").append("<tr><th>금액</th><td>" + value +"</td></tr>");
} else if(key == "checks"){
	$.each(value, function(index, item){
		$("#resultTable > tbody").append("<tr><th>수표권종 정보</th><td>" + item + "</td></tr>");
	});
} 
});

//팝업실행
$("#resultPopup").show();
$("#resultPopup").trigger('click');
}

//자기앞수표지급 전 체크
var checkValue = function(){
if(($("#totalAmount").val() == "") || ($("#totalAmount").val() == 0)){
alert("수표정보를 확인해주세요");
return false;
}

var case1 = $("#case1").val();
var case2 = $("#case2").val();
var case3 = $("#case3").val();
var case4 = $("#case4").val();
var case5 = $("#case5").val();
if((case1 == "input") || (case2 == "input") || (case3 == "input") || (case4 == "input") || (case5 == "input")){
if(case1 == "output"){
	if(!($("#number_of_sheet1").val() != "") || !($("#start_num1").val() != "")){
		//console.log("둘중 하나이상은 없다.");
		if(!($("#number_of_sheet1").val() != "") && !($("#start_num1").val() != "")){
			//console.log("둘다 없다.. 이상무");
		}else {
			alert("매수와 시작번호를 확인하세요");
			return false;
		}
	}	
}
if(case2 == "output"){
	if(!($("#number_of_sheet2").val() != "") || !($("#start_num2").val() != "")){
		//console.log("둘중 하나이상은 없다.");
		if(!($("#number_of_sheet2").val() != "") && !($("#start_num2").val() != "")){
			//console.log("둘다 없다.. 이상무");
		}else {
			alert("매수와 시작번호를 확인하세요");
			return false;
		}
	}	
}
if(case3 == "output"){
	if(!($("#number_of_sheet3").val() != "") || !($("#start_num3").val() != "")){
		//console.log("둘중 하나이상은 없다.");
		if(!($("#number_of_sheet3").val() != "") && !($("#start_num3").val() != "")){
			//console.log("둘다 없다.. 이상무");
		}else {
			alert("매수와 시작번호를 확인하세요");
			return false;
		}
	}	
}
if(case4 == "output"){
	if(!($("#number_of_sheet4").val() != "") || !($("#start_num4").val() != "")){
		//console.log("둘중 하나이상은 없다.");
		if(!($("#number_of_sheet4").val() != "") && !($("#start_num4").val() != "")){
			//console.log("둘다 없다.. 이상무");
		}else {
			alert("매수와 시작번호를 확인하세요");
			return false;
		}
	}	
}
if(case5 == "output"){
	if(!($("#number_of_sheet5").val() != "") || !($("#start_num5").val() != "")){
		//console.log("둘중 하나이상은 없다.");
		if(!($("#number_of_sheet5").val() != "") && !($("#start_num5").val() != "")){
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

if(($("#totalCash").val() == "") || ($("#totalCash").val() == 0)){
alert("금액정보를 확인해주세요.");
return false;
}
if($("#totalAmount").val() != $("#totalCash").val()){
alert("수표정보의 총금액과 금액정보 합계가 같아야합니다.");
return false;
}
if($("#client_realname_num").val() == ""){
alert("의뢰인 실명번호를 입력해주세요.");
$("#client_realname_num").focus();
return false;
} 
if($("#client_name").val() == "")	{
alert("의뢰인 성명을 입력해주세요.");
$("#client_name").focus();
return false;
}
if($("#client_relation").val() == "02"){
if(($("#sub_name").val() == "" ) || ($("#sub_num").val() == "")){
	alert("대리인 실명번호와 대리인 성명을 입력해주세요");
	return false;
}
}
if($("#telco_account_num").val() !== ""){
if(($("#telco_trade_amount").val() == "") || ($("#telco_trade_amount").val() == 0)){
	alert("연동을 확인하세요");
	return false;
}
if($("#telco_customer_name").val() == ""){
	alert("연동 계좌번호를 조회해주세요.");
	return false;
}
}
if($("#anot_account_num").val() != ""){
if(($("#anot_customer_name").val() == "") || ($("#anot_trade_amount").val() == "") || ($("#anot_trade_amount").val() == 0)){
	alert("타행을 확인하세요");
	return false;
}
}

return true;
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

//수표정보 계산
var endnum = function(tag){
var checkSepa, ofSheet, amount, start_num;
var amount1 = ($("#amount1").val() == "") ? 0 : parseInt($("#amount1").val());
var amount2 = ($("#amount2").val() == "") ? 0 : parseInt($("#amount2").val());
var amount3 = ($("#amount3").val() == "") ? 0 : parseInt($("#amount3").val());
var amount4 = ($("#amount4").val() == "") ? 0 : parseInt($("#amount4").val());
var amount5 = ($("#amount5").val() == "") ? 0 : parseInt($("#amount5").val());
switch(tag.name){
case "case1":
checkSepa = $("#check_sepa1").val();
ofSheet = ($("#number_of_sheet1").val() == "") ? 0 : parseInt($("#number_of_sheet1").val());
start_num = ($("#start_num1").val() == "") ? 0 : parseInt($("#start_num1").val());
switch(checkSepa){
	case "01": amount = 100000; break;
	case "02": amount = 300000; break;
	case "03": amount = 500000; break;
	case "04": amount = 1000000; break;
	default:
}
if(ofSheet != 0){
	$("#amount1").val(amount*ofSheet);
	$("#totalAmount").val(parseInt($("#amount1").val()) + amount2 + amount3 + amount4 + amount5);
	$("#end_num1").val(start_num+ofSheet-1);
	$("#case1").val("input");
}
if(ofSheet == ""){
	$("#amount1").val("");
	$("#totalAmount").val(amount2 + amount3 + amount4 + amount5);
	$("#end_num1").val("");
	$("#case1").val("output");
} else if(ofSheet == 0){
	$("#amount1").val("");
	$("#totalAmount").val(amount2 + amount3 + amount4 + amount5);
	$("#end_num1").val("");
	$("#case1").val("output");
}
if(start_num == ""){
	$("#end_num1").val("");
	$("#case1").val("output");
}

break;
case "case2":
checkSepa = $("#check_sepa2").val();
ofSheet = ($("#number_of_sheet2").val() == "") ? 0 : parseInt($("#number_of_sheet2").val());
start_num = ($("#start_num2").val() == "") ? 0 : parseInt($("#start_num2").val());
switch(checkSepa){
	case "01": amount = 100000; break;
	case "02": amount = 300000; break;
	case "03": amount = 500000; break;
	case "04": amount = 1000000; break;
	default:
}
if(ofSheet != 0){
	$("#amount2").val(amount*ofSheet);
	$("#totalAmount").val(amount1 + parseInt($("#amount2").val()) + amount3 + amount4 + amount5);
	$("#end_num2").val(start_num+ofSheet-1);
	$("#case2").val("input");
}
if(ofSheet == ""){
	$("#amount2").val('');
	$("#totalAmount").val(amount1 + amount3 + amount4 + amount5);
	$("#end_num2").val("");
	$("#case2").val("output");
} else if(ofSheet == 0){
	$("#amount2").val("");
	$("#totalAmount").val(amount1 + amount3 + amount4 + amount5);
	$("#end_num2").val("");
	$("#case2").val("output");
}
if(start_num == ""){
	$("#end_num2").val("");
	$("#case2").val("output");
}
break;
case "case3":
checkSepa = $("#check_sepa3").val();
ofSheet = ($("#number_of_sheet3").val() == "") ? 0 : parseInt($("#number_of_sheet3").val());
start_num = ($("#start_num3").val() == "") ? 0 : parseInt($("#start_num3").val());
switch(checkSepa){
	case "01": amount = 100000; break;
	case "02": amount = 300000; break;
	case "03": amount = 500000; break;
	case "04": amount = 1000000; break;
	default:
}
if(ofSheet != 0){
	$("#amount3").val(amount*ofSheet);
	$("#totalAmount").val(amount1 + amount2 + parseInt($("#amount3").val()) + amount4 + amount5);
	$("#end_num3").val(start_num+ofSheet-1);
	$("#case3").val("input");
}
if(ofSheet == ""){
	$("#amount3").val('');
	$("#totalAmount").val(amount1 + amount2 + amount4 + amount5);
	$("#end_num3").val("");
	$("#case3").val("output");
} else if(ofSheet == 0){
	$("#amount3").val("");
	$("#totalAmount").val(amount1 + amount2 + amount4 + amount5);
	$("#end_num3").val("");
	$("#case3").val("output");
}
if(start_num == ""){
	$("#end_num3").val("");
	$("#case3").val("output");
}
break;
case "case4":
checkSepa = $("#check_sepa4").val();
ofSheet = ($("#number_of_sheet4").val() == "") ? 0 : parseInt($("#number_of_sheet4").val());
start_num = ($("#start_num4").val() == "") ? 0 : parseInt($("#start_num4").val());
switch(checkSepa){
	case "01": amount = 100000; break;
	case "02": amount = 300000; break;
	case "03": amount = 500000; break;
	case "04": amount = 1000000; break;
	default:
}
if(ofSheet != 0){
	$("#amount4").val(amount*ofSheet);
	$("#totalAmount").val(amount1 + amount2 + amount3 + parseInt($("#amount4").val()) + amount5);
	$("#end_num4").val(start_num+ofSheet-1);
	$("#case4").val("input");
}
if(ofSheet == ""){
	$("#amount4").val('');
	$("#totalAmount").val(amount1 + amount2 + amount3 + amount5);
	$("#end_num4").val("");
	$("#case4").val("output");
} else if(ofSheet == 0){
	$("#amount4").val("");
	$("#totalAmount").val(amount1 + amount2 + amount3 + amount5);
	$("#end_num4").val("");
	$("#case4").val("output");
}
if(start_num == ""){
	$("#end_num4").val("");
	$("#case4").val("output");
}
break;
case "case5":
checkSepa = $("#check_sepa5").val();
ofSheet = ($("#number_of_sheet5").val() == "") ? 0 : parseInt($("#number_of_sheet5").val());
start_num = ($("#start_num5").val() == "") ? 0 : parseInt($("#start_num5").val());
switch(checkSepa){
	case "01": amount = 100000; break;
	case "02": amount = 300000; break;
	case "03": amount = 500000; break;
	case "04": amount = 1000000; break;
	default:
}
if(ofSheet != 0){
	$("#amount5").val(amount*ofSheet);
	$("#totalAmount").val(amount1 + amount2 + amount3 + amount4 + parseInt($("#amount5").val()));
	$("#end_num5").val(start_num+ofSheet-1);
	$("#case5").val("input");
}
if(ofSheet == ""){
	$("#amount5").val('');
	$("#totalAmount").val(amount1 + amount2 + amount3 + amount4);
	$("#end_num5").val("");
	$("#case5").val("output");
} else if(ofSheet == 0){
	$("#amount5").val("");
	$("#totalAmount").val(amount1 + amount2 + amount3 + amount4);
	$("#end_num5").val("");
	$("#case5").val("output");
}
if(start_num == ""){
	$("#end_num5").val("");
	$("#case5").val("output");
}
break;
default: break;
}
};        

//금액정보 합계
function addSum() {
var totalCheck = ($("#totalCheck").val() == "") ? 0 : parseInt($("#totalCheck").val());
var telcoTradeAmount = ($("#telco_trade_amount").val() == "") ? 0 : parseInt($("#telco_trade_amount").val());
var anotTradeAmount = ($("#anot_trade_amount").val() == "") ? 0 : parseInt($("#anot_trade_amount").val());
$("#check_alternative").val(totalCheck);
$("#bank_alternative").val(telcoTradeAmount + anotTradeAmount);
var sum =  Number($("#cash").val()) +  Number($("#check_alternative").val()) +  Number($("#bank_alternative").val());
$("#totalCash").val( sum );
return;
};

//대리인 항목 출력여부
function relationshipAccountHolder() {
if( $("#client_relation").val()=="01" ) {
$(".ones").hide();
}
else {
$(".ones").show();
$("#sub_name").val("");
$("#sub_num").val("");
}
return;
};

//수표발행/입금/송금계산
var checkAlternative = function(){
var checkAmount1 = $("#check_sepa11").val();
var ofSheet1 = ($("#number_of_sheet11").val() == "") ? 0 : parseInt($("#number_of_sheet11").val());
var amount1;
switch(checkAmount1){
case "01": amount1 = 100000; break;
case "02": amount1 = 300000; break;
case "03": amount1 = 500000; break;
case "04": amount1 = 1000000; break;
default:
}
var checkAmount2 = $("#check_sepa12").val();
var ofSheet2 = ($("#number_of_sheet12").val() == "") ? 0 : parseInt($("#number_of_sheet12").val());
var amount2;
switch(checkAmount2){
case "01": amount2 = 100000; break;
case "02": amount2 = 300000; break;
case "03": amount2 = 500000; break;
case "04": amount2 = 1000000; break;
default:
}
var checkAmount3 = $("#check_sepa13").val();
var ofSheet3 = ($("#number_of_sheet13").val() == "") ? 0 : parseInt($("#number_of_sheet13").val());
var amount3;
switch(checkAmount3){
case "01": amount3 = 100000; break;
case "02": amount3 = 300000; break;
case "03": amount3 = 500000; break;
case "04": amount3 = 1000000; break;
default:
}
var checkAmount4 = $("#check_sepa14").val();
var ofSheet4 = ($("#number_of_sheet14").val() == "") ? 0 : parseInt($("#number_of_sheet14").val());
var amount4;
switch(checkAmount4){
case "01": amount4 = 100000; break;
case "02": amount4 = 300000; break;
case "03": amount4 = 500000; break;
case "04": amount4 = 1000000; break;
default:
}
var checkAmount5 = $("#check_sepa15").val();
var ofSheet5 = ($("#number_of_sheet15").val() == "") ? 0 : parseInt($("#number_of_sheet15").val());
var amount5;
switch(checkAmount5){
case "01": amount5 = 100000; break;
case "02": amount5 = 300000; break;
case "03": amount5 = 500000; break;
case "04": amount5 = 1000000; break;
default:
}

$("#totalCheck").val((amount1*ofSheet1)+(amount2*ofSheet2) + (amount3*ofSheet3) + (amount4*ofSheet4) + (amount5*ofSheet5));

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