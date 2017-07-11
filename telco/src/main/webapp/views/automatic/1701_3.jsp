<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath }" scope="request" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>[1701]자동이체 등록/변경/해지/취소</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge" >
<meta http-equiv="content-type" content="text/html; charset=utf-8" >
<meta name="apple-mobile-web-app-capable" content="yes" >
<meta name="viewport" content="user-scalable=no, width=device-width, initial-scale=1.0, maximum-scale=1.0">
<link href="${ctx }/resources/css/common.css" type="text/css" rel="stylesheet" >
<link href="${ctx }/resources/css/media.css" type="text/css" rel="stylesheet" >
<script type="text/javascript" src="${ctx }/resources/js/jquery-1.11.3.min.js"></script> 
<script type="text/javascript" src="${ctx }/resources/vjs/automatic/1701_3.js"></script>
</head>

<body>
<jsp:include page="/views/include/header.jsp"/>

	<div id="container">
		<div class="nav">
			<ul>
				<li>&nbsp;▶ 수신/공통</li>
				<li><a href="${ctx }/views/bankbook/0010.jsp">&nbsp;&nbsp;&nbsp;수신신규</a></li>
                <li><a href="${ctx }/views/bankbook/0002.jsp">&nbsp;&nbsp;&nbsp;입금</a></li>
                <li><a href="${ctx }/views/bankbook/0003.jsp">&nbsp;&nbsp;&nbsp;지급</a></li>
				<li class="nav_dir"><a href="#" class="nav_bold">&nbsp;&nbsp;&nbsp;자동이체</a></li>
				<li><a href="${ctx }/views/bankbook/0080.jsp">&nbsp;&nbsp;&nbsp;통장정리</a></li>
                <li><a href="${ctx }/views/bankbook/0008.jsp">&nbsp;&nbsp;&nbsp;통장재발행</a></li>
                <li><a href="${ctx }/views/check/1401.jsp">&nbsp;&nbsp;&nbsp;자기앞수표 채번</a></li>
                <li><a href="${ctx }/views/check/1402.jsp">&nbsp;&nbsp;&nbsp;자기앞수표 발행</a></li>
                <li><a href="${ctx }/views/check/1403.jsp">&nbsp;&nbsp;&nbsp;자기앞수표 지급</a></li>
				<li><a href="${ctx }/views/check/1821.jsp">&nbsp;&nbsp;&nbsp;타행수표 즉시지급거래</a></li>
                <li><a href="${ctx }/views/add/0007.jsp">&nbsp;&nbsp;&nbsp;사고신고관리</a></li>
                <li><a href="${ctx }/views/add/0070.jsp">&nbsp;&nbsp;&nbsp;주의사고 등록/해제</a></li>
                <li><a href="${ctx }/views/bankbook/0004.jsp">&nbsp;&nbsp;&nbsp;해지</a></li>
                <li><a href="${ctx }/views/add/1099.jsp">&nbsp;&nbsp;&nbsp;거래취소</a></li>
			</ul>
		</div>

		<DIV id="contents">
			<h3>[1701] 자동이체 조회</h3>

			<div id="tabs">
				<div class="srch-0002">
					<div class="srch-inner-0002">
                        <ul>
                            <li>거래구분</li>
                            <li>
                            	<select title="거래구분" 	onChange="javascripｔ:moveUrl(this);" style="background: #ffffcc">
									<option value="${ctx }/views/automatic/1701.jsp">1: 등록</option>
									<option value="${ctx }/views/automatic/1701_2.jsp">2: 변경</option>
									<option value="${ctx }/views/automatic/1701_3.jsp" selected>3: 조회</option>
									<option value="${ctx }/views/automatic/1701_4.jsp">4: 해지</option>
								</select>
                            </li>
                        </ul>
                        <ul>
                            <li>업무종류</li>
                            <li>
                            	<select  title="업무종류" id="busi_kind" style="background: #ffffcc; width:150px;">
                            			<option value="300" selected="selected">300: 요구불간자동이체</option>
										<option value="310">310: 월부금자동이체</option>
										<option value="915">915: 전체</option>
								</select>
							</li>
                        </ul>

					</div>
					<!--End of srch-inner-0070-->
				</div>
				<!--End of srch-0070-->

                <h4>출금 계좌정보</h4>
                <div class="srch-0002">
					<div class="srch-inner-0002">
                        <ul>
                            <li>계좌번호</li>
                            <li><input  type="text" id="account_num" style="background: #ffffcc;" ></li>
                            <li><img src="${ctx }/resources/image/icon/search.png" id="findBankbook" alt="조회버튼" style="cursor:pointer;"></li>
                        </ul>
                        <ul>
                            <li>예금주명</li>
                            <li><input  type="text" id="customer_name" disabled ></li>
                        </ul>
                    </div>
                </div>

                <h4>자동이체 현황</h4>
				<div class="info01-wrap-0070">
					<div class="info01-inner-1701">
						<table class="content1701" id="myTable">
							<caption>해지,변경,취소거래 내용 테이블</caption>
							<colgroup>
								<col style="width:" >
								<col style="width:" >
								<col style="width:" >
								<col style="width:" >
								<col style="width:" >
								<col style="width:" >
								<col style="width:" >
								<col style="width:" >
								<col style="width:" >
								<col style="width:" >
								<col style="width:" >
								<col style="width:" >
							</colgroup>
							<thead>
								<tr>
									<th>자동이체상태</th>
									<th>신청일자</th>
									<th>입금은행</th>
									<th>계좌번호</th>
									<th>예금주</th>
									<th>이체금액</th>
									<th>이체간격</th>
									<th>이체기일</th>
									<th>이체개시일</th>
									<th>이체 만료일</th>
									<th>지급인자내용</th>
									<th>입금인자내용</th>
								</tr>
							</thead>
							<tbody>
							
							</tbody>
						</table>

					</div>
					<!--End of info01-inner-0070-->
				</div>
				<!--End of info01-wrap-0070-->

				<div class="btn_both">
					<div class="fr">
					</div>
				</div>

			</div>
			<!--End of tabs-->
		</DIV>
		<!--End of contents-->
	</div>
	<!--container-->

</body>

</html>
