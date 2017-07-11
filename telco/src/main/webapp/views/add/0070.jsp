<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath }" scope="request" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>[0070]주의사고 등록/해제[000070000]</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="viewport" content="user-scalable=no, width=device-width, initial-scale=1.0, maximum-scale=1.0">
	<link href="${ctx }/resources/css/common.css" type="text/css" rel="stylesheet">
	<link href="${ctx }/resources/css/media.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
    <script type="text/javascript" src="${ctx }/resources/vjs/add/0070.js"></script>
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
                <li><a href="${ctx }/views/automatic/1701.jsp">&nbsp;&nbsp;&nbsp;자동이체</a></li>
                <li><a href="${ctx }/views/bankbook/0080.jsp">&nbsp;&nbsp;&nbsp;통장정리</a></li>
                <li><a href="${ctx }/views/bankbook/0008.jsp">&nbsp;&nbsp;&nbsp;통장재발행</a></li>
                <li><a href="${ctx }/views/check/1401.jsp">&nbsp;&nbsp;&nbsp;자기앞수표 채번</a></li>
                <li><a href="${ctx }/views/check/1402.jsp">&nbsp;&nbsp;&nbsp;자기앞수표 발행</a></li>
                <li><a href="${ctx }/views/check/1403.jsp">&nbsp;&nbsp;&nbsp;자기앞수표 지급</a></li>
				<li><a href="${ctx }/views/add/1821.jsp">&nbsp;&nbsp;&nbsp;타행수표 즉시지급거래</a></li>
                <li><a href="${ctx }/views/add/0007.jsp">&nbsp;&nbsp;&nbsp;사고신고관리</a></li>
                <li class="nav_dir"><a href="#" class="nav_bold">&nbsp;&nbsp;&nbsp;주의사고 등록해제</a></li>
                <li><a href="${ctx }/views/bankbook/0004.jsp">&nbsp;&nbsp;&nbsp;해지</a></li>
                <li><a href="${ctx }/views/add/1099.jsp">&nbsp;&nbsp;&nbsp;거래취소</a></li>
            </ul>
        </div>
        
        <DIV id="contents">
            <h3>[0070] 주의사고 등록/해제</h3>
            
            <!--div class="btn0290">
                <a href="#">고객관계</a>
                <a href="#">고객코멘트</a>
                <a href="#">주의사고</a>
            </div-->
            
            <div id="tabs">
              <div class="srch-0070">
                <div class="srch-inner-0070">
                    <ul><li>계좌번호</li>
                        <li><input type="text" style="background:#ffffcc" ></li>
                        <li><a href="#"><img src="${ctx }/resources/image/icon/search.png" alt="조회버튼" ></a></li>
                    </ul>
                    <ul><li>예금주명</li>
                         <li><input type="text" readonly="readonly"  style="background:#e5e5e5"></li>
                    </ul>
                    <!--ul><li>계좌관리모점</li>
                         <li><input type="text" readonly="readonly"></li>
                    </ul-->
                    <ul>
                        <li>사고종류</li>
                        <li><select title="사고종류" style="width:150px;background:#ffffcc">
                            <option></option>
                            <!--option>1501: 통장/증서분실</option>
                            <option>1502: 인감분실</option-->
                            <option>1503: 통장+인감분실</option>
                            <!--option>1504: (구)현금카드분실</option>
                            <option>1505: 전부지급정지/해지금지</option>
                            <option>1006: 일부지급정비</option>
                            <option>1507: C/C지급정지</option>
                            <option>1508: 자동화기기지급정지</option>
                            <option>1509: NET지급정지</option>
                            <option>1510: (구)압류및기타법적제한(해제만가능)</option>
                            <option>1512: 이자지급가능한 지급정지</option>
                            <option>1513: 이자지급가능한 지급정지</option>
                            <option>1513: 무인감통장이월</option>
                            <option>1515: C/C에서만 입금가능</option>
                            <option>1516: C/C에서만 지급가능</option>
                            <option>1517: 입금금지</option>
                            <option>1518: 통장대출한도 C/C만 지급</option>
                            <option>1519: 전부명령(청약권박탈)</option>
                            <option>1520: 해지만불가</option>
                            <option>1521: 불비(무통지급)</option>
                            <option>1522: 불비(무인감)</option>
                            <option>1523: 불비(무통+무인감)</option>
                            <option>1524: 타점입금금지</option>
                            <option>1525: 창구에서만 지급가능</option>
                            <option>1526: 압류및가압류</option>
                            <option>1527: 빠른계좌조회(전화)금지</option>
                            <option>1528: 빠른계좌조회(인터넷)허용</option>
                            <option>1529: 전자금융거래금지</option>
                            <option>1531: 현금(직불)카드 발급금지</option>
                            <option>1532: 등록일이후 입금분 지급정지</option>
                            <option>1533: NET통장재발행금지</option>
                            <option>1534: 공동명의얘금NET지급허용</option>
                            <option>1544: 강제집행정지</option>
                            <option>1545: 창구출금불가</option>
                            <option>1547: 전화금융사기혐의등록</option>
                            <option>1548: 전화금융사기지급정지</option>
                            <option>1549: 창구및C/C만입금가능</option-->
                          </select>
                        </li>
                    </ul>
                    <ul><li>업무구분</li>
                        <li><select title="업무구분" style="background:#ffffcc" onChange="javascripｔ:moveUrl(this);"> <!-- 사고종류에서 1503클릭시 나타납니다 -->
                                
                                <option value="${ctx }/views/add/0070.jsp" id="rgs-0700">1: 등록</option>
                                <option value="${ctx }/views/add/0070_1.jsp" id="clr-0700">2: 해제</option>
                            </select>
                        </li>
                    </ul>
                </div><!--End of srch-inner-0070-->
              </div><!--End of srch-0070-->
            
              <h4>상세 내용</h4>
              <div class="info01-wrap-0070">
                <div class="info01-inner-0070"><!-- 1:등록 선택시 나타납니다 -->
                    <table >
                        <caption>통장+인감분실 등록 상세내용 테이블</caption>
                        <colgroup>
                            <col style="width:15%">
                            <col style="width:10%">
                            <col style="width:15%">
                            <col style="width:10%">
                            <col style="width:15%">
                            <col style="width:10%">
                            <col style="width:15%">
                            <col style="width:10%">
                        </colgroup>
                        <tbody>
                            <tr><th>제신고서인자라인</th><td><input type="text"></td>
                                <th>신고구분</th>
                                <td><select title="신고구분" style="background:#ffffcc">
                                        <option></option>
                                        <option>1: 유선신고</option>
                                        <option>2: 서면신고</option>
                                    </select></td>
                                <th>통장재발행</th>
                                <td><select title="통장재발행" style="background:#ffffcc">
                                    <option>1: 예</option>
                                    <option>2: 아니오</option>
                                  </select></td>
                                <th>통장종류</th>
                                <td><select disabled title="통장종류" style="background:#e5e5e5"><option></option></select></td>
                            </tr>
                            
                            <tr><th>중요증서번호</th>
                                <td><input  type="text" readonly="readonly" style="background:#e5e5e5"></td>
                                <th>인감/성명구분</th>
                                <td><select disabled title="인감/서명구분" style="background:#e5e5e5"><option></option></select></td>
                            </tr>
                            
                            <tr><th>비밀번호</th>
                                <td><input  type="text" readonly="readonly" style="background:#e5e5e5"></td>
                                <th>변경후비밀번호</th>
                                <td><input  type="text" readonly="readonly" style="background:#e5e5e5"></td>
                                <th colspan="3">개설점의은행거래신청서징구 또는 EDMS본인확인</th>
                                <td><select disabled title="개설점의은행거래신청서징구또는EDMS본인확인" style="background:#e5e5e5"><option></option></select></td>
                            </tr>
                            
                            <tr><th>거래일자</th>
                                <td colspan="3">
                                    <input type="text" readonly="readonly"  style="background:#e5e5e5;width:auto;">
                                    <img src="${ctx }/resources/image/icon/calendar-dis.png" alt="비활성 달력버튼">
                                    <input type="button" value="거래내역조회" disabled class="mybtn">
                                </td>
                                <th>거래일련번호</th><td><input type="text" readonly="readonly" style="background:#e5e5e5"></td>
                            </tr>
                            
                            <tr><th>신고인성명</th><td><input type="text" style="background:#ffffcc"></td>
                                <th>전화번호</th><td><input type="text"></td>
                                <th>핸드폰번호</th><td><input  type="text"></td>
                            </tr>
                        </tbody>
                    </table>
                </div><!--End of info01-inner-0070-->
              </div><!--End of info01-wrap-0070-->
                
                
              <h4>수수료 입금 구분</h4>
              <div class="info02-wrap-0070">
                <div class="info02-inner-0070">
                    <div class="dash">
                        <table>
                            <caption>통장+인감분실 등록 수수료 입금구분 테이블</caption>
                            <colgroup>
                                <col style="width:15%" >
                                <col style="width:10%" >
                                <col style="width:15%" >
                                <col style="width:10%" >
                                <col style="width:15%" >
                                <col style="width:10%" >
                                <col style="width:15%" >
                                <col style="width:10%" >
                            </colgroup>
                            <tbody>
                                <tr><th>수수료구분</th>
                                    <td><select disabled title="수수료구분" style="background:#e5e5e5"><option></option></select></td>
                                    <th>영수증인자</th>
                                    <td><select disabled title="영수증인자" style="background:#e5e5e5"><option></option></select></td>
                                    <th>연동계좌번호</th>
                                    <td><input type="text" readonly="readonly" style="background:#e5e5e5"></td>
                                    <th>연동계좌비밀번호</th>
                                    <td><input  type="text" readonly="readonly" style="background:#e5e5e5"></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div><!-- End of info02-inner-0070 -->
              </div><!-- End of info02-wrap-0070 -->
                

              <div class="btn_both">
                <div class="fr">
                    <a onclick="window.open('popup/pop_0070_1.html', '[0070] 주의사고 등록/해제 책임자승인사유창', 'width=900, height=380, location=no')">
						<input type="button" value="등록"> </a>
                </div>
              </div>

            </div><!--End of tabs-->
        </DIV><!--End of contents-->
    </div><!--container-->

</body>
    
</html>