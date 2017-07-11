<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath }" scope="request" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>[1402] 자기앞수표발행</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
    <meta name="viewport" content="user-scalable=no, width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <meta name="apple-mobile-web-app-capable" content="yes">
	<link href="${ctx }/resources/css/common.css" type="text/css" rel="stylesheet">
	<link href="${ctx }/resources/css/media.css" type="text/css" rel="stylesheet">
	<link href="${ctx }/resources/css/avgrund.css" type="text/css" rel="stylesheet">
	
    <script type="text/javascript" src="${ctx }/resources/js/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="${ctx }/resources/js/jquery.avgrund.js"></script>
    <script type="text/javascript" src="${ctx }/resources/vjs/check/1402.js"></script>
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
                <li class="nav_dir"><a href="#" class="nav_bold">&nbsp;&nbsp;&nbsp;자기앞수표 발행</a></li>
                <li><a href="${ctx }/views/check/1403.jsp">&nbsp;&nbsp;&nbsp;자기앞수표 지급</a></li>
				<li><a href="${ctx }/views/add/1821.jsp">&nbsp;&nbsp;&nbsp;타행수표 즉시지급거래</a></li>
                <li><a href="${ctx }/views/add/0007.jsp">&nbsp;&nbsp;&nbsp;사고신고관리</a></li>
                <li><a href="${ctx }/views/add/0070.jsp">&nbsp;&nbsp;&nbsp;주의사고 등록/해제</a></li>
                <li><a href="${ctx }/views/bankbook/0004.jsp">&nbsp;&nbsp;&nbsp;해지</a></li>
                <li><a href="${ctx }/views/add/1099.jsp">&nbsp;&nbsp;&nbsp;거래취소</a></li>
            </ul>
        </div>
        
        <div id="contents">
            <h3>[1402] 자기앞수표발행</h3>
            
            <div id="tabs">
              <div class="srch">
                <div class="srch-inner-1401">
                    <ul><li>거래종류</li></ul>
                    <ul><li>
                        <select title="거래종류"  onChange="javascripｔ:moveUrl(this);">
                            <option selected>201: 채번발행</option>
                            <option value="${ctx }/views/check/1402_2.jsp">221: 개별발행</option>
                        </select>
                    </li></ul>
                </div><!--End of srch-inner-0002-->
              </div><!--End of srch-0002-->
                
              <h4>발행정보</h4>
              <div class="info01-wrap-0070">
                <div class="info01-inner01-0010" style="border:none; padding:30px 0 0 8px;">
                    <table >
                        <caption>발행정보</caption>
                        <colgroup>
                            <col style="width:10%" >
                            <col style="width:20%">
                            <col style="width:25%" >
                            <col style="width:20%" >
                            <col style="width:25%" >
                        </colgroup>
                        <thead>
                            <tr>
                                <th>순번</th>
                                <th>채번번호</th>
                                <th>단위금액</th>
                                <th>매수</th>
                                <th>발행금액</th>
                            </tr>
                        </thead>
                        <tfoot>
                            <tr>
                                <td colspan="3">&nbsp;</td>
                                <th>총금액</th>
                                <td><input type="text" id="totalAmount" readonly style="background-color:#EBEBE4;"></td>
                            </tr>
                        </tfoot>
                        <tbody>
                            <tr><th>1</th>
                                <td><input type="text" name="case1" id="check_no1" maxlength="4"></td>
                                <td>
                                	<select name="case1" id="check_sepa1" onchange="endnum(this);">
                                		<option value="01" selected>01: 10만원권자기앞수표</option>
                                        <option value="02">02: 30만원권자기앞수표</option>
                                        <option value="03">03: 50만원권자기앞수표</option>
                                        <option value="04">04: 100만원권자기앞수표</option>
                                    </select><input type="hidden" id="case1" value="output">
                                </td>
                                <td><input type="text" name="case1" id="number_of_sheet1" maxlength="5" onkeyup="endnum(this);" ></td>
                                <td><input type="text" id="amount1" readonly style="background-color:#EBEBE4;"></td>
                               
                            </tr>
                            <tr><th>2</th>
                                <td><input type="text" name="case2" id="check_no2" maxlength="4"></td>
                                <td>
                                	<select name="case2" id="check_sepa2" onchange="endnum(this);">
                                		<option value="01" selected>01: 10만원권자기앞수표</option>
                                        <option value="02">02: 30만원권자기앞수표</option>
                                        <option value="03">03: 50만원권자기앞수표</option>
                                        <option value="04">04: 100만원권자기앞수표</option>
                                    </select><input type="hidden" id="case2" value="output">
                                </td>
                                <td><input type="text" name="case2" id="number_of_sheet2" maxlength="5" onkeyup="endnum(this);" ></td>
                                <td><input type="text" id="amount2" readonly style="background-color:#EBEBE4;"></td>
                                
                            </tr>
                            <tr><th>3</th>
                                <td><input type="text" name="case3" id="check_no3" maxlength="4"></td>
                                <td>
                                	<select name="case3" id="check_sepa3" onchange="endnum(this);" >
                                		<option value="01" selected>01: 10만원권자기앞수표</option>
                                        <option value="02">02: 30만원권자기앞수표</option>
                                        <option value="03">03: 50만원권자기앞수표</option>
                                        <option value="04">04: 100만원권자기앞수표</option>
                                    </select><input type="hidden" id="case3" value="output">
                                </td>
                                <td><input type="text" name="case3" id="number_of_sheet3" maxlength="5" onkeyup="endnum(this);" ></td>
                                <td><input type="text" id="amount3" readonly style="background-color:#EBEBE4;"></td>
                           
                            </tr>
                            <tr><th>4</th>
                                <td><input type="text" name="case4" id="check_no4" maxlength="4"></td>
                                <td>
                                	<select name="case4" id="check_sepa4" onchange="endnum(this);" >
                                		<option value="01" selected>01: 10만원권자기앞수표</option>
                                        <option value="02">02: 30만원권자기앞수표</option>
                                        <option value="03">03: 50만원권자기앞수표</option>
                                        <option value="04">04: 100만원권자기앞수표</option>
                                    </select><input type="hidden" id="case4" value="output">
                                </td>
                                <td><input type="text" name="case4" id="number_of_sheet4" maxlength="5" onkeyup="endnum(this);" ></td>
                                <td><input type="text" id="amount4" readonly style="background-color:#EBEBE4;"></td>
                            
                            </tr>
                            <tr><th>5</th>
                                <td><input type="text" name="case5" id="check_no5" maxlength="4"></td>
                                <td>
                                	<select name="case5" id="check_sepa5" onchange="endnum(this);">
                                		<option value="01" selected>01: 10만원권자기앞수표</option>
                                        <option value="02">02: 30만원권자기앞수표</option>
                                        <option value="03">03: 50만원권자기앞수표</option>
                                        <option value="04">04: 100만원권자기앞수표</option>
                                    </select><input type="hidden" id="case5" value="output">
                                </td>
                                <td><input type="text" name="case5" id="number_of_sheet5" maxlength="5" onkeyup="endnum(this);" ></td>
                                <td><input type="text" id="amount5" readonly style="background-color:#EBEBE4;"></td>
                            
                            </tr>
                        </tbody>
                    </table>
                </div><!--End of info01-inner02-1401-->
              </div><!--End of info01-wrap-1401-->
                  
              <div class="info01-wrap-0010">
                <div class="info01-title1-0010">
                    
                    <h4>발행금액 합계</h4>
                    <div class="info01-inner01-0010" style="padding:8px 5px 0">
                        <table >
                            <caption>금액정보</caption>
                            <colgroup>
                                <col style="width:30%">
                                <col style="width:30%">
                                <col style="width:20%">
                                <col style="width:20%">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th>현금</th><td colspan="3"><input type="text" id="cash" value="0" onkeyup="addSum();"></td>
                                </tr>
                                <tr>
                                    <th>대체</th><td colspan="3"><input type="text" id="alternative" value="0" onkeyup="addSum();"></td>
                                </tr>
                                <tr>
                                    <th>조회필자기앞</th><td><input type="text" id="cashier_check" value="0" onkeyup="addSum();"></td>
                                    <th>매수</th><td><input type="text" id="cashier_nos" maxlength="5"></td>
                                </tr>
                            </tbody>
                        </table>
                        <ul class="sum"><li>발행금액 합계</li>
                            <li><input type="text" id="totalCash" readonly="readonly" ></li>
                        </ul>
                    </div><!--End of info01-inner01-0002-->
                </div><!--End of info01-title1-0002-->
                  
                <div class="info01-title2-0010">
                    
                    <h4>의뢰인 정보</h4>
                    <div class="info01-inner03-0010" style="padding:15px 0px 22px">
                        <table class="tbl1402">
                            <caption>의뢰인정보</caption>
                            <colgroup>
                                <col style="width:40%">
                                <col style="width:60%">
                            </colgroup>

                            <tbody>
                                <tr><th>의뢰인실명번호</th>
                                    <td><input type="text" id="client_realname_num"></td>
                                </tr>
                                <tr><th>의뢰인성명</th>
                                    <td><input type="text" id="client_name" ></td>
                                </tr><tr><th>의뢰인과의 관계</th>
                                    <td>
                                    	<select title="의뢰인과의 관계"  id="client_relation" onchange="relationshipAccountHolder();">
                                        	<option value="01" selected>01:본인</option>
                                        	<option value="02">02:대리인</option>
                                        </select>
                                     </td>
                                </tr>
                                <tr>
                                	<th class="ones" style="display:none">대리인실명번호</th>
                                    <td class="ones" style="display:none"><input type="text" id="sub_num"></td>
                                </tr>
                                <tr>
                                	<th class="ones" style="display:none">대리인성명</th>
                                    <td class="ones" style="display:none"><input type="text" id="sub_name"></td>
                                </tr>
                            </tbody>
                        </table>  
                    </div>
                </div>
                  
                <div class="info01-title2-0010">
                    <h4>자기앞발행수수료</h4>
                    <div class="info01-inner02-0010" style="padding:25px 5px">
                        <table>
                            <caption>자기앞발행수수료</caption>
                            <colgroup>
                                <col style="width:30%">
                                <col style="width:20%" >
                                <col style="width:30%" >
                            </colgroup>
                           
                            <tbody>
                                <tr><th>수수료처리</th>
                                    <td>
                                    	<select title="수수료처리" style="background:#e5e5e5" disabled="disabled">
                                    		<option value="01" selected>01:현금</option>
                                        	<option>01: 현금</option>
                                        </select>
                                    </td>
                                    <td><input type="text" style="background:#e5e5e5" readonly="readonly"></td>
                                </tr>
                                <tr><th>입금증인자</th>
                                    <td colspan="2">
                                    	<select title="입금증인자" style="background:#e5e5e5" disabled="disabled">
                                    		<option value="01" selected>01:예</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <th>영수증인자</th>
                                    <td colspan="2">
                                    	<select title="영수증인자" style="background:#e5e5e5" disabled="disabled">
                                    		<option value="01" selected>01:예</option>
                                        	<option>1: 예</option>
                                        </select>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        
                    </div><!--End of info01-inner02-0002-->
                  </div><!--End of info01-title2-0002-->
                  
              </div><!--End of info01-0002-->
            
              <div class="btn_both">
                <div class="fr">
                    <input type="button" value="발행" id="publish">
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