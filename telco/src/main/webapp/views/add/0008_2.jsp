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
    <meta name="apple-mobile-web-app-capable" content="yes">
	<link href="${ctx }/resources/css/common.css" type="text/css" rel="stylesheet">
	<link href="${ctx }/resources/css/media.css" type="text/css" rel="stylesheet">
	<link href="${ctx }/resources/css/study.css" type="text/css" rel="stylesheet">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js" type="text/javascript"></script>
    <script src="${ctx }/resources/js/pop.js" type="text/javascript"></script> 
    <script type="text/javascript">
        function moveUrl(form) {
            var Url=form.options[form.selectedIndex].value;
            if (Url!="") { location.href=Url;
            }
        }
    </script>
    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){
            $(".gnb_ul").mouseenter(function(){
                $(".sub_nav").stop().slideDown("slow");
            });
            $(".nav_wrap").mouseleave(function(){
                $(".sub_nav").stop().slideUp("slow");
            });
        });
    </script>
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
        
        <DIV id="contents">
            <h3>[0008] 통장재발행/정리/재기장</h3>
            
            <!--div class="btn0290">
                <a href="#">고객관계</a>
                <a href="#">고객코멘트</a>
                <a href="#">주의사고</a>
            </div-->
            
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
                            <td><select name="" id="" title="거래종류" onChange="javascripｔ:moveUrl(this);" style="background:#ffffcc;">
                                <option value="${ctx }/views/bankbook/0008.jsp">301: 이월재발행</option>
                                <option value="${ctx }/views/add/0008_2.jsp" selected>305: 통장, 인감분실 재발행</option>
                                <option value="${ctx }/views/add/0008_3.jsp">310: 훼손 재발행</option>
                                <option value="${ctx }/views/add/0008_4.jsp">380: 통장 재인자</option>
                                <option value="${ctx }/views/add/0008_5.jsp">381: MS 재인자</option>
                                <option value="${ctx }/views/add/0008_6.jsp">399: 통장정리</option>
                                </select>
                            </td>
                            <th>계좌번호</th>
                            <td><input type="text" name="" id="" style="background:#ffffcc; width:150px">
                                <a href="#"><img src="${ctx }/resources/image/icon/search.png" alt="조회버튼"></a>
                            </td>
                            <th>통장발행번호</th>
                            <td><input type="text"></td>
                            <td><span class="note1 pointer">(*MS재인자시 입력)</span></td>
                        </tr>
                        </tbody>                                                                                                                                                                  
                    </table>
                    
                    <div class="comment2 posi47">
                        <div class="close pointer"><img src="${ctx }/resources/image/icon/close.png" alt="닫기" /></div>
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
                <div class="info01-inner-0070">
                    <table>
                        <caption>통장,인감분실 재발행 조회 상세내용</caption>
                        <colgroup>
                            <col style="width:9%" >
                            <col style="width:15%" >
                            <col style="width:9%" >
                            <col style="width:15%" >
                            <col style="width:10%" >
                            <col style="width:15%" >
                            <col style="width:12%" >
                            <col style="width:15%" >
                        </colgroup>
                        <tbody>
                            <tr>
                                <th>통장종류</th>
                                <td colspan="3"><select title="통장종류">
                                    <option>입출금이 자유로운통장</option>
                                    </select>
                                </td>
                                <th>중요증서번호</th><td><input type="text" disabled></td>
                                <th>제신고서인자라인</th>
                                <td><input type="text" style="background:#ffffcc;"></td>
                            </tr>
                            <tr>
                                <th colspan="3">개설점의은행거래신청서 징구 또는 EDMS본인확인</th>
                                <td><select title="개설점의은행거래신청서 징구 또는 EDMS본인확인">
                                    <option>1: 예</option><option>2: 아니오</option>
                                    </select>
                                </td>
                                <th>분실구분</th>
                                <td><select title="분실구분">
                                    <option>1: 통장분실</option>
                                    <option>2: 인감분실</option>
                                    <option>3: 통장, 인감분실</option>
                                    </select>
                                </td>
                                <th>비밀번호</th>
                                <td><input type="password" ></td>
                            </tr>
                            <tr>
                                <th>적요</th>
                                <td colspan="3"><input type="text" ></td>
                                <th>인감/서명구분</th>
                                <td><select title="인감/서명구분">
                                    <option>1: 인감사용</option>
                                    <option>2: 서명사용</option>
                                    <option>3: 인감, 서명사용</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th>수수료구분</th>
                                <td><select title="수수료구분">
                                    <option>1: 현금</option>
                                    <option>2: 연동계좌</option>
                                    <option>3: 미발생</option>
                                    </select>
                                </td>
                                <th>영수증인자</th>
                                <td><select title="영수증인자">
                                    <option>1: 예</option><option>2: 아니오</option>
                                    </select>
                                </td>
                                <!--th>연동계좌번호</th><td><input type="text" disabled></td>
                                <th>연동계좌비밀번호</th><td><input type="text" disabled></td-->
                            </tr>
                        </tbody>
                    </table>
                </div><!--End of info01-inner02-1401-->
              </div><!--End of info01-wrap-1401-->
                  
              <h4>거래내역 조회</h4>
              <div class="info01-wrap-1099">
                <div class="info01-inner-1099">
                    <table>
                        <caption>거래내역조회 테이블</caption>
                        <colgroup>
                            <col style="width:20px" >
                            <col >
                            <col >                                
                            <col >                                
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
                                <th><input type="checkbox" ></th>
                                <th>거래일자</th>
                                <th>거래번호</th>
                                <th>상세번호</th>
                                <th>거래종류</th>
                                <th>통장적요</th>
                                <th>통화코드</th>
                                <th>거래금액</th>
                                <th>거래후잔액</th>
                                <th>적요/통장표기</th>
                                <th>의뢰인명</th>
                                <th>취급점</th>
                                <th>취급점명</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
              </div>

              <div class="btn_both">
                <div class="fr">
                    <input type="button" value="재발행">
                </div>
              </div>

            </div><!--End of tabs-->
        </DIV><!--End of contents-->
    </div><!--container-->

</body>
    
</html>