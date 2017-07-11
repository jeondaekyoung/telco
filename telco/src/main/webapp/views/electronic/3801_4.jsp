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
    <script type="text/javascript" src="${ctx }/resources/vjs/electronic/3801_4.js"></script>
</head>

<body>
 <jsp:include page="/views/include/header.jsp"/>

    <div id="container">
        <div class="nav">
            <ul>
                <li>&nbsp;▶ 전자금융</li>                
                <li class="nav_dir">&nbsp;&nbsp;&nbsp;전자금융</li>
            </ul>
        </div>
        
        <input type="text" name="customer_no" id="customer_no" readonly="readonly" style="display:none">
        
        <div id="contents">
            <h3>[3801] 전자금융 신규/조회/변경/해지</h3>
            <div id="tabs">
              <div class="srch-3801">
                <div class="srch-inner-3801">
                    <ul><li>거래구분</li>
                            <li><select  title="거래구분" onChange="javascripｔ:moveUrl(this);" style="background:#ffffcc;">
                                <option value="${ctx }/views/electronic/3801.jsp">1: 신규</option>
                                <option value="${ctx }/views/electronic/3801_2.jsp">2: 변경</option>
                                <option value="${ctx }/views/electronic/3801_3.jsp">3: 해지</option>
                                <option value="${ctx }/views/electronic/3801_4.jsp" selected>4: 조회</option>
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
                        <li><input type="text" id="customer_name" readonly="readonly"></li>
                    </ul>
                    <ul>
                        <li>고객등급</li>
                        <li><select title="고객등급" style="background:#e5e5e5" disabled="disabled">
                                <option>개인-Green(일반)</option>
                            </select>
                        </li>
                    </ul>
                    
                    <table id="myTable">
                        <caption>전자금융 거래 조회 내역</caption>
                        <colgroup>
                            <col style="width:5%" >
                            <col style="width:" >
                            <col style="width:" >
                            <col style="width:" >
                            <col style="width:">
                            <col style="width:" >
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
                
              <h4>공통입력정보</h4>
              <div class="info03-wrap-3801-7">
                <div class="info03-inner-3801-7">
                    <table class="ib-info" >
                        <caption>전자금융 서비스신청 조회 내역</caption>
                        <colgroup>
                            <col style="width:18%">
                            <col style="width:15%">
                            <col style="width:">
                            <col style="width:15%">
                            <col style="width:18%">
                            <col style="width:15%">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th>서비스신규일자</th>
                                <td><input type="text" id="open_date" readonly ></td>
                                <th>신청점</th>
                                <td><input type="text" id="open_branch" readonly></td>
                                <th>해지점</th>
                                <td><input type="text" id="cancel_branch" readonly></td>
                            </tr>
                            <tr>
                                <th>인터넷모바일최근접속</th>
                                <td><input type="text" style="background:#e5e5e5" readonly></td>
                                <th>인터넷모바일최근이체성거래</th>
                                <td><input type="text" style="background:#e5e5e5" readonly></td>
                                <th>서비스해지일자</th>
                                <td><input type="text" id="cancel_date" readonly></td>
                            </tr>
                            <tr>
                                <th>보안매체교부상태</th>
                                <td><input type="text" id="security_media_sepa" readonly></td>
                                <th>보안매체비번오류횟수</th>
                                <td><input type="text"  style="background:#e5e5e5" readonly></td>
                                <th>이용자비번오류횟수</th>
                                <td><input type="text"  style="background:#e5e5e5" readonly></td>
                            </tr>
                            <tr>
                                <th>1일이체한도</th>
                                <td><input type="text" id="elec_transfer_day" readonly></td>
                                <th>1회이체한도</th>
                                <td><input type="text" id="elec_transfer_once" readonly></td>
                                <th>일중이체누계</th>
                                <td><input type="text"  style="background:#e5e5e5" readonly></td>
                            </tr>
                            <tr>
                                <th>해외IP차단서비스</th>
                                <td>
                                    <select  title="해외IP차단서비스"  style="background:#e5e5e5" disabled="disabled">
                                        <option>&nbsp;</option>
                                        <option>신청안함</option>
                                    </select>
                                </td>
                                <th>대리인 실명번호</th>
                                <td><input type="text" id="sub_num" readonly></td>
                                <th>거래자구분</th>
                                <td><input type="text" id="owner_sepa" readonly></td>
                            </tr>
                            <tr>
                                <th>수수료 감면율</th>
                                <td>
                                    <select  title="수수료감면율"  style="background:#e5e5e5" disabled="disabled" >
                                    <option>01: 징구</option>
                                    </select>
                                </td>
                                <th>수수료 감면기간</th>
                                <td><input type="text" style="background:#e5e5e5" readonly></td>
                                <th>권유 직원</th>
                                <td><input type="text" id="user_id" readonly></td>
                            </tr>
                        </tbody>
                    </table>
                    
                    <div class="wd50"><h4>출금지정계좌정보</h4>
                        <table >
                            <caption>출금지정계좌정보</caption>
                            <colgroup>
                                <col >
                                <col style="width:30%">
                                <col style="width:30%">
                            </colgroup>
                            <thead>
                                <tr>
                                    <th>출금계좌번호</th>
                                    <th>신청일자</th>
                                    <th>해지일자</th>
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
                    
                    <div class="wd50"><h4>입금지정계좌정보</h4>
                        <table >
                            <caption>입금지정계좌정보</caption>
                            <colgroup>
                                <col style="width:20%">
                                <col >
                                <col style="width:20%">
                                <col style="width:20%">
                                <col style="width:15%">
                            </colgroup>
                            <thead>
                                <tr>
                                    <th>은행</th>
                                    <th>계좌번호</th>
                                    <th>신청일자</th>
                                    <th>해지일자</th>
                                    <th>예금주</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div><!--End of info03-inner-3801-->
              </div><!--End of info03-wrap-3801-->
                
            </div>
        </div>
    </div>
</body>
</html>