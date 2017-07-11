<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath }" scope="request" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>[1821] 타행수표 즉시지급거래</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
    <meta name="viewport" content="user-scalable=no, width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
	<link href="${ctx }/resources/css/common.css" type="text/css" rel="stylesheet">
	<link href="${ctx }/resources/css/media.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script type="text/javascript" src="${ctx }/resources/js/pop.js"></script> 
    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script type="text/javascript" src="${ctx }/resources/vjs/add/1821.js"></script>
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
                <li><a href="${ctx }/views/check/1403.jsp">&nbsp;&nbsp;&nbsp;자기앞수표 지급</a></li>
                <li class="nav_dir"><a class="nav_bold">&nbsp;&nbsp;&nbsp;타행수표 즉시지급거래</a></li>
                <li><a href="${ctx }/views/add/0007.jsp">&nbsp;&nbsp;&nbsp;사고신고관리</a></li>
                <li><a href="${ctx }/views/add/0070.jsp">&nbsp;&nbsp;&nbsp;주의사고 등록/해제</a></li>
                <li><a href="${ctx }/views/bankbook/0004.jsp">&nbsp;&nbsp;&nbsp;해지</a></li>
                <li><a href="${ctx }/views/add/1099.jsp">&nbsp;&nbsp;&nbsp;거래취소</a></li>
            </ul>
        </div>
        
        <DIV id="contents">
            <h3>[1821] 타행수표 즉시지급거래</h3>
            
            <!--div class="btn0290">
                <a href="#">고객관계</a>
                <a href="#">고객코멘트</a>
                <a href="#">주의사고</a>
            </div-->
            
            <div id="tabs">
              <div class="srch-0002">
                <div class="srch-inner-0002">
                <ul><li>거래종류</li>
                        <li><select title="거래종류" style="background: #ffffcc;">
                                <option>거래종류</option>
                                <option>1: 타행수표즉시지급</option>
                            </select>
                        </li>
                    </ul>
                
                    
                </div><!--End of srch inner 0002-->
              </div><!--End of srch 0002-->
                
              <div class="info01-wrap-0010">
              	
                <div class="info01-title1-0010">
                    <h4>거래고객정보</h4>
                    
                    <div class="info01-inner01-0010" style="padding:10px;">
                        <ul>
                            <li><span>실명번호</span>
                                <input type="text" style="background: #ffffcc;">
                            </li>
                            <li><span>고객명</span>
                                <input type="text" style="background: #ffffcc;">
                            </li>
                            <li><span>의뢰인과의관계</span>
                                <select title="예금주와의관계" >
                                        <option>예금주와의관계</option>
                                        <option value="본인">00: 본인</option>
                                        <option value="배우자">01: 배우자</option>
                                        <option value="배우자부모">03: 배우자부모</option>
                                        <option value="사위">04: 사위</option>
                                        <option value="며느리">05: 며느리</option>
                                        <option value="외조부모">06: 외조부모</option>
                                        <option value="외손자">07: 외손자</option>
                                        <option value="위임장(개인인감)">08: 위임장(개인인감)</option>
                                        <option value="위임장(법인인감)">09: 위임장(법인인감)</option>
                                        <option value="공증받은위임장">10: 공증받은위임장</option>
                                        <option value="기타">11: 기타</option>
                                        <option value="직계존속(조부모)">12: 직계존속(조부모)</option>
                                        <option value="직계비속(자녀)">13: 직계비속(자녀)</option>
                                        <option value="직계비속(손자)">14: 직계비속(손자)</option>
                                        <option value="형제자매">15: 형제자매</option>
                                        <option value="친척">16: 친척</option>
                                        <option value="상사">17: 상사</option>
                                        <option value="동료(친구)">18: 동료(친구)</option>
                                        <option value="직원">19: 직원</option>
                                        <option value="대표자">20: 대표자</option>
                                    </select>
                            </li>
                            <li><span>대리인 실명번호</span>
                                <input type="text" >
                            </li>
                            <li><span>대리인 성명</span>
                                <input type="text" >
                            </li>
                         </ul>
                    </div><!--End of info01-inner01-0002-->
                </div><!--End of info01-title1-0002-->
                

                <div class="info01-title2-0010">
                    <h4>수표정보</h4>
                    <div class="info01-inner03-0010" style="padding:16px 0;">
  
                        <table>
                            <caption>수표정보 테이블</caption>
                            <colgroup>
                                <col style="width:40%">
                                <col >
                            </colgroup>

                            <tbody>
                                <tr>
                                  <th>발행지로코드</th>
                                    <td><input type="text" style="background:#ffffcc" >
                                </tr>
                                <tr>
                                  <th>수표번호</th>
                                    <td><input type="text" style="background:#ffffcc;"></td>
                                </tr>
                                <tr>
                                    <th>수표권종</th>
                                    <td><select title="수표권종" style="background:#ffffcc;">
                                            <option>수표권종</option>
                                            <option >13: 10만원권자기앞수표</option>
                                            <option >14: 30만원권자기앞수표</option>
                                            <option >15: 50만원권자기앞수표</option>
                                            <option >16: 100만원권자기앞수표</option>
                                            <option >19: 부정액</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <th>수표매수</th>
                                    <td><input type="text" style="background:#ffffcc">
                                    </td>
                                </tr>
                                
                            </tbody>
                        </table>
                    </div>
                </div>
				
                <div class="info01-title2-0010">

                <h4>금액정보</h4>

                    <div class="info01-inner02-0010" style="padding:36px 2px;">
                        <table>
                            <caption>금액정보 테이블</caption>
                            <colgroup>
                                <col style="width:40%">
                                <col >
                            </colgroup>                           
                            <tbody>
                                <tr>
                                	<th>현금 지급액</th>
                                    <td><select title="펀드번호" style="background:#ffffcc" ><option>&nbsp;</option></select></td>
                                </tr>
                                <tr>
                                	<th>대체 지급액</th>
                                    <td><input type="text"  style="background:#ffffcc" ></td>
                                </tr>
                                <tr>
                                	<th>거래금액 계</th>
                                    <td><input type="text" readonly="readonly" style="background:#E5E5E5;">
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
                        <col >
                        <col >
                        <col style="width:15%">
                        <col >
                    </colgroup>
                    <tbody>
                        <tr>
                            <th>거래목적구분</th>
                            <td>
                                <select title="거래목적구분" style="width:48%">
                                    <option>거래목적구분</option>
                                </select>
                                <input type="text"  style="width:48%"></td>
                            <th>연락처</th>
                            <td><input type="text" ></td>
                        </tr>
                        <tr>
                            <th>자금출처구분</th>
                            <td>
                                <select title="자금출처구분"  style="width:48%; background:#ffffcc;">
                                    <option>자금출처구분</option>
                                    <option >1: 근로및연금소득</option>
                                    <option >2: 퇴직소득</option>
                                    <option >3: 사업소득</option>
                                    <option >4: 부동산임대소득</option>
                                    <option >5: 부동산양도소득</option>
                                    <option >6: 금융소득(이자및배당)</option>
                                    <option >7: 상속/증여</option>
                                    <option >8: 일시재상양도로인한소득</option>
                                    <option >9: 기타</option>
                                </select>
								<input type="text" style="width:48%" ></td>
                            <th>영수증발급</th>
                            <td>
                                <select title="영수증발급" >
                                    <option>영수증발급</option>
                                    <option>1: 예</option>
                                    <option>2: 아니오</option>
                                </select>
                            </td>
                        </tr>
                    </tbody>
                </table>

              </div><!--End of info02-wrap-0002-->


						<div class="mybtn">
							<input type="button"  value="내용추가">
						</div>
       
                  
              <h4>지급목록</h4>
				<div class="info01-wrap-0070">
					<div class="info01-inner-1701" style="padding:5px;">
						
						<table class="content1701">
							<caption>해지,변경,취소거래 내용 테이블</caption>
							<colgroup>
								<col >
								<col >
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
									<th>수표상태</th>
									<th>발행지로코드</th>
									<th>권종구분</th>
									<th>수표번호</th>
									<th>수표금액</th>
									<th>현금지금액</th>
									<th>대체지급액</th>
									<th>연락처</th>
								</tr>
							</thead>
                            
                            <tfoot>
                                <tr>
									<th>합계</th>
									<th>&nbsp;</th>
									<th>&nbsp;</th>
									<th>&nbsp;</th>
									<th>&nbsp;</th>
									<th>.</th>
									<th>.</th>
									<th>.</th>
									<th></th>
								</tr>
                            </tfoot>
                            
							<tbody>
								<tr>
									<td>1</td>
									<td>.</td>
									<td>.</td>
									<td>.</td>
									<td>.</td>
									<td>.</td>
									<td>1,000,000,000</td>
									<td>.</td>
									<td>050-0505-1415</td>
								</tr>
								<tr>
									<td>2</td>
									<td>.</td>
									<td>.</td>
									<td>.</td>
									<td>.</td>
									<td>.</td>
									<td>1,000,000,000</td>
									<td>.</td>
									<td>050-0505-1415</td>
								</tr>
								
								<tr>
									<td>3</td>
									<td>.</td>
									<td>.</td>
									<td>.</td>
									<td>.</td>
									<td>.</td>
									<td>1,000,000,000</td>
									<td>.</td>
									<td>050-0505-1415</td>
								</tr>
								<tr>
									<td>1</td>
									<td>.</td>
									<td>.</td>
									<td>.</td>
									<td>.</td>
									<td>.</td>
									<td>1,000,000,000</td>
									<td>.</td>
									<td>050-0505-1415</td>
								</tr>
								<tr>
									<td>2</td>
									<td>.</td>
									<td>.</td>
									<td>.</td>
									<td>.</td>
									<td>.</td>
									<td>1,000,000,000</td>
									<td>.</td>
									<td>050-0505-1415</td>
								</tr>
								
								<tr>
									<td>3</td>
									<td>.</td>
									<td>.</td>
									<td>.</td>
									<td>.</td>
									<td>.</td>
									<td>1,000,000,000</td>
									<td>.</td>
									<td>050-0505-1415</td>
								</tr>
							</tbody>
						</table>

					</div>
					<!--End of info01-inner-0070-->
				</div>
				<!--End of info01-wrap-0070-->
                  
                  
                  
                <div class="btn_both">
                    <div class="fr">
                        <input type="button" value="등록">
                    </div>
                </div>
            </div><!--End of tabs-->
        </DIV><!--End of contents-->
    </div><!--container-->

</body>
    
</html>