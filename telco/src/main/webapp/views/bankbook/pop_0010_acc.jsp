<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath }" scope="request" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>[0010] 수신신규</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
    <meta name="apple-mobile-web-app-capable" content="yes">
	<link href="${ctx }/resources/css/pop.css" type="text/css" rel="stylesheet">
	<script type="text/javascript" src="${ctx }/resources/js/jquery-1.11.3.min.js"></script>
</head>

<body>
    <div id="wrap">
        <img src="${ctx }/resources/image/bg/warning2.png" style="width:100%" alt="통장을 넣어주세요">
        
        <div class="btn_both">
            <div class="btn0010">
                <a href="${ctx }/views/bankbook/pop_0010_acc2.jsp?account_num=${param.account_num}" class="btn_big"><span>확인</span></a>
            </div>
        </div>
    </div><!--wrap-->
</body>
</html>