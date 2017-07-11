<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath }" scope="request" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>[0008] 통장재발행/정리/재기장</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
    <meta name="viewport" content="user-scalable=no, width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <meta name="apple-mobile-web-app-capable" content="yes">
	<link href="${ctx }/resources/css/common.css" type="text/css" rel="stylesheet">
	<link href="${ctx }/resources/css/media.css" type="text/css" rel="stylesheet">
	<link href="${ctx }/resources/css/study.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="${ctx }/resources/js/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="${ctx }/resources/js/pop.js"></script>
    <script type="text/javascript" src="${ctx }/resources/vjs/bankbook/0008.js"></script>
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
                <li>&nbsp;▶ 수신/공통</li>                
                <li><a href="${ctx }/views/bankbook/0010.jsp">&nbsp;&nbsp;&nbsp;수신신규</a></li>
                <li><a href="${ctx }/views/bankbook/0002.jsp">&nbsp;&nbsp;&nbsp;입금</a></li>
                <li><a href="${ctx }/views/bankbook/0003.jsp">&nbsp;&nbsp;&nbsp;지급</a></li>
                <li><a href="${ctx }/views/automatic/1701.jsp">&nbsp;&nbsp;&nbsp;자동이체</a></li>
                <li><a href="${ctx }/views/bankbook/0080.jsp">&nbsp;&nbsp;&nbsp;통장정리</a></li>
                <li class="nav_dir"><a href="#" class="nav_bold">&nbsp;&nbsp;&nbsp;통장재발행</a></li>
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
        
        <input type="text" id="schoolName" readonly="readonly" value="${sessionScope.schoolName }" style="display: none;">
        
        <div id="contents">
            <h3>[0008] 통장재발행/정리/재기장 <img class="more" src="${ctx }/resources/image/icon/more.png" alt="코멘트"></h3>
                    
            <div class="comment1">
                <div class="comt">
                    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <span class="hl">통장 이월재발행</span>은
                        통장의 마지막 줄까지 기록되었을 경우 새로운 통장으로 재발행하는 업무입니다.<br>
                        통장 이월재발행은 고객으로부터 별도의 서류를 받을 필요가 없습니다.<br>
                        <span class="hl">인감 사용 통장</span>은 통장과 통장 인감만 소지하면 본인이 아니어도 통장 재발행이 가능하나,
                        <span class="hl">서명 사용 통장</span>은 반드시 본인이 통장과 신분증을 가져와야 하며 서명이 일치하는지 확인 후 재발행 할 수 있습니다.
                    </p>
                </div>
            </div>
        
            <div id="tabs">
              <div class="srch-1099">
                <div class="srch-inner-1099">
                    <table>
                        <caption>통장재발행/정리/재기장 조회 테이블</caption>
                        <colgroup>
                            <col style="width:8%">
                            <col style="width:20%">
                            <col style="width:8%">
                            <col style="width:25%">
                            <col style="width:9%">
                            <col style="width:15%">
                            <col style="width:15%">
                        </colgroup>                                                                                                                                           
                        <tbody>
                        <tr>
                            <th>거래종류</th>
                            <td>
                            	<select  title="거래종류" onChange="javascripｔ:moveUrl(this);" style="background:#ffffcc;">
	                                <option value="${ctx }/views/bankbook/0008.jsp" selected>301: 이월재발행</option>
	                                <option disabled="disabled" style="background:#e5e5e5;">305: 통장, 인감분실 재발행</option>
	                                <option disabled="disabled" style="background:#e5e5e5;">310: 훼손 재발행</option>
	                                <option disabled="disabled" style="background:#e5e5e5;">380: 통장 재인자</option>
	                                <option disabled="disabled" style="background:#e5e5e5;">381: MS 재인자</option>
	                                <option disabled="disabled" style="background:#e5e5e5;">399: 통장정리</option>
                                </select>
                            </td>
                            <th>계좌번호</th>
                            <td>
                            	<input type="text" id="account_num" style="background:#ffffcc; width:150px">
                                <img src="${ctx }/resources/image/icon/search.png" id="findBankbookTrade" alt="조회버튼" style="cursor:pointer;">
                            </td>
                            <th>통장발행번호</th>
                            <td><input type="text" style="background:#e5e5e5;" readonly="readonly"></td>
                            <td><span class="note1 pointer">(*MS재인자시 입력)</span></td>
                        </tr>
                        </tbody>                                                                                                                                                                  
                    </table>
                    
                    <div class="comment2 posi47">
                        <div class="close pointer"><img src="${ctx }/resources/image/icon/close.png" alt="닫기" ></div>
                        <div class="comt2">
                            <h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MS</h5><br><br>
                            <p>Magnetic Stripe의 약어. 통장 후면의 자기띠를 말합니다.
                            통장을 이용한 거래시 통장 프린터가 MS를 읽고 자동으로 정보를 불러들입니다.
                            MS가 손상될 경우 MS재인자 혹은 통장 재발행이 필요합니다.</p>
                        </div>
                    </div>
                    
                </div><!--End of srch-inner-0002-->
              </div><!--End of srch-0002-->
                
              <h4>상세내용</h4>
              <div class="info01-wrap-0070">
                <div class="info01-inner-0070" >
                    <table>
                        <caption>이월재발행 조회 상세내용</caption>
                        <colgroup>
                            <col style="width:16%" >
                            <col >
                            <col style="width:16%" >                                
                            <col style="width:16%" >
                            <col style="width:16%" >
                            <col style="width:16%" >
                        </colgroup>
                        <tbody>
                            <tr>
                                <th>통장종류</th>
                                <td><input type="text" id="item_name" readonly="readonly"></td>
                                <th>중요증서번호</th>
                                <td><input type="text" id="certificate_num" style="background:#ffffcc;"></td>
                                <th>인감/서명구분</th>
                                <td>
                                	<select title="인감/서명구분" id="signet_sepa" style="background:#ffffcc;">
	                                    <option value="01" selected="selected">01: 인감사용</option>
	                                    <option value="02">02: 서명사용</option>
	                                    <option value="03">03: 인감, 서명사용</option>
                                    </select>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div><!--End of info01-inner02-1401-->
              </div><!--End of info01-wrap-1401-->
                  
              <h4>거래내역 조회</h4>
              <div class="info01-wrap-1099">
                <div class="info01-inner-1099" id="tradeDiv">
                    <table id="myTable">
                        <caption>거래내역조회 테이블</caption>
                        <colgroup>
                            <col >
                            <col >                                
                            <col style="width:%" >
                            <col style="width:%" >
                            <col >
                            <col style="width:%" >                                
                            <col style="width:%" >
                            <col style="width:%" >
                            <col style="width:%" >
                        </colgroup>
                        <thead>
                            <tr>
                                <th>거래일자</th>
                                <th>거래번호</th>
                                <th>거래종류</th>
                                <th>통화코드</th>
                                <th>거래금액</th>
                                <th>거래후잔액</th>
                                <th>적요/통장표기</th>
                                <th>의뢰인명</th>
                                <th>취급점명</th>
                            </tr>
                        </thead>
                        <tbody>

                        </tbody>
                    </table>
                    
                </div>
                
                <div class="info01-inner-1099" id="imgBankbook">
                    <img src="${ctx }/resources/image/bg/warning.png" alt="통장을 넣어주세요">
                </div>
              </div>
              
              

              <div class="btn_both">
                <div class="fr">
                    <input type="button" value="재발행" id="reissue">
                </div>
              </div>

            </div><!--End of tabs-->
        </div><!--End of contents-->
    </div><!--container-->

</body>
    
</html>