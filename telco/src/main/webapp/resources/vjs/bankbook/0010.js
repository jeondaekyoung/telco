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
    	 var findNo = $("#realname_num").val();
    	 if(findNo == ""){
    		 alert("실명번호를 입력해주세요");
    	} else {
    		$.ajax({
    			url: rootPath + "/bankbook/findCustomer.do?realname_num=" + findNo
    			,type: "POST"
    			,success: findCustomerSuccess
    			,error: errorCallback
    		})
    	}
     });
     
     //수신신규
     $("#register").click(function(){
    	 if(checkValue() == true){
    		 console.log("수신신규 저장");
    		 $.ajax({
    			 url: rootPath + "/bankbook/registerBankbook.do"
    			 ,type: "POST"
    			 ,data: {
    				 certificate_num: $("#certificate_num").val()
    				 ,depositor_relation: $("#depositor_relation").val()
    				 ,finance_sepa: $("#finance_sepa").val()
    				 ,item_name: $("#item_name").val()
    				 ,sub_name: checkNull($("#sub_name").val())
    				 ,sub_num: checkNull($("#sub_num").val())
    				 ,bankbook_publish_sepa: $("#bankbook_publish_sepa").val()
    				 ,bankbook_pw: $("#bankbook_pw").val()
    				 ,bankbook_trade_pw: $("#bankbook_trade_pw").val()
    				 ,balance: $("#balance").val()
    				 ,management_point: $("#schoolName").val()
    				 ,signet_sepa: $("#signet_sepa").val()
    				 ,customer_no: $("#customer_no").val()
    				 ,summary: checkNull($("#summary").val())
    				 ,customer_name: $("#customer_name").val()
    				 ,cash: $("#cash").val()
    				 ,check_alternative: $("#check_alternative").val()
    				 ,bank_alternative: $("#bank_alternative").val()
    			 }
    			 ,success: registerBankbookSuccess
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
     
 });

var findCustomerSuccess = function(resultData){
	$.each(resultData, function(key, value){
		console.log(key + "/" + value);
		if(key == "customer_name"){
			if(value == ""){
				alert("찾는 고객이 없습니다.");
			}
			$("#customer_name").val(value);
		} else if(key == "customer_no"){
			$("#customer_no").val(value);
		}
	})
}

var registerBankbookSuccess = function(resultData){
	if(resultData != "false"){
		console.log("수신신규 완료");
		$.ajax({
			url: rootPath + "/bankbook/registerEtcAntiMoney.do"
			,type: "POST"
			,data: {
				account_num: resultData
				,capital_origin_sepa: $("#capital_origin_sepa").val()
				,trade_goal_sepa: $("#trade_goal_sepa").val()
				,pay_day: checkNull($("#pay_day").val())
				,summary: checkNull($("#summary").val())
			}
			 ,success: registerEtcAntiMoneySuccess
			 ,error: errorCallback
		});
	}
}

var registerEtcAntiMoneySuccess = function(resultData){
	$.each(resultData, function(key, value){
		console.log(key);
		if(key == "customer_name"){
			$("#resultTable > tbody").append("<tr><th>고객명</th><td>" + value +"</td></tr>");
		} else if(key == "bankbookInfo"){
			$("#resultTable > tbody").append("<tr><th>상품명</th><td>" + value.item_name + "</td></tr>");
			$("#resultTable > tbody").append("<tr><th>신규계좌번호</th><td>" + value.account_num + "</td></tr>");
			$("#resultTable > tbody").append("<tr><th>신규금액</th><td>" + value.balance + "</td></tr>");
		}
	});
	
	//팝업실행
	$("#resultPopup").show();
	$("#resultPopup").trigger('click');
}

//Ajax 데이터 널체크
var checkNull = function(data){
	if(data==""){
		return undefined;
	} else {
		return data;
	}
}

//대리인 항목 보이기
function relationshipAccountHolder() {
	if( $("#depositor_relation").val()=="00" ) {
		$(".본인").hide();
		$("#sub_name").removeClass("isEssential");
		$("#sub_num").removeClass("isEssential");
	}
	else {
		$(".본인").show();
		$("#sub_name").addClass("isEssential");
		$("#sub_num").addClass("isEssential");
	}
	return;
}


//계좌번호 부여
/* var account1 = Math.floor( Math.random()*(999-100+1) + 100 );
var account2 = Math.floor( Math.random()*(99999-10000+1) + 10000 );
var account3 = Math.floor( Math.random()*(999-100+1) + 100 );
account1 = account1.toString(); account2 = account2.toString(); account3 = account3.toString();
var newAccountNumber = account1 + account2 + account3; */

//금액정보 합계
function addSum() {
	var sum =  Number($("#cash").val()) +  Number($("#check_alternative").val()) +  Number($("#bank_alternative").val());
	$("#balance").val( sum );
	return;
}

//중요증서번호 보이기
/* function certificateNumber() {
	alert("변경");
	if( $("#통장발행select").val()=="02" ) {
		$("#certiNumber").show();
		$("#certiNumber").addClass("isEssential");
	}
	else {
		 $("#certiNumber").hide();
		 $("#certiNumber").removeClass("isEssential");
	}
	return;
} */

//필수항목 저장 전 체크
var checkValue = function(){
	if($("#realname_num").val() == ""){
		alert("실명번호를 조회해주세요");
		$("#realname_num").focus();
		return false;
	} else if($("#item_name").val() == ""){
		alert("상품명을 조회해주세요");
		return false;
	} else if($("#depositor_relation").val() != "00"){
		if($("#sub_name").val() == ""){
			alert("대리인 성명을 입력해주세요");
			$("#sub_name").focus();
			return false;
		} else if($("#sub_num").val() == ""){
			alert("대리인 실명번호를 입력해주세요");
			$("#sub_name").focus();
			return false;
		}
	} else if($("#certificate_num").val() == ""){
		alert("주요증서번호를 입력해주세요");
		$("#certificate_num").focus();
		return false;
	} else if($("#bankbook_pw").val() == ""){
		alert("비밀번호를 입력해주세요");
		$("#bankbook_pw").focus();
		return false;
	} else if($("#bankbook_trade_pw").val() == ""){
		alert("통장거래비밀번호를 입력해주세요");
		$("#bankbook_trade_pw").focus();
		return false;
	}
	
	return true;
}



//Ajax 에러 콜백함수
var errorCallback = function(){
	alert("수행 중 오류가 발생했습니다.");
};
//달력
 $(function() {  
           $( "#transfer_start,#transfer_end,#만기일" ).datepicker({ 
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
        