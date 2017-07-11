<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath }" scope="request" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>[0200] 고객 기본정보 관리[040100000]</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge" >
<meta http-equiv="content-type" content="text/html; charset=utf-8" >
<meta name="apple-mobile-web-app-capable" content="yes">
<link href="${ctx }/resources/css/common.css" type="text/css" rel="stylesheet">
<link href="${ctx }/resources/css/media.css" type="text/css" rel="stylesheet">
<link href="${ctx }/resources/css/tab.css" type="text/css" rel="stylesheet">
<link href="${ctx }/resources/css/jquery-ui.css" rel="stylesheet">
<script type="text/javascript" src="${ctx }/resources/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="${ctx }/resources/js/pop.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
        $(".gnb_ul").mouseenter(function(){
            $(".sub_nav").stop().slideDown("slow");
        });
        $(".nav_wrap").mouseleave(function(){
            $(".sub_nav").stop().slideUp("slow");
        });
        
		//비밀번호 초기화        
        $("#pwInit").click(function(){
        	if(checkValue() == true){        		
        		$("#pwInitForm").submit();
        	}
        });
        $("#cancel1").click(function(){
            $(".ly_pop").hide();
        });
        //-->비밀번호 초기화 끝
        
        //이용자 정보 수정
        $("#modifyUser").click(function(){
        	$("#modifyUserForm").submit();
        });
        $("#cancel2").click(function(){
            $(".ly_pop2").hide();
        });
        //-->이용자 정보 수정 끝
        
    });     //---- end of ready
    
	var checkValue = function(){
    	if($("#user_pw").val() == ""){
    		alert("새 비밀번호를 입력해주세요.");
    		$("#user_pw").focus();
    		return false;
    	} else if($("#user_pw1").val() == ""){
    		alert("새 비밀번호확인을 입력해주세요.");
    		$("#user_pw1").focus();
    		return false;
    	} else if($("#user_pw").val() != $("#user_pw1").val()){
    		alert("새 비밀번호를 확인해주세요");
    		return false;
    	}
    	return true;
    }
    
    var checkValue1 = function(){
    	if($("#user_name").val() == ""){
    		alert("이용자 성명을 입력해주세요.");
    		$("#user_name").focus();
    		return false;
    	} else if($("#user_id").val() == ""){
    		alert("이용자 ID를 입력해주세요.");
    		$("#user_id").focus();
    		return false;
    	} else if($("#grade").val() == ""){
    		alert("학년을 입력해주세요");
    		$("#grade").focus();
    		return false;
    	} else if($("#affiliation").val() == ""){
    		alert("계열/과를 입력해주세요");
    		$("#affiliation").focus();
    		return false;
    	} else if($("#ban").val() == ""){
    		alert("반을 입력해주세요");
    		$("#ban").focus();
    		return false;
    	} else if($("#num").val() == ""){
    		alert("번호를 입력해주세요.");
    		$("#num").focus();
    		return false;
    	} else if($("#join_date").val() == ""){
    		alert("가입일을 입력해주세요.");
    		$("#join_date").focus();
    		return false;
    	}
    	return true;
    }
    
</script>
</head>

