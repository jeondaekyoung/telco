if( window.location.host =='localhost:8080'){
	  var rootPath = window.location.protocol + '//' + window.location.host+'/telco';  
  }
  else
  var rootPath = window.location.protocol + '//' + window.location.host;

var request = new Request();

$(document).ready(function(){
    $(".gnb_ul").mouseenter(function(){
        $(".sub_nav").stop().slideDown("slow");
    });
    $(".nav_wrap").mouseleave(function(){
        $(".sub_nav").stop().slideUp("slow");
    });
    
      //조회 화면 셋팅
  	//$(".change").show();
	//$(".regist").hide();
	//$(".changebutton").hide();
	$('input').not("#findNo").attr('readonly','readonly');
	$('select').prop("disabled",true);
	$('select[id=거래구분]').prop("disabled",false);
	$('input').not("#findNo").css('background-color','#EDEDED');
	//데이터확인하기
	 var existCustomer = request.getParameter("existCustomer");
	 console.log("데이터확인하기 : " + existCustomer);
    if(existCustomer == "nothing"){
    	alert("존재하지않는 실명번호입니다.");
    }
	//데이터입히기
	putonData();

      //조회 클릭액션
      $("#findCustomer").click(function(){
    	  var findNo = $("#findNo").val();
    	  if(findNo == ""){
    		  alert("실명번호를 입력해주세요");
    	  } else {
    		  location.href = rootPath + "/customer/findCustomer.do?realname_num=" + findNo;
    	  }
      });
    
});
//--> ready end


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
	/* $(".change").hide();
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
	$('select[id=contact_sepa]').css('background-color','#FFFFCC'); */
	//$('input[id=tab1_address_after]').css('background-color','#FFFFCC');
	//$('input[id=tab1_phone1]').css('background-color','#FFFFCC');
	//$('input[id=tab1_phone2]').css('background-color','#FFFFCC');
	//$('input[id=tab1_phone3]').css('background-color','#FFFFCC');
	location.href = rootPath + "/views/customer/0200_register.jsp";
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

