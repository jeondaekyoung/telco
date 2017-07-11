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
</head>
<body>

    <div id="wrap">
        <h1><img src="${ctx }/resources/image/logo/logo2.png" alt="텔코"></h1>
        
        <div class="text btn1">
            <a href="join_t.jsp"><input type="button" value="교사"></a>
            <a href="join_s.jsp"><input type="button" value="학생"></a>
        </div>
    </div>
    
</body>
</html>