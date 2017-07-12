<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath }" scope="request" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>[1401] 자기앞수표채번등록/해제</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
    <meta name="viewport" content="user-scalable=no, width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <meta name="apple-mobile-web-app-capable" content="yes">
	<link href="${ctx }/resources/css/common.css" type="text/css" rel="stylesheet">
	<link href="${ctx }/resources/css/media.css?ver=0.2" type="text/css" rel="stylesheet">
	<link href="${ctx }/resources/css/avgrund.css" type="text/css" rel="stylesheet">
	
    <script type="text/javascript" src="${ctx }/resources/js/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="${ctx }/resources/js/pop.js?ver=1.2"></script>
    <script type="text/javascript" src="${ctx }/resources/js/jquery.avgrund.js"></script>
    <script type="text/javascript" src="${ctx }/resources/vjs/check/1401.js"></script>

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
                <li class="nav_dir"><a href="#" class="nav_bold">&nbsp;&nbsp;&nbsp;자기앞수표 채번</a></li>
                <li><a href="${ctx }/views/check/1402.jsp">&nbsp;&nbsp;&nbsp;자기앞수표 발행</a></li>
                <li><a href="${ctx }/views/check/1403.jsp">&nbsp;&nbsp;&nbsp;자기앞수표 지급</a></li>
				<li><a href="${ctx }/views/add/1821.jsp">&nbsp;&nbsp;&nbsp;타행수표 즉시지급거래</a></li>
                <li><a href="${ctx }/views/add/0007.jsp">&nbsp;&nbsp;&nbsp;사고신고관리</a></li>
                <li><a href="${ctx }/views/add/0070.jsp">&nbsp;&nbsp;&nbsp;주의사고 등록/해제</a></li>
                <li><a href="${ctx }/views/bankbook/0004.jsp">&nbsp;&nbsp;&nbsp;해지</a></li>
                <li><a href="${ctx }/views/add/1099.jsp">&nbsp;&nbsp;&nbsp;거래취소</a></li>
            </ul>
        </div>
        
        <div id="contents">
            <h3>[1401] 자기앞수표채번등록/해제</h3>
            
            <div id="tabs">
              <div class="srch">
                <div class="srch-inner-1401">
                    <ul><li>등록구분</li></ul>
                     <ul><li>
                     	<select>
                            <option>1: 등록</option>
                            <option disabled style="background:#E5E5E5;">2: 해제</option>
                          </select>
                        </li>
                    </ul>
                </div><!--End of srch-inner-0002-->
              </div><!--End of srch-0002-->
                
              <div class="info01-wrap-1401">
                    <div class="info01-inner1-1401">
                        <ul><li>채번번호</li>
                            <li><input type="text" id="check_no" style="background:#ffffcc;" maxlength="4"></li>
                        </ul>
                        <ul><li>장표출력</li>
                            <li>
                            	<select id="print_or" >
                            		<option value="01" selected>01: 예</option>
                            		<option value="02" >02: 아니오</option>
                          		</select>
                          	</li>
                        </ul>
                    </div>
                    <div class="info01-inner2-1401">
                        <table>
                            <caption>연동대체(당행자기앞지금)테이블</caption>
                            <colgroup>
                                <col style="width:5%" >
                                <col >
                                <col style="width:16%" >                                
                                <col style="width:16%" >
                                <col style="width:16%" >
                            </colgroup>
                            <thead>
                                <tr>
                                    <th scope="col">순번</th>
                                    <th scope="col">수표권종</th>
                                    <th scope="col">매수</th>
                                    <th scope="col">시작번호</th>
                                    <th scope="col">최종번호</th>
                                </tr>
                            </thead>

                            <tbody>
                                <tr><th>1</th>
                                    <td>
                                    	<select id="check_sepa1" >
                                    		<option value="01" selected>01: 10만원권자기앞수표</option>
                                            <option value="02">02: 30만원권자기앞수표</option>
                                            <option value="03">03: 50만원권자기앞수표</option>
                                            <option value="04">04: 100만원권자기앞수표</option>
                                        </select><input type="hidden" id="case1" value="output">
                                    </td>
                                    <td><input type="text" name="case1" id="number_of_sheet1" maxlength="5" onkeyup="endnum(this);"></td>
                                    <td><input type="text" name="case1" id="check_num1" maxlength="7" onkeyup="endnum(this);"></td>
                                    <td><input type="text" id="endNum1" readonly style="background-color:#EBEBE4"></td>
                                </tr>
                                <tr><th>2</th>
                                    <td>
                                    	<select id="check_sepa2" >
                                            <option value="01" selected>01: 10만원권자기앞수표</option>
                                            <option value="02">02: 30만원권자기앞수표</option>
                                            <option value="03">03: 50만원권자기앞수표</option>
                                            <option value="04">04: 100만원권자기앞수표</option>
                                        </select><input type="hidden" id="case2" value="output">
                                    </td>
                                    <td><input type="text" name="case2" id="number_of_sheet2" maxlength="5" onkeyup="endnum(this);"></td>
                                    <td><input type="text" name="case2" id="check_num2" maxlength="7" onkeyup="endnum(this);"></td>
                                    <td><input type="text" id="endNum2" readonly style="background-color:#EBEBE4"></td>
                                </tr>
                                <tr><th>3</th>
                                    <td>
                                    	<select id="check_sepa3" >
                                            <option value="01" selected>01: 10만원권자기앞수표</option>
                                            <option value="02">02: 30만원권자기앞수표</option>
                                            <option value="03">03: 50만원권자기앞수표</option>
                                            <option value="04">04: 100만원권자기앞수표</option>
                                        </select><input type="hidden" id="case3" value="output">
                                    </td>
                                    <td><input type="text" name="case3" id="number_of_sheet3" maxlength="5" onkeyup="endnum(this);"></td>
                                    <td><input type="text" name="case3" id="check_num3" maxlength="7" onkeyup="endnum(this);"></td>
                                    <td><input type="text" id="endNum3" readonly style="background-color:#EBEBE4"></td>
                                </tr>
                                <tr><th>4</th>
                                    <td>
                                    	<select id="check_sepa4" >
                                            <option value="01" selected>01: 10만원권자기앞수표</option>
                                            <option value="02">02: 30만원권자기앞수표</option>
                                            <option value="03">03: 50만원권자기앞수표</option>
                                            <option value="04">04: 100만원권자기앞수표</option>
                                        </select><input type="hidden" id="case4" value="output">
                                    </td>
                                    <td><input type="text" name="case4" id="number_of_sheet4" maxlength="5" onkeyup="endnum(this);"></td>
                                    <td><input type="text" name="case4" id="check_num4" maxlength="7" onkeyup="endnum(this);"></td>
                                    <td><input type="text" id="endNum4" readonly style="background-color:#EBEBE4"></td>
                                </tr>
                                <tr><th>5</th>
                                    <td>
                                    	<select id="check_sepa5" >
                                            <option value="01" selected>01: 10만원권자기앞수표</option>
                                            <option value="02">02: 30만원권자기앞수표</option>
                                            <option value="03">03: 50만원권자기앞수표</option>
                                            <option value="04">04: 100만원권자기앞수표</option>
                                        </select><input type="hidden" id="case5" value="output">
                                    </td>
                                    <td><input type="text" name="case5" id="number_of_sheet5" maxlength="5" onkeyup="endnum(this);"></td>
                                    <td><input type="text" name="case5" id="check_num5" maxlength="7" onkeyup="endnum(this);"></td>
                                    <td><input type="text" id="endNum5" readonly style="background-color:#EBEBE4"></td>
                                </tr>
                            </tbody>
                        </table>
                    </div><!--End of info01-inner02-1401-->
              </div><!--End of info01-wrap-1401-->

              <div class="btn_both">
                <div class="fr">
                    <input type="button" value="등록" id="registerCheckNo">
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