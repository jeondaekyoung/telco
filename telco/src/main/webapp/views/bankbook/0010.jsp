<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath }" scope="request" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>[0010] 수신신규</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
    <meta name="viewport" content="user-scalable=no, width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <meta name="apple-mobile-web-app-capable" content="yes">
	<link href="${ctx }/resources/css/common.css" type="text/css" rel="stylesheet">
	<link href="${ctx }/resources/css/media.css" type="text/css" rel="stylesheet">
	<link href="${ctx }/resources/css/study.css" type="text/css" rel="stylesheet">
    <link href='http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css' rel='stylesheet'>
    <link href="${ctx }/resources/css/avgrund.css" type="text/css" rel="stylesheet">
    
    <script type="text/javascript" src="${ctx }/resources/js/jquery-1.11.3.min.js"></script>
	<script type="text/javascript" src="${ctx }/resources/js/pop.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
    <script type="text/javascript" src="${ctx }/resources/js/jquery.avgrund.js"></script>
    <script type="text/javascript" src="${ctx }/resources/vjs/bankbook/0010.js"></script>

</head>
<!-- 총 데이터  38 select 15 -->
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
                <li class="nav_dir"><a href="#" class="nav_bold">&nbsp;&nbsp;&nbsp;수신신규</a></li>
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
                <li><a href="${ctx }/views/bankbook/0004.jsp">&nbsp;&nbsp;&nbsp;해지</a></li>
                <li><a href="${ctx }/views/add/1099.jsp">&nbsp;&nbsp;&nbsp;거래취소</a></li>
            </ul>
        </div>
        
        <input type="text" name="customer_no" id="customer_no" readonly="readonly" style="display:none" >
        <input type="text" name="schoolName" id="schoolName" readonly="readonly" value="${sessionScope.schoolName }" style="display:none">
        
        <div id="contents">
            <h3>[0010] 수신신규 <img class="more" src="${ctx }/resources/image/icon/more.png" alt="코멘트"></h3>
           
            <div class="comment1">
                <div class="comt">
                    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <span class="hl">수신신규</span>는 고객으로부터 받은 예금거래신청서에 미비사항이 없는지 확인 후 업무를 진행합니다.
                        계좌신규 마다 실명확인증표 원본에 의한 실명확인을 해야합니다.<br>
                        (<span class="hl">실명확인증표</span> : 주민등록증, 공무원증, 운전면허증, 장애인복지카드, 학생증, 청소년증, 국가유공자증 등)
                        <br><br>
                        은행거래신청서 작성시 고객에게<br>
                        - 개인정보 취급방침에 대한 내용 설명<Br>
                        - 상품 설명 및 약관 안내<br>
                        - 예금자보호상품 가입시 예금자보호법에 대한 내용 설명 후 자필 서명을 받습니다
                    </p>
                </div>
            </div>
            
            <div id="tabs">
              <div class="info01-wrap-0010">
                <div class="info02-wrap-0010">
                    <table >
                        <caption>수신신규 등록 테이블</caption>
                        <colgroup>
                            <col style="width:10%" >
                            <col style="width:15%" >
                            <col style="width:13%" >
                            <col style="width:15%" >
                            <col style="width:12%" >
                            <col style="width:13%" > 
                        </colgroup>
                        <tbody>
                            <tr>
                                <th><span class="note1 pointer">(*)실명번호</span></th>
                                <td><input type="text" class="isEssential" name="realname_num" id="realname_num" style="background:#ffffcc;width:110px;">
                                    <img src="${ctx }/resources/image/icon/search.png" alt="조회버튼" id="findCustomer" style="cursor:pointer">
                                </td>
                                
                                <th>고객명</th>
                                <td><input type="text" name="customer_name" id="customer_name" readonly="readonly"></td>
                            
                                <th>예금주와의관계</th>
                                <td>
                                    <select title="예금주와의관계" name="depositor_relation" id="depositor_relation" onchange="relationshipAccountHolder();">
                                        <option value="00" selected="selected">00: 본인</option>
                                        <option value="01">01: 배우자</option>
                                        <option value="02">02: 배우자부모</option>
                                        <option value="03">03: 사위</option>
                                        <option value="04">04: 며느리</option>
                                        <option value="05">05: 외조부모</option>
                                        <option value="06">06: 외손자</option>
                                        <option value="07">07: 위임장(개인인감)</option>
                                        <option value="08">08: 위임장(법인인감)</option>
                                        <option value="09">09: 공증받은위임장</option>
                                        <option value="10">10: 기타</option>
                                        <option value="11">11: 직계존속(조부모)</option>
                                        <option value="12">12: 직계비속(자녀)</option>
                                        <option value="13">13: 직계비속(손자)</option>
                                        <option value="14">14: 형제자매</option>
                                        <option value="15">15: 친척</option>
                                        <option value="16">16: 상사</option>
                                        <option value="17">17: 동료(친구)</option>
                                        <option value="18">18: 직원</option>
                                        <option value="19">19: 대표자</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th>과목명</th>
                                <td>
                                    <select title="과목명" name="finance_sepa" id="finance_sepa">
                                        <option value="05" selected="selected">05: 보통예금</option>
                                        <option value="07">07: 저축예금</option>
                                        <option disabled style="background:#E5E5E5;">2B: MMDA(기업)</option>
                                        <option disabled style="background:#E5E5E5;">2C: MMDA(개인)</option>
                                        <option disabled style="background:#E5E5E5;">11: 정기예금</option>
                                        <option disabled style="background:#E5E5E5;">25: 상호부금</option>
                                        <option disabled style="background:#E5E5E5;">04: 기업자유</option>
                                        <option disabled style="background:#E5E5E5;">01: 당좌예금</option>
                                        <option disabled style="background:#E5E5E5;">02: 가계당좌</option>
                                        <option disabled style="background:#E5E5E5;">15: 양도성예금증서CD</option>
                                        <option disabled style="background:#E5E5E5;">16: 금융채</option>
                                        <option disabled style="background:#E5E5E5;">17: 환매조건부채권</option>
                                        <option disabled style="background:#E5E5E5;">19: 기업어음</option>
                                        <option disabled style="background:#E5E5E5;">1F: 표지어음</option>
                                        <option disabled style="background:#E5E5E5;">21: 정기적금</option>
                                        <option disabled style="background:#E5E5E5;">23: 장기주택</option>
                                        <option disabled style="background:#E5E5E5;">29: 공공예금</option>
                                        <option disabled style="background:#E5E5E5;">2A: 국고예금</option>
                                        <option disabled style="background:#E5E5E5;">52: 특정금전신탁</option>
                                        <option disabled style="background:#E5E5E5;">5K: 연금신탁</option>
                                    </select>
                                </td>
                                <th>상품명</th>
                                <td>
                                    <input type="text" class="isEssential" name="item_name" id="item_name" style="background:#ffffcc;width:150px;" readonly="readonly">
                                    <a onClick="window.open('${ctx}/views/bankbook/pop_0010_2.jsp','상품목록검색','width=400, height=300, location=no')" ><img src="${ctx }/resources/image/icon/search.gif" alt="검색버튼" ></a>
                                </td>
                                <th class="본인" style="display:none;">대리인성명</th>
                                <td class="본인" style="display:none;">
                                    <input type="text" name="sub_name" id="sub_name" style="background:#ffffcc">
                                </td>
                            </tr>
                            <tr>
                                <th><span class="note2 pointer">(*)통장발행</span></th>
                                <td>
                                    <select title="통장발행" name="bankbook_publish_sepa" id="bankbook_publish_sepa" style="background: #ffffcc;" >
                                        <option value="00" selected="selected">00: 미발행(무통장신규)</option>
                                        <option value="01" >01: 통장식</option>
                                        <option value="02">02: 전자통장</option>
                                    </select>
                                </td>
                                <th>주요증서번호</th>
                                <td><input type="text" name="certificate_num" id="certificate_num" style="background:#ffffcc;" maxlength="11"></td>
                                <th class="본인" style="display:none;">대리인실명번호</th>
                                <td class="본인" style="display:none;">
                                    <input type="text" name="sub_num" id="sub_num" style="background:#ffffcc">
                                </td>
                            </tr>
                            <tr>
                                <th><span class="note3 pointer">(*)비밀번호</span></th>
                                <td><input type="password" class="isEssential" name="bankbook_pw" id="bankbook_pw" style="background:#ffffcc;" maxlength="4"></td>
                                <th><span class="note4 pointer">(*)통장거래비밀번호</span></th>
                                <td><input type="password" name="bankbook_trade_pw" id="bankbook_trade_pw" style="background:#ffffcc;" maxlength="6"></td>
                                
                            </tr>                            
                        </tbody>
                    </table>
                    
                    <div class="comment2 posi1">
                        <div class="close pointer"><img src="${ctx }/resources/image/icon/close.png" alt="닫기" ></div>
                        <div class="comt2">
                            <h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;실명번호</h5><br><br>
                            <p><span class="hl">고객의 주민번호, 여권번호 등</span>을 조회하여 거래를 시작합니다.<br>
                            -개인 : 주민등록번호<br>
                            -외국인 : 외국인등록번호, 여권번호<br>
                            -법인 : 법인번호</p>
                        </div>
                    </div>
                    <div class="comment2 posi2">
                        <div class="close pointer"><img src="${ctx }/resources/image/icon/close.png" alt="닫기" ></div>
                        <div class="comt2">
                            <h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;통장 발행</h5><br><br>
                            <p>상품에 따라 실물 통장을 발행하지 않고 <span class="hl">전자통장으로만</span> 발행되는 상품도 있습니다.</p>
                        </div>
                    </div>
                    <div class="comment2 posi3">
                        <div class="close pointer"><img src="${ctx }/resources/image/icon/close.png" alt="닫기" ></div>
                        <div class="comt2">
                            <h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;비밀번호</h5><br><br>
                            <p>은행 창구에서 통장, 증서를 이용한 거래시에 필요한 비밀번호로, PIN패드를 이용하여 <span class="hl">고객이 직접</span> 입력하게 합니다.</p>
                        </div>
                    </div>
                    <div class="comment2 posi4">
                        <div class="close pointer"><img src="${ctx }/resources/image/icon/close.png" alt="닫기" ></div>
                        <div class="comt2">
                            <h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;통장거래 비밀번호</h5><br><br>
                            <p>ATM기기 등의 자동화 기기에서 통장거래를 할 때 필요한 비밀번호에요.<br>
                                <span class="hl">6자리 숫자로 고객이 직접</span> PIN패드로 입력하게 합니다.</p>
                        </div>
                    </div>
                    
                </div><!--End of srch-inner-0002-->
              </div><!--End of srch-0002-->
                
              <!-- <div class="ly_pop" id="lypop" style="width:257px">
                <p class="desc">신규 계좌번호는 <em><script>document.write(account1 + "-" + account2 + "-" + account3);</script></em> 입니다.</p>
                <div>
                    <div class="btn">
                        <a href="javascript:;" onClick="close_lypop('divpop_frm','lypop')"><img src="http://static.naver.com/kin/09renewal/btn_confirm3.gif" width="45" height="26" alt="확인"></a>
                    </div>
                    <a href="javascript:;" onClick="close_lypop('divpop_frm','lypop')" class="clse"><img src="http://static.naver.com/kin/09renewal/btn_close_layer3.gif" width="19" height="19" alt="닫기"></a>
                </div>
              </div> -->
                
              <div class="info01-wrap-0010">
                <div class="info01-title1-0010">
                    <h4>금액정보</h4>
                    <div class="info01-inner01-0010" style="padding: 42px 5px;'">
                        <ul>
                            <li>
                                <span>현금</span>
                                <input type="text" id="cash" class="isEssential" onkeyup="addSum();">
                            </li>
                            <li>
                                <span>순대체</span>
                                <input type="text" id="check_alternative" onkeyup="addSum();">
                            </li>
                            <li>
                                <span>연동대체</span>
                                <input type="text" id="bank_alternative" onkeyup="addSum();">
                            </li>
                            <!-- <li>
                                <select  title="금액정보" onchange="$('#hidden7').val($(this).val());" style="width:140px">
                                    <option value="01" selected>01: 현금</option>
                                    <option value="02">00: 순대체</option>
                                    <option value="03">11: 연동대체</option>
                                    <option value="04">02: 자기앞</option>
                                    <option value="05">03: 조회필자기앞</option>
                                    <option value="06">04: 가계수표</option>
                                    <option value="07">05: 송금수표</option>
                                    <option value="08">06: 당좌, 약속어음</option>
                                    <option value="09">07: 국고수표</option>
                                    <option value="10">08: 우편환증서</option>
                                    <option value="11">09: 국공채</option>
                                    <option value="12">10: 기타타점</option>
                                    <option value="13">12: 상각처리</option>
                                    <option value="14">13: Bad Bank</option>
                                </select><input type="hidden" name="db0010" id="hidden7">
                                <input type="text" name="db0010" id="금액정보_4" onkeyup="addSum();">
                            </li> -->
                        </ul>
                        <ul class="sum"><li>합계</li>
                            <li><input name="balance" id="balance" type="text" value="0" style="background: #ffffcc;" readonly="readonly"></li>
                        </ul>
                    </div><!--End of info01-inner01-0002-->
                </div><!--End of info01-title1-0002-->
                

                <div class="info01-title2-0010">
                    <h4>자동이체정보</h4>
                    <div class="info01-inner03-0010">

                        
                        <table>
                            <caption>자동이체 등록 테이블</caption>
                            <colgroup>
                                <col style="width:40%">
                                <col style="width:60%" >
                            </colgroup>
                            <tbody>
                                <tr>
                                  <th><span class="note6 pointer">(*)자동이체출금</span></th>
                                    <td><input type="text" readonly="readonly" style="background:#E5E5E5;width:142px" >
                                    <img src="${ctx }/resources/image/icon/search.gif" alt="검색버튼"></td>
                                </tr>
                                <tr>
                                  <th>출금비밀번호</th>
                                    <td><input type="text" readonly="readonly" style="background:#E5E5E5;"></td>
                                </tr>
                                <tr>
                                    <th>자동이체금액</th>
                                    <td><input type="text" readonly="readonly" style="background:#E5E5E5;"></td>
                                </tr>
                                <tr>
                                    <th>이체개시일</th>
                                    <td><input type="text" id="transfer_start" readonly="readonly" style="background:#E5E5E5;width:142px">
                                        
                                    </td>
                                </tr>
                                <tr>
                                    <th>이체일</th>
                                    <td><select title="이체일"  id="이체일select" disabled="disabled" style="background:#E5E5E5;" >
                                            <option value="01" selected>&nbsp;</option>
                                            <option value="02">1: 1일</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <th>이체종료일</th>
                                    <td><input type="text" id="transfer_end" readonly="readonly" style="background:#E5E5E5;width:142px" >
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2"><span class="red">*자동이체 등록시 종료일 필수 입력</span></td>
                                </tr>
                            </tbody>
                        </table>
                        
                        <div class="comment2 posi6">
                            <div class="close pointer"><img src="${ctx }/resources/image/icon/close.png" alt="닫기" ></div>
                            <div class="comt2">
                                <h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;자동이체 출금</h5><br><br>
                                <p>적금상품 신규 등록시, 기존 계좌로부터 매월 정해진 날짜에 정해진 금액을 신규 계좌로 입금받고자 할 때 입력합니다.</p>
                            </div>
                        </div>
                        
                    </div>
                </div>
				
                <div class="info01-title2-0010">

                <h4>펀드정보</h4>

                    <div class="info01-inner02-0010">
                        <table >
                            <caption>계약정보 테이블</caption>
                            <colgroup>
                                <col style="width:40%">
                                <col >
                            </colgroup>
                           
                            <tbody>
                                <tr>
                                	<th>펀드번호</th>
                                    <td><select title="펀드번호"  disabled="disabled" style="background:#E5E5E5;" ><option>&nbsp;</option></select>
                                    	</td>
                                </tr>
                                <tr>
                                	<th>계약기간</th>
                                    <td><input type="text" readonly="readonly" style="background:#E5E5E5;width:65px" >월
                                        <input type="text" readonly="readonly" style="background:#E5E5E5;width:65px" >일
                                    </td>
                                </tr>
                                <tr>
                                	<th>만기일</th>
                                    <td><input type="text" readonly="readonly" style="background:#E5E5E5;width:140px" >
                                    </td>
                                </tr>
                                <tr>
                                	<th>이자지급형태</th>
                                    <td><select title="이자지급형태"  disabled="disabled" style="background:#E5E5E5;" >
                                    		<option value="01" selected>&nbsp;</option>
                                    		<option value="02">1: 이자원가식</option>
                                    	</select>
                                    </td>
                                </tr>
                                <tr>
                                	<th>이자지급간격</th>
                                    <td><select title="이자지급간격"  disabled="disabled" style="background:#E5E5E5;" >
	                                        <option value="01" selected>&nbsp;</option>
	                                        <option value="02">1: 만기지급식</option>
	                                        <option value="03">2: 월이자지급식</option>
                                        </select>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div><!--End of info01-inner02-0002-->
                  </div><!--End of info01-title2-0002-->
                  
              </div><!--End of info01-0002-->
              
                
              <h4>추가정보</h4>
              <div class="info02-wrap-0010">
                <table>
                    <caption>추가정보 테이블</caption>
                    <colgroup>
                        <col style="width:15%">
                        <col style="width:18%">
                        <col style="width:15%">
                        <col >
                        <col style="width:15%">
                        <col style="width:15%">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th><span class="note7 pointer">(*)자금원천및출처구분</span></th>
                            <td>
                                <select title="자금원천및출처구분" name="capital_origin_sepa" id="capital_origin_sepa" style="background:#ffffcc;" >
                                    <option value="01" selected>01: 근로및연금소득</option>
                                    <option value="02">02: 퇴직소득</option>
                                    <option value="03">03: 사업소득</option>
                                    <option value="04">04: 부동산임대소득</option>
                                    <option value="05">05: 부동산양도소득</option>
                                    <option value="06">06: 금융소득(이자및배당)</option>
                                    <option value="07">07: 상속/증여</option>
                                    <option value="08">08: 일시재산양도로인한소득</option>
                                    <option value="09">09: 기타</option>
                                </select>
                            </td>
                            <th><span class="note8 pointer">(*)거래목적구분</span></th>
                            <td>
                                <select title="거래목적구분" name="trade_goal_sepa" id="trade_goal_sepa" style="background:#ffffcc;">
                                    <option value="01" selected>01: 급여및생활비</option>
                                    <option value="02">02: 저축및투자</option>
                                    <option value="03">03: 보험료납부결제</option>
                                    <option value="04">04: 공과금납부결제</option>
                                    <option value="05">05: 카드대금결제</option>
                                    <option value="06">06: 대출원리금상환결제</option>
                                    <option value="07">07: 사업상거래</option>
                                    <option value="08">08: 기타</option>
                                </select>
                            </td>
                            <th>급여일</th>
                            <td><input type="text" name="pay_day" id="pay_day"></td>
                        </tr>
                        <tr>
                            <th><span class="note9 pointer">(*)인감/서명구분</span></th>
                            <td>
                                <select title="인감/서명구분" name="signet_sepa" id="signet_sepa" style="background:#ffffcc;" >
                                    <option value="01" selected>01: 인감사용</option>
                                    <option value="02">02: 서명사용</option>
                                    <option value="03">03: 인감,서명사용</option>
                                </select>
                            </td>
                            <!-- <th>세금대구분</th>
                            <td>
                                <select title="세금우대구분" name="tax_pvltrt_sepa" disabled="disabled" style="background:#E5E5E5;" >
                                    <option value="01" selected>&nbsp;</option>
                                    <option value="02">0: 일반과세</option>
                                    <option value="03">2: 세금우대</option>
                                    <option value="04">5: 생계형</option>
                                </select>
                            </td> -->
                        </tr>
                        <tr>
                            <th><span class="note11 pointer">(*)적요</span></th>
                            <td colspan="5"><input name="summary" id="summary" type="text" ></td>
                        </tr>
                    </tbody>
                </table>
                
                
                <div class="comment2 posi7">
                    <div class="close pointer"><img src="${ctx }/resources/image/icon/close.png" alt="닫기" ></div>
                    <div class="comt2">
                        <h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;자금원천 및 출처 구분</h5><br><br>
                        <p>자금원천, 자금출처 등은 자금세탁방지를 위한 정보이므로 <span class="hl">고객과 상담중 들은 내용</span>을 입력합니다.</p>
                    </div>
                </div>
                <div class="comment2 posi8">
                    <div class="close pointer"><img src="${ctx }/resources/image/icon/close.png" alt="닫기" ></div>
                    <div class="comt2">
                        <h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;거래목적 구분</h5><br><br>
                        <p>자금원천, 자금출처 등은 자금세탁방지를 위한 정보이므로 <span class="hl">고객과 상담중 들은 내용</span>을 입력합니다.</p>
                    </div>
                </div>                  
                <div class="comment2 posi9">
                    <div class="close pointer"><img src="${ctx }/resources/image/icon/close.png" alt="닫기" ></div>
                    <div class="comt2">
                        <h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;인감/서명 구분</h5><br><br>
                        <p>인감과 서명을 동시에 등록하는 경우에는 인감 또는 서명을 선택적으로 사용할수 있어요.<br>
                            <span class="hl">서명만 등록하는 경우</span>에는 창구 거래시 신분증을 지참한 본인인 경우에만 거래가 가능합니다.</p>
                    </div>
                </div>
                <div class="comment2 posi11">
                    <div class="close pointer"><img src="${ctx }/resources/image/icon/close.png" alt="닫기" ></div>
                    <div class="comt2">
                        <h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;적요</h5><br><br>
                        <p>향후 고객상담과 자금세탁방지에<br>
                            필요한 정보로, 고객과 상담중 들은 자금출처, 거래목적에 대한 정보를 입력합니다.</p>
                    </div>
                </div>
                  

              </div><!--End of info02-wrap-0002-->

                <div class="btn_both">
					<div class="fr">
						<input type="button" value="수신신규" id="register">						
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