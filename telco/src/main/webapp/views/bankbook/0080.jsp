<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath }" scope="request" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>[0080] 통장정리</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
    <meta name="viewport" content="user-scalable=no, width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <link href="${ctx }/resources/css/common.css" type="text/css" rel="stylesheet">
    <link href="${ctx }/resources/css/media.css" type="text/css" rel="stylesheet">
    <link href="${ctx }/resources/css/tab.css" type="text/css" rel="stylesheet">
    <link href="${ctx }/resources/css/study.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="${ctx }/resources/js/jquery-1.11.3.min.js"></script>
    <script src="${ctx }/resources/js/pop.js" type="text/javascript"></script> 
    <script type="text/javascript" src="${ctx }/resources/vjs/bankbook/0080.js"></script>
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
                <li class="nav_dir"><a href="#" class="nav_bold">&nbsp;&nbsp;&nbsp;통장정리</a></li>
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
            <h3>[0080] 통장정리 <img class="more" src="${ctx }/resources/image/icon/more.png" alt="코멘트"></h3>

            <div class="comment1">
                <div class="comt">
                    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <span class="hl">통장정리</span>는 통장에 거래내역을 프린트하는 업무입니다.
                        통장을 통장프린트기에 넣으면 자동으로 M/S(마그네틱 스트라이프)를 읽고 계좌번호와 통장 발행번호가 확인되며, 아직 정리되지 않은 거래내역이 통장에 프린트 됩니다.
                    </p>
                </div>
            </div>
        
            <div id="tabs">
              <div class="srch">
                <div class="srch-inner">
                   <ul>
                        <li>
                        	<span>계좌번호</span>
                            <input type="text" id="account_num" style="background:#ffffcc;">
                            <img src="${ctx }/resources/image/icon/search.png" alt="조회버튼" id="findBankbook" style="cursor:pointer">
                        </li>
                   </ul>
                   <ul>
                      <li><span>통장발행번호</span>
                        <input type="text" style="background:#e5e5e5;" readonly="readonly">
                      </li>
                  </ul>
                </div><!--End of srch-inner-->
              </div><!--End of srch-->
                
              <div class="info01" style="margin-bottom:25px;">
                <div class="info01-inner">
                    <div class="account"><img src="${ctx }/resources/image/bg/warning.png" alt="통장을 넣어주세요" id="imgBankbook"></div>
                </div><!--End of info01-inner-->
              </div><!--End of info01-->
              
              <div class="btn_both">
                <div class="fr">
                    
                </div>
            </div>
            </div><!--End of tabs-->
        </DIV><!--End of contents-->
    </div><!--container-->

</body>
    
</html>