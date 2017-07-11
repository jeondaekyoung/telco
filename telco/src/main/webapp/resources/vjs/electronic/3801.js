if( window.location.host =='localhost:8080'){
	  var rootPath = window.location.protocol + '//' + window.location.host+'/telco';  
  }
  else
  var rootPath = window.location.protocol + '//' + window.location.host;

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
	
	//신청서비스 체크
	$("#internet").click(function(){
		//console.log("internert = " + $("#internet").prop('checked'));
		if($("#internet").prop('checked') == true){
			$("#internet_elec_id").removeAttr("disabled").css("background","#ffffcc");
			$("#internet_elec_pw").removeAttr("disabled").css("background","#ffffcc");;
			$("#internet_elec_transfer_day").removeAttr("disabled").css("background","#ffffcc");;
			$("#internet_elec_transfer_once").removeAttr("disabled").css("background","#ffffcc");;
		} else {
			$("#internet_elec_id").css("background", "").attr("disabled", true).val("");
			$("#internet_elec_pw").css("background", "").attr("disabled", true).val("");
			$("#internet_elec_transfer_day").css("background", "").attr("disabled", true).val("");
			$("#internet_elec_transfer_once").css("background", "").attr("disabled", "disabled").val("");
		}
	});
	$("#phone").click(function(){
		//console.log("phone = " + $("#phone").prop('checked'));
		if($("#phone").prop('checked') == true){
			$("#phone_elec_pw").removeAttr("disabled").css("background","#ffffcc");;
			$("#phone_elec_transfer_day").removeAttr("disabled").css("background","#ffffcc");;
			$("#phone_elec_transfer_once").removeAttr("disabled").css("background","#ffffcc");;
		} else {
			$("#phone_elec_pw").css("background", "").attr("disabled", "disabled").val("");
			$("#phone_elec_transfer_day").css("background", "").attr("disabled", "disabled").val("");
			$("#phone_elec_transfer_once").css("background", "").attr("disabled", "disabled").val("");
		}
	});
	
	//전자금융 등록
	$("#register").click(function(){
		if(checkValue() == true){
			//console.log("신규 등록");
			$.ajax({
				url: rootPath + "/elec/register.do"
				,type: "POST"
				,data: {
					customer_no: $("#customer_no").val()
					,security_media_sepa: $("#security_media_sepa").val()
					,security_media_no: $("#security_media_no").val()
					
					,elec_internet: $("#internet").prop('checked')
					,elec_phone: $("#phone").prop('checked')
					,open_branch:  $("#schoolName").val()
					,application_sepa: $("#application_sepa").val()
					,owner_sepa: $("#owner_sepa").val()
					,sub_name: checkNull($("#sub_name").val())
					,sub_num: checkNull($("#sub_num").val())
					
					,internet_elec_id: checkNull($("#internet_elec_id").val())
					,internet_elec_pw: checkNull($("#internet_elec_pw").val())
					,internet_elec_transfer_day: checkNull($("#internet_elec_transfer_day").val())
					,internet_elec_transfer_once: checkNull($("#internet_elec_transfer_once").val())
					,phone_elec_pw: checkNull($("#phone_elec_pw").val())
					,phone_elec_transfer_day: checkNull($("#phone_elec_transfer_day").val())
					,phone_elec_transfer_once: checkNull($("#phone_elec_transfer_once").val())
				}
				,success: registerSuccess
				,error: errorCallback
			})
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

//실명번호 조회결과
var findCustomerSuccess = function(resultData){
//console.log("조회 결과 - " + resultData);
$("#internet").removeAttr("disabled");
$("#phone").removeAttr("disabled");
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
		if(item.elec_sepa == "인터넷뱅킹"){
			$("#internet").attr("disabled", "disabled");
		}
		if(item.elec_sepa == "폰뱅킹"){
			$("#phone").attr("disabled", "disabled");
		}
		var sbmTr = sbmHtmlTemplate.makesbmTr(index, item);
		$("#myTable > tbody").append(sbmTr);
	});
}
});
}

var sbmHtmlTemplate = {
makesbmTr : function(index, item){
//console.log(index + " / " + sysdate);
var sbmTr = "<tr><td>" + (index+1) + "</td><td>" + item.elec_sepa + "</td>"
				+ "<td>" + item.elec_id + "</td><td>" + item.state + "</td>" + "<td>" + item.change_date + "</td><td>" 
				+ item.security_media_sepa + "</td><td>" + item.security_media_no + "</td></tr>";
return sbmTr;
}
}

//전자금융 등록 결과
var registerSuccess = function(resultData){
$.each(resultData, function(key, value){
if(key == "customer_name"){
	console.log("고객명 : " + value);
	$("#resultTable > tbody").append("<tr><th>고객명</th><td>" + value +"</td></tr>");
} else if(key == "elec_info"){
	console.log("공통전자금융 : " + value);
	$("#resultTable > tbody").append("<tr><th>보안매체</th><td>" + codeTochar(value.security_media_sepa) + "," + value.security_media_no + "</td></tr>");
} else if(key == "elec_internet"){
	console.log("인터넷뱅킹 : " + value);
	$("#resultTable > tbody").append("<tr><th>인터넷뱅킹 정보</th><td>" + value.elec_id + "," + value.elec_transfer_day + "," + value.elec_transfer_once + "</td><tr>");
} else if(key == "elec_phone"){
	console.log("폰뱅킹 : " + value);
	$("#resultTable > tbody").append("<tr><th>폰뱅킹 정보</th><td>" + value.elec_transfer_day + "," + value.elec_transfer_once + "</td></tr>");
}
});

//팝업실행
$("#resultPopup").show();
$("#resultPopup").trigger('click');
};
//보안매체 코드->문자로 변환
var codeTochar = function(security_media_sepa){
switch(security_media_sepa){
case "01": return "보안카드";
case "02": return "OTP카드";
}
};

//수신등록 전 체크
var checkValue = function(){
if($("#customer_name").val() == ""){
alert("실명번호 조회를 해주세요");
$("#realname_num").focus();
return false;
}
if(($("#internet").prop('checked') == false) && ($("#phone").prop('checked') == false)){
alert("신청서비스를 선택해주세요.");
return false;
}
if($("#security_media_no").val() == ""){
alert("보안매체번호를 입력해주세요");
$("#security_media_no").focus();
return false;
}
if($("#owner_sepa").val() == "02"){
if(($("#sub_name").val() == "" ) || ($("#sub_num").val() == "")){
	alert("대리인 실명번호와 대리인 성명을 입력해주세요");
	return false;
}
}
if($("#internet").prop('checked') == true){
if(($("#internet_elec_id").val() == "") || ($("#internet_elec_pw").val() == "") || 
		($("#internet_elec_transfer_day").val() == "") || ($("#internet_elec_transfer_once").val() == "")){
	alert("인터넷뱅킹 신규정보를 입력해주세요.");
	return false;
}
}
if($("#phone").prop('checked') == true){
if(($("#phone_elec_pw").val() == "") || ($("#phone_elec_transfer_day").val() == "") || ($("#phone_elec_transfer_once").val() == "")){
		alert("폰뱅킹 신규정보를 입력해주세요.");
		return false;
}
}
return true;
}

//페이지 이동
function moveUrl(form) {
var Url=form.options[form.selectedIndex].value;
if (Url!="") { location.href=Url;
}
}

//대리인 항목 출력여부
function relationshipAccountHolder() {
if( $("#owner_sepa").val()=="01" ) {
$(".ones").hide();
}
else {
$(".ones").show();
$("#sub_name").val("");
$("#sub_num").val("");
}
return;
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