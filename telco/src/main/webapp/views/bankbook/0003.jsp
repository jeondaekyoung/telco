<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath }" scope="request" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>[0003] 지급</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="user-scalable=no, width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <meta name="apple-mobile-web-app-capable" content="yes">
	<link href="${ctx }/resources/css/common.css" type="text/css" rel="stylesheet">
	<link href="${ctx }/resources/css/media.css" type="text/css" rel="stylesheet">
	<link href="${ctx }/resources/css/study.css" type="text/css" rel="stylesheet">
	<link href="${ctx }/resources/css/avgrund.css" type="text/css" rel="stylesheet">

<script type="text/javascript" src="${ctx }/resources/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="${ctx }/resources/js/pop.js"></script>
<script type="text/javascript" src="${ctx }/resources/js/jquery.avgrund.js"></script>
<script type="text/javascript" src="${ctx }/resources/vjs/bankbook/0003.js"></script>
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
                <li class="nav_dir"><a href="#" class="nav_bold">&nbsp;&nbsp;&nbsp;지급</a></li>
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
            <h3>[0003] 지급 <img class="more" src="${ctx }/resources/image/icon/more.png" alt="코멘트"></h3>
            
            <div class="comment1">
                <div class="comt">
                    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <span class="hl">지급</span>업무는 고객으로부터 출금통장과 전표(청구서)를 받고, 전표 내용 대로 업무를 처리합니다. 통장과 전표의 인감이 일치하는지 확인해야 하고, 서명거래 시에는 신분증을 통해 본인이 맞는지 확인해야 합니다.
                    </p>
                </div>
            </div>
            
            <div id="tabs">
              <h4>계좌정보</h4>
              <div class="srch">
                  
                <div class="srch-inner-0004">
                    <ul style="width:auto">
                    	<li>계좌번호</li>
                    	<li><input type="text" id="account_num"  style="background:#ffffcc" ></li>
                        <li>
                        	<img src="${ctx }/resources/image/icon/search.png" id="findBankbookPay" alt="조회버튼"  style="cursor:pointer;">
                            <img src="${ctx }/resources/image/icon/ic.png" alt="계좌검색버튼">
                        </li>
                    </ul>
                    <ul style="width:auto">
                        <li>예금주</li>
                        <li><input type="text" id="customer_name" style="background:#ffffcc;" readonly  ></li>
                    </ul>
                    
                </div><!--End of srch-inner-0002-->
              </div><!--End of srch-0002-->

               <div class="info01-wrap-0002">
                <div class="info01-title1-0002">
                    
                    <h4>금액정보</h4>
                    <div class="info01-inner01-0002" style="padding: 21px 5px 12px">
                        <ul>
                            <li>
                                <span>현금</span>
                                <input type="text" name="cash" id="cash" class="isEssential" value="0" style="background: #ffffcc;" onkeyup="addSum();">
                            </li>
                            <li>
                                <span>순대체</span>
                                <input type="text" name="check_alternative" id="check_alternative" value="0" readonly="readonly">
                            </li>
                            <li>
                                <span>연동대체</span>
                                <input type="text" name="bank_alternative" id="bank_alternative" value="0" readonly="readonly" >
                            </li>
                        </ul>
                        <ul class="sum"><li>합계</li>
                            <li><input name="balance" id="balance" type="text" value="0" readonly="readonly" ></li>
                        </ul>
                    </div><!--End of info01-inner01-0002-->
                </div><!--End of info01-title1-0002-->
                    
                <div class="info01-title2-0002">
                    <h4>추가정보</h4>
                    <div class="info01-inner02-0003">
                        <table>
                            <caption></caption>
                            <colgroup>
                                <col style="width:25%">
                                <col style="width:25%">
                                <col style="width:25%">                                
                                <col style="width:25%">
                            </colgroup>
                            <tbody>
                                <tr><th><span class="note2 pointer">(*)비밀번호</span></th>
                                    <td><input type="text" class="isEssential" id="bankbook_pw" style="background:#ffffcc" ></td>
                                    <th>지급가능 금액</th>
                                    <td><input  type="text" id="nowBalance" ></td>
                                </tr>
                                <tr>
                                    <th>통장표기</th>
                                    <td colspan="3"><input type="text" id="summary"></td>
                                </tr>
                            </tbody>
                        </table>
                        
                        <div class="comment2 posi56">
                            <div class="close pointer"><img src="${ctx }/resources/image/icon/close.png" alt="닫기" ></div>
                            <div class="comt2">
                                <h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;비밀번호</h5><br><br>
                                <p>예금의 지급 시에는 손님께서 직접 PIN패드를 통해 비밀번호를 입력해야 합니다.</p>
                            </div>
                        </div>
                        
                    </div><!--End of info01-inner02-0002-->
                  </div><!--End of info01-title2-0002-->
              </div><!--End of info01-0002-->

              <h4>수표발행/입금/송금</h4>
              <div class="info02-wrap-0004">
                 <div class="info02-inner-0004">
                    <table>
                        <caption>수표 입력테이블</caption>
                        <colgroup>
                            <col style="width:5%;">
                            <col style="width:5%;" >
                            <col style="width:9%;" >
                            <col style="width:9%;" >
                            <col style="width:5%;" >
                            <col style="width:5%;" >
                            <col style="width:9%;" >
                            <col style="width:9%;" >
                            <col style="width:5%;" >
                            <col style="width:5%;" >
                            <col style="width:9%;">
                            <col style="width:9%;">
                            <col style="width:5%;">
                            <col style="width:5%;">
                            <col style="width:5%;">
                            <col style="width:5%;">
                        </colgroup>

                        <tbody>
                            <tr>
                                <th rowspan="3"><span class="note4 pointer">(*)<br>자기앞<br>수표<br>발행</span></th>
                                <th>채번</th>
                                <th colspan="2">단위금액</th>
                                <th>매수</th>
                                <th>채번</th>
                                <th colspan="2">단위금액</th>
                                <th>매수</th>
                                <th>채번</th>
                                <th colspan="2">단위금액</th>
                                <th>매수</th>
                                <th>합계</th>
                                <td colspan="2"><input type="text" style="background:#e5e5e5" readonly="readonly"></td>
                            </tr>
                            <tr>
                                <td><input type="text" name="case1" id="check_no1" maxlength="4"></td>
                                <td colspan="2">
                                	<select name="case1" id="check_amount1" onchange="endnum(this);">
                                			<option value="01" selected>01: 10만원권자기앞수표</option>
                                            <option value="02">02: 30만원권자기앞수표</option>
                                            <option value="03">03: 50만원권자기앞수표</option>
                                            <option value="04">04: 100만원권자기앞수표</option>
                                        </select>
                                </td>
                                <td><input type="text" name="case1" id="number_of_sheet1" onkeyup="endnum(this);" maxlength="5"></td>
                                <td><input type="text" name="case2" id="check_no2" maxlength="4"></td>
                                <td colspan="2">
                                	<select name="case2" id="check_amount2" onchange="endnum(this);">
                                			<option value="01" selected>01: 10만원권자기앞수표</option>
                                            <option value="02">02: 30만원권자기앞수표</option>
                                            <option value="03">03: 50만원권자기앞수표</option>
                                            <option value="04">04: 100만원권자기앞수표</option>
                                        </select>
                                </td>
                                <td><input type="text" name="case2" id="number_of_sheet2" onkeyup="endnum(this);" maxlength="5"></td>
                                <td><input type="text" name="case3" id="check_no3" maxlength="4"></td>
                                <td colspan="2">
                                	<select name="case3" id="check_amount3" onchange="endnum(this);">
                                		<option value="01" selected>01: 10만원권자기앞수표</option>
                                       	<option value="02">02: 30만원권자기앞수표</option>
                                       	<option value="03">03: 50만원권자기앞수표</option>
                                       	<option value="04">04: 100만원권자기앞수표</option>
                                    </select>
                                </td>
                                <td><input type="text" name="case3" id="number_of_sheet3" onkeyup="endnum(this);" maxlength="5"></td>
                                <th colspan="2"><span class="note5 pointer">(*)수수료처리</span></th>
                                <td><img src="${ctx }/resources/image/icon/search.gif" alt="검색버튼" style="cursor:default;"></td>
                            </tr>
                            <tr>
                                <td><input type="text" name="case4" id="check_no4" maxlength="4"></td>
                                <td colspan="2">
                                	<select name="case4" id="check_amount4" onchange="endnum(this);">
                                		<option value="01" selected>01: 10만원권자기앞수표</option>
                                        <option value="02">02: 30만원권자기앞수표</option>
                                        <option value="03">03: 50만원권자기앞수표</option>
                                        <option value="04">04: 100만원권자기앞수표</option>
                                    </select>
                                </td>
                                <td><input type="text" name="case4" id="number_of_sheet4" onkeyup="endnum(this);" maxlength="5"></td>
                                <td><input type="text" name="case5" id="check_no5" maxlength="4"></td>
                                <td colspan="2">
                                	<select name="case5" id="check_amount5" onchange="endnum(this);">
                            			<option value="01" selected>01: 10만원권자기앞수표</option>
                                        <option value="02">02: 30만원권자기앞수표</option>
                                        <option value="03">03: 50만원권자기앞수표</option>
                                        <option value="04">04: 100만원권자기앞수표</option>
                                    </select>
                                </td>
                                <td><input type="text" name="case5" id="number_of_sheet5" onkeyup="endnum(this);" maxlength="5"></td>
                                <th>합계</th>
                                <td colspan="3"><input type="text" id="totalAmount" onchange="addSum();" readonly ></td>
                                <td colspan="2">
                                	<select style="background:#e5e5e5" disabled="disabled">
                                	<option value="01" selected></option>
                                	</select>
                                </td>
                                <td><input type="text" style="background:#e5e5e5" disabled="disabled"></td>
                            </tr>
                            <tr>
                                <th>연동</th>
                                <th colspan="2">계좌번호</th>
                                <td colspan="2"><input type="text" id="telco_account_num" ></td>
                                <td colspan="2">
                                	<img src="${ctx }/resources/image/icon/search.gif" id="telcoFindBankbook" alt="검색버튼" style="cursor:pointer;">
                                	<input type="text" id="telco_customer_name" style="background:#ffffcc; width:75%;" readonly >
                                </td>
                                <th>통장표기</th>
                                <td colspan="2"><input type="text" id="telco_summary"></td>
                                <th>금액</th>
                                <td colspan="2">
                                	<input type="text" id="telco_trade_amount" onkeyup="addSum();">
                                </td>
                                <td colspan="2">
                                	<select style="background:#e5e5e5" disabled="disabled">
                               			<option value="01" selected>1: 현금</option>
                                	</select>                                	
                                </td>
                                <td><input type="text" style="background:#e5e5e5" disabled="disabled"></td>
                            </tr>
                            <tr>
                                <th>타행</th>
                                <td colspan="2">
                                	<select name="bankname" id="bankname" title="은행종류" style="background: #ffffcc;" >
		                                <option value="국민" selected>국민은행</option>
		                                <option value="우리">우리은행</option>
		                                <option value="신한">신한은행</option>
		                                <option value="기업">기업은행</option>
		                                <option value="하나">하나은행</option>
		                                <option value="농협중앙회">농협중앙회</option>
		                            </select>
	                            </td>
                                <td colspan="2"><input type="text" id="anot_account_num" ></td>
                                <td colspan="2">
                                	<img src="${ctx }/resources/image/icon/search.gif" alt="검색버튼" style="cursor:default;">
                                	<input type="text" id="anot_customer_name" style="background:#ffffcc; width:75%;" >
                                </td>
                                <th>통장표기</th>
                                <td colspan="2"><input type="text" id="anot_summary" ></td>
                                <th>금액</th>
                                <td colspan="2">
                                	<input type="text" id="anot_trade_amount" onkeyup="addSum();">                                    
                                </td>
                                <td colspan="2">
                                	<select style="background:#e5e5e5" disabled="disabled">
	                                	<option value="01" selected>1: 현금</option>
	                                </select>
	                            </td>
                                <td><input type="text" style="background:#e5e5e5" disabled="disabled"></td>
                            </tr>
                        </tbody>
                    </table>
                    
                     <div class="comment2 posi58">
                        <div class="close pointer"><img src="${ctx }/resources/image/icon/close.png" alt="닫기" ></div>
                        <div class="comt2">
                            <h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;자기앞수표발행</h5><br><br>
                            <p>고객이 자기앞수표로 지급요청 하는 경우 수표로 지급할 수 있습니다.<br>
                                미리 채번(자기앞수표를 발행할수 있도록 전산에 등록시키는 과정)된 수표 정보를 입력하여 수표를 발행, 고객에게 지급합니다.</p>
                        </div>
                    </div>
                     <div class="comment2 posi59">
                        <div class="close pointer"><img src="${ctx }/resources/image/icon/close.png" alt="닫기" ></div>
                        <div class="comt2">
                            <h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;수수료처리</h5><br><br>
                            <p>수표 발행, 및 타행 계좌로의 이체에는 은행별로 상이한 수수료가 붙습니다.
                                고객에게 수수료 발생 사실을 알리고 수수료를 받아야 합니다.</p>
                        </div>
                    </div>
                    
                 </div>
              </div>

              <div class="btn_both">
                <div class="fr">
                    <%-- <a href="#" onClick="window.open('${ctx}/views/bankbook/pop_0003.jsp','[0003]지급','width=400, height=400, location=no')" class="btn_big"></a> --%>
                    <input type="button" id="pay" value="지급" >
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