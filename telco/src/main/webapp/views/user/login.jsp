<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath }" scope="request" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>로그인</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
    <meta name="apple-mobile-web-app-capable" content="yes">
	<link href="${ctx }/resources/css/login.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="${ctx }/resources/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="${ctx }/resources/vjs/user/login.js"></script>
</head>

<body>
    <div id="wrap">
        <h1><img src="${ctx }/resources/image/logo/logo2.png" alt="텔코"></h1>
        <form action="${ctx }/login.do" method="POST" id="loginForm">
        <div class="text">
            <div>
                <input type="text" name="user_id" id="user_id" placeholder="ID" title="ID">
            </div>
            <div>
                <input type="password" name="user_pw" id="user_pw" placeholder="Password" title="password" />
            </div>
        </div>

        <div class="text btn">
            <!-- <a href="main_test.html"><input type="button" value="로그인"></a> -->
            <input type="button" value="로그인" id="login" >
            <input type="button" value="회원가입" onclick="agree();">
        </div>
        </form>
    </div>
</body>

</html>