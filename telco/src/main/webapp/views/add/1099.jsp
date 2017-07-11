<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath }" scope="request" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>[1099] 거래취소</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
    <meta name="viewport" content="user-scalable=no, width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <meta name="apple-mobile-web-app-capable" content="yes">
	<link href="${ctx }/resources/css/common.css" type="text/css" rel="stylesheet">
	<link href="${ctx }/resources/css/media.css" type="text/css" rel="stylesheet">
	<link href="${ctx }/resources/css/study.css" type="text/css" rel="stylesheet">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js" type="text/javascript"></script>
    <script src="${ctx }/resources/js/pop.js" type="text/javascript"></script> 
    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
    <script type="text/javascript" src="${ctx }/resources/vjs/add/1099.js"></script>
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
                <li><a href="${ctx }/views/bankbook/0008.jsp">&nbsp;&nbsp;&nbsp;통장재발행</a></li>
                <li><a href="${ctx }/views/check/1401.jsp">&nbsp;&nbsp;&nbsp;자기앞수표 채번</a></li>
                <li><a href="${ctx }/views/check/1402.jsp">&nbsp;&nbsp;&nbsp;자기앞수표 발행</a></li>
                <li><a href="${ctx }/views/check/1403.jsp">&nbsp;&nbsp;&nbsp;자기앞수표 지급</a></li>
				<li><a href="${ctx }/views/add/1821.jsp">&nbsp;&nbsp;&nbsp;타행수표 즉시지급거래</a></li>
                <li><a href="${ctx }/views/add/0007.jsp">&nbsp;&nbsp;&nbsp;사고신고관리</a></li>
                <li><a href="${ctx }/views/add/0070.jsp">&nbsp;&nbsp;&nbsp;주의사고 등록/해제</a></li>
                <li><a href="${ctx }/views/bankbook/0004.jsp">&nbsp;&nbsp;&nbsp;해지</a></li>
                <li class="nav_dir"><a href="#" class="nav_bold">&nbsp;&nbsp;&nbsp;거래취소</a></li>
            </ul>
        </div>
        
        <DIV id="contents">
            <h3>[1099] 거래취소 <img class="more" src="${ctx }/resources/image/icon/more.png" alt="코멘트"></h3>
                        
            <div class="comment1">
                <div class="comt">
                    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <span class="hl">거래취소</span>는 당일 거래만 취소 가능합니다. 원칙적으로 직원의 조작 오류로 인한 거래만 취소 가능하며,
                        고객의 요청으로는 취소할수 없습니다.</p>
                    <p>거래취소는 <span class="hl">책임자승인</span>이 필요한 거래이므로 책임자와 상의 후에 업무를 진행합니다.
                        입금거래시 입금이 완료된 후에 예금주가 예금채권에 대한 권리를 가지므로, 정당하지 않은 수취인에게 입금되지 않도록 주의합니다.
                    </p>
                </div>
            </div>
                    
            <div id="tabs">
              <div class="srch-1099">
                <div class="srch-inner-1099">
                    <table>
                        <caption>거래취소 조회 테이블</caption>
                        <colgroup>
                            <col style="width:8%">
                            <col style="width:18%">
                            <col style="width:8%">
                            <col style="width:18%">
                            <col style="width:8%">
                            <col style="width:*">                            
                            <col >
                        </colgroup>
                        <tbody>
                            <tr>
                                <th>계좌번호</th><td><input type="text"  style="background:#ffffcc"></td>                            
                                <th>일련번호</th><td><input type="text" disabled ></td>
                                <th>통장발행번호</th><td><input type="text" ></td>
                            </tr>
                            <tr>
                                <th>거래종류</th>
                                <td><select><option>201: 입금</option>
                                            <option>301: 지급</option>
                                            <option>101: 예금신규</option>
                                            <option>463: 해지</option>
                                            <option>321: 수표어음지급</option>
                                            <option>361: 이자지급</option>
                                    </select>
                                </td>
                                <th>거래텔러</th><td><input type="text" ></td>
                                <th>원인거래일</th>
                                <td><input type="text" style="width:100px">
                                    <img src="${ctx }/resources/image/icon/calendar.png" alt="달력버튼">
                                <input type="text"  style="width:75px">
                                    ~
                                    <input type="text" style="width:75px"><a href="#"><img src="${ctx }/resources/image/icon/search.png" alt="조회버튼"></a></td>
                            </tr>
                        </tbody>
                    </table>
                </div><!--End of srch-inner-0002-->
              </div><!--End of srch-0002-->
            
              <h4>거래내역</h4>
              <div class="info01-wrap-1099">
                    <div class="info01-inner-1099">
                        <table>
                            <caption>거래내역 조회 테이블</caption>
                            <colgroup>
                                <col style="width:24px" >
                                <col>
                                <col style="width:10%" >                                
                                <col style="width:10%" >
                                <col style="width:10%" >
                                <col style="width:10%" >
                                <col style="width:10%" >
                                <col style="width:10%" >
                                <col style="width:10%" >
                                <col style="width:10%" >
                                <col style="width:10%" >
                            </colgroup>
                            <thead>
                                <tr>
                                    <th scope="col"><input type="checkbox" ></th>
                                    <th scope="col">거래일자</th>
                                    <th scope="col">거래번호</th>
                                    <th scope="col">거래종류</th>
                                    <th scope="col">통장적요</th>
                                    <th scope="col">통화코드</th>
                                    <th scope="col">거래금액</th>
                                    <th scope="col">거래후잔액</th>
                                    <th scope="col">적요/통장표기</th>
                                    <th scope="col">취급점</th>
                                    <th scope="col">거래텔러</th>
                                </tr>
                            </thead>

                            <tbody>
                                <tr>
                                    <td><input type="checkbox"></td>
                                    <td>2015-1-15</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>냐하하하하하하하하하하하하하하하하하</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox"></td>
                                    <td>2015-1-15</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>냐하하하하하하하하하하하하하하하하하</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox"></td>
                                    <td>2015-1-15</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>냐하하하하하하하하하하하하하하하하하</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox"></td>
                                    <td>2015-1-15</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>냐하하하하하하하하하하하하하하하하하</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                            </tbody>
                        </table>
                    </div><!--End of info01-inner02-1401-->
              </div><!--End of info01-wrap-1401-->

              <div class="info01-wrap-1099">
                  <div class="info02-inner-1099">
                    
                       <span class="sp">거래일련번호</span>
                       <span><input type="text" disabled ></span>
                       <span class="sp">취소사유</span>
                       <span><input type="text" ></span>
                           
                  </div>
              </div>
              
              <div class="btn_both">
	                <div class="fr">
	                   	 <input type="button" value="등록">
	                </div>
              </div>

            </div><!--End of tabs-->
        </DIV><!--End of contents-->
    </div><!--container-->

</body>
    
</html>