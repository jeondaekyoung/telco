<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>[0070] 주의사고해제</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <meta name="apple-mobile-web-app-capable" content="yes"/>
	<link href="../css/pop.css" type="text/css" rel="stylesheet">
</head>

<body>
    <div id="wrap">
      <div class="pop-0002">
        <div class="pop-0002-inner">
            <img src="../image/icon/info.png" alt="인포아이콘" />
            <div class="pop-0002-inner1">
                <table>
                    <colgroup>
                        <col style="width:20%;"/>
                        <col />
                    </colgroup>
                    <caption>주의사고해제 신청시 나타나는 테이블입니다. 해제코드와 승인내역과 고객 계좌정보로 이루어져 있습니다.</caption>
                    <thead><th>코드</th><th>메시지</th></thead>
                    <tbody>
                        <tr><td>PCOM10030</td><td>[책임자승인] 주의사고해제</td></tr>
                        <tr><td></td><td>거래종류 [통장+인감분실] 거래입니다.</td></tr>                       
                        <tr><td></td><td>예금주명 = [나하나], 거래후잔액 = [25,140,000]</td></tr>
                        <tr><td></td><td>&nbsp;</td></tr>
                    </tbody>
                </table>
            </div>
            <div class="pop-0002-inner2">
                <ul><li><span>승인사유코드</span></li>
                    <li><select><option></option>
                            <option>01: 책임자승인</option>
                            <option>02: 텔러자체승인</option>
                        </select>
                    </li>
                </ul>
                <ul><li><span>1차 책임자정보</span></li>
                    <li><span>텔러행번</span></li>
                    <li><input type="text" /></li>
                    <li><span>기기번호</span></li>
                    <li><input type="text" /></li>
                    <li><span>직위코드</span></li>
                    <li><input type="text" /></li>
                </ul>
                <ul><li><span>2차 책임자정보</span></li>
                    <li><span>텔러행번</span></li>
                    <li><input type="text" /></li>
                    <li><span>기기번호</span></li>
                    <li><input type="text" /></li>
                    <li><span>직위코드</span></li>
                    <li><input type="text" /></li>
                </ul>
            </div>
        </div>
      </div>

      <div class="btn_both">
        <div class="btn0002">
            <a onclick="window.close()" class="btn_big"><span>취소</span></a>
            <a onclick="window.close()" class="btn_big"><span>확인</span></a>
        </div>
      </div>
    </div><!--wrap-->

</body>
</html>