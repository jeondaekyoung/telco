<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath }" scope="request" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>[3801] 전자금융 ID 변경</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <meta name="apple-mobile-web-app-capable" content="yes"/>
	<link href="${ctx }/resources/css/pop.css" type="text/css" rel="stylesheet">
	<script type="text/javascript" src="${ctx }/resources/js/jquery-1.11.3.min.js"></script>
</head>

<body>

      <div class="pop-cgid">
          <ul><li>전자금융 ID 변경</li></ul>
          <div class="pop-cgid-inner">
            <div class="pop-input"><ul><li>변경희망 ID <input type="text" name="" id="" /><a href="#">중복체크</a></li>
                 <li><span>사용가능한 ID 입니다.</span></li>
                 </ul>
            </div>
            <div class="pop-noti"><p><strong>*변경희망 ID*</strong><br>6~10자리의 영문 또는 영문+숫자 조합<br>변경 희망 ID입력시 자동으로 중복체크 됨</p></div>
            <div class="btn_both">
                <div class="btn3801-pop">
                    <a class="btn_big pop-close"><span>확인</span></a> 
                </div>
            </div>
          </div><!--End of pop-cgid-inner-->
      </div><!--End of pop-cgid-->

</body>
</html>