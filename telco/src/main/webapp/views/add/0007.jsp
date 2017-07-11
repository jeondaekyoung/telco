<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath }" scope="request" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
    <title>[0007] 사고신고관리</title>
    <meta name="viewport" content="user-scalable=no, width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <meta name="apple-mobile-web-app-capable" content="yes">
	<link href="${ctx }/resources/css/common.css" type="text/css" rel="stylesheet">
	<link href="${ctx }/resources/css/media.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
    <script type="text/javascript" src="${ctx }/resources/vjs/add/0007.js"></script>
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
				<li class="nav_dir"><a href="#" class="nav_bold">&nbsp;&nbsp;&nbsp;사고신고관리</a></li>
                <li><a href="${ctx }/views/add/0070.jsp">&nbsp;&nbsp;&nbsp;주의사고 등록/해제</a></li>
                <li><a href="${ctx }/views/bankbook/0004.jsp">&nbsp;&nbsp;&nbsp;해지</a></li>
                <li><a href="${ctx }/views/add/1099.jsp">&nbsp;&nbsp;&nbsp;거래취소</a></li>
            </ul>
        </div>
        
        <DIV id="contents">
            <h3>[0007] 사고신고관리</h3>
            
            <!--div class="btn0290">
                <a href="#">고객관계</a>
                <a href="#">고객코멘트</a>
                <a href="#">주의사고</a>
            </div-->
            
            <div id="tabs">
              <div class="srch-1099">
                <div class="srch-inner-1099">
                    <table>
                        <colgroup>
                            <col style="width:100px">
                            <col style="width:150px">
                            <col >
                        </colgroup>
                        <tbody>
                        <tr>
                            <th>거래구분</th>
                            <td><select  title="거래구분">
                                <option>1: 등록</option>
                                <option>2: 등록내역조회</option>
                                <option>3: 등록정보정정</option>
                                </select>
                            </td>
                            <td></td>
                        </tr>
                        </tbody>                                                                                                                                                                  
                    </table>
                </div><!--End of srch-inner-0002-->
              </div><!--End of srch-0002-->
                
              <h4>고객정보</h4>
              <div class="info01-wrap-0070">
                <div class="info01-inner-0070 table0008">
                    <table>
                        <colgroup>
                            <col style="width:10%" >
                            <col >
                            <col style="width:10%" >                                
                            <col style="width:15%" >
                            <col style="width:10%" >
                            <col style="width:15%" > 
                            <col style="width:10%" >
                            <col style="width:15%" >
                        </colgroup>
                        <tbody>
                            <tr>
                                <th>실명번호</th>
                                <td><input type="text" style="background:#ffffcc;width:80px">
                                    <a href="#" class="mybtn">조회</a>
                                </td>
                                <th>고객명</th><td><input type="text" disabled></td>
                                <th>고객번호</th><td><input type="text" disabled></td>
                                <th>고객자격</th><td><input type="text" disabled></td>
                            </tr>
                        </tbody>
                    </table>
                </div><!--End of info01-inner02-1401-->
              </div><!--End of info01-wrap-1401-->
                  
              <h4>분실등록/해제</h4>
              <div class="info01-wrap-1099">
                <div class="info01-inner-1099">
                    <table>
                        <caption>분실등록/해제 테이블</caption>
                        <colgroup>
                            <col >
                            <col >
                            <col >                                
                            <col >
                            <col >
                            <col >
                            <col >
                            <col >                                
                            <col >
                        </colgroup>
                        <thead>
                            <tr>
                                <th>순번</th>
                                <th>상태</th>
                                <th>과목명</th>
                                <th>계좌/카드번호</th>
                                <th>이용자ID</th>
                                <th>잔액</th>
                                <th>최종거래일</th>
                                <th>신고자명</th>
                                <th>신고자연락처</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>&nbsp;.</td>
                                <td>&nbsp;.</td>
                                <td>&nbsp;.</td>
                                <td>&nbsp;.</td>
                                <td>&nbsp;.</td>
                                <td>&nbsp;.</td>
                                <td>&nbsp;.</td>
                                <td>&nbsp;.</td>
                                <td>&nbsp;.</td>
                            </tr>
                        </tbody>
                    </table>
                    
                </div>
              </div>
                
                
               <h4>사고신고정보</h4>
              <div class="info01-wrap-0070">
                <div class="info01-inner-0070 table0008">
                    <table>
                        <colgroup>
                            <col style="width:15%">
                            <col >
                            <col style="width:15%">                                
                            <col >
                        </colgroup>
                        <tbody>
                            <tr>
                                <th>통장/인감 신고유형</th>
                                <td><select title="통장/인감 신고유형" disabled>
                                        <option >1501: 통장/증서분실(전자통장포함)</option>
                                        <option >1502: 인감분실</option>
                                        <option >1503: 통장+인감분실</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th>신고유형</th>
                                <td><select title="신고유형" disabled>
                                        <option >1: 유선신고</option>
                                        <option >2: 서면신고</option>
                                    </select></td>
                                <th>제신고서인자라인</th><td><input type="text" disabled></td>
                            </tr>
                            <tr>
                                <th>신고자명</th><td><input type="text" disabled></td>
                                <th>신고자연락처</th><td><input type="text" disabled></td>
                            </tr>
                            <tr>
                                <th>고객과의 관계</th>
                                <td><select title="고객과의관계" disabled>
                                        <option>예금주와의관계</option>
                                        <option value="본인">00: 본인</option>
                                        <option value="배우자">01: 배우자</option>
                                        <option value="배우자부모">03: 배우자부모</option>
                                        <option value="사위">04: 사위</option>
                                        <option value="며느리">05: 며느리</option>
                                        <option value="외조부모">06: 외조부모</option>
                                        <option value="외손자">07: 외손자</option>
                                        <option value="위임장(개인인감)">08: 위임장(개인인감)</option>
                                        <option value="위임장(법인인감)">09: 위임장(법인인감)</option>
                                        <option value="공증받은위임장">10: 공증받은위임장</option>
                                        <option value="기타">11: 기타</option>
                                        <option value="직계존속(조부모)">12: 직계존속(조부모)</option>
                                        <option value="직계비속(자녀)">13: 직계비속(자녀)</option>
                                        <option value="직계비속(손자)">14: 직계비속(손자)</option>
                                        <option value="형제자매">15: 형제자매</option>
                                        <option value="친척">16: 친척</option>
                                        <option value="상사">17: 상사</option>
                                        <option value="동료(친구)">18: 동료(친구)</option>
                                        <option value="직원">19: 직원</option>
                                        <option value="대표자">20: 대표자</option>
                                    </select>
                                <th>분실장소및기타</th><td><input type="text" disabled></td>
                            </tr>
                        </tbody>
                    </table>
                </div><!--End of info01-inner02-1401-->
                  
                <div class="info01-inner-0070 table0008">
                    <table>
                        <colgroup>
                            <col style="width:6%;">
                            <col style="width:4%;">
                            <col style="width:6%;">
                            <col style="width:4%;">
                            <col style="width:6%;">
                            <col style="width:4%;">
                            <col style="width:6%;">
                            <col style="width:4%;">
                            <col style="width:6%;">
                            <col style="width:4%;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th>등록직원번호</th>
                                <td><input type="text" disabled></td>
                                <th>등록 일자</th>
                                <td><input type="text" disabled></td>
                                <th>등록 시간</th>
                                <td><input type="text" disabled></td>
                                <th>변경직원번호</th>
                                <td><input type="text" disabled></td>
                                <th>변경 일자</th>
                                <td><input type="text" disabled></td>
                            </tr>
                        </tbody>
                    </table>
                </div><!--End of info01-inner02-1401-->
              </div><!--End of info01-wrap-1401-->

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