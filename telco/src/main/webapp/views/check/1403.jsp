<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath }" scope="request" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>[1403] 자기앞수표지급</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
    <meta name="viewport" content="user-scalable=no, width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <meta name="apple-mobile-web-app-capable" content="yes">
	<link href="${ctx }/resources/css/common.css" type="text/css" rel="stylesheet">
	<link href="${ctx }/resources/css/media.css" type="text/css" rel="stylesheet">
	<link href="${ctx }/resources/css/avgrund.css" type="text/css" rel="stylesheet">
	
    <script type="text/javascript" src="${ctx }/resources/js/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="${ctx }/resources/js/jquery.avgrund.js"></script>
    <script type="text/javascript" src="${ctx }/resources/vjs/check/1403.js"></script>
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
                <li class="nav_dir"><a href="#" class="nav_bold">&nbsp;&nbsp;&nbsp;자기앞수표 지급</a></li>
				<li><a href="${ctx }/views/add/1821.jsp">&nbsp;&nbsp;&nbsp;타행수표 즉시지급거래</a></li>
                <li><a href="${ctx }/views/add/0007.jsp">&nbsp;&nbsp;&nbsp;사고신고관리</a></li>
                <li><a href="${ctx }/views/add/0070.jsp">&nbsp;&nbsp;&nbsp;주의사고 등록/해제</a></li>
                <li><a href="${ctx }/views/bankbook/0004.jsp">&nbsp;&nbsp;&nbsp;해지</a></li>
                <li><a href="${ctx }/views/add/1099.jsp">&nbsp;&nbsp;&nbsp;거래취소</a></li>
            </ul>
        </div>
        
        <input type="text" id="schoolName" readonly="readonly" value="${sessionScope.schoolName }" style="display:none">
        
        <div id="contents">
            <h3>[1403] 자기앞수표지급</h3>
            
            <div id="tabs">
              <div class="srch">
                <div class="srch-inner-1401">
                    <ul><li>지급구분</li></ul>
                    <ul><li>
                        <select title="지급구분" style="background:#ffffcc;">
                            <option>301: 일반지급</option>
                            <option>302: 교환지급</option>
                            <option>303: 추심지급</option>
                            <option>304: 제권판결지급</option>
                            <option>305: 제권판결이전지급</option>
                            <option>306: 잡익지급</option>
                            </select>
                    </li></ul>
                </div><!--End of srch-inner-0002-->
              </div><!--End of srch-0002-->
              
                
              <h4>수표정보</h4>
              <div class="info01-wrap-0070">
                <div class="info01-inner01-0010" style="border:none; padding:30px 0 0 8px;">
                    <table>
                        <caption>자기앞수표지급 조회 상세내용</caption>
                        <colgroup>
                            <col style="width:5%" >
                            <col style="width:20%" >
                            <col style="width:10%" >
                            <col style="width:15%" >
                            <col style="width:15%" >
                            <col style="width:15%" >
                            <col style="width:10%" >
                        </colgroup>
                        <thead>
                            <tr>
                                <th>순번</th>
                                <th>단위금액</th>
                                <th>매수</th>
                                <th>시작번호</th>
                                <th>최종번호</th>
                                <th>발행금액</th>
                                <th>지로코드</th>
                            </tr>
                        </thead>
                        <tfoot>
                            <tr>
                                <td colspan="4"></td>
                                <th>총금액</th>
                                <td><input type="text" id="totalAmount" readonly style="background-color:#EBEBE4;"></td>
                                <td></td>
                            </tr>
                        </tfoot>
                        <tbody>
                            <tr><th>1</th>
                                <td>
                                	<select name="case1" id="check_sepa1" onchange="endnum(this);">
                                		<option value="01" selected>01: 10만원권자기앞수표</option>
                                        <option value="02">02: 30만원권자기앞수표</option>
                                        <option value="03">03: 50만원권자기앞수표</option>
                                        <option value="04">04: 100만원권자기앞수표</option>
                                    </select><input type="hidden" id="case1" value="output">
                                </td>
                                <td><input type="text" name="case1" id="number_of_sheet1" maxlength="5" onkeyup="endnum(this);"></td>
                                <td><input type="text" name="case1" id="start_num1" onkeyup="endnum(this);" maxlength="7"></td>
                                <td><input type="text" id="end_num1" readonly style="background-color:#EBEBE4;"></td>
                                <td><input type="text" id="amount1" readonly style="background-color:#EBEBE4;"></td>
                                <td><input type="text" id="giro_code1" maxlength="6"></td>
                                
                            </tr>
                            <tr><th>2</th>
                                <td>
                                	<select name="case2" id="check_sepa2" onchange="endnum(this);">
                                		<option value="01" selected>01: 10만원권자기앞수표</option>
                                        <option value="02">02: 30만원권자기앞수표</option>
                                        <option value="03">03: 50만원권자기앞수표</option>
                                        <option value="04">04: 100만원권자기앞수표</option>
                                    </select><input type="hidden" id="case2" value="output">
                                </td>
                                <td><input type="text" name="case2" id="number_of_sheet2" maxlength="5" onkeyup="endnum(this);"></td>
                                <td><input type="text" name="case2" id="start_num2" onkeyup="endnum(this);" maxlength="7"></td>
                                <td><input type="text" id="end_num2" readonly style="background-color:#EBEBE4;"></td>
                                <td><input type="text" id="amount2" readonly style="background-color:#EBEBE4;"></td>
                                <td><input type="text" id="giro_code2" maxlength="6"></td>
                                
                            </tr>
                            <tr><th>3</th>
                                <td>
                                	<select name="case3" id="check_sepa3" onchange="endnum(this);">
                                		<option value="01" selected>01: 10만원권자기앞수표</option>
                                        <option value="02">02: 30만원권자기앞수표</option>
                                        <option value="03">03: 50만원권자기앞수표</option>
                                        <option value="04">04: 100만원권자기앞수표</option>
                                    </select><input type="hidden" id="case3" value="output">
                                </td>
                                <td><input type="text" name="case3" id="number_of_sheet3" maxlength="5" onkeyup="endnum(this);"></td>
                                <td><input type="text" name="case3" id="start_num3" onkeyup="endnum(this);" maxlength="7"></td>
                                <td><input type="text" id="end_num3" readonly style="background-color:#EBEBE4;"></td>
                                <td><input type="text" id="amount3" readonly style="background-color:#EBEBE4;"></td>
                                <td><input type="text" id="giro_code3" maxlength="6"></td>
                                
                            </tr>
                            <tr><th>4</th>
                                <td>
                                	<select name="case4" id="check_sepa4" onchange="endnum(this);">
                                		<option value="01" selected>01: 10만원권자기앞수표</option>
                                        <option value="02">02: 30만원권자기앞수표</option>
                                        <option value="03">03: 50만원권자기앞수표</option>
                                        <option value="04">04: 100만원권자기앞수표</option>
                                    </select><input type="hidden" id="case4" value="output">
                                </td>
                                <td><input type="text" name="case4" id="number_of_sheet4" maxlength="5" onkeyup="endnum(this);"></td>
                                <td><input type="text" name="case4" id="start_num4" onkeyup="endnum(this);" maxlength="7"></td>
                                <td><input type="text" id="end_num4" readonly style="background-color:#EBEBE4;"></td>
                                <td><input type="text" id="amount4" readonly style="background-color:#EBEBE4;"></td>
                                <td><input type="text" id="giro_code4" maxlength="6"></td>
                              
                            </tr>
                            <tr><th>5</th>
                                <td>
                                	<select name="case5" id="check_sepa5" onchange="endnum(this);">
                                		<option value="01" selected>01: 10만원권자기앞수표</option>
                                        <option value="02">02: 30만원권자기앞수표</option>
                                        <option value="03">03: 50만원권자기앞수표</option>
                                        <option value="04">04: 100만원권자기앞수표</option>
                                    </select><input type="hidden" id="case5" value="output">
								</td>
                                <td><input type="text" name="case5" id="number_of_sheet5" maxlength="5" onkeyup="endnum(this);"></td>
                                <td><input type="text" name="case5" id="start_num5" onkeyup="endnum(this);" maxlength="7"></td>
                                <td><input type="text" id="end_num5" readonly style="background-color:#EBEBE4;"></td>
                                <td><input type="text" id="amount5" readonly style="background-color:#EBEBE4;"></td>
                                <td><input type="text" id="giro_code5" maxlength="6"></td>
                               
                            </tr>
                        </tbody>
                    </table>
                </div><!--End of info01-inner02-1401-->
              </div><!--End of info01-wrap-1401-->
                  
              <div class="info01-wrap-0002">
                <div class="info01-title1-0002 info1403-money" style="width:38.5%">
                    <h4>금액정보</h4>
                    <div class="info01-inner01-0002" style="padding:15px 5px 0">
                        <ul>
                            <li>
                                <span>현금</span>
                                <input type="text" id="cash" value="0" style="width:50%; background: #ffffcc;" onkeyup="addSum();">
                            </li>
                            <li>
                                <span>순대체</span>
                                <input type="text" id="check_alternative" value="0" style="width:50%;" readonly="readonly">
                            </li>
                            <li>
                                <span>연동대체</span>
                                <input type="text" id="bank_alternative" value="0" style="width:50%;" readonly="readonly">
                            </li>
                        </ul>
                        <ul class="sum"><li>합계</li>
                            <li><input  type="text" id="totalCash" value="0" readonly="readonly" style="width:47%;" ></li>
                        </ul>
                    </div><!--End of info01 inner01 0002-->
                </div><!--End of info01 title1 0002-->  
                  
                <div class="info02-title1-0002 info1403-custom" style="margin-left:10px">
                    <H4>의뢰인정보</H4>
                    <div class="info02-inner01-0002" style="padding:41px 5px">
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
                                    <th>의뢰인실명번호</th>
                                    <td><input type="text" id="client_realname_num"></td>
                                    <th>의뢰인 성명</th>
                                    <td><input type="text" id="client_name"></td>
                                </tr>
                                <tr>
                                    <th>의뢰인과의 관계</th>
                                    <td>
                                        <select title="의뢰인과의 관계" id="client_relation" onchange="relationshipAccountHolder();">
                                            <option value="01" selected>01: 본인</option>
                                            <option value="02">2: 대리인</option>
                                    </select></td>
                                </tr>
                                <tr>
                                    <th class="ones" style="display:none">대리인실명번호</th>
                                    <td class="ones" style="display:none"><input  type="text" id="sub_num"></td>
                                    <th class="ones" style="display:none">대리인성명</th>
                                    <td class="ones" style="display:none"><input type="text" id="sub_name"></td>
                                </tr>
                            </tbody>
                            
                            
                        </table>
                    </div><!--End of info02 inner01 wrap 0002-->
                </div><!--End of info02 title1 0002-->
              </div>

			  <h4>수표발행/입금/송금</h4>
              <div class="info02-wrap-0004">
                 <div class="info02-inner-0004">
                    <table>
                        <caption>수표 입력테이블</caption>
                        <colgroup>
                            <col style="width:5%;" >
                            <col style="width:5%;" >
                            <col style="width:9%;" >
                            <col style="width:9%;" >
                            <col style="width:5%;" >
                            <col style="width:5%;" >
                            <col style="width:9%;" >
                            <col style="width:9%;" >
                            <col style="width:5%;" >
                            <col style="width:5%;" >
                            <col style="width:9%;" >
                            <col style="width:9%;" >
                            <col style="width:5%;" >
                            <col style="width:5%;" >
                            <col style="width:5%;" >
                            <col style="width:5%;" >
                        </colgroup>
                        <tbody>
                            <tr>
                                <th rowspan="3">자기앞<br>수표<br>발행</th>
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
                                <td colspan="2"><input type="text" style="background:#e5e5e5" disabled="disabled"></td>
                            </tr>
                            <tr>
                                <td><input type="text" name="case11" id="check_no11" maxlength="4"></td>
                                <td colspan="2">
                                	<select name="case11" id="check_sepa11" onchange="checkAlternative();">
                            			<option value="01" selected>01: 10만원권자기앞수표</option>
                                        <option value="02">02: 30만원권자기앞수표</option>
                                        <option value="03">03: 50만원권자기앞수표</option>
                                        <option value="04">04: 100만원권자기앞수표</option>
                                    </select>
                                </td>
                                <td><input type="text" name="case11" id="number_of_sheet11" onkeyup="checkAlternative();" maxlength="5"></td>
                                <td><input type="text" name="case12" id="check_no12" maxlength="4"></td>
                                <td colspan="2">
                                	<select name="case12" id="check_sepa12" onchange="checkAlternative();">
                            			<option value="01" selected>01: 10만원권자기앞수표</option>
                                        <option value="02">02: 30만원권자기앞수표</option>
                                        <option value="03">03: 50만원권자기앞수표</option>
                                        <option value="04">04: 100만원권자기앞수표</option>
                                    </select>
                                </td>
                                <td><input type="text"  name="case12" id="number_of_sheet12" onkeyup="checkAlternative();" maxlength="5"></td>
                                <td><input type="text" name="case13" id="check_no13" maxlength="4"></td>
                                <td colspan="2">
                                	<select name="case13" id="check_sepa13" onchange="checkAlternative();">
                                		<option value="01" selected>01: 10만원권자기앞수표</option>
                                       	<option value="02">02: 30만원권자기앞수표</option>
                                       	<option value="03">03: 50만원권자기앞수표</option>
                                       	<option value="04">04: 100만원권자기앞수표</option>
                                    </select>
                                </td>
                                <td><input type="text" name="case13" id="number_of_sheet13" onkeyup="checkAlternative();" maxlength="5"></td>
                                <th colspan="2">수수료처리</th>
                                <td><img src="${ctx }/resources/image/icon/search.gif" alt="검색버튼" style="cursor:default;"></td>
                            </tr>
                            <tr>
                                <td><input type="text" name="case14" id="check_no14" maxlength="4"></td>
                                <td colspan="2">
                                	<select name="case14" id="check_sepa14" onchange="checkAlternative();">
                                		<option value="01" selected>01: 10만원권자기앞수표</option>
                                        <option value="02">02: 30만원권자기앞수표</option>
                                        <option value="03">03: 50만원권자기앞수표</option>
                                        <option value="04">04: 100만원권자기앞수표</option>
                                    </select>
                                </td>
                                <td><input type="text" name="case14" id="number_of_sheet14" onkeyup="checkAlternative();" maxlength="5"></td>
                                <td><input type="text" name="case15" id="check_no15" maxlength="4"></td>
                                <td colspan="2">
                                	<select name="case15" id="check_sepa15" onchange="checkAlternative();">
                            			<option value="01" selected>01: 10만원권자기앞수표</option>
                                        <option value="02">02: 30만원권자기앞수표</option>
                                        <option value="03">03: 50만원권자기앞수표</option>
                                        <option value="04">04: 100만원권자기앞수표</option>
                                    </select>
                                </td>
                                <td><input type="text"  name="case15" id="number_of_sheet15" onkeyup="checkAlternative();" maxlength="5"></td>
                                <th>합계</th>
                                <td colspan="3"><input type="text"  id="totalCheck" readonly></td>
                                <td colspan="2">
                                	<select style="background:#e5e5e5" disabled="disabled">
                                		<option value="01" selected></option>
                                	</select>
                                </td>
                                <td><input type="text"  style="background:#e5e5e5" disabled="disabled" readonly></td>
                            </tr>
                            <tr>
                                <th>연동</th>
                                <th colspan="2">계좌번호</th>
                                <td colspan="2"><input type="text" id="telco_account_num"></td>
                                <td colspan="2" style="text-align:left">
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
                                <td><input type="text"  style="background:#e5e5e5" disabled="disabled" readonly></td>
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
                                <td colspan="2"><input type="text" id="anot_account_num"></td>
                                <td colspan="2" style="text-align:left">
                                	<img src="${ctx }/resources/image/icon/search.gif" alt="검색버튼" style="cursor:default;">
                                	<input type="text" id="anot_customer_name" style="background:#ffffcc; width:75%;" >
                                </td>
                                <th>통장표기</th>
                                <td colspan="2"><input type="text" id="anot_summary"></td>
                                <th>금액</th>
                                <td colspan="2">
                                	<input type="text" id="anot_trade_amount" onkeyup="addSum();">
                                </td>
                                <td colspan="2">
                                	<select style="background:#e5e5e5" disabled="disabled">
	                                	<option value="01" selected>1: 현금</option>
	                                </select>
                                </td>
                                <td><input type="text" style="background:#e5e5e5" disabled="disabled" readonly></td>
                            </tr>
                        </tbody>
                    </table>
                 </div>
              </div>
            
              <div class="btn_both">
                <div class="fr">
                    <input type="button" id="payment" value="지급">
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