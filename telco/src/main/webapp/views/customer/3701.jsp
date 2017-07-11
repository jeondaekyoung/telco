<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath }" scope="request" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>[3801] 전자금융 신규/조회/변경/해지</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
    <meta name="viewport" content="user-scalable=no, width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <meta name="apple-mobile-web-app-capable" content="yes">
	<link href="${ctx }/resources/css/common.css" type="text/css" rel="stylesheet">
	<link href="${ctx }/resources/css/media.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="${ctx }/resources/js/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="${ctx }/resources/vjs/customer/3701.js"></script>
</head>

<body>
   <jsp:include page="/views/include/header.jsp"/>

    <div id="container">
        <div class="nav">
            <ul>
                <li>&nbsp;▶ 신용카드</li>                
                <li class="nav_dir">&nbsp;&nbsp;&nbsp;카드발급</li>
            </ul>
        </div>
        
        <DIV id="contents">
            <h3>[3701] 카드발급</h3>
            <div id="tabs">
              <div class="srch-3801">
                <div class="srch-inner-3801">
                    <ul><li>거래종류</li>
                            <li>
                            	<select title="거래종류" style="background:#ffffcc; width:220px">
	                                <option value="현금IC" disabled="disabled" style="background:#e5e5e5;">01: 현금IC카드 발급</option>
	                                <option value="재발급" disabled="disabled" style="background:#e5e5e5;">02: 현금/모바일/전자통장 재발급</option>
	                                <option value="현금IC전환" disabled="disabled" style="background:#e5e5e5;">03: 현금IC카드 전환발급</option>
	                                <option value="모바일" disabled="disabled" style="background:#e5e5e5;">04: 모바일IC/USIM카드 발급</option>
	                                <option value="전자통장" disabled="disabled" style="background:#e5e5e5;">05: 전자통장 발급</option>
	                                <option value="MS카드" disabled="disabled" style="background:#e5e5e5;">06: MS카드/구MS카드 전환발급</option>
	                                <option disabled="disabled" style="background:#e5e5e5;">==========================</option>
	                                <option value="v-cah" disabled="disabled" style="background:#e5e5e5;">07: V-CASH카드 발급/재발급</option>
	                                <option value="k-cash"disabled="disabled" style="background:#e5e5e5;">08: K-CASH카드 발급</option>
	                                <option value="09" selected>09: 직불카드 발급</option>
	                                <option value="직불재발급" disabled="disabled" style="background:#e5e5e5;">10: 직불카드 재발급/재발급취소</option>
                              </select>
                            </li>
                        </ul>
                </div><!--End of srch-inner-->
              </div><!--End of srch-->


              
              <div class="srch-3801">
                <div class="srch-inner-3801">
                    <ul>
                        <li>실명번호</li>
                        <li><input type="text" id="realname_num" style="background:#ffffcc"></li>
                        <li><img src="${ctx }/resources/image/icon/search.png" id="findCustomerDebit" alt="조회버튼" style="cursor: pointer;"></li>
                    </ul>
                    
                    <ul>
                        <li>고객명</li>
                        <li><input type="text" id="customer_name" readonly style="background:#e5e5e5"></li>
                    </ul>
                    <ul>
                        <li>고객번호</li>
                        <li><input type="text" id="customer_no" readonly style="background:#e5e5e5"></li>
                    </ul>
                </div><!--End of srch-inner-->
              </div><!--End of srch-->
                
                
                
              <div class="info01-wrap-0002">
                    
                <div class="info01-title2-0002" style="margin:0 9px 0 0;">
                    <h4>카드발급정보</h4>
                    <div class="info01-inner01-0002 info01-inner-0070" style="padding:7px 0 2px 5px">
                        <table class="ib-info">
                        <caption>카드발급정보</caption>
                        <colgroup>
                            <col style="width:20%">
                            <col style="width:30%">
                            <col style="width:">
                            <col style="width:30%">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th>직불카드번호</th>
                                <td><input type="text" id="dcard_num" style="background: #ffffcc;" ></td>
                                <th>카드상품코드</th>
                                <td>
                                	<select title="카드상품코드" id="dcard_code" style="background: #ffffcc;">
	                                    <option value="101" selected="selected">101: 일반직불</option>
	                                    <option value="102">102: 제휴증권카드</option>
	                                    <option value="103">103: 주류구매카드</option>
	                                    <option value="104">104: 해외직불카드</option>
	                                    <option value="105">105: 학생증카드</option>
                                	</select>
                                </td>
                            </tr>
                            <tr>
                                <th>카드발급구분</th>
                                <td>
                                	<select title="카드발급구분" id="dcard_issue_sepa" style="background: #ffffcc;">
	                                    <option value="01">01: 우편발급</option>
	                                    <option value="02">02: 즉시발급</option>
                                	</select>
                                </td>
                                <th>카드비밀번호</th>
                                <td><input type="text" id="dcard_pw" style="background: #ffffcc;" maxlength="4"></td>
                            </tr>
                            <tr>
                                <th>결제계좌번호</th>
                                <td>
                                	<input type="text" id="account_num" style="width: 142px; background: #ffffcc;">
                                    <img src="${ctx }/resources/image/icon/search.gif" id="findCustomerBankbook" alt="검색버튼" style="cursor: pointer;">
                                    <span id="findCBresult"></span>
                                </td>
                                <th>카드사용구분</th>
                                <td>
                                	<select title="카드사용구분" id="dcard_use_sepa" style="background: #ffffcc;">
	                                    <option value="01">01: 현금인출만 가능</option>
	                                    <option value="02">02: 가맹점이용만 가능</option>
	                                    <option value="03">03: 모두 이용가능</option>
                                	</select>
                                </td>
                            </tr>
                            <tr>
                                <th>카드교부구분</th>
                                <td>
                                	<select title="카드교부구분" id="dcard_issue_place" style="background: #ffffcc;">
	                                    <option value="01">01: 영업점</option>
	                                    <option value="02">02: 인편</option>
                                	</select>
                                </td>
                                <th>권유직원번호</th>
                                <td><input type="text" id="emp_name" style="background:#e5e5e5" disabled="disabled"></td>
                            </tr>
                            
                        </tbody>
                    </table>
                        
                        <ul class="sum"></ul>
                            <table class="ib-info">
                            <colgroup>
                                <col style="width:25%">
                                <col style="width:25%">
                                <col style="width:">
                                <col style="width:25%">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th>제휴증권사코드</th>
                                    <td><input type="text" id="scrcmpn_code"></td>
                                    <th>주류구매카드사업자번호</th>
                                    <td><input type="text" id="achlqr_bizrno"></td>
                                </tr>
                            </tbody>
                            </table>
                        
                    </div><!--End of info01 inner01 0002-->
                </div><!--End of info01 title2 0002-->
                
                <div class="info01-title1-0002">
                    <H4>학생증 카드정보</H4>
                    <div class="info01-inner01-0002" style="padding-bottom:96px">
                        <ul>
                            <li>
                                <span>학교 코드</span>
                                <input type="text" id="school_code">
                            </li>
                            <li>
                                <span>학번</span>
                                <input type="text" id="student_num">
                            </li>
                            <li>
                                <span>바코드회차</span>
                                <input type="text" id="barcode_num">
                            </li>
                        </ul>
                    </div><!--End of info01 inner01 0002-->
                </div><!--End of info01 title1 0002-->
              </div><!--End of info01 0002-->    
                
                
              <H4>직불카드 보유내역</H4>
              <div class="info01-wrap-3801">
                <div class="info01-inner-3801">                    
                    <table id="myTable">
                        <caption>직불카드 보유내역</caption>
                        <colgroup>
                            <col style="width:5%">
                            <col >
                            <col >
                            <col >
                            <col>
                            <col >
                        </colgroup>
                        <thead>
                            <tr>
                                <th>순번</th>
                                <th>직불카드번호</th>
                                <th>결제계좌번호</th>
                                <th>카드상태</th>
                                <th>카드상품코드</th>
                                <th>발급구분</th>
                                <th>발급일</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                        </tbody>
                    </table>
                </div><!-- End of info01-inner-3801 -->
              </div><!--End of info01-wrap-3801-->
                
                
              <div class="btn_both">
                <div class="fr">
                    <input type="button" value="카드발급" id="issueDcard">
                </div>
              </div>
            </div>
        </DIV>
    </div>
</body>
</html>