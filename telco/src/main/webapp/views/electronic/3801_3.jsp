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
    <script  type="text/javascript" src="${ctx }/resources/vjs/electronic/3801_3.js"></script>
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
        
        <input type="text" id="schoolName" readonly="readonly" value="${sessionScope.schoolName }" style="display:none">
        <input type="text" name="customer_no" id="customer_no" readonly="readonly" style="display:none">
        
        <div id="contents">
            <h3>[3801] 전자금융 신규/조회/변경/해지</h3>
            <div id="tabs">
              <div class="srch-3801">
                <div class="srch-inner-3801">
                    <ul><li>거래구분</li>
                            <li><select title="거래구분" onChange="javascripｔ:moveUrl(this);" style="background:#ffffcc;">
                                <option value="${ctx }/views/electronic/3801.jsp">1: 신규</option>
                                <option value="${ctx }/views/electronic/3801_2.jsp" >2: 변경</option>
                                <option value="${ctx }/views/electronic/3801_3.jsp" selected="selected">3: 해지</option>
                                <option value="${ctx }/views/electronic/3801_4.jsp">4: 조회</option>
                              </select>
                            </li>
                        </ul>
                        <ul>
                            <li>실명</li>
                            <li><input type="text" id="realname_num" style="background:#ffffcc"></li>
                            <li><img src="${ctx }/resources/image/icon/search.png" id="findCustomer" alt="조회버튼" style="cursor:pointer"></li>
                        </ul>
                </div><!--End of srch-inner-->
              </div><!--End of srch-->

            
              <h4>기본정보</h4>
              <div class="info01-wrap-3801">
                <div class="info01-inner-3801">
                    <div>
                        <ul>
                            <li>고객명</li>
                            <li><input type="text" id="customer_name" readonly="readonly" ></li>
                        </ul>
                        <ul>
                            <li>고객등급2</li>
                            <li>
                                <select title="고객등급" style="background:#e5e5e5" disabled="disabled" >
                                    <option>개인-Green(일반)</option>
                                </select>
                            </li>
                        </ul>
                    </div>
                    
                    <table id="myTable" >
                        <caption>전자금융 해지 조회내역</caption>
                        <colgroup>
                            <col style="width:5%" >
                            <col style="width:" >
                            <col style="width:" >
                            <col style="width:" >
                            <col style="width:" >
                            <col style="width:" >
                        </colgroup>
                        <thead>
                            <tr><th>순번</th>
                                <th>선택</th>
                                <th>가입서비스</th>
                                <th>ID</th>
                                <th>상태</th>
                                <th><span class="note1 pointer">(*)해지신청</span></th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                    
                    
                        <div class="comment2 posi42">
                            <div class="close pointer"><img src="${ctx }/resources/image/icon/close.png" alt="닫기" ></div>
                            <div class="comt2">
                                <h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;인증서폐기</h5><br><br>
                                <p>해지시 인증서를 폐기하게 되면, 나중에 전자금융을 하기 위해서 은행거래용공인인증서를 다시 발급 받아야 합니다.</p>
                            </div>
                        </div>
                        
                </div><!--End of info02-inner-3801-->
              </div><!-- End of info02-wrap-3801 -->
                
              <div class="btn_both">
                <div class="fr">
                    <%-- <a onClick="window.open('${ctx}/views/electronic/pop_3801_3.jsp','[3801]전자금융 해지','width=400, height=400, location=no')"><input type="button" value="해지"></a> --%>
                    <input type="button" value="해지" id="cancel" >
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