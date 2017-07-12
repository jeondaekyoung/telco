<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath }" scope="request" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>[0231] 자금세탁방지 고객관리</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge" >
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<meta name="viewport" content="user-scalable=no, width=device-width, initial-scale=1.0, maximum-scale=1.0">
<meta name="apple-mobile-web-app-capable" content="yes">
<link href="${ctx }/resources/css/common.css" type="text/css" rel="stylesheet">
<link href="${ctx }/resources/css/tab.css" type="text/css" rel="stylesheet">
<link href="${ctx }/resources/css/media.css" type="text/css" rel="stylesheet">
<link rel='stylesheet' href='http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css'>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.js"></script> 
<script type="text/javascript" src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
        $(".gnb_ul").mouseenter(function(){
            $(".sub_nav").stop().slideDown("slow");
        });
        $(".nav_wrap").mouseleave(function(){
            $(".sub_nav").stop().slideUp("slow");
        });
    });
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

//필수입력 항목 지정
function isEssential_1() {
	if($("select[id=우편물수령처]").val()=="01") {
		$("input[id=직장우편번호_1]").css("background-color","#ffffff").removeClass("isEssential");
		$("input[id=직장_부속주소]").css("background-color","#ffffff").removeClass("isEssential");
		$("input[id=제3_전화번호_1]").css("background-color","#ffffff").removeClass("isEssential");
		$("input[id=제3_전화번호_2]").css("background-color","#ffffff").removeClass("isEssential");
		$("input[id=제3_전화번호_3]").css("background-color","#ffffff").removeClass("isEssential");
		$("input[id=자택_이메일주소_1]").css("background-color","#ffffff").removeClass("isEssential");
		$("input[id=자택_이메일주소_2]").css("background-color","#ffffff").removeClass("isEssential");
	}
	else if($("select[id=우편물수령처]").val()=="02") {
		$("input[id=제3_전화번호_1]").css("background-color","#ffffff").removeClass("isEssential");
		$("input[id=제3_전화번호_2]").css("background-color","#ffffff").removeClass("isEssential");
		$("input[id=제3_전화번호_3]").css("background-color","#ffffff").removeClass("isEssential");
		$("input[id=자택_이메일주소_1]").css("background-color","#ffffff").removeClass("isEssential");
		$("input[id=자택_이메일주소_2]").css("background-color","#ffffff").removeClass("isEssential");
		$("input[id=직장우편번호_1]").css("background-color","#ffffcc").addClass("isEssential");
		$("input[id=직장_부속주소]").css("background-color","#ffffcc").addClass("isEssential");
	}
	else if($("select[id=우편물수령처]").val()=="03") {
		$("input[id=직장우편번호_1]").css("background-color","#ffffff").removeClass("isEssential");
		$("input[id=직장_부속주소]").css("background-color","#ffffff").removeClass("isEssential");
		$("input[id=자택_이메일주소_1]").css("background-color","#ffffff").removeClass("isEssential");
		$("input[id=자택_이메일주소_2]").css("background-color","#ffffff").removeClass("isEssential");
		$("input[id=제3_전화번호_1]").css("background-color","#ffffcc").addClass("isEssential");
		$("input[id=제3_전화번호_2]").css("background-color","#ffffcc").addClass("isEssential");
		$("input[id=제3_전화번호_3]").css("background-color","#ffffcc").addClass("isEssential");
	}
	else if($("select[id=우편물수령처]").val()=="04") {
		$("input[id=직장우편번호_1]").css("background-color","#ffffff").removeClass("isEssential");
		$("input[id=직장_부속주소]").css("background-color","#ffffff").removeClass("isEssential");
		$("input[id=제3_전화번호_1]").css("background-color","#ffffff").removeClass("isEssential");
		$("input[id=제3_전화번호_2]").css("background-color","#ffffff").removeClass("isEssential");
		$("input[id=제3_전화번호_3]").css("background-color","#ffffff").removeClass("isEssential");
		$("input[id=자택_이메일주소_1]").css("background-color","#ffffcc").addClass("isEssential");
		$("input[id=자택_이메일주소_2]").css("background-color","#ffffcc").addClass("isEssential");
	}
}

