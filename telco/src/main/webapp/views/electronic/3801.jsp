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
    <script src="${ctx }/resources/js/jquery.avgrund.js"></script>
    <script type="text/javascript" src="${ctx }/resources/vjs/electronic/3801.js"></script>

<body>
<jsp:include page="/views/include/header.jsp"/>

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
                                <option value="${ctx }/views/electronic/3801.jsp" selected="selected">1: 신규</option>
                                <option value="${ctx }/views/electronic/3801_2.jsp">2: 변경</option>
                                <option value="${ctx }/views/electronic/3801_3.jsp">3: 해지</option>
                                <option value="${ctx }/views/electronic/3801_4.jsp">4: 조회</option>
                              </select>
                            </li>
                        </ul>
                        <ul>
                            <li>실명번호</li>
                            <li><input type="text" id="realname_num" style="background:#ffffcc"></li>
                            <li><img src="${ctx }/resources/image/icon/search.png" id="findCustomer" alt="조회버튼" style="cursor:pointer;"></li>
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
                        </colgroup>
                        <thead>
                            <tr>
                                <th>순번</th>
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
                                <span>신청서비스</span>
                                <input type="checkbox" id="internet" ><label for="internet">인터넷뱅킹</label>
                                <input type="checkbox" id="phone" ><label for="phone">폰뱅킹</label>
                            </li>
                        </ul>
                        <ul>
                            <li>
                                <span class="note1 pointer">(*)보안매체선택</span>
                                <select title="보안매체선택" id="security_media_sepa" style="background: #ffffcc;">
                                    <option value="01" selected="selected">01: 보안카드</option>
                                    <option value="02">02: OTP카드</option>
                                </select>
                            </li>
                            <li>
                                <span>보안매체번호</span>
                                <input type="text" id="security_media_no" style="background: #ffffcc;" maxlength="8">
                            </li>
                        </ul>
                        <ul>
                            <li>
                                <span class="note2 pointer">(*)신청서구분</span>
                                <select title="신청서구분" id="application_sepa">
                                    <option value="01" selected="selected">01: 전자금융신청서</option>
                                    <option value="02">02: 은행거래신청서</option>
                                </select>
                            </li>
                            <li>
                                <span>인자위치(은행용)</span>
                                <input type="text" value="01" style="background:#e5e5e5" disabled="disabled">
                            </li>
                        </ul>
                        <ul>
                            <li>
                                <span>권유직원</span>
                                <input type="text" id="emp_name" style="background:#e5e5e5" disabled="disabled">
                            </li>
                            
                            <li>
                                <span>거래자구분</span>
                                <select title="거래자구분" id="owner_sepa" onchange="relationshipAccountHolder();">
                                    <option value="01" selected="selected">01: 본인</option>
                                    <option value="02">02: 대리인</option>
                                </select>
                            </li>
                        </ul>
                        <ul>
                            <li class="ones" style="display:none">
                                <span>대리인실명번호</span>
                                <input type="text" id="sub_num">
                            </li>
                            <li class="ones" style="display:none">
                            	<span>대리인성명</span>
                            	<input type="text" id="sub_name">
                            </li>
                        </ul>
                    </div>
                    
                    
                    <div class="posi31 images">
                        <div class="close pointer"><img src="${ctx }/resources/image/icon/close.png" alt="닫기" ></div>
                        <div class="comt2">
                            <img src="${ctx }/resources/image/bg/scard.png" alt="보안카드"/>
                            <img src="${ctx }/resources/image/bg/otp.png" alt="OTP"/>
                        </div>
                    </div>
                    <div class="comment2 posi32">
                        <div class="close pointer"><img src="${ctx }/resources/image/icon/close.png" alt="닫기" ></div>
                        <div class="comt2">
                            <h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;신청서 구분</h5><br><br>
                            <p><span class="hl">①전자금융신청서</span>: 고객이 별도로 방문하여 전자금융만 신청하실 때 선택합니다.<br>
                                <span class="hl">②은행거래신청서</span>: 계좌 신규와 함께 인터넷뱅킹을 동시에 요청하실 때 선택합니다.</p>
                        </div>
                    </div>
                    <div class="comment2 posi33">
                        <div class="close pointer"><img src="${ctx }/resources/image/icon/close.png" alt="닫기" ></div>
                        <div class="comt2">
                            <h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;대리인 실명번호</h5><br><br>
                            <p>대리인에 의한 전자금융 신청은 불가능합니다.(미성년자 제외)</p>
                        </div>
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

              <h4>인터넷뱅킹 신규정보</h4>
              <div class="info03-wrap-3801">
                <div class="info03-inner-3801">
                    <ul>
                        <li>
                            <span class="note4 pointer">(*)이용자 ID</span>
                            <input type="text" id="internet_elec_id" disabled="disabled">
                        </li>
                        <li>
                            <span class="note5 pointer">(*)이용자 비밀번호</span>
                            <input type="password" id="internet_elec_pw" disabled="disabled">
                        </li>
                        <li>
                            <span class="note6 pointer">(*)1일 이체한도</span>
                            <input type="text" id="internet_elec_transfer_day" disabled="disabled">
                        </li>
                        <li>
                            <span class="note7 pointer">(*)1회 이체한도</span>
                            <input type="text" id="internet_elec_transfer_once" disabled="disabled">
                        </li>
                    </ul>
                    
                    
                     <div class="comment2 posi34">
                        <div class="close pointer"><img src="${ctx }/resources/image/icon/close.png" alt="닫기" ></div>
                        <div class="comt2">
                            <h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;이용자 ID</h5><br><br>
                            <p>인터넷뱅킹, 스마트뱅킹 등에 사용되는 아이디입니다. 영문+숫자 조합으로 10자 내외로 만들 수 있습니다.</p>
                        </div>
                    </div>
                    <div class="comment2 posi35">
                        <div class="close pointer"><img src="${ctx }/resources/image/icon/close.png" alt="닫기" ></div>
                        <div class="comt2">
                            <h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;이용자 비밀번호</h5><br><br>
                            <p>인터넷뱅킹, 스마트뱅킹 사용시 필요한 비밀번호로 PIN패드로 고객이 직접 입력하도록 합니다.
                                남이 쉽게 알 수 있는 동일한 숫자, 연속된 숫자, 전화번호나 실명번호 등의 번호는 사용할 수 없습니다.</p>
                        </div>
                    </div>
                    <div class="comment2 posi36">
                        <div class="close pointer"><img src="${ctx }/resources/image/icon/close.png" alt="닫기" ></div>
                        <div class="comt2">
                            <h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1일 이체한도</h5><br><br>
                            <p>전자금융을 통해 하루동안 이체할 수 있는 금액입니다.
                                보안등급에 따라 정해진 금액 내에서 고객이 원하는 만큼 이체한도를 지정할수 있습니다.</p>
                        </div>
                        <img src="${ctx }/resources/image/bg/1dl.png" alt="1일이체한도"/>
                    </div>
                    <div class="comment2 posi37">
                        <div class="close pointer"><img src="${ctx }/resources/image/icon/close.png" alt="닫기" ></div>
                        <div class="comt2">
                            <h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1회 이체한도</h5><br><br>
                            <p>전자금융을 통해 1회에 이체할 수 있는 금액입니다.
                                보안등급에 따라 정해진 금액 내에서 고객이 원하는 만큼 이체한도를 지정할수 있습니다.</p>
                        </div>
                        <img src="${ctx }/resources/image/bg/1tl.png" alt="1회이체한도"/>
                    </div>
                    
                </div><!--End of info03-inner-3801-->
              </div><!--End of info03-wrap-3801-->
                
              <h4>폰뱅킹 신규정보</h4>
              <div class="info04-wrap-3801">
                  <div class="info04-inner-3801">
                    <ul>
                        <li>
                            <span class="note8 pointer">(*)폰뱅킹 비밀번호</span>
                            <input type="password" id="phone_elec_pw" disabled="disabled">
                        </li>
                        <li>
                            <span class="note9 pointer">(*)1일 이체한도</span>
                            <input type="text" id="phone_elec_transfer_day" disabled="disabled">
                        </li>
                        <li>
                            <span class="note10 pointer">(*)1회 이체한도</span>
                            <input type="text" id="phone_elec_transfer_once" disabled="disabled">
                        </li>
                    </ul>
                    
                    
                <div class="comment2 posi38">
                    <div class="close pointer"><img src="${ctx }/resources/image/icon/close.png" alt="닫기" ></div>
                    <div class="comt2">
                        <h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;폰뱅킹 비밀번호</h5><br><br>
                        <p>폰뱅킹 사용시 필요한 비밀번호로 PIN패드로 고객이 직접 입력하도록 합니다.(4~6자리)
                            남이 쉽게 알 수 있는 동일한 숫자, 연속된 숫자, 전화번호나 실명번호 등의 번호는 사용할수 없습니다.</p>
                    </div>
                </div>
                  
                <div class="comment2 posi39">
                    <div class="close pointer"><img src="${ctx }/resources/image/icon/close.png" alt="닫기" ></div>
                    <div class="comt2">
                        <h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1일 이체한도</h5><br><br>
                        <p>전자금융을 통해 하루동안 이체할 수 있는 금액입니다.
                            보안등급에 따라 정해진 금액 내에서 고객이 원하는 만큼 이체한도를 지정할수 있습니다.</p>
                    </div>
                    <img src="${ctx }/resources/image/bg/1dl.png" alt="1일이체한도"/>
                </div>
                  
                <div class="comment2 posi40">
                    <div class="close pointer"><img src="${ctx }/resources/image/icon/close.png" alt="닫기" ></div>
                    <div class="comt2">
                        <h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1회 이체한도</h5><br><br>
                        <p>전자금융을 통해 1회에 이체할 수 있는 금액입니다.
                            보안등급에 따라 정해진 금액 내에서 고객이 원하는 만큼 이체한도를 지정할수 있습니다.</p>
                    </div>
                    <img src="${ctx }/resources/image/bg/1tl.png" alt="1회이체한도"/>
                </div>
                
                </div><!--End of info04-inner-3801-->
              </div><!--End of info04-wrap-3801-->
                
              <div class="btn_both">
                <div class="fr">
                    <%-- <a onClick="window.open('${ctx}/views/electronic/pop_3801.jsp','[3801]전자금융 신규','width=400, height=400, location=no')" class="btn_big"><span>등록</span></a> --%>
                    <input type="button" value="등록" id="register">
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