<body>
	<jsp:include page="/views/include/header.jsp"/>

	<div id="container">
		<div class="nav">
			<ul>
				<li>&nbsp;▶ 관리자 메뉴</li>
				<li><a href="${ctx }/views/admin/register.jsp" >&nbsp;&nbsp;&nbsp;이용자 등록</a></li>
				<li><a href="${ctx }/views/admin/search.jsp">&nbsp;&nbsp;&nbsp;이용자 검색</a></li>
				<li class="nav_dir"><a href="#" class="nav_hold">&nbsp;&nbsp;&nbsp;이용자 정보</a></li>
			</ul>
		</div>

		<div id="contents">
			<h3>관리자 메뉴</h3>
			<div id="tabs">
				<form action="${ctx }/admin/modifyUser.do" method="POST" id="modifyUserForm">
				
				
				    <div class="tabfl wd30">
					    <ul>
						    <li>
		                        <span>이용자 구분</span>
		                        <select id="user_sepa" name="user_sepa">
		                            <option value="교사" <c:if test="${user.user_sepa eq '교사' }">selected="selected"</c:if>>교사</option>
		                            <option value="학생" <c:if test="${user.user_sepa eq '학생' }">selected="selected"</c:if>>학생</option>                                            
		                        </select>
	                        </li>
	                        <li>
		                        <span>이용자 성명</span>
		                        <input type="text" name="user_name" id="user_name" value="${user.user_name }">
	                        </li>
	                        <li>
		                        <span>이용자 ID</span>
		                        <input type="text" name="user_id" id="user_id" value="${user.user_id }" readonly="readonly">
	                       </li>
                       </ul>
                    </div>
                    
                    
                    <div class="tabfr wd30 dashed">
                    	<ul>
	                    	<li><input type="text" name="grade" id="grade" value="${user.grade }">학년</li>
	                        <li><input type="text" name="affiliation" id="affiliation" value="${user.affiliation }">계열/과</li>
	                        <li><input type="text" name="ban" id="ban" style="width:54px" value="${user.ban }">반 
	                        	<input type="text" name="num" id="num" style="width:54px" value="${user.num }">번호</li>
                        </ul>
                    </div>
                    
                    
                    <div class="tabfr2 wd30">
	                     <ul><li><span>가입일</span><input type="text" name="join_date" id="join_date" class="datepicker3" data-date-format="yyyy-mm-dd" value="${user.join_date }"></li>
	                     	<li><span>만료일</span><input type="text" name="expiration" id="expiration" class="datepicker4" data-date-format="yyyy-mm-dd" value="${user.expiration_date }"></li></ul>
                    </div>
                    
                 </form>
                 <div class="tabfr2 tabbtn">
                     <ul><li><a class="mybtn2 btn2">비밀번호 초기화</a></li>
                     	<li><a class="mybtn2 btn3">이용자 정보수정</a></li></ul>
                 </div>
                 
                 <div class="ly_pop" id="lypop2" style="width:257px">
                 	<form action="${ctx }/admin/pwInit.do?user_id=${user.user_id}" method="POST" id="pwInitForm">
                 	<input type="password" id="user_pw" name="user_pw" placeholder="비밀번호">
            		<input type="password" id="user_pw1" name="user_pw1" placeholder="비밀번호 확인">
            		</form>
            		<br><br>
                     <p class="desc">비밀번호를 초기화 하시겠습니까?</p>
                         <div class="btn">
                             <img src="http://static.naver.com/kin/09renewal/btn_confirm3.gif" width="45" height="26" alt="확인" id="pwInit">
                             <img src="http://static.naver.com/kin/09renewal/btn_cancel2.gif" width="45" height="26" alt="취소" id="cancel1">
                         </div>
                 </div>
                 
                 <div class="ly_pop2" id="lypop3" style="width:257px">
                     <p class="desc">이용자 정보를 수정 하시겠습니까?</p>
                         <div class="btn">
                             <img src="http://static.naver.com/kin/09renewal/btn_confirm3.gif" width="45" height="26" alt="확인" id="modifyUser">
                             <img src="http://static.naver.com/kin/09renewal/btn_cancel2.gif" width="45" height="26" alt="취소" id="cancel2">
                         </div>                         
                 </div>                       
                 
                 <table class="tableAdmin">
                     <colgroup>
                         <col style="width:100px">
                         <col style="width:200px">
                         <col style="width:25%">
                         <col>
                     </colgroup>
                     <thead>
                         <tr>                             
                             <th>날짜</th>
                             <th>IP</th>
                             <th>로그인위치</th>
                         </tr>
                     </thead>
                     <tbody>
                     	<c:choose>
	                     	<c:when test="${accesss eq null }">
	                     	</c:when>
	                     	<c:otherwise>
	                     		<c:forEach items="${accesss }" var="access">
	                     			<tr>
	                     				<td>${access.access_date }</td>
	                     				<td>${access.ip }</td>
	                     				<td>${access.device }</td>
	                     			</tr>
	                     		</c:forEach>
	                     	</c:otherwise>
                     	</c:choose>
                     </tbody>
                 </table>
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