function isEssential_2() {
	if($("select[id=전화연락처]").val()=="01" || $("select[id=전화연락처]").val()=="04") {
		$("input[id=직장_전화번호_1]").css("background-color","#ffffff").removeClass("isEssential");
		$("input[id=직장_전화번호_2]").css("background-color","#ffffff").removeClass("isEssential");
		$("input[id=직장_전화번호_3]").css("background-color","#ffffff").removeClass("isEssential");
		$("input[id=자택_휴대전화_1]").css("background-color","#ffffff").removeClass("isEssential");
		$("input[id=자택_휴대전화_2]").css("background-color","#ffffff").removeClass("isEssential");
		$("input[id=자택_휴대전화_3]").css("background-color","#ffffff").removeClass("isEssential");
	}
	else if($("select[id=전화연락처]").val()=="02") {
		$("input[id=자택_휴대전화_1]").css("background-color","#ffffff").removeClass("isEssential");
		$("input[id=자택_휴대전화_2]").css("background-color","#ffffff").removeClass("isEssential");
		$("input[id=자택_휴대전화_3]").css("background-color","#ffffff").removeClass("isEssential");
		$("input[id=직장_전화번호_1]").css("background-color","#ffffcc").addClass("isEssential");
		$("input[id=직장_전화번호_2]").css("background-color","#ffffcc").addClass("isEssential");
		$("input[id=직장_전화번호_3]").css("background-color","#ffffcc").addClass("isEssential");
	}
	else if($("select[id=전화연락처]").val()=="03") {
		$("input[id=직장_전화번호_1]").css("background-color","#ffffff").removeClass("isEssential");
		$("input[id=직장_전화번호_2]").css("background-color","#ffffff").removeClass("isEssential");
		$("input[id=직장_전화번호_3]").css("background-color","#ffffff").removeClass("isEssential");
		$("input[id=자택_휴대전화_1]").css("background-color","#ffffcc").addClass("isEssential");
		$("input[id=자택_휴대전화_2]").css("background-color","#ffffcc").addClass("isEssential");
		$("input[id=자택_휴대전화_3]").css("background-color","#ffffcc").addClass("isEssential");
	}
}

//거래구분
function dealDivision() {
	if($("select[id=거래구분]").val()=="01") {
		$(".change").hide();
		$(".regist").show();
		$('input').not("#고객자격_1,#고객자격_2").removeAttr('readonly');
		$('select').prop("disabled",false);
		$('input[type=text]').css('background-color','#FFFFFF');
		$('input[id=거래구분]').css('background-color','#FFFFCC');
		$('input[id=실명번호]').css('background-color','#FFFFCC');
		$('input[id=검색번호]').css('background-color','#FFFFCC');
		$('select[id=실명번호select]').css('background-color','#FFFFCC');
		$('input[id=고객자격_1]').css('background-color','#FFFFCC');
		$('input[id=고객명]').css('background-color','#FFFFCC');
		$('select[id=국적select]').css('background-color','#FFFFCC');
		$('select[id=우편물수령처]').css('background-color','#FFFFCC');
		$('select[id=전화연락처]').css('background-color','#FFFFCC');
		$('input[id=자택_상세주소]').css('background-color','#FFFFCC');
		$('input[id=자택_전화번호_1]').css('background-color','#FFFFCC');
		$('input[id=자택_전화번호_2]').css('background-color','#FFFFCC');
		$('input[id=자택_전화번호_3]').css('background-color','#FFFFCC');
	}
	else if($("select[id=거래구분]").val()=="03") {
		$(".change").show();
		$(".regist").hide();
		$('input').not("#고객자격_1,#고객자격_2").removeAttr('readonly');
		$('select').prop("disabled",false);
		$('input[type=text]').css('background-color','#FFFFFF');
		$('input[id=거래구분]').css('background-color','#FFFFCC');
		$('input[id=실명번호]').css('background-color','#FFFFCC');
		$('input[id=검색번호]').css('background-color','#FFFFCC');
		$('select[id=실명번호select]').css('background-color','#FFFFCC');
		$('input[id=고객자격_1]').css('background-color','#FFFFCC');
		$('input[id=고객명]').css('background-color','#FFFFCC');
		$('select[id=국적select]').css('background-color','#FFFFCC');
		$('select[id=우편물수령처]').css('background-color','#FFFFCC');
		$('select[id=전화연락처]').css('background-color','#FFFFCC');
		$('input[id=자택_상세주소]').css('background-color','#FFFFCC');
		$('input[id=자택_전화번호_1]').css('background-color','#FFFFCC');
		$('input[id=자택_전화번호_2]').css('background-color','#FFFFCC');
		$('input[id=자택_전화번호_3]').css('background-color','#FFFFCC');
	}
	else if($("select[id=거래구분]").val()=="09") {
		$(".change").show();
		$(".regist").hide();
		$(".changebutton").hide();
		$('input').not("#검색번호").attr('readonly','readonly');
		$('select').prop("disabled",true);
		$('select[id=거래구분]').prop("disabled",false);
		$('input').not("#검색번호").css('background-color','#EDEDED');
	}
}

