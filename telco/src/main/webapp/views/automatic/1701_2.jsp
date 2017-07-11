<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath }" scope="request" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>[1701]자동이체 등록/변경/해지/취소</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="content-type" content="text/html; charset=utf-8">
    <meta name="viewport" content="user-scalable=no, width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <meta name="apple-mobile-web-app-capable" content="yes">
	<link href="${ctx }/resources/css/common.css" type="text/css" rel="stylesheet">
	<link href="${ctx }/resources/css/media.css" type="text/css" rel="stylesheet">
	<link href="${ctx }/resources/css/study.css" type="text/css" rel="stylesheet">
	<link rel='stylesheet' href='http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css'>
    <script type="text/javascript" src="${ctx }/resources/js/jquery-1.11.3.min.js"></script> 
    <script src="${ctx }/resources/js/pop.js" type="text/javascript"></script> 
    <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js" type="text/javascript"></script>
    <script type="text/javascript" src="${ctx }/resources/vjs/automatic/1701_2.js"></script>
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
				<li class="nav_dir"><a href="#" class="nav_bold">&nbsp;&nbsp;&nbsp;자동이체</a></li>
				<li><a href="${ctx }/views/bankbook/0080. jsp">&nbsp;&nbsp;&nbsp;통장정리</a></li>
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

		<DIV id="contents">
			<h3>[1701] 자동이체 변경</h3>

			<div id="tabs">
				<div class="srch-0002">
					<div class="srch-inner-0002">
                        <ul>
                            <li>거래구분</li>
                            <li><select title="거래구분" onChange="javascripｔ:moveUrl(this);" style="background: #ffffcc">
											<option value="${ctx }/views/automatic/1701.jsp">1: 등록</option>
											<option value="${ctx }/views/automatic/1701_2.jsp" selected>2: 변경</option>
											<option value="${ctx }/views/automatic/1701_3.jsp">3: 조회</option>
											<option value="${ctx }/views/automatic/1701_4.jsp">4: 해지</option>
									</select>
                            </li>
                        </ul>
                        <ul>
                            <li>업무종류</li>
                            <li>
                            	<select title="업무종류" id="busi_kind" style="background: #ffffcc; width:150px;">
									<option value="300" selected="selected">300: 요구불간자동이체</option>
									<option value="310">310: 월부금자동이체</option>
									<option value="915">915: 전체</option>
								</select>
							</li>
                        </ul>

					</div>
					<!--End of srch-inner-0070-->
				</div>
				<!--End of srch-0070-->

				
                <h4>출금 계좌정보</h4>
                <div class="srch-0002">
					<div class="srch-inner-0002">
                        <ul>
                            <li><span class="note1 pointer">(*)계좌번호</span></li>
                            <li><input  type="text" id="account_num" style="background: #ffffcc;" ></li>
                            <li><img src="${ctx }/resources/image/icon/search.png" id="findAtcngsByBankbook" alt="조회버튼" style="cursor:pointer;"></li>
                        </ul>
                        <ul>
                            <li>예금주명</li>
                            <li><input  type="text" id="customer_name" disabled></li>
                        </ul>
                        <ul>
                            <li><span class="note3 pointer">(*)비밀번호</span></li>
                            <li><input  type="text" id="withdrawal_pw" style="background: #ffffcc;" maxlength="4"></li>
                        </ul>
                    </div>                    
                    
                    <div class="comment2 posi24">
						<div class="close pointer"><img src="${ctx }/resources/image/icon/close.png" alt="닫기" ></div>
						<div class="comt2">
							<h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;계좌번호</h5>
							<br>	<br>
							<p><span class="hl">출금</span>될 계좌 번호를 입력합니다.</p>
						</div>
					</div>
					<div class="comment2 posi25">
						<div class="close pointer"><img src="${ctx }/resources/image/icon/close.png" alt="닫기" ></div>
						<div class="comt2">
							<h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;비밀번호</h5>
							<br><br>
							<p>은행 창구에서 통장, 증서를 이용한 거래에 필요한 비밀번호로, <span class="hl">PIN패드로 고객이 직접 입력</span>
								하도록 합니다. 남이 쉽게 알 수 있는 동일한 숫자, 연속된 숫자, 전화번호나 실명번호 등은 사용할 수 없습니다.</p>
						</div>
					</div>
					
                </div>

                <h4>자동이체 현황</h4>
				<div class="info01-wrap-0070">
					<div class="info01-inner-1701">
						<table class="content1701" id="myTable">
							<caption>해지,변경,취소거래 내용 테이블</caption>
							<colgroup>
								<col style="width:" >
								<col style="width:" >
								<col style="width:" >
								<col style="width:" >
								<col style="width:" >
								<col style="width:" >
								<col style="width:" >
								<col style="width:" >
								<col style="width:" >
								<col style="width:" >
								<col style="width:" >
							</colgroup>
							<thead>
								<tr>
									<th>신청일자</th>
									<th>입금은행</th>
									<th>계좌번호</th>
									<th>예금주</th>
									<th>이체금액</th>
									<th>이체간격</th>
									<th>이체기일</th>
									<th>이체개시일</th>
									<th>이체 만료일</th>
									<th>지급인자내용</th>
									<th>입금인자내용</th>
								</tr>
							</thead>
							<tbody>
								
							</tbody>
						</table>

					</div>
					<!--End of info01-inner-0070-->
				</div>
				<!--End of info01-wrap-0070-->
                
                
                
                <h4>자동이체 정보 변경</h4>
				<div class="info01-wrap-0070">
					<div class="info01-inner-1701 table0008">
						<!-- 2:해제 선택시 나타납니다. -->
						<table>
							<caption>해지,변경,취소거래 조회 테이블</caption>
							<colgroup>
								<col style="width: 13%">
								<col style="width: 20%" >
								<col style="width: 13%" >
								<col style="width: 20%" >
								<col style="width: 14%" >
								<col style="width: 20%" >
							</colgroup>
							<tbody>
                                <tr>
                                    <th>입금은행</th>
                                    <td>
                                    	<select title="은행종류" id="transfer_bank" style="background: #ffffcc;">
                                            <option value="01" selected>01:텔코은행</option>
				                            <option value="02">02: 국민은행</option>
				                            <option value="03">03: 우리은행</option>
				                            <option value="04">04: 신한은행</option>
				                            <option value="05">05: 기업은행</option>
				                            <option value="06">06: 하나은행</option>
				                            <option value="07">07: 농협중앙회</option>
                                        </select>
                                        <input type="text" id="seq_no" style="display: none;">
                                    </td>
                                    <th>입금계좌</th>
                                    <td>
                                    	<input type="text" id="transfer_account_num" style="background: #ffffcc; width:130px">
                                        <img src="${ctx }/resources/image/icon/search.png" alt="조회버튼" id="depositBankbook" style="cursor:pointer;">
                                    </td>
                                    <th>예금주명</th>
                                    <td><input type="text" id="transfer_customer_name" style="background:#ffffcc;"></td>
                                </tr>
								<tr>
									<th>이체 기일</th>
									<td><input type="text" id="transfer_day" style="background: #ffffcc;" maxlength="2"></td>
									<th>이체 간격</th>
									<td>
										<select title="이체간격" id="transfer_interval" style="background: #ffffcc;">
											<option value="01" selected="selected">01: 1개월간격</option>
										</select>
									</td>
									<th>이체금액</th>
									<td><input type="text" id="atcng_amount" style="background: #ffffcc;"></td>
								</tr>
								<tr>
									<th><span class="note4 pointer">(*)이체개시일</span></th>
									<td><input type="text" id="transfer_start" style="background: #ffffcc; width: 140px" ></td>
									<th><span class="note6 pointer">(*)이체만료일</span></th>
									<td><input type="text" id="transfer_end" style="background: #ffffcc; width: 140px"></td>
								</tr>
								<tr>
									<th>거래시메모내용</th>
									<td colspan="3"><input  type="text" id="summary"></td>
								</tr>
								<tr>
									<th><span class="note7 pointer">(*)지급인자내용</span></th>
									<td><input  type="text" id="to_summary"></td>
									<th><span class="note8 pointer">(*)입금인자내용</span></th>
									<td><input  type="text" id="from_summary"/></td>
								</tr>
							</tbody>
						</table>
						
						
						<div class="comment2 posi26">
							<div class="close pointer"><img src="${ctx }/resources/image/icon/close.png" alt="닫기" ></div>
							<div class="comt2">
								<h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;이체 개시일</h5>
								<br><br>
								<p>선택 입력사항으로 고객요청 시, 이체 개시일을 지정할 수 있습니다.</p>
							</div>
						</div>
						<div class="comment2 posi27">
							<div class="close pointer"><img src="${ctx }/resources/image/icon/close.png" alt="닫기" ></div>
							<div class="comt2">
								<h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;이체 만료일</h5>
								<br><br>
								<p>이체만료일 미입력 시 자동이체 해지 시까지 계속 이체됩니다.</p>
							</div>
						</div>
						<div class="comment2 posi28">
							<div class="close pointer"><img src="${ctx }/resources/image/icon/close.png" alt="닫기" ></div>
							<div class="comt2">
								<h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;지급 인자 내용</h5>
								<br><br>
								<p>지급인자 내용에 적은 문구는 자동이체 시 <span class="hl">출금</span>되는 통장에 인자됩니다.
									고객이 통장에 문구 기재를 요청하는 경우에 입력합니다.</p>
							</div>
						</div>
						<div class="comment2 posi29">
							<div class="close pointer"><img src="${ctx }/resources/image/icon/close.png" alt="닫기" ></div>
							<div class="comt2">
								<h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;입금 인자 내용</h5>
								<br><br>
								<p>입금인자 내용에 적은 문구는자동이체 시 <span class="hl">입금</span>되는 통장에 인자됩니다.
									고객이 통장에 문구 기재를 요청하는 경우에 입력합니다.</p>
							</div>
						</div>
						

					</div>
					<!--End of info01-inner-0070-->
				</div>
				<!--End of info01-wrap-0070-->

				<div class="btn_both">
					<div class="fr">
						<!-- <a onClick="window.open('popup/pop_1701_3.html','[1701]자동이체 변경','width=400, height=400, location=no')">sss</a> -->
						<input type="button" id="modify" value="등록">
					</div>
				</div>

			</div>
			<!--End of tabs-->
		</DIV>
		<!--End of contents-->
	</div>
	<!--container-->

</body>

</html>
