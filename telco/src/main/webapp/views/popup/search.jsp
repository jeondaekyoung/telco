<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath }" scope="request" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
    <meta name="apple-mobile-web-app-capable" content="yes">
<link href="${ctx }/resources/css/search.css" type="text/css" rel="stylesheet">
<title>Insert title here</title>
</head>

<body>
	<div id="header">
		<h1>주소 찾기</h1>
	</div>

	<div id="container">

		<div id="content">
            <p>도로명 또는 건물명(아파트)을 입력해주세요.</p>
			<div class="search">
                <div class="searchBox">
                    <form>
                        <input type="text" >
                        <input type="button" value="검색" >
                    </form>
                </div>
			</div>


			<div class="result">
				<p>주소를 클릭하면 자동 입력됩니다.</p>
				<div>
					<table >
						<caption>주소검색 결과</caption>
						<colgroup>
							<col style="width:10%">
							<col style="width:25%">
							<col >
						</colgroup>
						<thead>
							<tr><th>No.</th><th>우편번호</th><th>도로명 주소</th></tr>
						</thead>
						<tbody>
							<tr><td>1</td>
								<td>080-050</td>
                                <td><a href="#">서울특별시 강남구 학동로 56길 47</a></td>
							</tr>
                           
						</tbody>
					</table>
				</div>		
			</div>

		</div>
	</div>
</body>
</html>