<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  isELIgnored="false" %>
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
	<script type="text/javascript">
$(document).ready(function(){
	
	$("#popupClose").click(function(){
		window.opener.location.reload();
		window.close();
	});
	
});	
	</script>

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
                <thead>
                	<tr><th>메시지</th></tr>
                </thead>
                <tbody>
                    <tr><td>계좌 번호 : ${param.account_num }</td></tr>
                    <tr><td>정상처리되었습니다</td></tr>
                    <tr><td>&nbsp;</td></tr>
                    <tr><td>&nbsp;</td></tr>
                </tbody>
            </table>
        </div>
      </div>
        
      <div class="btn_both">
        <div class="btn0002">            
            <a id="popupClose" class="btn_big"><span>확인</span></a>
        </div>
      </div>
    </div><!--wrap-->

</body>
</html>