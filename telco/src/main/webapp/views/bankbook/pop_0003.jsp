<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath }" scope="request" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>[0003] 지급 결과</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
    <meta name="apple-mobile-web-app-capable" content="yes">
	<link href="${ctx }/resources/css/pop.css" type="text/css" rel="stylesheet">
</head>

<body>
    <div id="wrap">
      <div class="pop-0002-2">
        <div class="pop-0002-2-inner1">
            <table>
                <colgroup>
                    <col >
                </colgroup>
                <caption>지급 결과 내용</caption>
                <thead><tr>메시지</tr></thead>
                <tbody>
                    <tr><td>정상처리되었습니다</td></tr>
                    <tr><td>&nbsp;</td></tr>
                    <tr><td>&nbsp;</td></tr>
                    <tr><td>&nbsp;</td></tr>
                </tbody>
            </table>

        </div><!-- End of pop-0002-2-inner1 -->
        <div class="btn_both">
            <div class="">
                <a onclick="window.close()" class="btn_big"><span>확인</span></a>
            </div>
        </div>
      </div><!-- End of pop-0002-2 -->
    </DIV><!--End of wrap-->
</body>
</html>