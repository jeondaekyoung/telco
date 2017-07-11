<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath }" scope="request" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>[0002] 입금</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="user-scalable=no, width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <meta name="apple-mobile-web-app-capable" content="yes">
	<link href="${ctx }/resources/css/common.css" type="text/css" rel="stylesheet">
	<link href="${ctx }/resources/css/media.css" type="text/css" rel="stylesheet">
	<link href="${ctx }/resources/css/study.css" type="text/css" rel="stylesheet">
	<link href="${ctx }/resources/css/avgrund.css" type="text/css" rel="stylesheet">
	
<script type="text/javascript" src="${ctx }/resources/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="${ctx }/resources/js/pop.js"></script>
<script type="text/javascript" src="${ctx }/resources/js/jquery.avgrund.js"></script>
<script type="text/javascript" src="${ctx }/resources/vjs/bankbook/0002.js"></script>
</head>
<!-- 데이터 41개 -->
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
                <li class="nav_dir"><a href="#" class="nav_bold">&nbsp;&nbsp;&nbsp;입금</a></li>
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
                <li><a href="${ctx }/views/add/1099.jsp">&nbsp;&nbsp;&nbsp;거래취소</a></li>
            </ul>
        </div>
        
        <input type="text" id="schoolName" readonly="readonly" value="${sessionScope.schoolName }" style="display:none">
        
        <div id="contents">
            <h3>[0002] 입금</h3>
            
            <div id="tabs">
              <h4>계좌정보</h4>
              <div class="srch-0002">
                <div class="srch-inner-0002">
                                    
                    <ul><li>은행</li>
                        <li>
                        	<select name="bankname" id="bankname" title="은행종류" style="background: #ffffcc;" >
                                <option value="01" selected>01: 텔코은행</option>
                                <option value="02">02: 국민은행</option>
                                <option value="03">03: 우리은행</option>
                                <option value="04">04: 신한은행</option>
                                <option value="05">05: 기업은행</option>
                                <option value="06">06: 하나은행</option>
                                <option value="07">07: 농협중앙회</option>
                            </select>
                        </li>
                    </ul>
                    <ul>
                    	<li><span class="note1 pointer">(*)계좌번호</span></li>                
                        <li><input type="text" id="account_num" class="isEssential" style="background: #ffffcc;"></li>
                        <li><img src="${ctx }/resources/image/icon/search.png" alt="조회버튼" id="findBankbook" style="cursor: pointer;"></li>
                        <li><img src="${ctx }/resources/image/icon/ic.png" alt="계좌검색버튼"></li>
                    </ul>
                              
                    <ul>
                    	<li>예금주</li>
                    	<li><input type="text" id="customer_name" style="background: #ffffcc;"></li>
                    </ul>
                    <ul><li><span class="note2 pointer">(*)통장발행번호</span></li>
                        <li><input type="text" name="" style="background: #e5e5e5;width:30px" readonly="readonly"></li>
                    </ul>
                    
                    <div class="comment2 posi12">
                        <div class="close pointer"><img src="${ctx }/resources/image/icon/close.png" alt="닫기" ></div>
                        <div class="comt2">
                            <h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;계좌번호</h5><br><br>
                            <p>고객이 전표에 작성한 계좌번호를 입력합니다. 통장 거래시 통장프린터에 통장을 넣으면 자동으로 M/S(마그네틱 스트라이프)를 읽고 계좌정보가 입력됩니다.</p>
                        </div>
                    </div>
                    
                    <div class="comment2 posi13">
                        <div class="close pointer"><img src="${ctx }/resources/image/icon/close.png" alt="닫기" ></div>
                        <div class="comt2">
                            <h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;통장 발행번호</h5><br><br>
                            <p>각 계좌별 <span class="hl">통장의 일련번호</span>로, 통장을 재발행 할때마다 번호가 새로 부여됩니다.
			                                통장을 프린터기에 넣으면 자동으로 조회되고, 최신 발행된 통장이 아닐 경우 거래가 되지 않습니다.
			                                무통장 거래 시 입력하지 않습니다.</p>
                        </div>
                    </div>
                </div><!--End of srch inner 0002-->
              </div><!--End of srch 0002-->
                
              <div class="info01-wrap-0002">
                <div class="info01-title1-0002">
                    <h4>금액정보</h4>
                    <div class="info01-inner01-0002">
                        <ul>
                            <li><span>현금</span>
                                <input type="text" name="cash" id="cash" class="isEssential" value="0" style="background: #ffffcc;" onkeyup="addSum();">
                            </li>
                            <li><span>순대체</span>
                                <input type="text" name="check_alternative" id="check_alternative" value="0" onkeyup="addSum();">
                            </li>
                            <li><span>연동대체</span>
                                <input type="text" name="bank_alternative" id="bank_alternative" value="0" readonly="readonly" >
                            </li>
                        </ul>
                        <ul class="sum"><li>합계</li>
                            <li><input name="balance" id="balance" type="text" value="0" readonly="readonly" ></li>
                        </ul>
                    </div><!--End of info01 inner01 0002-->
                </div><!--End of info01 title1 0002-->
                    
                <div class="info01-title2-0002">
                    <span class="note3 pointer"><h4>(*)연동대체(당행자기앞지금)</h4></span>
                    
                    <div class="comment2 posi14">
                        <div class="close pointer"><img src="${ctx }/resources/image/icon/close.png" alt="닫기" ></div>
                        <div class="comt2">
                            <h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;연동대체(당행자기앞지금)</h5><br><br>
                            <p>당행수표를 지급함과 동시에 입금하는 업무입니다. 자기앞수표 지급거래와 입금거래가 동시에 이루어집니다.</p>
                        </div>
                    </div>
                    
                    <div class="info01-inner02-0002">
                        <table>
                            <caption>연동대체(당행자기앞지금)테이블</caption>
                            <colgroup>
                                <col style="width:15%">
                                <col style="width:15%" >
                                <col style="width:10%" >                                
                                <col style="width:15%" >
                                <col >
                                <col style="width:15%" >
                            </colgroup>
                            <thead>
                                <tr>
                                    <th><span class="note9 pointer">(*)수표 금액</span></th>
                                    <th><span class="note9 pointer">(*)시작번호</span></th>
                                    <th>매수</th>
                                    <th><span class="note9 pointer">(*)끝번호</span></th>
                                    <th><span class="note9 pointer">(*)지로코드</span></th>
                                    <th>합계</th>
                                </tr>
                            </thead>
                            
                            
                            <tfoot>
                                <tr>
                                    <th scope="col" colspan="5">총합계</th>
                                    <td scope="col"><input type="text" size="12" style="background:#e5e5e5" id="totalAmount" readonly ></td>
                                </tr>
                            </tfoot>
                            
                            
                            <tbody>
                                <tr>
                                	<td>
                                		<select name="case1" id="check_amount1" onchange="endnum(this);" style="width:100%">
                                			<option value="01" selected>01: 10만원권자기앞수표</option>
                                            <option value="02">02: 30만원권자기앞수표</option>
                                            <option value="03">03: 50만원권자기앞수표</option>
                                            <option value="04">04: 100만원권자기앞수표</option>
                                        </select>
                                	</td>
                                    <td><input type="text" size="12" name="case1" id="start_num1" onkeyup="endnum(this);"></td>
                                    <td><input type="text" size="12" name="case1" id="number_of_sheet1" onkeyup="endnum(this);"></td>
                                    <td><input type="text" size="12" id="end_num1" readonly></td>
                                    <td>
                                    	<input type="text" size="12" id="giro_code1" style="width:90px; background: #ffffcc;" maxlength="6">
                                        <img src="${ctx }/resources/image/icon/search.gif" alt="검색버튼">
                                    </td>
                                    <td><input type="text" size="12" id="amount1" readonly ></td>
                                </tr>
                                <tr>
                                	<td>
                                		<select name="case2" id="check_amount2" onchange="endnum(this);" style="width:100%" >
                                			<option value="01" selected>01: 10만원권자기앞수표</option>
                                            <option value="02">02: 30만원권자기앞수표</option>
                                            <option value="03">03: 50만원권자기앞수표</option>
                                            <option value="04">04: 100만원권자기앞수표</option>
                                        </select>
                                	</td>
                                    <td><input type="text" size="12" name="case2" id="start_num2" onkeyup="endnum(this);"></td>
                                    <td><input type="text" size="12" name="case2" id="number_of_sheet2" onkeyup="endnum(this);"></td>
                                    <td><input type="text" size="12" id="end_num2" readonly></td>
                                    <td>
                                    	<input type="text" size="12" id="giro_code2" style="width:90px;background: #ffffcc;" maxlength="6">
                                        <img src="${ctx }/resources/image/icon/search.gif" alt="검색버튼">
                                    </td>
                                    <td><input type="text" size="12" id="amount2" readonly></td>
                                </tr>
                                <tr>
                                	<td>
                                		<select name="case3" id="check_amount3" onchange="endnum(this);" style="width:100%">
                                			<option value="01" selected>01: 10만원권자기앞수표</option>
                                            <option value="02">02: 30만원권자기앞수표</option>
                                            <option value="03">03: 50만원권자기앞수표</option>
                                            <option value="04">04: 100만원권자기앞수표</option>
                                        </select>
                                	</td>
                                    <td><input type="text" size="12" name="case3" id="start_num3" onkeyup="endnum(this);"></td>
                                    <td><input type="text" size="12" name="case3" id="number_of_sheet3" onkeyup="endnum(this);"></td>
                                    <td><input type="text" size="12" id="end_num3" readonly></td>
                                    <td>
                                    	<input type="text" size="12" id="giro_code3" style="width:90px;background: #ffffcc;" maxlength="6">
                                        <img src="${ctx }/resources/image/icon/search.gif" alt="검색버튼">
                                    </td>
                                    <td><input type="text" size="12" id="amount3" readonly ></td>
                                </tr>
                            </tbody>
                        </table>
                        
                        <div class="posi30 check">
                            <div>
                                <img src="${ctx }/resources/image/bg/check.png" alt="수표 견본">
                            </div>
                        </div>
                        
                    </div><!--End of info01 inner02 0002-->
                  </div><!--End of info01 title2 0002-->
              </div><!--End of info01 0002-->
              
              <div class="info02-wrap-0002">
                <div class="info02-title1-0002">
                    <H4>의뢰인정보</H4>
                    <div class="info02-inner01-0002">
                        <table>
                            <caption>의뢰인정보 입니다. 의뢰인의 성명과 계좌번호, 통장표기,의뢰인과의 관계, 대리인 실명번호로 구성되어있습니다.</caption>
                            <colgroup>
                                <col style="width:20%">
                                <col style="width:30%">
                                <col style="width:20%">
                                <col style="width:30%">
                            </colgroup>
                    
                            <tbody>
                                <tr>
                                    <th><span class="note6 pointer">(*)의뢰인 성명</span></th>
                                    <td><input type="text" id="client_name" style="background:#ffffcc;"></td>
                                    <th><span class="note4 pointer">(*)의뢰인실명번호</span></th>
                                    <td><input type="text" id="client_num" style="background:#ffffcc;"></td>
                                </tr>
                                <tr>
                                    <th><span class="note7 pointer">(*)통장표기</span></th>
                                    <td><input type="text" id="summary"></td>
                                    <th>의뢰인과의 관계</th>
                                    <td>
                                        <select title="의뢰인과의 관계" id="client_relation" onchange="relationshipAccountHolder();">
                                            <option value="01">01:본인</option>
                                            <option value="02">02:대리인</option>
                                    	</select>
                                    </td>
                                </tr>
                                <tr>
                                    <th class="ones" style="display:none">대리인 성명</th>
                                    <td class="ones" style="display:none"><input type="text" id="sub_name"></td>
                                    <th class="ones" style="display:none"><span class="note8 pointer">(*)대리인실명번호</span></th>
                                    <td class="ones" style="display:none">
                                        <input type="text" id="sub_num" style="width:120px">
                                        <img src="${ctx }/resources/image/icon/search.gif" alt="대리인실명번호검색">
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div><!--End of info02 inner01 wrap 0002-->
                    
                    <div class="comment2 posi15">
                        <div class="close pointer"><img src="${ctx }/resources/image/icon/close.png" alt="닫기"></div>
                        <div class="comt2">
                            <h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;의뢰인 실명번호</h5><br><br>
                            <p>무통장거래시 고객이 적은 전표를 보고 의뢰인 실명번호를 적습니다. 통장거래시 입력하지 않습니다.</p>
                        </div>
                    </div>
                    <div class="comment2 posi16">
                        <div class="close pointer"><img src="${ctx }/resources/image/icon/close.png" alt="닫기" ></div>
                        <div class="comt2">
                            <h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;의뢰인 성명</h5><br><br>
                            <p>무통장거래시 고객이 적은 전표를 보고 의뢰인 성명을 적습니다. 통장거래시 입력하지 않습니다.</p>
                        </div>
                    </div>
                    <div class="comment2 posi17">
                        <div class="close pointer"><img src="${ctx }/resources/image/icon/close.png" alt="닫기" ></div>
                        <div class="comt2">
                            <h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;통장 표기</h5><br><br>
                            <p>고객이 통장에 문구기재를 요청하시는 경우 적습니다. 통장표기란에 적은 내용은 입금시 수취인의 통장에 표기됩니다.</p>
                        </div>
                    </div>
                    <div class="comment2 posi18">
                        <div class="close pointer"><img src="${ctx }/resources/image/icon/close.png" alt="닫기" ></div>
                        <div class="comt2">
                            <h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;대리인 실명번호</h5><br><br>
                            <p>대리인 거래시에는 전표에 대리인 정보를 받고, 전산에도 대리인 실명번호를 입력합니다.</p>
                        </div>
                    </div>
                    
                </div><!--End of info02 title1 0002-->
                    
                <div class="info02-title2-0002">
                    <h4>송금수수료</h4>
                    <div class="info02-inner02-0002">
                        <table>
                            <caption>송금수수료 입니다. 수수료와 수수료 구분, 수수료 차감후입금 여부와 입금증과 영수증 발급 여부로 구성되어있습니다.</caption>
                            <colgroup>
                                <col style="width:30%">
                                <col style="width:20%">
                                <col style="width:35%">
                                <col style="width:15%">
                            </colgroup>
 
                            <tbody>
                                <tr>
                                    <th>수수료</th>
                                    <td>
                                        <img src="${ctx }/resources/image/icon/search.gif" width="20" height="20" alt="검색버튼">
                                        <input type="text" style="width:35px;background:#e5e5e5" readonly>
                                    </td>
                                    <th>수수료차감후입금</th>
                                    <td>
                                        <select  style="background:#e5e5e5" disabled="disabled">
                                            <option value="01" selected>&nbsp;</option>
                                            <option value="02">1: 예</option>
                                            <option value="03">2: 아니오</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <th>입금수수료구분</th>
                                    <td colspan="3">
                                        <select style="background:#e5e5e5" disabled="disabled">
                                            <option value="01" selected>&nbsp;</option>
                                            <option value="02">01: 당행계좌입금</option>
                                            <option value="03">02: 타행-10만원이하</option>
                                            <option value="04">02: 타행-100만원이하</option>
                                            <option value="05">02: 타행-100만원초과</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <th>입금증</th>
                                    <td>
                                        <select  style="background:#e5e5e5" disabled="disabled">
                                            <option value="01" selected>&nbsp;</option>
                                            <option value="02">1: 발급</option>
                                            <option value="03">2: 미발급</option>
                                        </select>
                                    </td>
                                    <th>영수증</th>
                                    <td>
                                        <select  style="background:#e5e5e5" disabled="disabled">
                                            <option value="01" selected>&nbsp;</option>
                                            <option value="02">1: 발급</option>
                                            <option value="03">2: 미발급</option>
                                        </select>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div><!--End of info02 inner02 0002-->
                  </div><!--End of info02 title2 0002-->
              </div><!--End of info02 wrap 0002-->
        
              <div class="btn_both">
                
                <div class="fr">
                    <input type="button" id="deposit" value="입금" >
                </div>
              </div>
                
              <div id="resultPopup" style="display:none">
		     	 <div class="head1"><p>처리 내역</p></div>
			     <table id="resultTable">
			        <colgroup><col style="width:30%"><col style="width:70%"></colgroup>
			    	<tbody></tbody>
			    </table>
			  </div>
              
            </div><!--End of tabs-->
        </div><!--End of contents-->
    </div><!--container-->


</body>

</html>