//DB로부터 select 채우기
function fillSelect() {
	$("#실명번호select").val( $("#hidden1").val() );
	$("#국적select").val( $("#hidden2").val() );
	$("#우편물수령처").val( $("#hidden3").val() );
	$("#전화연락처").val( $("#hidden4").val() );
	$("#자택_주거형태").val( $("#hidden5").val() );
	$("#자택_이메일주소select").val( $("#hidden6").val() );
	$("#직장_주거형태").val( $("#hidden7").val() );
	$("#직장_직업").val( $("#hidden8").val() );
	$("#제3_주거형태").val( $("#hidden9").val() );
	$("#제3_이메일주소select").val( $("#hidden10").val() );
	$("#추가_실제생일select").val( $("#hidden11").val() );
	$("#추가_결혼기념일select").val( $("#hidden12").val() );
	$("#추가_성별구분").val( $("#hidden13").val() );
	$("#추가_세대구성").val( $("#hidden14").val() );
	$("#추가_자녀수").val( $("#hidden15").val() );
	$("#추가_보유차량").val( $("#hidden16").val() );
	$("#추가_맞벌이여부").val( $("#hidden17").val() );
	$("#추가_주택소유").val( $("#hidden18").val() );
	$("#추가_세대주구분").val( $("#hidden19").val() );
	$("#추가_생계형구분").val( $("#hidden20").val() );
	$("#자금_신분증종류").val( $("#hidden21").val() );
	$("#자금_검증").val( $("#hidden22").val() );
	$("#자금_직업").val( $("#hidden23").val() );
	return false;
}

//필수항목 저장 전 체크
function essentialCheck(){
	var check = true;
    var target = $("input.isEssential");
    for(var i=0; i<target.length; i++){
        if(target.eq(i).val() == ""){
            check = false;
        }
    }
    if(check==true)
    	$("#dbform").submit();
    else if(check==false)
    	alert("해당항목을모두채우세요");
}

//email 자동으로 입력
function emailInsert_1() {
	if( $("#자택_이메일주소select").val()=="01" ) 
		$("#자택_이메일주소_2").val("");
	else
		$("#자택_이메일주소_2").val( $("#자택_이메일주소select option:selected").text() );
	return false;
}

function emailInsert_2() {
	if( $("#제3_이메일주소select").val()=="01" ) 
		$("#제3_이메일주소_2").val("");
	else
		$("#제3_이메일주소_2").val( $("#제3_이메일주소select option:selected").text() );
	return false;
}

