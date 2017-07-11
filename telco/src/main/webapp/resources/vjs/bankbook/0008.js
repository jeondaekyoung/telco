var rootPath = window.location.protocol + '//' +window.location.host + '/telco';


$(document).ready(function(){
    $(".gnb_ul").mouseenter(function(){
        $(".sub_nav").stop().slideDown("slow");
    });
    $(".nav_wrap").mouseleave(function(){
        $(".sub_nav").stop().slideUp("slow");
    });
    
    //화면 초기화
    $("#tradeDiv").hide();
    $("#imgBankbook").show();
    
    //계좌조회
    $("#findBankbookTrade").click(function(){
    	var findNum = $("#account_num").val();
    	if(findNum == ""){
    		alert("계좌번호를 입력해주세요");
    	} else {
    		$.ajax({
    			url: rootPath + "/bankbook/findBankbookTrade.do"
    			,type: "POST"
    			,data: {
    				account_num: findNum
    			}
    			,success: findBankbookTradeSuccess
    			,error: errorCallback
    		})
    	}
    });
    
    //재발행 하기
    $("#reissue").click(function(){
    	if(checkValue() == true){
    		console.log("재발행");
    		$.ajax({
    			url: rootPath + "/bankbook/reissue.do"
    			,type: "POST"
    			,data: {
    				kind_sepa: '301'
    				,account_num: $("#account_num").val()
    				,certificate_num: $("#certificate_num").val()
    				,signet_sepa: $("#signet_sepa").val()
    				,management_point: $("#schoolName").val()
    			}
    			,success: reissueSuccess
    			,error: errorCallback
    		});
    	}
    });
});

//계좌조회(거래내역 포함)
var findBankbookTradeSuccess = function(resultData){
console.log("결과 - " + resultData);
$("#tradeDiv").show();
$("#imgBankbook").hide();
$.each(resultData, function(key, value){
if(key == "item_name"){
	if(value == ""){
		alert("찾는 계좌번호가 없습니다");
	}
	$("#item_name").val(value);
} else if(key == "bankbookTrades"){
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
var sysdate = new Date(item.trade_datetime);
var sbmTr = "<tr><td>" + sysdate.toLocaleString() + "</td><td>" + item.trade_no + "</td>"
				+ "<td>" + item.trade_sepa + "</td><td>" + item.currency_code + "</td>"
				+ "<td>" + item.trade_amount + "</td><td>" + item.trade_balance + "</td>"
				+ "<td>" + item.summary + "</td><td>" + item.client_name + "</td><td>" + item.management_point + "</td></tr>";
return sbmTr;
}
};
//재발행
var reissueSuccess = function(resultData){
if(resultData != "false"){
window.open(rootPath + '/views/bankbook/pop_0008.jsp','통장','width=430, height=550, scrollbars=yes, location=no');
}
}

//재발행 전 체크
var checkValue = function(){
if($("#account_num").val() == ""){
alert("통장 계좌번호를 조회해주세요");
$("#account_num").focus();
return false;
}
if($("#certificate_num").val() == ""){
alert("중요증서번호를 입력해주세요");
$("#certificate_num").focus();
return false;
}
return true;
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