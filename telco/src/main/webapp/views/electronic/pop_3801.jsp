<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath }" scope="request" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>[3801] 전자금융 신규</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <meta name="apple-mobile-web-app-capable" content="yes"/>
	<link href="${ctx }/resources/css/pop.css" type="text/css" rel="stylesheet">
</head>

<body>
    <div id="wrap">
      <div class="pop-0002">
        <div class="pop-0002-inner1">
            <table>
            <colgroup>
                <col />
            </colgroup>
            <caption>등록 결과 내용</caption>
            <thead><tr><th>메시지</th></tr></thead>
            <tbody>
                <tr><td>정상처리되었습니다</td></tr>
                <tr><td>&nbsp;</td></tr>
                <tr><td>&nbsp;</td></tr>
                <tr><td>&nbsp;</td></tr>
            </tbody>
        </table>
        </div>
        <div class="pop-0002-inner2">
            <ul>
                <li><span>텔러행번</span></li>
                <li><input type="text" /></li>
                <li><span>기기번호</span></li>
                <li><input type="text" /></li>
            </ul>
        </div>
      </div>

      <div class="btn_both">
        <div class="btn0002">
            <a onClick="window.close()" class="btn_big"><span>취소</span></a>
            <a onClick="window.close()" class="btn_big"><span>확인</span></a>
        </div>
      </div>
    </div><!--wrap-->

</body>
</html>