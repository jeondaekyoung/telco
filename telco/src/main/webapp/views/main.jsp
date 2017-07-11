<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath }" scope="request" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>TELCO</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
    <meta name="viewport" content="user-scalable=no, width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
	<link href="${ctx }/resources/css/common.css" type="text/css" rel="stylesheet">
	<link href="${ctx }/resources/css/media.css" type="text/css" rel="stylesheet">
    <link href="${ctx }/resources/css/main.css" type="text/css" rel="stylesheet">
    <link href="${ctx }/resources/css/jquery.bxslider.css" rel="stylesheet" >
    
    <script type="text/javascript" src="${ctx }/resources/js/jquery-1.11.3.min.js"></script>
    <script type="text/javascript"  src="${ctx }/resources/js/jquery.bxslider.js"></script>
    <script type="text/javascript" src="${ctx }/resources/vjs/main.js"></script>
</head>

<body>
<jsp:include page="/views/include/header.jsp"/>

    <div id="content">               
        <div id="container">
	        <div>
	            <ul class="bxslider">
	              <li class="slide"><img src="${ctx }/resources/image/bg/main_1.png" alt="slide"></li>
	              <li class="slide"><img src="${ctx }/resources/image/bg/main_2.png" alt="slide" ></li>
	              <li class="slide"><img src="${ctx }/resources/image/bg/main_3.png" alt="slide" ></li>
	              <li class="slide"><img src="${ctx }/resources/image/bg/main_4.png" alt="slide" ></li>
	              <li class="slide"><img src="${ctx }/resources/image/bg/main_5.png" alt="slide" ></li>
	            </ul>
            </div>
        </div>
        <div class="main_blank">&nbsp;</div>
    </div>
    
    <div id="footer">&nbsp;</div>

</body>
    
</html>