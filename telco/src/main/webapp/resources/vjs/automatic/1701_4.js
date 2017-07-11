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

//출금계좌번호 조회
var findAtcngsByBankbookSuccess = function(resultData){
//console.log("결과 - " + resultData);
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
var sbmTr = "<tr><td><a class='mybtn' onclick='cancel(" + item.seq_no + ");'>해지</a></td><td>"+ item.app_day + "</td>"
				+ "<td>" + item.transfer_bank + "</td><td>" + item.transfer_account_num + "</td>"
				+ "<td>" + item.transfer_customer_name + "</td><td>" + item.atcng_amount + "</td>"
				+ "<td>" + item.transfer_interval + "</td><td>" + item.transfer_day + "</td>"
				+ "<td>" + item.transfer_start + "</td><td>" + item.transfer_end + "</td>"
				+ "<td>" + item.to_summary + "</td><td>" + item.from_summary + "</td></tr>";
return sbmTr;
}
};

//해지 하기
var cancel = function(seq_no){
if(checkValue() == true){
console.log("해지 - " + seq_no);
$.ajax({
	url: rootPath + "/automatic/cancel.do"
	,type: "POST"
	,data: {
		seq_no: seq_no
		,account_num: $("#account_num").val()
		,withdrawal_pw: $("#withdrawal_pw").val()
	}
	,success: cancelSuccess
	,error: errorCallback
});
}
};
var cancelSuccess = function(resultData){
$.each(resultData, function(key, value){
if(key == "account_num"){
	if(value == "pwInvalid"){
		$("#resultTable > tbody").append("<tr><td>비밀번호가 잘못되었습니다</td></tr>");
	} else {
		$("#resultTable > tbody").append("<tr><th>계좌번호</th><td>" + value +"</td></tr>");
	}
} else if(key == "customer_name"){
	$("#resultTable > tbody").append("<tr><th>예금주</th><td>" + value + "</td></tr>");
}
});

//팝업실행
$("#resultPopup").show();
$("#resultPopup").trigger('click');
};
//해지 전 체크
var checkValue = function(){
if($("#withdrawal_pw").val() == ""){
alert("비밀번호를 입력해주세요");
$("#withdrawal_pw").focus();
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
//페이지 이동
function moveUrl(form) {
var Url = form.options[form.selectedIndex].value;
if (Url != "") {
location.href = Url;
}
}