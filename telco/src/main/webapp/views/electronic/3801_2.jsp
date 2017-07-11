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
	<link href="${ctx }/resources/css/study.css" type="text/css" rel="stylesheet">
	<link href="${ctx }/resources/css/avgrund.css" type="text/css" rel="stylesheet">
	
	<script type="text/javascript" src="${ctx }/resources/js/jquery-1.11.3.min.js"></script>
    <script src="${ctx }/resources/js/pop.js" type="text/javascript"></script> 
    <script src="${ctx }/resources/js/jquery.avgrund.js" type="text/javascript"></script>
    <script type="text/javascript" src="${ctx }/resources/vjs/electronic/3801_2.js"></script>

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
                <li>&nbsp;▶ 전자금융</li>                
                <li class="nav_dir">&nbsp;&nbsp;&nbsp;전자금융</li>
            </ul>
        </div>
        
        <input type="text" id="schoolName" readonly="readonly" value="${sessionScope.schoolName }" style="display:none">
        <input type="text" name="customer_no" id="customer_no" readonly="readonly" style="display:none">
        
        <div id="contents">
            <h3>[3801] 전자금융 신규/조회/변경/해지</h3>
            <div id="tabs">
              <div class="srch-3801">
                <div class="srch-inner-3801">
                    <ul><li>거래구분</li>
                            <li><select  title="거래구분" onChange="javascripｔ:moveUrl(this);" style="background:#ffffcc;">
                                <option value="${ctx }/views/electronic/3801.jsp">1: 신규</option>
                                <option value="${ctx }/views/electronic/3801_2.jsp" selected="selected">2: 변경</option>
                                <option value="${ctx }/views/electronic/3801_3.jsp">3: 해지</option>
                                <option value="${ctx }/views/electronic/3801_4.jsp">4: 조회</option>
                              </select>
                            </li>
                        </ul>
                        <ul>
                            <li>실명번호</li>
                            <li><input type="text" id="realname_num" style="background:#ffffcc"></li>
                            <li><img src="${ctx }/resources/image/icon/search.png" id="findCustomer" alt="조회버튼" style="cursor:pointer"></li>
                        </ul>
                </div><!--End of srch-inner-->
              </div><!--End of srch-->

              <h4>기본정보</h4>
              <div class="info01-wrap-3801">
                <div class="info01-inner-3801">
                    <ul>
                        <li>고객명</li>
                        <li><input type="text" id="customer_name" readonly="readonly" ></li>
                    </ul>
                    <ul>
                        <li>고객등급</li>
                        <li>
                            <select title="고객등급" style="background:#e5e5e5" disabled="disabled" >
                                <option>개인-Green(일반)</option>
                            </select>
                        </li>
                    </ul>
                    
                    <table id="myTable">
                        <caption>전자금융 신규 조회내역</caption>
                        <colgroup>
                            <col style="width:5%">
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
                                <th>선택</th>
                                <th>서비스구분</th>
                                <th>ID</th>
                                <th>상태</th>
                                <th>최종변경일</th>
                                <th>OTP/보안카드 구분</th>
                                <th>OTP/보안카드 번호</th>
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
                            </tr>
                        </tbody>
                    </table>
                </div><!-- End of info01-inner-3801 -->
              </div><!--End of info01-wrap-3801-->
            
                
            
              <h4>기본정보변경</h4>
              <div class="info02-wrap-3801">
                <div class="info02-inner-3801">
                    
                    <div style="width:">
                        <ul>
                            <li>
                                <span>보안매체선택</span>
                                <select title="보안매체선택" id="security_media_sepa">
                                    <option value="01" selected="selected">01: 보안카드</option>
                                    <option value="02">02: OTP카드</option>
                                </select>
                            </li>
                            <li>
                                <span>보안매체번호</span>
                                <input type="text" id="security_media_no" maxlength="8">
                            </li>
                        </ul>
                        <ul>
                     	   <li>
                                <span>권유직원</span>
                                <input type="text" id="emp_name" style="background:#e5e5e5" disabled="disabled">
                            </li>
                            <li>
                                <span>인자위치(은행용)</span>
                                <input type="text" value="01" style="background:#e5e5e5" disabled="disabled">
                            </li>
                        </ul>
                    </div>
                    
                    <div class="wd">
                        <ul>
                            <li><span>출금계좌지정</span></li>
                            <li><a>출금가능계좌추가</a><a>행 삭제</a></li>
                        </ul>
                        <table >
                            <caption>출금계좌지정</caption>
                            <colgroup>
                                <col >
                                <col >
                                <col >
                            </colgroup>
                            <thead>
                                <tr>
                                    <th>순번</th>
                                    <th>계좌번호</th>
                                    <th>서비스구분</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div><!--End of info02-inner-3801-->
              </div><!-- End of info02-wrap-3801 -->

              <h4>인터넷뱅킹 정보 변경</h4>
              <div class="info03-wrap-3801">
                <div class="info03-inner-3801">
                    <ul>
                        <li><span class="note1 pointer">(*)이용자 비밀번호</span>
                            <input type="password" id="internet_elec_pw" disabled="disabled">
                        </li>
                        <li>
                            <span>1일 이체한도</span>
                            <input type="text" id="internet_elec_transfer_day" disabled="disabled">
                        </li>
                        <li>
                            <span>1회 이체한도</span>
                            <input type="text" id="internet_elec_transfer_once" disabled="disabled">
                        </li>
                    </ul>
                    <ul>
                        <li>
                            <a id="searchElecId" >ID 변경</a>                           
                        </li>
                        <li>
                            <input type="text" id="internet_elec_id" style="margin:2px" disabled="disabled">
                            <div style="float:right; padding-top: 7px;" id="idResult"> </div>
                        </li>
                    </ul>
                    
                    
                    <div class="comment2 posi41">
                        <div class="close pointer"><img src="${ctx }/resources/image/icon/close.png" alt="닫기" ></div>
                        <div class="comt2">
                            <h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;이용자 비밀번호</h5><br><br>
                            <p>인터넷뱅킹, 스마트뱅킹 사용시 필요한 비밀번호로 PIN패드로 고객이 직접 입력하도록 합니다.
                                남이 쉽게 알 수 있는 동일한 숫자, 연속된 숫자, 전화번호나 실명번호 등의 번호는 사용할 수 없습니다.</p>
                        </div>
                    </div>
                </div><!--End of info03-inner-3801-->
              </div><!--End of info03-wrap-3801-->
                
              <h4>폰뱅킹 정보 변경</h4>
              <div class="info04-wrap-3801">
                  <div class="info04-inner-3801">
                    <ul>
                        <li>
                            <span>폰뱅킹 비밀번호</span>
                            <input type="password" id="phone_elec_pw" disabled="disabled">
                        </li>
                        <li>
                            <span>1일 이체한도</span>
                            <input type="text" id="phone_elec_transfer_day" disabled="disabled">
                        </li>
                        <li>
                            <span>1회 이체한도</span>
                            <input type="text" id="phone_elec_transfer_once" disabled="disabled">
                        </li>
                    </ul>
                </div><!--End of info04-inner-3801-->
              </div><!--End of info04-wrap-3801-->
                
              <div class="btn_both">
                <div class="fr">
                    <%-- <a onClick="window.open('${ctx}/views/electronic/pop_3801.jsp','[3801]전자금융 신규','width=400, height=400, location=no')" class="btn_big"><span>등록</span></a> --%>
                    <input type="button" value="변경" id="modify">
                </div>
              </div>
              
              <div id="resultPopup" style="display:none">
			     	<div class="head1"><p>처리 내역</p></div>
				    <table id="resultTable">
				        <colgroup><col style="width:30%"><col style="width:70%"></colgroup>
				    	<tbody></tbody>
				    </table>
			   </div>
			
            </div>
        </div>
    </div>
</body>
</html>