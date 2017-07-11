var rootPath = window.location.protocol + '//' +window.location.host + '/telco';


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
		//checkboxSelect($(this).val());
		console.log($(this).val() + " 클릭이당");
	});
}
});
}
var sbmHtmlTemplate = {
makesbmTr : function(index, item){
//console.log(index + " / " + sysdate);
var sbmTr = "<tr onclick='mouseEvent(\"" + item.elec_sepa + item.elec_no + "\");'><td>" + (index+1) + "</td><td>" + item.elec_sepa + "</td>"
				+ "<td>" + item.elec_id + "</td><td>" + item.state + "</td>" + "<td>" + item.change_date + "</td><td>" 
				+ item.security_media_sepa + "</td><td>" + item.security_media_no + "</td></tr>";
return sbmTr;
}
}

//마우스 이벤트
var mouseEvent = function(value){
console.log("마우스클릭 - " + value);
$.ajax({
url: rootPath + "/elec/findElec.do"
,type: "POST"
,data: {
	elec: value
	,customer_no: $("#customer_no").val()
}
,success: findElecSuccess
,error: errorCallback
})
}
var findElecSuccess = function(resultData){
//console.log("전자금융 조회결과 - " + resultData);
$("#open_date").val(resultData.open_date);
$("#open_branch").val(resultData.open_branch);
$("#cancel_branch").val(resultData.cancel_branch);
$("#cancel_date").val(resultData.cancel_date);
$("#security_media_sepa").val(resultData.security_media_sepa);
$("#elec_transfer_day").val(resultData.elec_transfer_day)	;
$("#elec_transfer_once").val(resultData.elec_transfer_once);
$("#sub_num").val(resultData.sub_num);
$("#owner_sepa").val(resultData.owner_sepa);
$("#user_id").val(resultData.user_id);
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