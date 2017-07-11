<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath }" scope="request" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>[0200] 고객 기본정보 관리[040100000]</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<meta name="apple-mobile-web-app-capable" content="yes" >
<link href="${ctx }/resources/css/common.css" type="text/css" rel="stylesheet">
<link href="${ctx }/resources/css/media.css" type="text/css" rel="stylesheet">
<link href="${ctx }/resources/css/tab.css" type="text/css" rel="stylesheet">
<link href="${ctx }/resources/css/jquery-ui.css" rel="stylesheet">
<script type="text/javascript" src="${ctx }/resources/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="${ctx }/resources/js/pop.js"></script>
<script type="text/javascript" src="${ctx }/resources/vjs/admin/search.js"></script>
</head>

<body>
	<div id="header">
		<div class="gnb">
			<h1>
				<a href="${ctx }/views/main.jsp"><img src="${ctx }/resources/image/logo/h1logo.png" alt="텔코" ></a>
			</h1>
			<div class="nav_wrap">
				<div class="gnb_ul">
					<ul>
						<li>고객/CRM</li>
						<li>수신/공통</li>
						<li>전자금융</li>
						<li>부수/대행</li>
						<li>신용카드</li>
						<c:if test="${sessionScope.userName ne null }">
                    		<li class="last">${sessionScope.userName }님</li>
                    	</c:if>
					</ul>
				</div>

                <div class="sub_nav">
                    <ul>
                        <li><a href="${ctx }/views/customer/0200_register.jsp">고객관리</a></li>
                        <li><a href="${ctx }/views/customer/0009.jsp">거래내역조회</a></li>
                        <li><a href="${ctx }/views/add/0231.jsp">자금세탁방지 고객관리</a></li>
                    </ul>
                    <ul>
                        <li><a href="${ctx }/views/bankbook/0010.jsp">수신신규</a></li>
                        <li><a href="${ctx }/views/bankbook/0002.jsp">입금</a></li>
                        <li><a href="${ctx }/views/bankbook/0003.jsp">지급</a></li>
                        <li><a href="${ctx }/views/automatic/1701.jsp">자동이체</a></li>
                        <li><a href="${ctx }/views/bankbook/0080.jsp">통장정리</a></li>
                        <li><a href="${ctx }/views/bankbook/0008.jsp">통장재발행</a></li>
                        <li class="legend">---- 수표 ----</li>
                        <li><a href="${ctx }/views/check/1401.jsp">자기앞수표 채번</a></li>
                        <li><a href="${ctx }/views/check/1402.jsp">자기앞수표 발행</a></li>
                        <li><a href="${ctx }/views/check/1403.jsp">자기앞수표 지급</a></li>
                        <li class="legend">------------</li>
                        <li><a href="${ctx }/views/add/1821.jsp">타행수표 즉시지급거래</a></li>
                        <li><a href="${ctx }/views/add/0007.jsp">사고신고관리</a></li>
                        <li><a href="${ctx }/views/add/0070.jsp">주의사고 등록/해제</a></li>
                        <li><a href="${ctx }/views/bankbook/0004.jsp">해지</a></li>
                        <li><a href="${ctx }/views/add/1099.jsp">거래취소</a></li>
                    </ul>
                    <ul>
                        <li><a href="${ctx }/views/electronic/3801.jsp">전자금융</a></li>
                    </ul>
                    <ul><li>&nbsp;</li></ul>
                    <ul class="last"><li><a href="${ctx }/views/customer/3701.jsp">카드발급</a></li></ul>
                    <c:if test="${sessionScope.userName ne null }">
                    	<ul>
                    		<c:if test="${sessionScope.userSepa eq  '교사' }">
                    			<li><a href="${ctx }/admin/register.do">관리자</a></li>
                    		</c:if>
                    		<li><a href="${ctx }/logout.do">로그아웃</a></li>
                    	</ul>                    	
                    </c:if>
                </div>

			</div>
		</div>
	</div>

	<div id="container">
		<div class="nav">
			<ul>
				<li>&nbsp;▶ 관리자 메뉴</li>
				<li><a href="${ctx }/views/admin/register.jsp" >&nbsp;&nbsp;&nbsp;이용자 등록</a></li>
				<li class="nav_dir"><a href="#" class="nav_hold">&nbsp;&nbsp;&nbsp;이용자 검색</a></li>
				<li><a href="${ctx }/views/admin/info.jsp">&nbsp;&nbsp;&nbsp;이용자 정보</a></li>
			</ul>
		</div>

		<div id="contents">
			<h3>이용자 검색</h3>
			<div id="tabs">
				<ul>
				<li>
					<form action="${ctx }/admin/searchUsers.do" id="searchUsersForm" >
					<div class="search">
                         <select id="searchTerms" name="searchTerms">
                             <option value="searchDay">접속일로 조회</option>
                             <option value="searchName">성명으로 조회</option>
                         </select>
                         <span class="space1">조회기간
                          <input type="text" name="startDay" id="startDay" class="datepicker1" data-date-format="yyyy-mm-dd">~
                          <input type="text" name="endDay" id="endDay" class="datepicker2" data-date-format="yyyy-mm-dd">
                  		</span>
                         <span class="space2" >성명
                         	<input type="text" name="usersName" id="usersName">
                         </span>
                         <a class="mybtn" id="searchUsers">조회</a>
                     </div>
                     </form>
                                    
                     <table class="tableAdmin">
                         <colgroup>
                             <col>
                             <col>
                             <col>
                             <col>
                             <col>
                             <col>
                             <col>
                         </colgroup>
                         <thead>
                             <tr>
                                 <th>날짜</th>
                                 <th>IP</th>
                                 <th>이용자구분</th>
                                 <th>ID</th>
                                 <th>성명</th>
                                 <th>로그인 위치</th>
                                 <th></th>
                             </tr>
                         </thead>
                         <tbody>
                         <c:choose>
                         	<c:when test="${users eq null }">
                         	</c:when>
                         	<c:otherwise>
	                         	<c:forEach items="${users }" var="user">
	                         		<tr>
	                         			<td>${user.access_date }</td>
	                         			<td>${user.ip }</td>
	                         			<td>${user.user_sepa }</td>
	                         			<td>${user.user_id }</td>
	                         			<td>${user.user_name }</td>
	                         			<td>${user.device }</td>
	                         			<td><a href="${ctx }/admin/information.do?user_id=${user.user_id}" class="mybtn2">이용자 정보 보기</a>
	                         	</c:forEach>
                         	</c:otherwise>
                         </c:choose>
                         </tbody>
                     </table>
                </li>
                </ul>
			</div>
			<!--End of tabs-->
		</div>
		<!--End of contents-->
	</div>
	<!--container-->

	<script type="text/javascript" src="http://code.jquery.com/jquery-1.10.2.js"></script>
  	<script type="text/javascript" src="http://code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){
            $(".datepicker1").datepicker({
			dateFormat : 'yy-mm-dd', //날짜 형식
			dayNamesMin : [ "일", "월", "화", "수", "목", "금", "토" ], //요일 지정
			showMonthAfterYear : true, //년도 뒤에 월 붙이기
			monthNames : [ "1월", "2월", "3월", "4월",
					"5월", "6월", "7월", "8월", "9월",
					"10월", "11월", "12월" ]
		  });
            $(".datepicker2").datepicker({
			dateFormat : 'yy-mm-dd', //날짜 형식
			dayNamesMin : [ "일", "월", "화", "수", "목", "금", "토" ], //요일 지정
			showMonthAfterYear : true, //년도 뒤에 월 붙이기
			monthNames : [ "1월", "2월", "3월", "4월",
					"5월", "6월", "7월", "8월", "9월",
					"10월", "11월", "12월" ]
		  });
            $(".datepicker3").datepicker({
			dateFormat : 'yy-mm-dd', //날짜 형식
			dayNamesMin : [ "일", "월", "화", "수", "목", "금", "토" ], //요일 지정
			showMonthAfterYear : true, //년도 뒤에 월 붙이기
			monthNames : [ "1월", "2월", "3월", "4월",
					"5월", "6월", "7월", "8월", "9월",
					"10월", "11월", "12월" ]
		  });
            $(".datepicker4").datepicker({
			dateFormat : 'yy-mm-dd', //날짜 형식
			dayNamesMin : [ "일", "월", "화", "수", "목", "금", "토" ], //요일 지정
			showMonthAfterYear : true, //년도 뒤에 월 붙이기
			monthNames : [ "1월", "2월", "3월", "4월",
					"5월", "6월", "7월", "8월", "9월",
					"10월", "11월", "12월" ]
		  });
        });
    </script>
</body>

</html>