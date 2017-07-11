<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath }" scope="request" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <title>[0009] 계좌조회</title>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta http-equiv="content-type" content="text/html; charset=utf-8">
  <meta name="viewport" content="user-scalable=no, width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <meta name="apple-mobile-web-app-capable" content="yes">
	<link href="${ctx }/resources/css/common.css" type="text/css" rel="stylesheet">
	<link href="${ctx }/resources/css/media.css" type="text/css" rel="stylesheet">
    <link href="${ctx }/resources/css/tab.css" type="text/css" rel="stylesheet">
  <script type="text/javascript" src="${ctx }/resources/js/jquery-1.11.3.min.js"></script>
  <script type="text/javascript" src="${ctx }/resources/vjs/customer/0009.js"></script>
</head>

  <body>
    <div id="header">
        <div class="gnb">
            <h1><a href="${ctx }/views/main.jsp"><img src="${ctx }/resources/image/logo/h1logo.png" alt="텔코"></a></h1>
            <div class="nav_wrap">
                <div class="gnb_ul">
                    <ul>
						<li><a href="${ctx }/views/customer/0200_register.jsp">고객/CRM</a></li>
						<li><a href="${ctx }/views/bankbook/0010.jsp">수신/공통</a></li>
						<li><a href="${ctx }/views/electronic/3801.jsp">전자금융</a></li>
						<li><a href="">부수/대행</a></li>
						<li><a href="${ctx }/views/customer/3701.jsp">신용카드</a></li>
                        <c:if test="${sessionScope.userName ne null }">
	                    	<li class="last">${sessionScope.userName }님</li>
	                    </c:if>
                    </ul>
                </div>   

                <div class="sub_nav">
                    <ul>
                        <li><a href="${ctx }/views/customer/0200_register.jsp">고객관리</a></li>
                        <li><a href="${ctx }/views/customer/0009.jsp">거래내역조회</a></li>
                        <li><a href="${ctx }/views/add/0231.jsp">자금세탁방지 고객관리</a></li>
                    </ul>
                    <ul>
                        <li><a href="${ctx }/views/bankbook/0010.jsp">수신신규</a></li>
                        <li><a href="${ctx }/views/bankbook/0002.jsp">입금</a></li>
                        <li><a href="${ctx }/views/bankbook/0003.jsp">지급</a></li>
                        <li><a href="${ctx }/views/automatic/1701.jsp">자동이체</a></li>
                        <li><a href="${ctx }/views/bankbook/0080.jsp">통장정리</a></li>
                        <li><a href="${ctx }/views/bankbook/0008.jsp">통장재발행</a></li>
                        <li class="legend">---- 수표 ----</li>
                        <li><a href="${ctx }/views/check/1401.jsp">자기앞수표 채번</a></li>
                        <li><a href="${ctx }/views/check/1402.jsp">자기앞수표 발행</a></li>
                        <li><a href="${ctx }/views/check/1403.jsp">자기앞수표 지급</a></li>
                        <li class="legend">------------</li>
                        <li><a href="${ctx }/views/add/1821.jsp">타행수표 즉시지급거래</a></li>
                        <li><a href="${ctx }/views/add/0007.jsp">사고신고관리</a></li>
                        <li><a href="${ctx }/views/add/0070.jsp">주의사고 등록/해제</a></li>
                        <li><a href="${ctx }/views/bankbook/0004.jsp">해지</a></li>
                        <li><a href="${ctx }/views/add/1099.jsp">거래취소</a></li>
                    </ul>
                    <ul>
                        <li><a href="${ctx }/views/electronic/3801.jsp">전자금융</a></li>
                    </ul>
                    <ul><li>&nbsp;</li></ul>
                    <ul class="last"><li><a href="${ctx }/views/customer/3701.jsp">카드발급</a></li></ul>
                    <c:if test="${sessionScope.userName ne null }">
                    	<ul>
                    		<c:if test="${sessionScope.userSepa eq  '교사' }">
                    			<li><a href="${ctx }/admin/register.do">관리자</a></li>
                    		</c:if>
                    		<li><a href="${ctx }/logout.do">로그아웃</a></li>
                    	</ul>                    	
                    </c:if>
                </div>

            </div>
        </div>
    </div>

    <div id="container">
        <div class="nav">
            <ul>
                <li>&nbsp;▶ 고객/CRM</li>
                <li><a href="${ctx }/views/customer/0200_register.jsp">&nbsp;&nbsp;&nbsp;고객 기본정보 관리</a></li>
                <li class="nav_dir"><a href="#" class="nav_bold">&nbsp;&nbsp;&nbsp;계좌조회</a></li>
				<li><a href="${ctx }/views/add/0231.jsp">&nbsp;&nbsp;&nbsp;자금세탁방지 고객관리</a></li>
            </ul>
        </div>
        
        
        <div id="contents">
            <h3>[0009] 계좌조회</h3>
            <div id="tabs">
              <div class="srch-0070">
                <div class="srch-inner-0070">
                    <ul>
                    	<li>계좌번호</li>
                        <li>
                        	<input type="text" id="account_num" style="background:#ffffcc" >
                            <img src="${ctx }/resources/image/icon/search.png" alt="조회버튼" id="findBankbook" style="cursor:pointer;">
                        </li>
                    </ul>
                </div><!--End of srch-inner-0070-->
              </div><!--End of srch-0070-->

              <h4>계좌 기본정보</h4>
              <div class="info01-wrap-0070">
                <div class="info01-inner-0070">
                    <table>
                        <caption>계좌 기본정보</caption>
                        <colgroup>
                            <col style="width:10%">
                            <col style="width:15%">
                            <col style="width:10%">
                            <col style="width:15%">
                            <col style="width:10%">
                            <col style="width:15%">
                            <col style="width:10%">
                            <col style="width:15%">
                        </colgroup>
                        <tbody>
                            <tr>
                            	<th>고객명</th>
                                <td><input id="customer_name" type="text" readonly></td>
                                <th>고객 자격</th>
                                <td><input  id="customer_qualf_name" type="text" readonly></td>
                                <th>신규일</th>
                                <td><input  id="open_date" type="text" readonly></td>
                            </tr>
                            <tr>
                                <th>상품명</th>
                                <td><input  id="item_name" type="text" readonly></td>
                                <th>잔액</th>
                                <td><input  id="balance" type="text" readonly></td>
                                <th>관리점</th>
                                <td><input  id="management_point" type="text" readonly></td>
                            </tr>
                        </tbody>
                    </table>
                    
                </div><!--End of info01 inner 0070-->
              </div><!--End of info01 wrap 0070-->
                
              <div class="tab_list3 m1">
                <ul>
                    <li class="m1">
                        <a><span>거래내역</span></a>
                        <ul>
                        	<li>
                            <table id="myTable" class="table0009">
                                <caption></caption>
                                <colgroup>
                                    <col style="width:15%">
                                    <col style="width:10%">
                                    <col style="width:10%">
                                    <col style="width:10%">
                                    <col style="width:15%">
                                    <col style="width:15%">
                                    <col style="width:10%">
                                    <col style="width:10%">
                                </colgroup>
                                <thead>
                                    <tr>
                                        <th>거래일자</th>
                                        <th>거래종류</th>
                                        <th>통화코드</th>
                                        <th>거래금액</th>
                                        <th>거래후잔액</th>
                                        <th>적요/통장표기</th>
                                        <th>의뢰인명</th>
                                        <th>취급점</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    
                                </tbody>
                            </table>
                        </li>
                    </ul>
                        <li>
                            <a><span style="color:#ccc;cursor:default">계좌기본항목</span></a>
                            <ul><li>&nbsp;</li></ul>
                        </li>
                        <li>
                            <a><span style="color:#ccc;cursor:default">변경·예외기록</span></a>
                            <ul><li>&nbsp;</li></ul>
                        </li>
                        <li>
                            <a><span style="color:#ccc;cursor:default">적용이율</span></a>
                            <ul><li>&nbsp;</li></ul>
                        </li>
                        <li>
                        	<a><span style="color:#ccc;cursor:default">해지예상</span></a>
                            <ul><li>&nbsp;</li></ul>
                        </li>
                        <li>
                        	<a><span style="color:#ccc;cursor:default">평잔</span></a>
                            <ul><li>&nbsp;</li></ul>
                        </li>
                    </ul>
                </div><!--End of info03-->
            </div><!--End of tabs-->
        </div><!--End of contents-->
    </div><!--container-->


</body>
</html>