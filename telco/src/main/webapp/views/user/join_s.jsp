<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <c:set var="ctx" value="${pageContext.request.contextPath }" scope="request" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>회원 가입</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
    <meta name="apple-mobile-web-app-capable" content="yes">
	<link href="${ctx }/resources/css/login.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="${ctx }/resources/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="${ctx }/resources/vjs/user/join_s.js"></script>
</head>
<body>

    <div id="wrap2">
        <h1><img src="${ctx }/resources/image/logo/logo2.png" alt="텔코"></h1>
        <form action="${ctx }/join_s.do" method="POST" id="joinStudent">
        <div class="btn2">
            <input type="text" id="user_id" name="user_id" placeholder="아이디">
            <input type="password" id="user_pw" name="user_pw" placeholder="비밀번호">
            <input type="password" id="user_pw1" name="user_pw1" placeholder="비밀번호 확인">
            <input type="text" id="user_name" name="user_name" placeholder="이름">
            <input type="text" id="email_address" name="email_address" placeholder="이메일">
            <input type="text" id="school_name" name="school_name" placeholder="학교이름">
            <div class="classInfo2">
                <input type="text" id="grade" name="grade" placeholder="학년">
                <input type="text" id="affiliation" name="affiliation" placeholder="계열/과">
                <input type="text" id="ban" name="ban" placeholder="반">
                <input type="text" id="num" name="num" placeholder="번호">
            </div>
            <input type="button" value="회원가입" style="height:50px" onclick="join_s();">
        </div>
        </form>
    </div>
</body>

</html>