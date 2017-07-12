<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath }" scope="request" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
<title>[0004] 해지</title>
    <meta name="viewport" content="user-scalable=no, width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <meta name="apple-mobile-web-app-capable" content="yes">
	<link href="${ctx }/resources/css/common.css" type="text/css" rel="stylesheet">
	<link href="${ctx }/resources/css/media.css" type="text/css" rel="stylesheet">
	<link href="${ctx }/resources/css/study.css" type="text/css" rel="stylesheet">
	<script type="text/javascript" src="${ctx }/resources/js/jquery-1.11.3.min.js"></script>
	<script type="text/javascript" src="${ctx }/resources/js/pop.js"></script> 
    <script type="text/javascript" src="${ctx }/resources/vjs/bankbook/0004.js"></script>
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
                <li><a href="${ctx }/views/add/0070.jsp">&nbsp;&nbsp;&nbsp;주의사고 등록/해제</a></li>
                <li class="nav_dir"><a href="#" class="nav_bold">&nbsp;&nbsp;&nbsp;해지</a></li>
                <li><a href="${ctx }/views/add/1099.jsp">&nbsp;&nbsp;&nbsp;거래취소</a></li>
            </ul>
        </div>
        
        <input type="text" id="schoolName" readonly="readonly" value="${sessionScope.schoolName }" style="display:none">
        
        <div id="contents">
            <h3>[0004] 해지 <img class="more" src="${ctx }/resources/image/icon/more.png" alt="코멘트"></h3>
                    
            <div class="comment1">
                <div class="comt">
                    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <span class="hl">해지</span>는 계좌를 해지하고 잔액을 고객에게 지급하는 업무입니다.<br>해지 후 금액은 현금으로 지급하거나, 당행계좌 혹은 타행 계좌로 송금할 수 있습니다.
                    </p>
                </div>
            </div>
            
            <div id="tabs">
              <div class="srch">
                <div class="srch-inner-0004">
                    
                    <ul>
                    	<li>계좌번호</li>
                    	<li><input type="text" id="account_num" style="background:#ffffcc;"></li>
                        <li><img src="${ctx }/resources/image/icon/search.png" alt="조회버튼" id="findBankbookPay" style="cursor: pointer;"></li>
                        <li><img src="${ctx }/resources/image/icon/ic.png" alt="계좌검색버튼"></li>
                    </ul>
                	<ul>
                        <li>예금주</li>
                    	<li><input type="text" id="customer_name" size="10"  style="background:#ffffcc;" readonly="readonly"></li></ul>
                    <ul>
                        <li>해지구분</li>
                    	<li>
                            <select  title="해지구분" id="cancel_message" >
                                <option value="00" selected>00: 일반해지</option>
                            </select>
                        </li></ul>
                    <ul>
                        <li><span class="note1 pointer">(*)통장발행번호</span></li>
                    	<li><input type="text" size="10" style="background:#e5e5e5;" readonly="readonly"></li></ul>
                    
                    <div class="comment2 posi62">
                        <div class="close pointer"><img src="${ctx }/resources/image/icon/close.png" alt="닫기" ></div>
                        <div class="comt2">
                            <h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;통장발행번호</h5><br><br>
                            <p>각 계좌별 발급된 통장의 일련번호로, 이월재발행 등 통장을 재발행 할때마다 번호가 새로 부여됩니다.</p>
                        </div>
                    </div>
                    
                </div><!--End of srch-inner-0002-->
              </div><!--End of srch-0002-->
                
              <h4>해지 정보</h4>
              <div class="info01-wrap-1401">
                    <div class="info01-inner-0004">
                        <table>
                            <caption></caption>
                            <colgroup>
                                <col style="width:16%">
                                <col style="width:16%">
                                <col style="width:16%">
                                <col style="width:16%">
                                <col style="width:16%">
                                <col style="width:16%">
                            </colgroup>
                            <tbody>
                                <tr><th>해지원금</th>
                                    <td><input type="text"  readonly="readonly" id="nowBalance"></td>
                                    <th>현금</th>
                                    <td><input type="text" id="cash" class="isEssential" value="0" style="background:#ffffcc;" onkeyup="addSum();"></td>
                                    <th>비밀번호</th>
                                    <td><input type="text" id="bankbook_pw" style="background:#ffffcc;"></td>
                                </tr>
                                <tr><th>해지 예상금액</th>
                                    <td><input type="text"  readonly="readonly" id="nowBalance1"></td>
                                    <th>순대체</th>
                                    <td><input type="text" id="check_alternative" value="0" readonly="readonly"></td>
                                    <th>해지사유</th>
                                    <td><select  title="해지사유" id="cancel_why_sepa">
                                            <option value="01" selected="selected">01: 주택자금</option>
                                            <option value="02">02: 가계자금</option>
                                            <option value="03">03: 결혼자금</option>
                                            <option value="04">04: 자녀학비</option>
                                            <option value="05">05: 사업자금</option>
                                            <option value="06">06: 투자자금</option>
                                            <option value="07">07: 대출금상환</option>
                                            <option value="08">08: 당행재예치</option>
                                            <option value="09">09: 타금융기관예치</option>
                                            <option value="10">10: 이사</option>
                                            <option value="11">11: 청약지역변경용</option>
                                            <option value="12">12: 청약변형변경용</option>
                                            <option value="13">13: 청약부금재신규</option>
                                            <option value="14">14: 청약저축당첨</option>
                                            <option value="15">15: 강제해지(당좌,가계당좌)</option>
                                            <option value="99">99: 기타</option>
                                          </select>
                                    </td>
                                </tr>
                                <tr>
                                    <th>연동대체</th>
                                    <td><input type="text" id="bank_alternative" value="0" readonly="readonly"></td>
                                    <th><span class="note3 pointer">(*)적요</span></th>
                                    <td><input type="text" id="summary" ></td>
                                </tr>
                            </tbody>
                        </table>
                        
                        <div class="comment2 posi64">
                            <div class="close pointer"><img src="${ctx }/resources/image/icon/close.png" alt="닫기" ></div>
                            <div class="comt2">
                                <h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;해지사유, 적요</h5><br><br>
                                <p>해지 시 고객에게 들은 사유를 기반으로 해지 사유을 선택하고, 기타 메모할 내용은 적요 칸에 입력합니다</p>
                            </div>
                        </div>
                        
                    </div>
              </div><!--End of info01-wrap-1401-->

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
                                        </select></td>
                                <td><input type="text" name="case1" id="number_of_sheet1" onkeyup="endnum(this);" maxlength="5"></td>
                                <td><input type="text" name="case2" id="check_no2" maxlength="4"></td>
                                <td colspan="2">
                                	<select name="case2" id="check_amount2" onchange="endnum(this);">
                                			<option value="01" selected>01: 10만원권자기앞수표</option>
                                            <option value="02">02: 30만원권자기앞수표</option>
                                            <option value="03">03: 50만원권자기앞수표</option>
                                            <option value="04">04: 100만원권자기앞수표</option>
                                        </select></td>
                                <td><input type="text" name="case2" id="number_of_sheet2" onkeyup="endnum(this);" maxlength="5"></td>
                                <td><input type="text" name="case3" id="check_no3" maxlength="4"></td>
                                <td colspan="2">
                                	<select name="case3" id="check_amount3" onchange="endnum(this);">
                                		<option value="01" selected>01: 10만원권자기앞수표</option>
                                       	<option value="02">02: 30만원권자기앞수표</option>
                                       	<option value="03">03: 50만원권자기앞수표</option>
                                       	<option value="04">04: 100만원권자기앞수표</option>
                                    </select></td>
                                <td><input type="text" name="case3" id="number_of_sheet3" onkeyup="endnum(this);" maxlength="5"></td>
                                
                                <th colspan="2">수수료처리</th>
                                <td><img src="${ctx }/resources/image/icon/search.gif" alt="검색버튼" style="cursor: default;"></td>
                            </tr>
                            <tr>
                                <td><input type="text" name="case4" id="check_no4" maxlength="4"></td>
                                <td colspan="2">
                                	<select name="case4" id="check_amount4" onchange="endnum(this);">
                                		<option value="01" selected>01: 10만원권자기앞수표</option>
                                        <option value="02">02: 30만원권자기앞수표</option>
                                        <option value="03">03: 50만원권자기앞수표</option>
                                        <option value="04">04: 100만원권자기앞수표</option>
                                    </select></td>
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
                                <td><input type="text"  style="background:#e5e5e5" disabled="disabled"></td>
                            </tr>
                            <tr>
                                <th>연동</th>
                                <th colspan="2">계좌번호</th>
                                <td colspan="2"><input type="text"  id="telco_account_num"></td>
                                <td colspan="2">
                                	<img src="${ctx }/resources/image/icon/search.gif" id="telcoFindBankbook" alt="검색버튼" >
                                	<input type="text"  id="telco_customer_name"style="background:#ffffcc; width:75%;" readonly>
                                </td>
                                <th>통장표기</th>
                                <td colspan="2"><input type="text" id="telco_summary"></td>
                                
                                <th>금액</th>
                                <td colspan="2">
                                    <input type="text"  id="telco_trade_amount" onkeyup="addSum();"></td>
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
                                <td colspan="2"><input type="text"  id="anot_account_num"></td>
                                <td colspan="2"><img src="${ctx }/resources/image/icon/search.gif" alt="검색버튼">
                                	<input type="text"  id="anot_customer_name" style="background:#ffffcc; width:75%;" ></td>
                                
                                <th>통장표기</th>
                                <td colspan="2"><input type="text"  id="anot_summary"></td>
                                
                                <th>금액</th>
                                <td colspan="2">
                                    <input type="text" id="anot_trade_amount" onkeyup="addSum();">
                                </td>
                                <td colspan="2">      
                                    <select style="background: #e5e5e5;" disabled="disabled">
                                    	<option value="01" selected>1: 현금</option>
									</select>                                
                                </td>
                                <td><input type="text" style="background:#e5e5e5" disabled="disabled"></td>
                            </tr>
                        </tbody>
                    </table>
                    
                     <div class="comment2 posi65">
                        <div class="close pointer"><img src="${ctx }/resources/image/icon/close.png" alt="닫기" ></div>
                        <div class="comt2">
                            <h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;자기앞수표발행</h5><br><br>
                            <p>고객이 자기앞수표로 지급요청 하는 경우 수표로 지급할 수 있습니다.<br>
                                미리 채번(자기앞수표를 발행할수 있도록 전산에 등록시키는 과정)된 수표 정보를 입력하여 수표를 발행, 고객에게 지급합니다.</p>
                        </div>
                    </div>
                    
                 </div>
              </div>
                
              

              <div class="btn_both">
                <div class="fr">
                    <!-- <a onClick="window.open('popup/pop_0004.html','[0004]해지 등록','width=400, height=4300, location=no')" class="btn_big"></a> -->
                    <input type="button" id="cancel" value="해지" >
                </div>
              </div>

            </div><!--End of tabs-->
        </DIV><!--End of contents-->
    </div><!--container-->

</body>
</html>