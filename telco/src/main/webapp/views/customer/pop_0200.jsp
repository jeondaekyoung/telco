<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath }" scope="request" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>고객자격코드검색</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <link href="${ctx }/resources/css/pop.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="${ctx }/resources/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
});

function act(customer_qualf_sepa, customer_qualf_name){
	//alert(val);
	$("#customer_qualf_sepa", opener.document).val(customer_qualf_sepa);
	$("#customer_qualf_name", opener.document).val(customer_qualf_name);
	if(customer_qualf_sepa == "003" || customer_qualf_sepa == "004" || customer_qualf_sepa == "005" ){
		$(".사업자등록번호, .업체명", opener.document).show();		
	} else {
		$(".사업자등록번호, .업체명", opener.document).hide();
		$("#bizrno, #enterprise_name", opener.document).val(null);
	}
	window.close();
}

</script>
</head>

<body>
    <div id="wrap">
        <div class="qualify-info01">
            <table class="qualify">
                <caption>고객자격코드검색창</caption>
                <colgroup>
                    <col style="width:50px" >
                    <col style="width:50px" >
                    <col>
                    <col style="width:100px" >
                    <col style="width:100px">
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col">순번</th>
                        <th scope="col">코드</th>
                        <th scope="col">고객자격코드명</th>
                        <th scope="col">개인법인구분</th>
                        <th scope="col">자격과세</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th>1</th>
                        <td onclick="act('001','내국인-개인');" style="cursor:pointer">001</td>
                        <td onclick="act('001','내국인-개인');" style="cursor:pointer">내국인-개인</td>
                        <td>1:개인</td>
                        <td>01:개인과세</td>
                    </tr>
                    <tr>
                        <th>2</th>
                        <td onclick="act('002','내국인-주민번호미부여자');" style="cursor:pointer">002</td>
                        <td onclick="act('002','내국인-주민번호미부여자');" style="cursor:pointer">내국인-주민번호미부여자</td>
                        <td>1:개인</td>
                        <td>01:개인과세</td>
                    </tr>
                    <tr>
                        <th>3</th>
                        <td onclick="act('003','개인사업자-개인사업자');" style="cursor:pointer">003</td>
                        <td onclick="act('003','개인사업자-개인사업자');" style="cursor:pointer">개인사업자-개인사업자</td>
                        <td>2:개인사업자</td>
                        <td>01:개인과세</td>
                    </tr>
                    <tr>
                        <th>4</th>
                        <td onclick="act('004','비영리법인-비영리법인(기타)');" style="cursor:pointer">004</td>
                        <td onclick="act('004','비영리법인-비영리법인(기타)');" style="cursor:pointer">비영리법인-비영리법인(기타)</td>
                        <td>3:법인</td>
                        <td>04:법인과세</td>
                    </tr>
                    <tr>
                        <th>5</th>
                        <td onclick="act('005','영리법인-영리법인');" style="cursor:pointer">005</td>
                        <td onclick="act('005','영리법인-영리법인');" style="cursor:pointer">영리법인-영리법인</td>
                        <td>3:법인</td>
                        <td>04:법인과세</td>
                    </tr>
                </tbody>
            </table>    
        </div>
    </div>
</body>