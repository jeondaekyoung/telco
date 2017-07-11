<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set  var="ctx" value="${pageContext.request.contextPath }" scope="request"  />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8"/>
<link href="${ctx }/resources/css/search.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="${ctx }/resources/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" >
var rootPath = window.location.protocol + '//' +window.location.host + '/telco';

$(document).ready(function(){
	
	
	
});

var searchJuso = function(){
	
	$.ajax({
		url: rootPath + "/customer/searchAddr.do"
		,type: "post"
		,data: {
			searchWord: $("#searchWord").val()
		}
		,success: searchAddr
		,error: errorCallback
			
	});
};

var searchAddr = function(resultData){
	$("#jusoTable > tbody").empty();
	//console.log(resultData);
	$.each(resultData, function(index, item){
		var listTr = "<tr>" + "<td>" + (index+1) + "</td>"
						+ "<td>" + item.zip_code + "</td>"
						+ "<td onclick='act(\"" + item.zip_code + "\"" + ",\"" + item.juso + "\" );'>" + item.juso + "</td>" + "</tr>";
		$("#jusoTable > tbody").append(listTr);
	});
};

var act = function(zip_code, juso){
	var tabValue = "${param.tab}";
	//console.log(tabValue);
	if(tabValue == 1){
		$("#tab1_zip_code", opener.document).val(zip_code);
		$("#tab1_address_before", opener.document).val(juso);
	} else if(tabValue == 2){
		$("#tab2_zip_code", opener.document).val(zip_code);
		$("#tab2_address_before", opener.document).val(juso);
	} else if(tabValue == 3){
		$("#tab3_zip_code", opener.document).val(zip_code);
		$("#tab3_address_before", opener.document).val(juso);
	}
	window.close();
};

//Ajax 에러 콜백함수
var errorCallback = function(){
	alert("수행 중 오류가 발생했습니다.");
};
</script>
<title>도로명 주소 찾기</title>
</head>

<body>
	<div id="header">
		<h1>도로명 주소 찾기</h1>
	</div>

	<div id="container">

		<div id="content">
            
			<div class="search">
                <div class="searchBox">
                    <form>
                        <input type="text" name="searchWord" id="searchWord"/>
                        <input type="button" value="검색" onclick="searchJuso();">
                    </form>
                	<span>도로명 또는 건물명(아파트)을 입력해주세요.</span>
                </div>
			</div>


			<div class="result">
				<p>주소를 클릭하면 자동 입력됩니다.</p>
				<div>
					<table id="jusoTable">
						<caption>주소검색 결과</caption>
						<colgroup>
							<col style="width:10%"/>
							<col style="width:25%"/>
							<col />
						</colgroup>
						<thead>
							<tr><th>No.</th><th>우편번호</th><th>도로명 주소</th></tr>
						</thead>
						<tbody>
                           
						</tbody>
					</table>
				</div>		
			</div>

		</div>
	</div>
</body>
</html>