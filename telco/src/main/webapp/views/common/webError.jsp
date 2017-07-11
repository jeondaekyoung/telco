<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" isErrorPage="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath }" scope="request" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${ctx }/resources/css/bootstrap.css" type="text/css" rel="stylesheet">
<style type="text/css">
	.h {font-family: "Open Sans"; font-size: 170px;  font-weight: 300;  text-shadow: 0 1px 0 #d9d9d9, 0 2px 0 #d0d0d0, 0 5px 10px rgba(0,0,0,0.125), 0 10px 20px rgba(0,0,0,0.2);}
	.text-white {color: #fff;}
</style>
<script type="text/javascript" src="${ctx }/resources/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	
});
</script>
<title>에러페이지</title>
</head>
<body>
<div id="content">
    <div class="row m-n">
	      <div class="col-sm-4 col-sm-offset-4">
		        <div class="text-center m-b-lg">
		          <h1 class="h text-white"><a href="${ctx }/index.jsp"><img src="${ctx }/resources/image/logo/h1logo.png" alt="텔코" ></a></h1>
		          <p><strong style="font-size:18px">죄송합니다.<br>요청하신 페이지를 찾을 수 없습니다.</strong></p>
		          <p>방문하시려는 페이지의 주소가 잘못 입력되었거나,<br>페이지의 주소가 변경 혹은 삭제되어 요청하신 페이지를 찾을 수 없습니다.</p>
		          <p>입력하신 주소가 정확한지 다시 한번 확인해 주시기 바랍니다.</p>
		          <p>관련 문의사항은 아래 고객센터로 연락주시면 친절하게 안내해 드리겠습니다.</p>
		        </div>
	        <div class="list-group m-b-sm bg-white m-b-lg">
		          
		          <a href="javascript:history.go(-1)" class="list-group-item">뒤로가기</a>
		          
		          <a href="#" class="list-group-item">
		            <span class="badge">070-8624-4536</span>Call us
		          </a>
	        </div>
	      </div>
    </div>
</div>

</body>
</html>