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
    
    /* //데이터 입히기
    var customerBasics = "${customerBasics}";
    console.log("조회완료 -" + customerBasics);
    
    if(customerBasics == "nothing"){
    	alert("존재하지않는 실명번호입니다.");
    } else if(customerBasics == undefined){
    	console.log("undefined");
    } else if(customerBasics == ""){
    	console.log("빈문자열");
    } else if(customerBasics == null){
    	console.log("null");
    } else {
    	console.log("맞는게없다. - " + customerBasics);
    	var testaaa = customerBasics.realname_num;
    	console.log(customerBasics.length);
    	console.log(testaaa);
    } */
    
    
  //조회 클릭액션
  /* $("#findCustomer").click(function(){
	  var findNo = $("#findNo").val();
	  if(findNo == ""){
		  alert("실명번호를 입력해주세요");
	  } else {
		  location.href = "${ctx}/customer/findCustomer.do?realname_num=" + findNo;
	  }
  }); */
    
  //저장 클릭액션
    $("#register").click(function(){
    	 if(checkValue() == true){
    		$.ajax({
    			url: $("#registerForm").attr("action")
    			,type: "POST"
    			,data:{
    				realname_num : $("#realname_num").val()
    				,realname_num_sepa : $("#realname_num_sepa").val()
    				,customer_qualf_sepa : $("#customer_qualf_sepa").val()
    				,customer_qualf_name : $("#customer_qualf_name").val()
    				,customer_name : $("#customer_name").val()
    				,customer_name_eng : checkNull($("#customer_name_eng").val())
    				,passport_num : checkNull($("#passport_num").val())
    				,nationality_sepa : $("#nationality_sepa").val()
    				,bizrno : checkNull($("#bizrno").val())
    				,enterprise_name : checkNull($("#enterprise_name").val())
    				,postal_sepa : $("#postal_sepa").val()
    				,contact_sepa : $("#contact_sepa").val()        				
    			}
    			,success : registerBasicsSuccess
    			,error : errorCallback
    		});
    	}
    });
  
	//결과 팝업화면
	$('#resultPopup').avgrund({
		height: 260,
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
//--> ready end



var registerBasicsSuccess = function(resultData){
	
	if(resultData != "false"){
		console.log("자택(본사) 시작 -" + resultData);
		$.ajax({
			url: rootPath + "/customer/registerHouse.do"
			,type: "POST"
			,data: {
				customer_no: resultData
				,zip_code: checkNull($("#tab1_zip_code").val())
				,address_before: checkNull($("#tab1_address_before").val())
				,address_after: checkNull($("#tab1_address_after").val())
				,residence_sepa: $("#tab1_residence_sepa").val()
				,town_name: checkNull($("#tab1_town_name").val())
				,apart_name: checkNull($("#tab1_apart_name").val())
				,dong: checkNull($("#tab1_dong").val())
				,ho: checkNull($("#tab1_ho").val())
				,address_eng: checkNull($("#tab1_address_eng").val())
				,phone1: checkNull($("#tab1_phone1").val())
				,phone2: checkNull($("#tab1_phone2").val())
				,phone3: checkNull($("#tab1_phone3").val())
				,extension: checkNull($("#tab1_extension").val())
				,cellphone1: checkNull($("#tab1_cellphone1").val())
				,cellphone2: checkNull($("#tab1_cellphone2").val())
				,cellphone3: checkNull($("#tab1_cellphone3").val())
				,fax1: checkNull($("#tab1_fax1").val())
				,fax2: checkNull($("#tab1_fax2").val())
				,fax3: checkNull($("#tab1_fax3").val())
				,email_id: checkNull($("#tab1_email_id").val())
				,email_domain: checkNull($("#tab1_email_domain").val())
				,homepage: checkNull($("#tab1_homepage").val())
				,foreign_address: checkNull($("#tab1_foreign_address").val())
				,foreign_phone: checkNull($("#tab1_foreign_phone").val())
			}
			,success : registerHouseSuccess
			,error : errorCallback
		});
	} else {
		alert("존재하는 실명번호입니다.");
	}
};

var registerHouseSuccess = function(resultData){
	if(resultData != "false"){
		console.log("직장(사업장) 시작 - " + resultData);
		$.ajax({
			url: rootPath + "/customer/registerOffice.do"
			,type: "POST"
			,data: {
				customer_no: resultData
				,zip_code: checkNull($("#tab2_zip_code").val())
				,address_before: checkNull($("#tab2_address_before").val())
				,address_after: checkNull($("#tab2_address_after").val())
				,moving_in_sepa: $("#tab2_moving_in_sepa").val()
				,town_name: checkNull($("#tab2_town_name").val())
				,apart_name: checkNull($("#tab2_apart_name").val())
				,dong: checkNull($("#tab2_dong").val())
				,ho: checkNull($("#tab2_ho").val())
				,phone1: checkNull($("#tab2_phone1").val())
				,phone2: checkNull($("#tab2_phone2").val())
				,phone3: checkNull($("#tab2_phone3").val())
				,extension: checkNull($("#tab2_extension").val())
				,fax1: checkNull($("#tab2_fax1").val())
				,fax2: checkNull($("#tab2_fax2").val())
				,fax3: checkNull($("#tab2_fax3").val())
				,address_eng: checkNull($("#tab2_address_eng").val())
				,job: $("#tab2_job").val()
				,company_name: checkNull($("#tab2_company_name").val())
				,department_name: checkNull($("#tab2_department_name").val())
				,position_name: $("#tab2_position_name").val()
				,join_date: checkNull($("#tab2_join_date").val())
			}
			,success : registerOfficeSuccess
			,error : errorCallback
		})
	} else {
		alert("실패");
	}
};

var registerOfficeSuccess = function(resultData){
	if(resultData != "false"){
		console.log("제3연락처 시작 - " + resultData);
		$.ajax({
			url: rootPath + "/customer/registerThird.do"
			,type: "POST"
			,data: {
				customer_no: resultData
				,zip_code: checkNull($("#tab3_zip_code").val())
				,address_before: checkNull($("#tab3_address_before").val())
				,address_after: checkNull($("#tab3_address_after").val())
				,residence_sepa: $("#tab3_residence_sepa").val()
				,town_name: checkNull($("#tab3_town_name").val())
				,apart_name: checkNull($("#tab3_apart_name").val())
				,dong: checkNull($("#tab3_dong").val())
				,ho: checkNull($("#tab3_ho").val())
				,address_eng: checkNull($("#tab3_address_eng").val())
				,phone1: checkNull($("#tab3_phone1").val())
				,phone2: checkNull($("#tab3_phone2").val())
				,phone3: checkNull($("#tab3_phone3").val())
				,extension: checkNull($("#tab3_extension").val())
				,fax1: checkNull($("#tab3_fax1").val())
				,fax2: checkNull($("#tab3_fax2").val())
				,fax3: checkNull($("#tab3_fax3").val())
				,email_id: checkNull($("#tab3_email_id").val())
				,email_domain: checkNull($("#tab3_email_domain").val())
				,homepage: checkNull($("#tab3_homepage").val())
				,foreign_address: checkNull($("#tab3_foreign_address").val())
				,foreign_phone: checkNull($("#tab3_foreign_phone").val())
			}
			,success: registerThirdSuccess
			,error: errorCallback
		})
	} else {
		alert("실패");
	}
};

var registerThirdSuccess = function(resultData){
	if(resultData != "false"){
		console.log("고객추가정보 시작 -" + resultData);
		$.ajax({
			url: rootPath + "/customer/registerAdd.do"
			,type: "POST"
			,data: {
				customer_no: resultData
				,birthday_sepa: $("#tab4_birthday_sepa").val()
				,birthday:  checkNull($("#tab4_birthday").val()) 
				,marriage_sepa: $("#tab4_marriage_sepa").val()
				,marriage_date: checkNull($("#tab4_marriage_date").val())
				,gender_sepa: $("#tab4_gender_sepa").val()
				,household_sepa: $("#tab4_household_sepa").val()
				,spouse_brthdy_year: checkNull($("#tab4_spouse_brthdy_year").val())
				,children_sepa: $("#tab4_children_sepa").val()
				,children1_brthdy_year: checkNull($("#tab4_children1_brthdy_year").val())
				,children2_brthdy_year: checkNull($("#tab4_children2_brthdy_year").val())
				,children3_brthdy_year: checkNull($("#tab4_children3_brthdy_year").val())
				,car_sepa: $("#tab4_car_sepa").val()
				,annual_income: checkNull($("#tab4_annual_income").val()) 
				,dual_income_or: $("#tab4_dual_income_or").val()
				,pay_day: checkNull($("#tab4_pay_day").val())
				,house_have_sepa: $("#tab4_house_have_sepa").val()
				,householder_sepa: $("#tab4_householder_sepa").val()
				,living_sepa: $("#tab4_living_sepa").val()
				,living_pyeong:  checkNull($("#tab4_living_pyeong").val())
			}
			,success: registerAddSuccess
			,error: errorCallback
		})
	} else {
		alert("실패");
	}
};

var registerAddSuccess = function(resultData){
	if(resultData != "false"){
		console.log("자금세탁방지 시작 - " + resultData);
		$.ajax({
			url: rootPath + "/customer/registerAntiMoney.do"
			,type: "POST"
			,data: {
				customer_no: resultData
				,identification_type: $("#tab5_identification_type").val()
				,verify_sepa: $("#tab5_verify_sepa").val()
				,job_sepa: $("#tab5_job_sepa").val()
			}
			,success: registerAntiMoney
			,error: errorCallback
		})
	} else {
		alert("실패");
	}
};

var registerAntiMoney = function(resultData){
	$.each(resultData, function(key, value){
		if(key == "customerBasics"){
			$("#resultTable > tbody").append("<tr><th>고객명</th><td>" + value.customer_name +"</td></tr>");
			$("#resultTable > tbody").append("<tr><th>실명번호</th><td>" + value.realname_num +"</td></tr>");
		} else if(key == "houseCompany"){
			$("#resultTable > tbody").append("<tr><th>주소</th><td>" + value.address_before + "</td></tr>");
			$("#resultTable > tbody").append("<tr><th>연락처</th><td>" + value.cellphone1 + "-" + value.cellphone2 + "-" + value.cellphone3 + "</td></tr>");
		}
	});
	
	//팝업실행
	$("#resultPopup").show();
	$("#resultPopup").trigger('click');
};

var checkValue = function(){
	if($("#realname_num").val() == ""){
		alert("실명번호를 입력해주세요");
		$("#realname_num").focus();
		return false;
	}
	if($("#customer_qualf_sepa").val() == ""){
		alert("고객자격을 선택해주세요");
		return false;
	}
	if($("#customer_name").val() == ""){
		alert("고객명을 입력해주세요");
		$("#customer_name").focus();
		return false;
	}
	if($("#tab1_zip_code").val() == "" || $("#tab1_address_before").val() == ""){
		alert("자택(본사) 주소를 조회해주세요");
		$("#tab1_zip_code").focus();
		return false;
	}
	if($("#tab1_cellphone1").val() == "" || $("#tab1_cellphone2").val() == "" || $("#tab1_cellphone3") == ""){
		alert("휴대전화번호를 입력해주세요");
		$("#tab1_cellphone1").focus();
		return false;
	}
	
	return true;
};

var checkNull = function(data){
	//console.log(data);
	if(data==""){
		//console.log("결과는 점점");
		return undefined;
	} else {
		//console.log("결과는 data");
		return data;
	}
}
//Ajax 에러 콜백함수
var errorCallback = function(){
	alert("수행 중 오류가 발생했습니다.");
};


jQuery(function($) {
	var tab = $('.tab_list');
	tab.removeClass('js_off');
	tab.css('height', tab.find('>ul>li>ul:visible').height() + 40);
	function onSelectTab() {
		var t = $(this);
		var myClass = t.parent('li').attr('class');
		t.parents('.tab_list:first').attr('class', 'tab_list ' + myClass);
		tab.css('height', t.next('ul').height() + 40);
	}
	tab.find('>ul>li>a').click(onSelectTab).focus(onSelectTab);
});

//필수입력 항목 지정
function isEssential_1() {
	/* if($("select[id=postal_sepa]").val()=="01") {	//자택(본사)
		$("input[id=tab2_zip_code]").css("background-color","#ffffff").removeClass("isEssential");
		$("input[id=tab2_address_after]").css("background-color","#ffffff").removeClass("isEssential");
		$("input[id=tab3_phone1]").css("background-color","#ffffff").removeClass("isEssential");
		$("input[id=tab3_phone2]").css("background-color","#ffffff").removeClass("isEssential");
		$("input[id=tab3_phone3]").css("background-color","#ffffff").removeClass("isEssential");
		$("input[id=tab1_email_id]").css("background-color","#ffffff").removeClass("isEssential");
		$("input[id=tab1_email_domain]").css("background-color","#ffffff").removeClass("isEssential");
	}
	else if($("select[id=postal_sepa]").val()=="02") {  //직장(사업장)
		$("input[id=tab2_zip_code]").css("background-color","#ffffff").removeClass("isEssential");
		$("input[id=tab2_address_after]").css("background-color","#ffffff").removeClass("isEssential");
		$("input[id=tab1_email_id]").css("background-color","#ffffff").removeClass("isEssential");
		$("input[id=tab1_email_domain]").css("background-color","#ffffff").removeClass("isEssential");
		$("input[id=tab3_phone1]").css("background-color","#ffffcc").addClass("isEssential");
		$("input[id=tab3_phone2]").css("background-color","#ffffcc").addClass("isEssential");
		$("input[id=tab3_phone3]").css("background-color","#ffffcc").addClass("isEssential");
	}
	else if($("select[id=postal_sepa]").val()=="03") {	//제3연락처
		$("input[id=tab2_zip_code]").css("background-color","#ffffff").removeClass("isEssential");
		$("input[id=tab2_address_after]").css("background-color","#ffffff").removeClass("isEssential");
		$("input[id=tab3_phone1]").css("background-color","#ffffff").removeClass("isEssential");
		$("input[id=tab3_phone2]").css("background-color","#ffffff").removeClass("isEssential");
		$("input[id=tab3_phone3]").css("background-color","#ffffff").removeClass("isEssential");
		$("input[id=tab1_email_id]").css("background-color","#ffffcc").addClass("isEssential");
		$("input[id=tab1_email_domain]").css("background-color","#ffffcc").addClass("isEssential");
	} */
}

function isEssential_2() {
	/* if($("select[id=contact_sepa]").val()=="01" || $("select[id=contact_sepa]").val()=="02") {		//자택(본사) or 직장(사업장)
		$("input[id=tab2_phone1]").css("background-color","#ffffff").removeClass("isEssential");
		$("input[id=tab2_phone2]").css("background-color","#ffffff").removeClass("isEssential");
		$("input[id=tab2_phone3]").css("background-color","#ffffff").removeClass("isEssential");
		$("input[id=tab1_cellphone1]").css("background-color","#ffffff").removeClass("isEssential");
		$("input[id=tab1_cellphone2]").css("background-color","#ffffff").removeClass("isEssential");
		$("input[id=tab1_cellphone3]").css("background-color","#ffffff").removeClass("isEssential");
	}
	else if($("select[id=contact_sepa]").val()=="03") {		//휴대폰
		$("input[id=tab2_phone1]").css("background-color","#ffffff").removeClass("isEssential");
		$("input[id=tab2_phone2]").css("background-color","#ffffff").removeClass("isEssential");
		$("input[id=tab2_phone3]").css("background-color","#ffffff").removeClass("isEssential");
		$("input[id=tab1_cellphone1]").css("background-color","#ffffcc").addClass("isEssential");
		$("input[id=tab1_cellphone2]").css("background-color","#ffffcc").addClass("isEssential");
		$("input[id=tab1_cellphone3]").css("background-color","#ffffcc").addClass("isEssential");
	} */
}

//거래구분
function dealDivision() {
	if($("select[id=거래구분]").val()=="01") {		//등록
		$(".change").hide();
		$(".regist").show();
		$('input').not("#customer_qualf_sepa,#customer_qualf_name").removeAttr('readonly');
		$('select').prop("disabled",false);
		$('input').css('background-color','#FFFFFF');
		$('input[id=거래구분]').css('background-color','#FFFFCC');
		$('input[id=realname_num]').css('background-color','#FFFFCC');
		$('input[id=findNo]').css('background-color','#FFFFCC');
		$('select[id=realname_num_sepa]').css('background-color','#FFFFCC');
		$('input[id=customer_qualf_sepa]').css('background-color','#FFFFCC');
		$('input[id=customer_name]').css('background-color','#FFFFCC');
		$('select[id=nationality_sepa]').css('background-color','#FFFFCC');
		$('select[id=postal_sepa]').css('background-color','#FFFFCC');
		$('select[id=contact_sepa]').css('background-color','#FFFFCC');
		//$('input[id=tab1_address_after]').css('background-color','#FFFFCC');
		//$('input[id=tab1_phone1]').css('background-color','#FFFFCC');
		//$('input[id=tab1_phone2]').css('background-color','#FFFFCC');
		//$('input[id=tab1_phone3]').css('background-color','#FFFFCC');
	}
	else if($("select[id=거래구분]").val()=="02") {		//변경
		/* $(".change").show();
		$(".regist").hide();
		$('input').not("#customer_qualf_sepa,#customer_qualf_name").removeAttr('readonly');
		$('select').prop("disabled",false);
		$('input').css('background-color','#FFFFFF');
		$('input[id=거래구분]').css('background-color','#FFFFCC');
		$('input[id=realname_num]').css('background-color','#FFFFCC');
		$('input[id=findNo]').css('background-color','#FFFFCC');
		$('select[id=realname_num_sepa]').css('background-color','#FFFFCC');
		$('input[id=customer_qualf_sepa]').css('background-color','#FFFFCC');
		$('input[id=customer_name]').css('background-color','#FFFFCC');
		$('select[id=nationality_sepa]').css('background-color','#FFFFCC');
		$('select[id=postal_sepa]').css('background-color','#FFFFCC');
		$('select[id=contact_sepa]').css('background-color','#FFFFCC'); */
		//$('input[id=tab1_address_after]').css('background-color','#FFFFCC');
		//$('input[id=tab1_phone1]').css('background-color','#FFFFCC');
		//$('input[id=tab1_phone2]').css('background-color','#FFFFCC');
		//$('input[id=tab1_phone3]').css('background-color','#FFFFCC');
		location.href = rootPath + "/views/customer/0200_modify.jsp";
	}
	else if($("select[id=거래구분]").val()=="03") {		//조회
		/* $(".change").show();
		$(".regist").hide();
		$(".changebutton").hide();
		$('input').not("#findNo").attr('readonly','readonly');
		$('select').prop("disabled",true);
		$('select[id=거래구분]').prop("disabled",false);
		$('input').not("#findNo").css('background-color','#EDEDED'); */
		location.href = rootPath + "/views/customer/0200_find.jsp";
	}
}

//email 자동으로 입력
function emailInsert_1() {
	if( $("#자택_이메일주소select").val()=="01" ) 
		$("#tab1_email_domain").val("");
	else
		$("#tab1_email_domain").val( $("#자택_이메일주소select option:selected").text() );
	return false;
}
function emailInsert_2() {
	if( $("#제3_이메일주소select").val()=="01" ) 
		$("#tab3_email_domain").val("");
	else
		$("#tab3_email_domain").val( $("#제3_이메일주소select option:selected").text() );
	return false;
}

//달력
$(function() {  
	  $( "#tab2_join_date,#tab4_birthday,#tab4_marriage_date" ).datepicker({
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




