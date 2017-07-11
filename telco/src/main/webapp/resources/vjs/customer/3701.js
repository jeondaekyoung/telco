var rootPath = window.location.protocol + '//' +window.location.host + '/telco';



var account_num_flag = false;
$(document).ready(function(){
    $(".gnb_ul").mouseenter(function(){
        $(".sub_nav").stop().slideDown("slow");
    });
    $(".nav_wrap").mouseleave(function(){
        $(".sub_nav").stop().slideUp("slow");
    });
    
    //실명번호 조회
    $("#findCustomerDebit").click(function(){
    	var findNum = $("#realname_num").val();
    	if(findNum == ""){
    		alert("실명번호를 입력해주세요");
    	} else {
    		$.ajax({
    			url: rootPath + "/card/findCustomerDebit.do"
    			,type: "POST"
    			,data: {
    				realname_num: findNum
    			}
    			,success: findCustomerDebit
    			,error: errorCallback
    		})
    	}
    });
    
    //결제계좌번호 조회
    $("#findCustomerBankbook").click(function(){
    	var findNum = $("#account_num").val();
    	if(findNum == ""){
    		alert("결제계좌번호를 입력해주세요");
    	} else if($("#realname_num").val() == "" || $("#customer_name").val() == ""){
    		alert("실명번호를 조회해주세요");
    	} else {
    		$.ajax({
    			url: rootPath + "/card/findCustomerBankbook.do"
    			,type: "POST"
    			,data: {
    				realname_num: $("#realname_num").val()
    				,account_num: findNum
    			}
    			,success: findCustomerBankbook
    			,error: errorCallback
    		});
    	}
    });
    
    //직불카드 발급
    $("#issueDcard").click(function(){
    	if(checkValue() == true){
    		console.log("직불카드 발급");
    		$.ajax({
    			url: rootPath + "/card/issueDcard.do"
    			,type: "POST"
    			,data: {
    				dcard_num: $("#dcard_num").val()
    				,dcard_code: $("#dcard_code").val()
    				,dcard_issue_sepa: $("#dcard_issue_sepa").val()
    				,dcard_pw: $("#dcard_pw").val()
    				,dcard_use_sepa: $("#dcard_use_sepa").val()
    				,dcard_issue_place: $("#dcard_issue_place").val()
    				,scrcmpn_code: checkNull($("#scrcmpn_code").val())
    				,achlqr_bizrno: checkNull($("#achlqr_bizrno").val())
    				,school_code: checkNull($("#school_code").val())
    				,student_num: checkNull($("#student_num").val())
    				,barcode_num: checkNull($("#barcode_num").val())
    				
    				,customer_no: $("#customer_no").val()
    				,account_num: $("#account_num").val()
    			}
    			,success: issueDcardSuccess
    			,error: errorCallback
    		});
    	}
    });
    
    //결졔계좌번호가 바뀌었을 경우 확인하도록 유도한다.
    $("#account_num").change(function(){
    	account_num_flag = false;
    });
});

//실명번호 조회
var findCustomerDebit = function(resultData){
//console.log("결과 - " + resultData);
$.each(resultData, function(key, value){
if(key == "customer_name"){
	if(value == ""){
		alert("찾는 고객이 없습니다.");
	}
	$("#customer_name").val(value);
} else if(key == "customer_no"){
	$("#customer_no").val(value);
} else if(key == "cardDebits"){
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
	var sbmTr = "<tr><td>" + (index+1) + "</td><td>" + item.dcard_num + "</td>"
					+ "<td>" + item.account_num + "</td><td>" + item.dcard_state + "</td>"
					+ "<td>" + item.dcard_code + "</td><td>" + item.dcard_issue_sepa + "</td>"
					+ "<td>" + item.issue_date + "</td></tr>";
	return sbmTr;
}
};
//결제계좌번호 조회
var findCustomerBankbook = function(resultData){
console.log("결과 - " + resultData);
if(resultData == "false"){
$("#findCBresult").empty();
$("#findCBresult").append("본인의 계좌번호가 아닙니다");
account_num_flag = false;
} else {
$("#findCBresult").empty();
$("#findCBresult").append("본인의 계좌번호가 맞습니다");
account_num_flag = true;
}
}
//직불카드 발급
var issueDcardSuccess = function(resultData){
console.log("결과 - " + resultData);
if(resultData != "false"){
alert("정상 처리되었습니다");
}
}
//직불카드 발급전 체크
var checkValue = function(){
if($("#realname_num").val() == "" || $("#customer_name").val() == ""){
alert("실명번호를 조회해주세요");
$("#realname_num").focus();
return false;
}
if($("#dcard_num").val() == ""){
alert("직불카드번호를 입력해주세요");
$("#dcard_num").focus();
return false;
}
if($("#dcard_pw").val() == ""){
alert("카드비밀번호를 입력해주세요");
$("#dcard_pw").focus();
return false;
}
if($("#account_num").val() == "" || account_num_flag == false){
alert("결제계좌번호를 확인해주세요");
$("#account_num").focus();
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