//달력
$(function() {  
          $( "#추가_실제생일,#추가_결혼기념일,#실제생일" ).datepicker({ 
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
             buttonImage: "${ctx }/resources/image/icon/calendar.png", 
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
<style type="text/css">
    ul table,
    ul table {border: 1px solid #c7c7c7;}
    ul table td,
    ul table td {border: 2px solid #E8F3F1; text-align: left}
    ul table td img {vertical-align: middle;}
    ul table th,
    ul table th {background:#B3D2D5; border: 2px solid #E8F3F1;}
</style>
    
</head>
<!-- 저장해야할 데이터 101개 , select 23개 -->
<body>
<form id="dbform" method="post" action="DB/0200insert.jsp">
	<jsp:include page="/views/include/header.jsp"/>

	<div id="container">
		<div class="nav">
			<ul>
				<li>&nbsp;▶ 고객/CRM</li>
				<li><a href="${ctx }/views/customer/0200_register.jsp">&nbsp;&nbsp;&nbsp;고객관리</a></li>
				<li><a href="${ctx }/views/customer/0009.jsp">&nbsp;&nbsp;&nbsp;거래내역조회</a></li>
				<li class="nav_dir"><a href="#" class="nav_bold">&nbsp;&nbsp;&nbsp;자금세탁방지 고객관리</a></li>
			</ul>
		</div>

		<DIV id="contents">
			<h3>[0231] 자금세탁방지 고객관리</h3>
			<div id="tabs">
				<div class="srch-0002">
                    <div class="srch-inner-0002">
						<ul>
                            <li><span>거래구분</span></li>
							<li><select title="거래구분" id="거래구분" style="background: #ffffcc;" onchange="dealDivision();">
									<option value="01">1: 등록</option>
									<option value="03">3: 변경</option>
									<option value="09">9: 조회</option>
							 	</select>
							 </li>
                        </ul>
                        
						<ul>
							<li class="change"><span>실명번호</span></li>
							<li><input type="text" id="검색번호" name="searchNumber" style="background: #e5e5e5;"></li>
                            <li><select title="검색번호" style="background:#e5e5e5">
                                    <option>01: 고객번호</option>
                                    <option>02: 실명번호</option>
                                    <option>03: 계좌번호</option>
                                    <option>04: 카드번호</option>
                                    <option>05: 여권번호</option>
                                </select></li>
				            <li><img src="${ctx }/resources/image/icon/search.gif" alt="검색버튼" id="검색" style="cursor:pointer">
								<!--select title="은행거래신청서인자">
										<option>1:은행거래신청서인자</option>
										<option>2:은행거래신청서인자 없음</option>
								</select-->
							</li>
                            <li><div class="mybtn"><input type="button" style="padding-left:16px;margin-left:1px" value="사업자휴폐업조회"></div></li>
                            <li><div class="mybtn"><input type="button" style="padding:5px 7px;margin-left:5px" value="운전면허증 확인"></div></li>
						</ul>

					</div>
					<!--End of srch-inner-->
				</div>
				<!--End of srch-->

				<h4>기본정보</h4>
				<div class="info01-wrap-1401">
					<div class="info01-inner-0004">
						<table>
							<caption>기본정보</caption>
							<colgroup>
								<col style="width: 100px">
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
										<input type="text" id="실명번호" name="realName" class="isEssential" style="background: #ffffcc; width: 80px">
										<select title="실명번호" name="db0200select" id="실명번호select" style="background: #ffffcc; width: 48%" onchange="$('#hidden1').val($(this).val());">
											<option value="01" selected>01: 주민등록번호</option>
											<option value="02">02: 여권조합번호</option>
											<option value="03">03: 외국인등록증번호</option>
											<option value="04">04: 국내거소신고증번호</option>
											<option value="05">05: 사업자번호</option>
											<option value="06">06: 고유번호</option>
											<option value="07">07: 납세번호</option>
											<option value="08">08: 법인번호</option>
										</select>
                                        <img src="${ctx }/resources/image/icon/search.gif" alt="검색버튼" id="검색" style="cursor:pointer">
									</td>
									<th><span>고객자격</span></th>
									<td colspan="3">
										<input type="text" id="고객자격_1" name="db0200" class="isEssential" style="background: #ffffcc; width: 80px" readonly>
										<a target="_blank" onclick="window.open('popup/pop_0200.html','고객자격코드검색','width=730, height=400, scrollbars=yes, location=no'); return false">
											<img class="qualify" src="${ctx }/resources/image/icon/search.gif" alt="검색버튼" >
										</a>
										<input type="text" id="고객자격_2" name="db0200" readonly style="width: 48%"></td>
								</tr>
                                
                                
								<tr>
									<th><span>고객명(한글)</span></th>
									<td><input type="text" id="고객명" name="db0200" class="isEssential" style="background: #ffffcc;" ></td>
									<th><span>고객명(영문)</span></th>
									<td><input type="text" id="영문명" name="db0200" style="background:#ffffcc"></td>
									<th><span>여권번호</span></th>
									<td><input type="text" id="여권번호" name="db0200" maxlength="9"></td><!--td수정-->
								</tr>
                                
                                
								<tr>
									<th><span>국적</span></th>
									<td>
										<select title="국적" id="국적select" name="db0200select" style="background: #ffffcc;" onchange="$('#hidden2').val($(this).val());">
											<option value="01" selected>KR : 대한민국</option>
											<option value="02">US : 미국</option>
											<option value="03">CN : 중국</option>
											<option value="04">JP : 일본</option>
											<option value="05">GB : 영국</option>
											<option value="06">HK : 홍콩</option>
											<option value="07">CA : 캐나다</option>
										</select><input type="hidden" name="db0200" id="hidden2" value="01">
										<input type="hidden" id="국적" name="db0200" style="width: 48%">
									</td>
									<th><span>검증방법</span></th>
									<td colspan="3"><select title="검증방법" style="background:#ffffcc; width:49%">
                                            <option >1: 비문서적방법</option>
                                            <option >2: 문서적방법</option>
                                            <option >8: 검증생략</option>
                                            <option >9: 일회성거래</option>
                                        </select>
                                     
                                        <select title="검증방법" style="width:49%">
                                            <option >1: 1382</option>
                                            <option >2: 운전면허시험관리단조회</option>
                                            <option >3: 음성녹취</option>
                                            <option >4: 신용정보조회</option>
                                            <option >5: 사업자휴폐업조회</option>
                                            <option >6: 전자공시시스템조회</option>
                                            <option >7: 기타</option>
                                        </select></td>
								</tr>
								<tr>
									<th><span style="font-size:11px">실명확인증표종류</span></th>
									<td>
										<select title="실명확인증표종류" style="background: #ffffcc;">
											<option >1: 주민등록번호</option>
											<option >2: 운전면허증</option>
											<option >3: 여권</option>
											<option >4: 학생증</option>
											<option >5: 외국인등록증</option>
											<option >6: 국내거소신고증</option>
											<option >7: 사업자등록증/사업자등록증명원</option>
											<option >8: 고유번호증</option>
											<option >9: 납세번호증</option>
											<option >A: 투자등록증</option>
											<option >B: 기타</option>
											<option >C: 일회성거래</option>
										</select>
										</td>
									<th><span>고객번호</span></th>
									<td>
										<input type="text" style="background:#e5e5e5">
									</td>
									<td colspan="2">&nbsp;</td>
								</tr>
							</tbody>
						</table>

					</div>
					<!--End of info01-inner-->
				</div>
				<!--End of info01-->


				
                <h4>고객정보</h4>
                <ul style="background:#E8F3F1; border:1px solid #C7C7C7; padding:5px">
                <li>
                    <table style="border:none">
                        <caption>자택주소정보</caption>
                        <colgroup><!-- 수정 colgroup  -->
                            <col style="width:10%">
                            <col style=""/>
                            <col style="width:10%">
                            <col style="width:20%">
                        </colgroup><!-- 수정 colgroup  -->
                        <tbody>
                            <tr>
                                <th>실제생일</th>
                                <td colspan="3"><select title="생일">
                                        <option>양력</option>
                                        <option>음력</option>
                                        <option>윤달</option>
                                    </select>
                                    <input type="text" name="" id="실제생일">
                                </td>
                            </tr>
                            <tr>
                                <th class="자택">자택 우편번호</th>
                                <td ><!-- 수정 td -->
                                    <input type="text" id="자택/본사우편번호_1" name="db0200" style="width:80px;" >
                                    <IMG src="${ctx }/resources/image/icon/search.gif" alt="검색버튼" onclick="window.open('${ctx}/views/customer/searchAddr.jsp?tab=3','우편번호검색','width=600, height=620, scrollbars=yes, location=no'); return false">
                                    <input type="text" name="db0200" id="자택/본사우편번호_2" style="width:47%;">
                                </td><!-- 수정 td -->
                                <th>부속주소</th>
                                <td><input type="text" name="db0200" id="자택_상세주소" class="isEssential" style="width: 100%;"></td>
                            </tr>
                            <tr>
                                <th>주거형태</th>
                                <td colspan="3">
                                    <select title="주거형태" id="자택_주거형태" name="db0200select" onchange="$('#hidden5').val($(this).val());">
                                        <option value="01">01: 아파트</option>
                                        <option value="02">02: 빌라</option>
                                        <option value="03">03: 연립/다세대</option>
                                        <option value="04">04: 오피스텔</option>
                                        <option value="05">05: 단독</option>
                                        <option value="06">99: 기타</option>
                                    </select><input type="hidden" name="db0200" id="hidden5" value="01">
                                    <input type="text" name="db0200" id="자택_마을">마을
                                    <input type="text" name="db0200" id="자택_아파트">아파트
                                    <input type="text" name="db0200" id="자택_동">동
                                    <input type="text" name="db0200" id="자택_호">호
                                </td>
                            </tr>
                            <tr>
                        <th>전화번호</th>
                        <td ><input type="text" name="db0200" id="자택_전화번호_1" class="isEssential" style="width:25%;" maxlength="3" >-<input type="text" name="db0200" id="자택_전화번호_2" class="isEssential" style="width:25%;" maxlength="4" >-<input type="text" name="db0200" id="자택_전화번호_3" class="isEssential" style="width:25%;" maxlength="4" ></td>
                        
                        <th>휴대전화</th>
                        <td><input type="text" name="db0200" id="자택_휴대전화_1" style="width:25%" maxlength="3">-<input type="text" name="db0200" id="자택_휴대전화_1" style="width:25%" maxlength="4">-<input type="text" name="db0200" id="자택_휴대전화_1" style="width:25%" maxlength="4"></td>
                        
                    </tr>
                            <tr>
                                <th>이메일주소</th>
                                <td colspan="3"><input type="text" name="db0200" id="자택_이메일주소_1" style="width:auto" />@<input type="text" id="자택_이메일주소_2" style="width:auto" >
                                    <select id="자택_이메일주소select" name="db0200select" onchange="$('#hidden6').val($(this).val()); emailInsert_1();">
                                        <option value="01">-- 직접 입력 --</option>
                                        <option value="02">gmail.com</option><!-- 수정 option -->
                                        <option value="03">hanmail.net</option>
                                        <option value="04">hotmail.com</option>
                                        <option value="05">naver.com</option>
                                        <option value="06">nate.com</option>
                                </select><input type="hidden" name="db0200" id="hidden6" value="01"></td>
                                
                            </tr>
                            <tr>
                                <th>해외주소</th>
                                <td colspan="3"><input type="text" name="db0200" id="자택_해외주소" style="width: 99%" ></td>
                               
                            </tr>
                        </tbody>
                    </table>
                    </li>
                </ul>
                    
                        
                        
                        
                        
                        
						
				
                <h4 style="margin-top:25px">직장 / 사업장 정보</h4>
                <ul style="background:#E8F3F1; border:1px solid #C7C7C7; padding:5px; margin-bottom:25px;">
                    <li>	
                        <table style="border:none">
                            <caption>직장 주소정보</caption>
                            <colgroup>
                                <col style="width: 10%" >
                                <col style="width: 20%" >
                                <col style="width: 10%" >
                                <col >
                                <col style="width: 10%" >
                                <col style="width: 20%" >
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th>직장 우편번호</th>
                                    <td colspan="3"><input type="text" name="db0200" id="직장우편번호_1" style="width: 80px;" >
                                        <img src="${ctx }/resources/image/icon/search.gif" alt="검색버튼" onclick="window.open('${ctx}/views/customer/searchAddr.jsp?tab=3','우편번호검색','width=600, height=620, scrollbars=yes, location=no'); return false">
                                        <input type="text" name="db0200" id="직장우편번호_2" style="width: 47%;" >
                                    </td>
                                    <th>부속주소</th>
                                    <td><input type="text" name="db0200" id="직장_부속주소" style="width: 99%" ></td>
                                </tr>
                               
                                <tr><!-- 수정 tr -->
                                    <th>전화번호</th>
                                    <td><input type="text" name="db0200" id="직장_전화번호_1" style="width:25%" maxlength="3">-<input type="text" name="db0200" id="직장_전화번호_2" style="width:25%" maxlength="4">-<input type="text" name="db0200" id="직장_전화번호_3" style="width:25%" maxlength="4"></td>
                                    <th>내선</th>
                                    <td><input type="text" name="db0200" id="직장_내선" style="width:30px" maxlength="3"></td>
                                    <th>팩스번호</th>
                                    <td><input type="text" name="db0200" id="직장_팩스번호_1" style="width:25%" maxlength="3">-<input type="text" name="db0200" id="직장_팩스번호_1" style="width:25%" maxlength="4">-<input type="text" name="db0200" id="직장_팩스번호_3" style="width:25%" maxlength="4"></td>
                                </tr><!-- 수정 tr -->
                                <tr>
                                    <th>직업</th>
                                    <td colspan="3"><select title="직업" id="직장_직업" name="db0200select" onchange="$('#hidden8').val($(this).val());">
                                            <option value="01">01: 급여소득자</option>
                                            <option value="02">02: 전문직</option>
                                            <option value="03">03: 자영업자</option>
                                            <option value="04">04: 공무원</option>
                                            <option value="05">05: 연금소득자</option>
                                            <option value="06">06: 주부</option>
                                            <option value="07">07: 학생</option>
                                            <option value="08">08: 기타</option>
                                        </select><input type="hidden" name="db0200" id="hidden8" value="01">
                                        <input type="text" style="width:20%">
                                        <img src="${ctx }/resources/image/icon/search.gif" alt="검색버튼" >
                                        <input type="text" style="width:20%">
                                    </td>
                                    <th>홈페이지</th>
                                    <td><input type="text"  style="width: 99%"></td>
                                </tr>
                                <tr>
                                    <th>직장명</th>
                                    <td colspan="3"><input type="text" name="db0200" id="직장_직장명" style="width:40%">
                                        <img src="${ctx }/resources/image/icon/search.gif" alt="검색버튼">
                                        <input type="text" style="width:40%">
                                    </td>
                                    <th>연소득</th>
                                    <td><input type="text"  style="width: 30%">만원
                                        <select><option></option></select>
                                    </td>
                                </tr>
                                <tr>
                                    <th>표준산업분류</th>
                                    <td colspan="3"><input type="text" name="db0200" id="직장_부서명" style="width:40%">
                                        <img src="${ctx }/resources/image/icon/search.gif" alt="검색버튼" >
                                        <input type="text" style="width:40%">
                                    </td>
                                    
                                    <th>사업자번호</th>
                                    <td><input type="text" name="db0200" id="직장_입사일자" style="width: 99%"></td>
                                </tr>
                            </tbody>
                        </table>
                    </li>
                    <!--End of info02-inner add02 m2-->

                </ul>
                
				<div class="btn_both">
					<div class="fr regist">
						<input type="button" value="등록">
					</div>
				</div>
				
			</div>
			<!--End of tabs-->
		</DIV>
		<!--End of contents-->
	</div>
	<!--container-->
</form>

<script type="text/javascript">

$("#검색").click(function() {
	jQuery.ajax({
		   type:"post",
		   dataType: "json",
		   url: "DB/0200view.jsp",
		   data: {
		      searchNumber : $("input[name=searchNumber]").val()
		   },
		   success: function(data){
			   if($("input[name=searchNumber]").val()=="")
				   alert("실명번호를 입력하세요.");
			   else if( data["db0200_1"] != null ) {
			   $("input[name=realName]").val(data["searchNumber"]);
			   for(var i=0; i<100; i++) {
				   $("input[name=db0200]").eq(i).val(data["db0200_" + String(i+1)]);
			   }
			   fillSelect();
			   if( data["db0200_" + String(2)] < "014" ) {
					$(".개인사업자번호").hide();
					$(".업체명").hide();
					$(".자택").show();
					$(".본사").hide();
				}
				else if( data["db0200_" + String(2)] > "013" && data["db0200_" + String(2)] < "020" ) {
					$(".개인사업자번호").show();
					$(".업체명").show();
					$(".자택").show();
					$(".본사").hide();
				}
				else if( data["db0200_" + String(2)] > "030" ) {
					$(".개인사업자번호").show();
					$(".업체명").hide();
					$(".자택").hide();
					$(".본사").show();
					$("select[id=실명번호select]").val("08");
				}
			   }
			   else
				   alert("조회결과가 없습니다.");
		   },
		   error:function(request,status,error){
		        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
		});
		return false;
});

</script>
</body>

</html>