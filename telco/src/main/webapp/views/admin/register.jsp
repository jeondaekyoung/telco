<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath }" scope="request" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>[0200] 고객 기본정보 관리[040100000]</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="content-type" content="text/html; charset=utf-8" >
<meta name="apple-mobile-web-app-capable" content="yes" >
<link href="${ctx }/resources/css/common.css" type="text/css" rel="stylesheet">
<link href="${ctx }/resources/css/media.css" type="text/css" rel="stylesheet">
<link href="${ctx }/resources/css/tab.css" type="text/css" rel="stylesheet">
<link href="${ctx }/resources/css/jquery-ui.css" rel="stylesheet">
<script type="text/javascript" src="${ctx }/resources/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="${ctx }/resources/js/pop.js"></script>
<script type="text/javascript">
var searchUserIdCheck;		//이용자아이디 중복 조회 플러그
var registerResult = "${registerResult}";	//이용자 등록행위 확인

    $(document).ready(function(){
        $(".gnb_ul").mouseenter(function(){
            $(".sub_nav").stop().slideDown("slow");
        });
        $(".nav_wrap").mouseleave(function(){
            $(".sub_nav").stop().slideUp("slow");
        });
        
        //아이디 중복 체크 Ajax
        $("#searchUserId").click(function(){
           $.ajax({
        	   url :"/telco/admin/searchUserId.do",
        	   type :"get",
        	   data : {
        		   user_id : $("#user_id").val()
        	   },
        	   success : searchUserIdResult,
        	   error : errorCallback
           });
        });
		//아이디 중복 체크 Ajax 성공콜백함수
	    var searchUserIdResult = function(resultData){
	    	searchUserIdCheck = resultData;
	    	//console.log("1 " + searchUserIdCheck);
	    	if(searchUserIdCheck == true) {
	    		$("#searchUserIdResult").empty();
		    	$("#searchUserIdResult").append('사용가능한 아이디입니다.');
	    	} else {
	            $("#searchUserIdResult").empty();
	    		$("#searchUserIdResult").append('사용중인 아이디입니다.');
	    	}
	    };
        
        //이용자 등록하기
        $("#registerUser").click(function(){
        	if(checkValue() == true){
        		$("#register").submit();
        	}
        });
        //이용자 등록완료시 팝업
        if(registerResult == "true") {
	        //console.log("*" + registerResult);
	        alert("이용자 등록를 하였습니다.");
        }
    });     //---- end of ready

    
    //이용자등록 체크포인트 
    var checkValue = function() {
    	//console.log("2 " + searchUserIdCheck);
    	if(searchUserIdCheck != true){
    		alert("아이디 중복 검사를 해주세요.")
    		return false;
    	} else if($("#user_name").val() == ""){
            alert("이름를 입력해주세요");
            $("#user_name").focus();
            return false;
        }  else if($("#user_id").val() == ""){
    		alert("아이디를 입력해주세요");
    		$("#user_id").focus();
            return false;
    	} else if($("#user_pw").val() == ""){
            alert("비밀번호를 입력해주세요");
            $("#user_pw").focus();
            return false;
    	}  else if($("#grade").val() == ""){
        	alert("학년을 입력해주세요");
        	$("#grade").focus();
        	return false;
        } else if($("#affiliation").val() == ""){
        	alert("계열/과를 입력해주세요");
        	$("#affiliation").focus();
        	return false;
        } else if($("#ban").val() == ""){
        	alert("반을 입력해주세요.");
        	$("#ban").focus();
        	return false;
        } else if($("#num").val() == ""){
            alert("번호를 입력해주세요");
            $("#num").focus();
            return false;
        } 
        return true;
    }
    //Ajax 에러 콜백함수
    var errorCallback = function(){
    	alert("수행 중 오류가 발생했습니다.");
    };
</script>
</head>

<body>
	<jsp:include page="/views/include/header.jsp"/>
	<div id="container">
		<div class="nav">
			<ul>
				<li>&nbsp;▶ 관리자 메뉴</li>
				<li class="nav_dir"><a href="#" class="nav_hold">&nbsp;&nbsp;&nbsp;이용자 등록</a></li>
				<li><a href="${ctx }/views/admin/search.jsp">&nbsp;&nbsp;&nbsp;이용자 검색</a></li>
				<li><a href="${ctx }/views/admin/info.jsp">&nbsp;&nbsp;&nbsp;이용자 정보</a></li>
			</ul>
		</div>

		<div id="contents">
			<h3>이용자 등록</h3>
			<div id="tabs">
				<form action="${ctx }/admin/registerUser.do" method="POST" id="register">
                    <div class="tabfl wd48">
                        <span>이용자 구분</span>
                        <select id="user_sepa" name="user_sepa">
                            <option value="교사">교사</option>
                            <option value="학생">학생</option>
                        </select><br>
                        <span>이용자 성명</span>
                        <input type="text" name="user_name" id="user_name"><br>
                        <span>이용자 ID</span>
                        <input type="text" name="user_id" id="user_id">
                        <a class="mybtn" id="searchUserId">중복 조회</a>
                        <div id="searchUserIdResult"></div>
                        <span>비밀번호</span>
                        <input type="password" name="user_pw" id="user_pw">
                    </div>
                    <div class="tabfr wd48">
                        <input type="text" name="grade" id="grade">학년<br>
                        <input type="text" name="affiliation" id="affiliation">계열/과<br>                                        
                        <input type="text" name="ban" id="ban" style="width:54px">반 <input type="text" name="num" id="num" style="width:54px">번호
                    </div>
                    <div class="tabAlign">
                        <p>
                            <a class="mybtn3" id="registerUser">등록</a>
                            <a class="mybtn3">취소</a>
                        </p>
                    </div>
               </form>
               </div>
		</div>
		<!--End of contents-->
	</div>
	<!--container-->


</body>

</html>