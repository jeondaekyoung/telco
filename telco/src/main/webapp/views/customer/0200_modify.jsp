<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath }" scope="request" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>[0200] 고객 기본정보 관리[040100000]</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge" >
	<meta http-equiv="content-type" content="text/html; charset=utf-8" >
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="viewport" content="user-scalable=no, width=device-width, initial-scale=1.0, maximum-scale=1.0">
	<link href="${ctx }/resources/css/common.css" type="text/css" rel="stylesheet">
	<link href="${ctx }/resources/css/media.css" type="text/css" rel="stylesheet">
	<link href="${ctx }/resources/css/tab.css" type="text/css" rel="stylesheet">
	<link href="${ctx }/resources/css/study.css" type="text/css" rel="stylesheet">
	<link href="${ctx }/resources/css/avgrund.css" type="text/css" rel="stylesheet">
	<link rel='stylesheet' href='http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css'>
	 
<script type="text/javascript" src="${ctx }/resources/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<script type="text/javascript" src="${ctx }/resources/js/pop.js"></script>
<script type="text/javascript" src="${ctx }/resources/js/jquery.avgrund.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
        $(".gnb_ul").mouseenter(function(){
            $(".sub_nav").stop().slideDown("slow");
        });
        $(".nav_wrap").mouseleave(function(){
            $(".sub_nav").stop().slideUp("slow");
        });
        
		//데이터확인하기
		var existCustomer = "${existCustomer}";
		var customerBasics_no = "";
		console.log("조회완료 -" + existCustomer);
		if(existCustomer == "nothing"){
			console.log("nothing");
			alert("존재하지않는 실명번호입니다.");
		} else if(existCustomer == ""){
			console.log("빈문자열")
		} else if(existCustomer == undefined){
			console.log("undefined");
		} else if(existCustomer == null){
			console.log("null이다.");
		} else {
			console.log("먼지모르겠다.");
		}
		//데이터입히기
		putonData();
		
		
      //조회 클릭액션
      $("#findCustomer").click(function(){
    	  var findNo = $("#findNo").val();
    	  if(findNo == ""){
    		  alert("실명번호를 입력해주세요");
    	  } else {
    		  location.href = "${ctx}/customer/findmoCustomer.do?realname_num=" + findNo;
    	  }
      });
      
      $("#modify").click(function(){
    	  if(checkValue() == true){
	    	  $.ajax({
	    		  url: "${ctx}/customer/modifyBasics.do"
	    		  ,type: "POST"
	    		  ,data: {
	    			customer_no: "${customerBasics.customer_no}"
	    			,realname_num : $("#realname_num").val()
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
	    		  ,success: modifyBasicsSuccess
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
				location.href="${ctx}/views/customer/0200_modify.jsp";
			},
			template: $("#resultPopup")
		});
    });
//--> ready end

var modifyBasicsSuccess = function(resultData){
	if(resultData != "false"){
		console.log("자택(본사) 시작 - " + resultData);
		$.ajax({
			url: "${ctx}/customer/modifyHouse.do"
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
			,success : modifyHouseSuccess
			,error : errorCallback
		});
	} else {
	 	alert("실패");
	}
};

var modifyHouseSuccess = function(resultData){
	if(resultData != "false"){
		console.log("직장(사업장) 시작 - " + resultData);
		$.ajax({
			url: "${ctx}/customer/modifyOffice.do"
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
			,success : modifyOfficeSuccess
			,error : errorCallback
		})
	} else {
		alert("실패");
	}
};

var modifyOfficeSuccess = function(resultData){
	if(resultData != "false"){
		console.log("제3연락처 시작 - " + resultData);
		$.ajax({
			url: "${ctx}/customer/modifyThird.do"
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
			,success: modifyThirdSuccess
			,error: errorCallback
		})
	} else {
		alert("실패");
	}
};

var modifyThirdSuccess = function(resultData){
	if(resultData != "false"){
		console.log("고객추가정보 시작 ");
		$.ajax({
			url: "${ctx}/customer/modifyAdd.do"
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
			,success: modifyAddSuccess
			,error: errorCallback
		})
	} else {
		alert("실패");
	}
};

var modifyAddSuccess = function(resultData){
	if(resultData != "false"){
		console.log("자금세탁방지 시작 - " + resultData);
		$.ajax({
			url: "${ctx}/customer/modifyAntiMoney.do"
			,type: "POST"
			,data: {
				customer_no: resultData
				,identification_type: $("#tab5_identification_type").val()
				,verify_sepa: $("#tab5_verify_sepa").val()
				,job_sepa: $("#tab5_job_sepa").val()
			}
			,success: modifyAntiMoney
			,error: errorCallback
		})
	} else {
		alert("실패");
	}
};

var modifyAntiMoney = function(resultData){
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
	$("#resultPopup").trigger('click');
};

var putonData = function(){
	$("#findNo").val("${customerBasics.realname_num}");
	$("#realname_num").val("${customerBasics.realname_num}");
	$("#realname_num_sepa").val("${customerBasics.realname_num_sepa}");
	$("#customer_qualf_sepa").val("${customerBasics.customer_qualf_sepa}");
	$("#customer_qualf_name").val("${customerBasics.customer_qualf_name}");
	$("#customer_name").val("${customerBasics.customer_name}");
	$("#customer_name_eng").val("${customerBasics.customer_name_eng}");
	$("#passport_num").val("${customerBasics.passport_num}");
	$("#nationality_sepa").val("${customerBasics.nationality_sepa}");
	$("#postal_sepa").val("${customerBasics.postal_sepa}");
	$("#contact_sepa").val("${customerBasics.contact_sepa}");
	$("#bizrno").val("${customerBasics.bizrno}");
	$("#enterprise_name").val("${customerBasics.enterprise_name}");
	
	$("#tab1_zip_code").val("${houseCompany.zip_code}");
	$("#tab1_address_before").val("${houseCompany.address_before}");
	$("#tab1_address_after").val("${houseCompany.address_after}");
	$("#tab1_residence_sepa").val("${houseCompany.residence_sepa}");
	$("#tab1_town_name").val("${houseCompany.town_name}");
	$("#tab1_apart_name").val("${houseCompany.apart_name}");
	$("#tab1_dong").val("${houseCompany.dong}");
	$("#tab1_ho").val("${houseCompany.ho}");
	$("#tab1_address_eng").val("${houseCompany.address_eng}");
	$("#tab1_phone1").val("${houseCompany.phone1}");
	$("#tab1_phone2").val("${houseCompany.phone2}");
	$("#tab1_phone3").val("${houseCompany.phone3}");
	$("#tab1_extension").val("${houseCompany.extension}");
	$("#tab1_cellphone1").val("${houseCompany.cellphone1}");
	$("#tab1_cellphone2").val("${houseCompany.cellphone2}");
	$("#tab1_cellphone3").val("${houseCompany.cellphone3}");
	$("#tab1_fax1").val("${houseCompany.fax1}");
	$("#tab1_fax2").val("${houseCompany.fax2}");
	$("#tab1_fax3").val("${houseCompany.fax3}");
	$("#tab1_email_id").val("${houseCompany.email_id}");
	$("#tab1_email_domain").val("${houseCompany.email_domain}");
	$("#tab1_homepage").val("${houseCompany.homepage}");
	$("#tab1_foreign_address").val("${houseCompany.foreign_address}");
	$("#tab1_foreign_phone").val("${houseCompany.foreign_phone}");
	
	
	$("#tab2_zip_code").val("${officeWorkspace.zip_code}");
	$("#tab2_address_before").val("${officeWorkspace.address_before}");
	$("#tab2_address_after").val("${officeWorkspace.address_after}");
	$("#tab2_moving_in_sepa").val("${officeWorkspace.moving_in_sepa}");
	$("#tab2_town_name").val("${officeWorkspace.town_name}");
	$("#tab2_apart_name").val("${officeWorkspace.apart_name}");
	$("#tab2_dong").val("${officeWorkspace.dong}");
	$("#tab2_ho").val("${officeWorkspace.ho}");
	$("#tab2_phone1").val("${officeWorkspace.phone1}");
	$("#tab2_phone2").val("${officeWorkspace.phone2}");
	$("#tab2_phone3").val("${officeWorkspace.phone3}");
	$("#tab2_extension").val("${officeWorkspace.extension}");
	$("#tab2_fax1").val("${officeWorkspace.fax1}");
	$("#tab2_fax2").val("${officeWorkspace.fax2}");
	$("#tab2_fax3").val("${officeWorkspace.fax3}");
	$("#tab2_address_eng").val("${officeWorkspace.address_eng}");
	$("#tab2_job").val("${officeWorkspace.job}");
	$("#tab2_company_name").val("${officeWorkspace.company_name}");
	$("#tab2_department_name").val("${officeWorkspace.department_name}");
	$("#tab2_position_name").val("${officeWorkspace.position_name}");
	$("#tab2_join_date").val("${officeWorkspace.join_date}");
	
	$("#tab3_zip_code").val("${thirdContact.zip_code}");
	$("#tab3_address_before").val("${thirdContact.address_before}");
	$("#tab3_address_after").val("${thirdContact.address_after}");
	$("#tab3_residence_sepa").val("${thirdContact.residence_sepa}");
	$("#tab3_town_name").val("${thirdContact.town_name}");
	$("#tab3_apart_name").val("${thirdContact.apart_name}");
	$("#tab3_dong").val("${thirdContact.dong}");
	$("#tab3_ho").val("${thirdContact.ho}");
	$("#tab3_phone1").val("${thirdContact.phone1}");
	$("#tab3_phone2").val("${thirdContact.phone2}");
	$("#tab3_phone3").val("${thirdContact.phone3}");
	$("#tab3_extension").val("${thirdContact.extension}");
	$("#tab3_fax1").val("${thirdContact.fax1}");
	$("#tab3_fax2").val("${thirdContact.fax2}");
	$("#tab3_fax3").val("${thirdContact.fax3}");
	$("#tab3_email_id").val("${thirdContact.email_id}");
	$("#tab3_email_domain").val("${thirdContact.email_domain}");
	$("#tab3_homepage").val("${thirdContact.homepage}");
	$("#tab3_address_eng").val("${thirdContact.address_eng}");
	$("#tab3_foreign_address").val("${thirdContact.foreign_address}");
	$("#tab3_foreign_phone").val("${thirdContact.foreign_phone}");
	
	$("#tab4_birthday_sepa").val("${customerAdd.birthday_sepa}");
	$("#tab4_birthday").val("${customerAdd.birthday}");
	$("#tab4_marriage_sepa").val("${customerAdd.marriage_sepa}");
	$("#tab4_marriage_date").val("${customerAdd.marriage_date}");
	$("#tab4_gender_sepa").val("${customerAdd.gender_sepa}");
	$("#tab4_household_sepa").val("${customerAdd.household_sepa}");
	$("#tab4_spouse_brthdy_year").val("${customerAdd.spouse_brthdy_year}");
	$("#tab4_children_sepa").val("${customerAdd.children_sepa}");
	$("#tab4_children1_brthdy_year").val("${customerAdd.children1_brthdy_year}");
	$("#tab4_children2_brthdy_year").val("${customerAdd.children2_brthdy_year}");
	$("#tab4_children3_brthdy_year").val("${customerAdd.children3_brthdy_year}");
	$("#tab4_car_sepa").val("${customerAdd.car_sepa}");
	$("#tab4_annual_income").val("${customerAdd.annual_income}");
	$("#tab4_dual_income_or").val("${customerAdd.dual_income_or}");
	$("#tab4_pay_day").val("${customerAdd.pay_day}");
	$("#tab4_house_have_sepa").val("${customerAdd.house_have_sepa}");
	$("#tab4_householder_sepa").val("${customerAdd.householder_sepa}");
	$("#tab4_living_sepa").val("${customerAdd.living_sepa}");
	$("#tab4_living_pyeong").val("${customerAdd.living_pyeong}");
	
	$("#tab5_identification_type").val("${antiMoneyLaundering.identification_type}");
	$("#tab5_verify_sepa").val("${antiMoneyLaundering.verify_sepa}");
	$("#tab5_job_sepa").val("${antiMoneyLaundering.job_sepa}");
};
 
var checkValue = function(){
	if($("#realname_num").val() == ""){
		alert("실명번호를 조회하세요");
		$("#realname_num").focus();
		return false;
	} else if($("#customer_qualf_sepa").val() == ""){
		alert("고객자격을 선택해주세요");
		return false;
	} else if($("#customer_name").val() == ""){
		alert("고객명을 입력해주세요");
		$("#customer_name").focus();
		return false;
	} else {
		return true;
	}
};

var checkNull = function(data){
	if(data==""){
		return undefined;
	} else {
		return data;
	}
}
//Ajax 에러 콜백함수
var errorCallback = function(){
	alert("수행 중 오류가 발생했습니다.");
};
</script>

<script type="text/javascript">
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

//거래구분
function dealDivision() {
	if($("select[id=거래구분]").val()=="01") {		//등록
		location.href = "${ctx}/views/customer/0200_register.jsp";
	}
	else if($("select[id=거래구분]").val()=="02") {		//변경
	}
	else if($("select[id=거래구분]").val()=="03") {		//조회
		location.href = "${ctx}/views/customer/0200_find.jsp";
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
             buttonImage: "${ctx}/resources/image/icon/calendar.png",
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


</script>
</head>
<!-- 저장해야할 데이터 101개 , select 23개 -->
<body>

<jsp:include page="/views/include/header.jsp"/>
	<div id="container">
		<div class="nav">
			<ul>
				<li>&nbsp;▶ 고객/CRM</li>
				<li class="nav_dir"><a href="#" class="nav_bold">&nbsp;&nbsp;&nbsp;고객 기본정보 관리</a></li>
				<li><a href="${ctx }/views/customer/0009.jsp">&nbsp;&nbsp;&nbsp;계좌조회</a></li>
				<li><a href="${ctx }/views/add/0231.jsp">&nbsp;&nbsp;&nbsp;자금세탁방지 고객관리</a></li>
			</ul>
		</div>

		<div id="contents">
			<h3>[0200] 고객 기본정보 관리 <img class="more" src="${ctx }/resources/image/icon/more.png" alt="코멘트"></h3>
			<div class="comment1">
                <div class="comt">
                    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        고객 신규시 등록하게 되는 고객의 정보는 향후 고객관리에 큰 영향을 미치게 되므로, 필수 정보가 아니더라도 <span class="hl">최대한 많은 정보</span>를 정확하게 파악하여 입력하도록 한다.</p>
                    <p>우편, 전화 연락처 항목은 손님께 은행 거래에 대한 내역이 통보되는 연락처이며 매우 중요하므로 꼭 한번 더 확인하도록 한다.</p>
                </div>
            </div>
			
			<div id="tabs">
				<div class="srch">
					<div class="srch-inner">
						<ul>
							<li><span class="note1 pointer">(*)거래구분</span>
								<select title="거래구분" id="거래구분" style="background: #ffffcc;" onchange="dealDivision();">
									<option value="01">1: 등록</option>								
									<option value="02" selected="selected">2: 변경</option>
									<option value="03">3: 조회</option>
							 	</select>
							 </li>
						</ul>
						<ul>
							<li class="change" >
								<span>실명번호</span>
								<input type="text" id="findNo" style="background-color: #FFFFCC;">
								<img src="${ctx }/resources/image/icon/search.gif" alt="검색버튼" id="findCustomer" style="cursor:pointer">
							</li>
						</ul>
						
						<div class="comment2 posi60">
		                    <div class="close pointer"><img src="${ctx }/resources/image/icon/close.png" alt="닫기" ></div>
		                    <div class="comt2">
		                        <h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;거래구분</h5><br><br>
		                        <p>조회 선택시에는 필수입력필드,입력필드 상관 없이 편집 안되고 조회만 되면됩니다.</p>
		                    </div>
		                </div>
						
					</div>
					<!--End of srch-inner-->
				</div>
				<!--End of srch-->

				<h4>고객 기본정보</h4><!-- 정 h4 -->
				<div class="info01-wrap-1401">
					<form action="${ctx}/customer/modifyBasics.do" id="modifyBasicsForm" method="POST" >
					<div class="info01-inner-0004">
						<table summary="고객기본정보">
							<caption>고객기본정보</caption>
							<colgroup>
								<col style="width: 100px" >
								<col >
								<col style="width: 120px" >
								<col style="width: 120px" >
								<col style="width: 120px" >
								<col style="width: 160px" >
							</colgroup>
							<tbody>
								<tr>
									<th><span>실명번호</span></th>
									<td>
										<input type="text" id="realname_num" name="realname_num" class="isEssential" style="background-color:#ffffcc; width: 48%"  >
										<select title="실명번호" name="realname_num_sepa" id="realname_num_sepa" style="background-color:#ffffcc; width: 48%" >
											<option value="01" selected>01: 주민등록번호</option>
											<option value="02">02: 여권조합번호</option>
											<option value="03">03: 외국인등록증번호</option>
											<option value="04">04: 국내거소신고증번호</option>
											<option value="05">05: 사업자번호</option>
											<option value="06">06: 고유번호</option>
											<option value="07">07: 납세번호</option>
											<option value="08">08: 법인번호</option>
										</select>
									</td>
									<th><span>고객자격</span></th>
									<td colspan="3">
										<input type="text" id="customer_qualf_sepa" name="customer_qualf_sepa" class="isEssential" style="background: #ffffcc; width: 80px" readonly >
										<a target="_blank" onclick="window.open('${ctx}/views/customer/pop_0200.jsp','고객자격코드검색','width=700, height=180, scrollbars=yes, location=no'); ">
											<img class="qualify" src="${ctx }/resources/image/icon/search.gif" alt="검색버튼" >
										</a>
										<input type="text" id="customer_qualf_name" name="customer_qualf_name" readonly style="width:auto"></td>
								</tr>
								<tr>
									<th><span>고객명</span></th>
									<td><input type="text" id="customer_name" name="customer_name" class="isEssential" style="background: #ffffcc;" ></td>
									<th><span>영문명</span></th>
									<td><input type="text" id="customer_name_eng" name="customer_name_eng"></td>
									<th><span>여권번호</span></th>
									<td><input type="text" id="passport_num" name="passport_num" maxlength="9"></td>
								</tr>
								<tr>
									<th><span>국적</span></th>
									<td>
										<select title="국적" id="nationality_sepa" name="nationality_sepa" style="background: #ffffcc;" >
											<option value="01" selected>KR : 대한민국</option>
											<option value="02">US : 미국</option>
											<option value="03">CN : 중국</option>
											<option value="04">JP : 일본</option>
											<option value="05">GB : 영국</option>
											<option value="06">HK : 홍콩</option>
											<option value="07">CA : 캐나다</option>
										</select>
									</td>
									
										<th class="사업자등록번호" ><span class="note2 pointer">(*)사업자등록번호</span></th>
										<td><input type="text" class="사업자등록번호" id="bizrno" name="bizrno" maxlength="10" ></td>
										<th class="업체명" ><span class="note2 pointer">(*)업체명</span></th>
										<td><input type="text" class="업체명" id="enterprise_name" name="enterprise_name" ></td>
									
								</tr>
								<tr>
									<th><span>우편물수령처</span></th>
									<td>
										<select title="우편물수령처" id="postal_sepa" name="postal_sepa" style="background: #ffffcc;" onchange="isEssential_1(); ">
											<option value="01" selected>01: 자택(본사)</option>
											<option value="02">02: 직장(사업장)</option>
											<option value="03">03: 제3연락처</option>
											<option value="05">04: 전자우편(자택)</option>
											<option value="06">05: 전자우편(직장)</option>
										</select>
										</td>
									<th><span>전화연락처</span></th>
									<td>
										<select title="전화연락처" id="contact_sepa" name="contact_sepa" style="background: #ffffcc;" onchange="isEssential_2();">
											<option value="01" selected>01: 자택(본사)</option>
											<option value="02">02: 직장(사업장)</option>
											<option value="03">03: 휴대폰</option>
											<option value="04">04: 원치않음</option>
										</select>
									</td>
									<td colspan="2">&nbsp;</td>
								</tr>
							</tbody>
						</table>
 
	                    <div class="comment2 posi61">
	                        <div class="close pointer"><img src="${ctx }/resources/image/icon/close.png" alt="닫기" ></div>
	                        <div class="comt2">
	                            <h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;개인사업자번호/업체명</h5><br><br>
	                            <p>개인사업자는 사업자명의로 고객등록이 불가능합니다. 개인 명의로 등록하고 사업자번호와 업체명을 추가입력합니다.</p>
	                        </div>
	                    </div>
                    
					</div>
					</form>
					<!--End of info01-inner-->
				</div>
				<!--End of info01-->
				
				
				<div class="tab_list m1">
					<ul>
						<li class="m1"><a><span class="자택">자택(본사)</span></a>
							<ul>
								<li>
									<form action="${ctx}/customer/modifyHouse.do" id="registerForm" method="POST" >
									<table summary="자택주소정보">
										<caption>자택주소정보</caption>
										<colgroup>
                                            <col style="width:100px">
                                            <col style="width:200px">
                                            <col style="width:50px">
                                            <col style="width:100px">
                                            <col style="width:80px">
                                            <col style="width:150px">
                                            <col style="width:80px">
                                            <col style="width:100px">
                                        </colgroup>
										<tbody>
											<tr>
												<th class="자택">자택 우편번호</th>												
												<td colspan="5">
                                                    <input type="text" id="tab1_zip_code" name="zip_code" style="width:80px;" >
                                                    <img src="${ctx }/resources/image/icon/search.gif" alt="검색버튼" onclick="window.open('${ctx}/views/customer/searchAddr.jsp?tab=1','우편번호검색','width=600, height=620, scrollbars=yes, location=no'); ">
                                                    <input type="text" name="address_before" id="tab1_address_before" style="width:480px;">
                                                </td>
												<th>상세주소</th>
												<td><input type="text" name="address_after" id="tab1_address_after" class="isEssential" ></td>
											</tr>
											<tr>
												<th>주거형태</th>
												<td colspan="7">
													<select title="주거형태" id="tab1_residence_sepa" name="residence_sepa" >
														<option value="01" selected="selected">01: 아파트</option>
														<option value="02">02: 빌라</option>
														<option value="03">03: 연립/다세대</option>
														<option value="04">04: 오피스텔</option>
														<option value="05">05: 단독</option>
														<option value="06">99: 기타</option>
													</select>
													<input type="text" name="town_name" id="tab1_town_name">마을
													<input type="text" name="apart_name" id="tab1_apart_name">아파트
													<input type="text" name="dong" id="tab1_dong">동
													<input type="text" name="ho" id="tab1_ho">호
												</td>
											</tr>
											<tr>
												<th>영문주소</th>
												<td colspan="7"><input type="text" name="address_eng" id="tab1_address_eng" style="width: 100%" ></td>
											</tr>
											<tr>
		                                        <th>전화번호</th>
		                                        <td><input type="text" name="phone1" id="tab1_phone1" class="isEssential" style="width:25%;" maxlength="3" >-<input type="text" name="phone2" id="tab1_phone2" class="isEssential" style="width:30%;" maxlength="4" >-<input type="text" name="phone3" id="tab1_phone3" class="isEssential" style="width:30%;" maxlength="4" ></td>
		                                        <th>내선</th>
		                                        <td><input type="text" name="extension" id="tab1_extension" style="width:100px" maxlength="3"></td>
		                                        <th>휴대전화</th>
		                                        <td><input type="text" name="cellphone1" id="tab1_cellphone1" style="width:25%" maxlength="3">-<input type="text" name="cellphone2" id="tab1_cellphone2" style="width:30%" maxlength="4">-<input type="text" name="cellphone3" id="tab1_cellphone3" style="width:30%" maxlength="4"></td>
		                                        <th>팩스번호</th>
		                                        <td><input type="text" name="fax1" id="tab1_fax1" style="width:25%" maxlength="3">-<input type="text" name="fax2" id="tab1_fax2" style="width:29%" maxlength="4">-<input type="text" name="fax3" id="tab1_fax3" style="width:30%" maxlength="4"></td>
		                                    </tr>
											<tr>
												<th>이메일주소</th>
												<td colspan="5">
													<input type="text" name="email_id" id="tab1_email_id" size="22" >@
													<input type="text" name="email_domain" id="tab1_email_domain" size="23" >
													 <select id="자택_이메일주소select" name="db0200select" onchange="emailInsert_1();">
														<option value="01">-- 직접 입력 --</option>
														<option value="02">gmail.com</option>
														<option value="03">hanmail.net</option>
														<option value="04">hotmail.com</option>
														<option value="05">naver.com</option>
														<option value="06">nate.com</option>
													</select>
												<th>홈페이지</th>
												<td><input type="text" name="homepage" id="tab1_homepage" style="width: 99%" ></td>
											</tr>
											<tr>
												<th>해외주소</th>
												<td colspan="5"><input type="text" name="foreign_address" id="tab1_foreign_address" style="width: 99%" ></td>
												<th>해외전화</th>
												<td><input type="text" name="foreign_phone" id="tab1_foreign_phone" style="width: 100%" ></td>
											</tr>
										</tbody>
									</table>
									</form>
								</li>
							</ul>
						</li>
						<!--End of info02-inner add01 m1-->

						<li class="m2"><a><span>직장(사업장)</span></a>
							<ul>
								<li>
									<form action="${ctx}/customer/modifyOffice.do" id="registerForm" method="POST" >
									<table summary="직장주소정보">
										<caption>직장 주소정보</caption>
										<colgroup>
											<col style="width: 100px" >
											<col style="width: 200px" >
											<col style="width: 100px" >
											<col style="width: 200px" >
											<col style="width: 80px" >
											<col style="width: 200px" >
										</colgroup>
										<tbody>
											<tr>
												<th>직장 우편번호</th>
												<td colspan="3">
													<input type="text" name="zip_code" id="tab2_zip_code" style="width: 80px;" >
													<img src="${ctx }/resources/image/icon/search.gif" alt="검색버튼" onclick="window.open('${ctx}/views/customer/searchAddr.jsp?tab=2','우편번호검색','width=600, height=620, scrollbars=yes, location=no');" >
													<input type="text" name="address_before" id="tab2_address_before" style="width: 400px;" >
												</td>
												<th>부속주소</th>
												<td><input type="text" name="address_after" id="tab2_address_after" style="width: 99%" ></td>
											</tr>
											<tr>
												<th>주거형태</th>
												<td colspan="5">
													<select title="주거형태" id="tab2_moving_in_sepa" name="moving_in_sepa" >
														<option value="01" selected="selected">01: 아파트</option>
														<option value="02">02: 빌라</option>
														<option value="03">03: 연립/다세대</option>
														<option value="04">04: 오피스텔</option>
														<option value="05">05: 단독</option>
														<option value="06">99: 기타</option>
													</select>
													<input type="text" name="town_name" id="tab2_town_name" >마을
													<input type="text" name="apart_name" id="tab2_apart_name" >아파트
													<input type="text" name="dong" id="tab2_dong" >동
													<input type="text" name="ho" id="tab2_ho" >호
												</td>
											</tr>
											<tr>
												<th>영문주소</th>
												<td colspan="5"><input type="text" name="address_eng" id="tab2_address_eng" style="width: 100%" ></td>
											</tr>
											<tr>
                                                <th>전화번호</th>
                                                <td><input type="text" name="phone1" id="tab2_phone1" style="width:25%" maxlength="3">-<input type="text" name="phone2" id="tab2_phone2" style="width:30%" maxlength="4">-<input type="text" name="phone3" id="tab2_phone3" style="width:30%" maxlength="4"></td>
                                                <th>내선</th>
                                                <td><input type="text" name="extension" id="tab2_extension" style="width:100px" maxlength="3"></td>
                                                <th>팩스번호</th>
                                                <td><input type="text" name="fax1" id="tab2_fax1" style="width:25%" maxlength="3">-<input type="text" name="fax2" id="tab2_fax2" style="width:30%" maxlength="4">-<input type="text" name="fax3" id="tab2_fax3" style="width:30%" maxlength="4"></td>
                                            </tr>
											<tr>
												<th>직업</th>
												<td>
													<select title="직업" id="tab2_job" name="job" style="width: 100%" >
														<option value="01" selected="selected">01: 회사원</option>
														<option value="02">02: 사무 종사자</option>
														<option value="03">03: 서비스 종사자</option>
														<option value="04">04: 판매 종사자</option>
														<option value="05">05: 농업,어업,임업 종사자</option>
														<option value="06">06: 건축,전기,장비 기술자</option>
														<option value="07">07: 교사</option>
														<option value="08">08: 군인</option>
														<option value="09">09: 임원</option>
														<option value="10">10: 공무원</option>
														<option value="11">11: 고위공직자</option>
														<option value="12">12: 정치인</option>
														<option value="13">13: 주부</option>
														<option value="14">14: 학생</option>
													</select>
												</td>
												<th>직장명</th>
												<td><input type="text" name="company_name" id="tab2_company_name" style="width: 98%" ></td>
												<td colspan="2">&nbsp;</td>
											</tr>
											<tr>
												<th>부서명</th>
												<td><input type="text" name="department_name" id="tab2_department_name" style="width: 99%" ></td>
												<th>직위명</th>
												<td><input type="text" name="position_name" id="tab2_position_name" style="width: 98%" ></td>
												<th>입사일자</th>
												<td><input type="text" name="join_date" id="tab2_join_date"></td>
											</tr>
										</tbody>
									</table>
									</form>
								</li>
							</ul></li>
						<!--End of info02-inner add02 m2-->

						<li class="m3"><a><span>제3연락처</span></a>
							<ul>
								<li>
									<table summary="제3연락처 주소정보">
										<caption>제3연락처 주소정보</caption>
										<colgroup>
											<col style="width: 100px" >
											<col style="width: 200px" >
											<col style="width: 100px" >
											<col style="width: 200px">
											<col style="width: 80px" >
											<col style="width: 200px" >
										</colgroup>
										<tbody>
											<tr>
												<th>우편번호</th>
												<td colspan="3">
													<input type="text" name="zip_code" id="tab3_zip_code" style="width: 80px;" >
													<img src="${ctx }/resources/image/icon/search.gif" alt="검색버튼" onclick="window.open('${ctx}/views/customer/searchAddr.jsp?tab=3','우편번호검색','width=600, height=620, scrollbars=yes, location=no');" >
													<input type="text" name="address_before" id="tab3_address_before" style="width: 400px;" >
												</td>
												<th>부속주소</th>
												<td><input type="text" name="address_after" id="tab3_address_after" style="width: 99%" ></td>
											</tr>
											<tr>
												<th>주거형태</th>
												<td colspan="5">
													<select title="주거형태" id="tab3_residence_sepa" name="residence_sepa" >
														<option value="01" selected="selected">01: 아파트</option>
														<option value="02">02: 빌라</option>
														<option value="03">03: 연립/다세대</option>
														<option value="04">04: 오피스텔</option>
														<option value="05">05: 단독</option>
														<option value="99">99: 기타</option>
													</select>
													<input type="text" name="town_name" id="tab3_town_name" >마을
													<input type="text" name="apart_name" id="tab3_apart_name">아파트
													<input type="text" name="dong" id="tab3_dong">동
													<input type="text" name="ho" id="tab3_ho" >호
												</td>
											</tr>
											<tr>
												<th>영문주소</th>
												<td colspan="5"><input type="text" name="address_eng" id="tab3_address_eng" style="width: 100%" ></td>
											</tr>
											<tr>
                                                <th>전화번호</th>
                                                <td><input type="text" name="phone1" id="tab3_phone1" style="width:25%" maxlength="3">-<input type="text" name="phone2" id="tab3_phone2" style="width:30%" maxlength="4">-<input type="text" name="phone3" id="tab3_phone3" style="width:30%" maxlength="4"></td>
                                                <th>내선</th>
                                                <td><input type="text" name="extension" id="tab3_extension" style="width:100px" maxlength="3"></td>
                                                <th>팩스번호</th>
                                                <td><input type="text" name="fax1" id="tab3_fax1" style="width:25%" maxlength="3">-<input type="text" name="fax2" id="tab3_fax2" style="width:30%" maxlength="4">-<input type="text" name="fax3" id="tab3_fax3" style="width:30%" maxlength="4"></td>
                                            </tr>
											<tr>
												<th>이메일주소</th>
												<td colspan="3">
													<input type="text" name="email_id" id="tab3_email_id" size="22" >@
													<input type="text" name="email_domain" id="tab3_email_domain" size="23" >
													<select id="제3_이메일주소select"  onchange="emailInsert_2();">
														<option value="01">-- 직접 입력 --</option>
														<option value="02">gmail.com</option>
														<option value="03">hanmail.net</option>
														<option value="04">hotmail.com</option>
														<option value="05">naver.com</option>
														<option value="06">nate.com</option>
													</select>
												</td>
												<th>홈페이지</th>
												<td><input type="text" name="homepage" id="tab3_homepage" style="width: 99%" ></td>
											</tr>
											<tr>
												<th>해외주소</th>
												<td colspan="3"><input type="text" name="foreign_address" id="tab3_foreign_address" style="width: 99%" ></td>
												<th>해외전화</th>
												<td><input type="text" name="foreign_phone" id="tab3_foreign_phone" style="width: 99%" ></td>
											</tr>
										</tbody>
									</table>
								</li>
							</ul></li>
						<!--End of info02-inner add03 m3-->

						<li class="m4"><a><span>고객추가정보</span></a>
							<ul>
								<li>
									<table summary="고객추가정보">
										<caption>고객추가정보</caption>
										<colgroup>
											<col style="width: 80px" >
											<col style="width: 200px" >
											<col style="width: 80px" >
											<col style="width: 60px" >
											<col style="width: 60px" >
											<col >
											<col style="width: 60px" >
											<col style="width: 60px" >
											<col style="width: 60px" >
											<col style="width: 60px" >
											<col style="width: 60px" >
											<col style="width: 60px" >
										</colgroup>
										<tbody>
										<tr>
											<th>실제 생일</th>
											<td>
												<select title="실제생일" id="tab4_birthday_sepa" name="birthday_sepa" >
													<option value="01" selected="selected">01:양력</option>
													<option value="02">02:음력</option>
													<option value="03">03:윤달</option>
												</select>
												<input type="text" name="birthday" id="tab4_birthday" style="width: 80px" >
											</td>
											<th colspan="2">결혼기념일</th>
											<td colspan="4">
												<select title="결혼기념일" id="tab4_marriage_sepa" name="marriage_sepa" >
													<option value="01" selected="selected">미혼</option>
													<option value="02">기혼</option>
												</select>
											<input type="text" name="marriage_date" id="tab4_marriage_date" ></td>
											<th colspan="2">성별 구분</th>
											<td colspan="2">
												<select title="성별구분" id="tab4_gender_sepa" name="gender_sepa" style="width: 99%" >
													<option value="01" selected="selected">남성</option>
													<option value="02">여성</option>
												</select>
											</td>
										</tr>
										<tr>
											<th>세대 구성</th>
											<td>
												<select title="세대구성" id="tab4_household_sepa" name="household_sepa" style="width: 99%" >
													<option value="01" selected="selected">01: 1인가구</option>
													<option value="02">02: 배우자</option>
													<option value="03">03: 배우자+자녀</option>
													<option value="04">04: 배우자+부모</option>
													<option value="05">05: 배우자+부모+자녀</option>
													<option value="06">06: 배우자+부모+조부모</option>
													<option value="07">07: 배우자+부모+조부모+자녀</option>
													<option value="08">08: 본인+부모</option>
													<option value="09">09: 본인+자녀</option>
													<option value="10">10: 본인+부모+자녀</option>
													<option value="11">11: 본인+부모+조부모</option>
													<option value="12">12: 본인+부모+조부모+자녀</option>
												</select>
											</td>
											<th>배우자</th>
											<td><input type="text" name="spouse_brthdy_year" id="tab4_spouse_brthdy_year" size="3" >년생</td>
											<th>자녀수</th>
											<td>
												<select title="자녀수" id="tab4_children_sepa" name="children_sepa" >
													<option value="01" selected="selected">1명</option>
													<option value="02">2명</option>
													<option value="03">3명</option>
													<option value="04">3명이상</option>
												</select>
											</td>
											<th>자녀1</th>
											<td><input type="text" name="children1_brthdy_year" id="tab4_children1_brthdy_year" size="3" >년생</td>
											<th>자녀2</th>
											<td><input type="text" name="children2_brthdy_year" id="tab4_children2_brthdy_year" size="3" >년생</td>
											<th>자녀3</th>
											<td><input type="text" name="children3_brthdy_year" id="tab4_children3_brthdy_year" size="3" >년생</td>
										</tr>
										<tr>
											<th>보유 차량</th>
											<td>
												<select title="보유차량" id="tab4_car_sepa" name="car_sepa" style="width: 99%" >
													<option value="01" selected="selected">01: 없음</option>
													<option value="02">02: 본인차량소유</option>
													<option value="03">03: 배우자차량소유</option>
													<option value="04">04: 부모차량소유</option>
													<option value="05">05: 자녀차량소유</option>
													<option value="06">06: 본인+배우자차량소유</option>
												</select>
											</td>
											<th>연소득</th>
											<td colspan="3"><input type="text" name="annual_income" id="tab4_annual_income" size="21" >만원</td>
											<th colspan="2">맞벌이여부</th>
											<td colspan="2">
												<select title="맞벌이여부" id="tab4_dual_income_or" name="dual_income_or" style="width: 99%" >
													<option value="01" selected="selected">1: 예</option>
													<option value="02">2: 아니오</option>
												</select>
											</td>
											<th>급여일</th>
											<td><input type="text" name="pay_day" id="tab4_pay_day" size="3" >일</td>
										</tr>
										<tr>
											<th>주택 소유</th>
											<td>
												<select title="주택소유" id="tab4_house_have_sepa" name="house_have_sepa" style="width: 99%" >
													<option value="00" selected="selected">00: 없음</option>
													<option value="01">01: 주택소유</option>
													<option value="02">02: 주택2채이상</option>
													<option value="03">03: 아파트소유</option>
													<option value="04">04: 아파트2채이상</option>
													<option value="05">05: 토지소유</option>
													<option value="99">99: 기타</option>
												</select>
											</td>
											<th>주거 평수</th>
											<td colspan="3"><input type="text" name="living_pyeong" id="tab4_living_pyeong" size="21" >m²</td>
											<th colspan="2">세대주구분</th>
											<td colspan="2">
												<select title="세대주구분" id="tab4_householder_sepa" name="householder_sepa" style="width: 99%" >
													<option value="01" selected="selected">1: 세대주</option>
													<option value="02">2: 가족</option>
												</select>
											</td>
											<td colspan="2">&nbsp;</td>
										</tr>
										<tr>
											<th>생계형구분</th>
											<td>
												<select title="생계형구분" id="tab4_living_sepa" name="living_sepa" style="width: 99%" >
													<option value="01" selected="selected">01: 해당없음</option>
													<option value="02">02: 60세이상노인</option>
													<option value="03">03: 장애인</option>
													<option value="04">04: 국가유공자중상이자</option>
													<option value="05">05: 국민기초생활보장수급자</option>
													<option value="06">06: 독립유공자</option>
													<option value="07">07: 독립유공자가족</option>
													<option value="08">08: 518민주화운동부상자</option>
													<option value="09">09: 고엽제후유증환자</option>
												</select>
											</td>
										</tr>
										</tbody>
									</table>
								</li>
							</ul></li>
						<!--End of info02 inner add01 m1-->

						<li class="m5"><a><span>자금세탁방지</span></a>
							<ul>
								<li>
									<table summary="자금세탁방지" style="width: 100%">
										<caption>자금세탁방지</caption>
										<colgroup>
											<col style="width: 100px">
											<col style="width: 200px">
											<col style="width: 100px">
											<col style="width: 80px">
											<col style="width: 100px">
											<col style="width: 170px">
										</colgroup>
										<tbody>
											<tr>
												<th>신분증종류</th>
												<td >
													<select title="신분증종류" id="tab5_identification_type" name="identification_type" style="width: 100%" >
														<option value="01" selected="selected">01: 주민등록증</option>
														<option value="02">02: 운전면허증</option>
														<option value="03">03: 여권</option>
														<option value="04">04: 학생증</option>
														<option value="05">05: 외국인등록증</option>
														<option value="06">06: 국내거소신고증</option>
														<option value="07">07: 사업자등록증/사업자등록증명원</option>
														<option value="08">08: 고유번호증</option>
														<option value="09">09: 납세번호증</option>
														<option value="10">10: 투자등록증</option>
														<option value="11">11: 기타</option>
														<option value="12">12: 일회성거래</option>
													</select>
												</td>
												<th>검 증</th>
												<td >
													<select title="검증" id="tab5_verify_sepa" name="verify_sepa" style="width: 100%" >
														<option value="00"></option>
														<option value="01">01: 예</option>
														<option value="02">02: 아니오</option>
													</select>
												</td>
												<th>직 업</th>
												<td >
													<select title="직업" id="tab5_job_sepa" name="job_sepa" style="width: 100%" >
														<option value="01" selected="selected">01: 회사원</option>
														<option value="02">02: 사무종사자</option>
														<option value="03">03: 서비스종사자</option>
														<option value="04">04: 판매종사자</option>
														<option value="05">05: 사업가</option>
														<option value="06">06: 농업,어업,임업종사자</option>
														<option value="07">07: 건축,전기,장비 기술자</option>
														<option value="08">08: 교사</option>
														<option value="09">09: 군인</option>
														<option value="10">10: 주부</option>
														<option value="11">11: 학생</option>
														<option value="12">12: 임원</option>
														<option value="13">13: 공무원</option>
														<option value="14">14: 고위공직자</option>
														<option value="15">15: 정치인</option>
													</select>
												</td>
											</tr>
										</tbody>
									</table>
								</li>
								
							</ul></li>
						<!--End of info02-inner add03 m3-->
					</ul>
				</div><!--End of info02-->
				
				<div class="btn_both">
					<div class="fr change changebutton">
						<input type="button"  value="변경" id="modify" >
					</div>
				</div>
			</div><!--End of tabs-->
			
			<div id="resultPopup" style="display:none">
			     	<div class="head1"><p>처리 내역</p></div>
				    <table id="resultTable">
				        <colgroup><col style="width:30%"><col style="width:70%"></colgroup>
				    	<tbody></tbody>
				    </table>
			</div>
			
		</div><!--End of contents-->
	</div><!--container-->
</body>
</html>