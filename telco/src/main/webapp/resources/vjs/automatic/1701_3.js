var rootPath = window.location.protocol + '//' +window.location.host + '/telco';


$(document).ready(function(){
    $(".gnb_ul").mouseenter(function(){
        $(".sub_nav").stop().slideDown("slow");
        $(this).toggleClass("active"); return false;
    });
    $(".nav_wrap").mouseleave(function(){
        $(".sub_nav").stop().slideUp("slow");
        $(this).toggleClass("active"); return false;
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
    
    //자동이체 조회
    $("#find").click(function(){
    	if(checkValue() == true){
    		console.log("자동이체 조회");
    		$.ajax({
    			url: rootPath + "/automatic/findAtcngs.do"
    			,type: "POST"
    			,data: {
    				busi_kind: $("#busi_kind").val()
    				,account_num: $("#account_num").val()
    			}
    			,success: findSuccess
    			,error: errorCallback
    		});
    	}
    });
    
    
});

//조회 결과
var findSuccess = function(resultData){
console.log("결과 - " + resultData);
if(resultData == ""){
$("#myTable > tbody").empty();
var sbmTr = "<tr><td colspan='12'>등록된 자동이체가 없습니다</td></tr>";
$("#myTable > tbody").append(sbmTr);
} else {
$("#myTable > tbody").empty();
$.each(resultData, function(key, value){
	var sbmTr = sbmHtmlTemplate.makesbmTr(key, value);
	$("#myTable > tbody").append(sbmTr);
});
}
}
var sbmHtmlTemplate = {
makesbmTr : function(index, item){
	var sbmTr = "<tr><td>" + item.using_or + "</td><td>" + item.app_day + "</td>"
					+ "<td>" + item.transfer_bank + "</td><td>" + item.transfer_account_num + "</td>"
					+ "<td>" + item.transfer_customer_name + "</td><td>" + item.atcng_amount + "</td>"
					+ "<td>" + item.transfer_interval + "</td><td>" + item.transfer_day + "</td>"
					+ "<td>" + item.transfer_start + "</td><td>" + item.transfer_end + "</td>"
					+ "<td>" + item.to_summary + "</td><td>" + item.from_summary + "</td></tr>";
	return sbmTr;
}
}

//자동이체 조회 전 체크
var checkValue = function(){
if($("#account_num").val() == "" || $("#customer_name").val() == ""){
alert("출금계좌를 입력해주세요");
$("#account_num").focus();
return false;
}
return true;
};

//출금계좌번호 조회
var findBankbookSuccess = function(resultData){
console.log("결과 - " + resultData);
if(resultData == ""){
alert("찾는 계좌번호가 없습니다.");
} else {
$("#customer_name").val(resultData);
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
}