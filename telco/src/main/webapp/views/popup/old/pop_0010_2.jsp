<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>상품목록조회(수신)</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <meta name="apple-mobile-web-app-capable" content="yes"/>
	<link href="../css/pop.css" type="text/css" rel="stylesheet">
</head>

<body>
    <div id="wrap">
      <div class="pop-0010">
        <div class="pop-0010-inner1">
            <table summary="상품명,상품코드,조회버튼,초기화버튼으로 구성되어 있습니다.">
                <colgroup>
                    <col style="width:20%" />
                    <col style="width:60%" />
                    <col style="width:20%" />
                </colgroup>
                <caption>상품목록조회(수신)</caption>
               
                <tbody>
                    <tr><th>상품명</th>
                        <td><input type="text" name="" id="" /></td>
                        <td><button>조회</button></td></tr>
                    <tr><th>상품코드</th>
                        <td><input type="text" name="" id="" style="width:31%" />-<input type="text" name="" id="" style="width:31%" />-<input type="text" name="" id="" style="width:31%" /></td>
                        <td><button>초기화</button></td></tr>
                </tbody>
            </table>
        </div>
        <div class="pop-0010-inner2">
            <table summary="상품코드,상품한글명으로 구성되어 있습니다.">
                <colgroup>
                    <col style="width:40%" />
                    <col style="width:60%" />
                </colgroup>
                <caption>상품 조회 내역</caption>
                <thead>
                    <tr><th>상품코드</th><th>상품한글명</th></tr>
                </thead>
                <tbody>
                    <tr>
                        <td>001-00001-01</td>
                        <td>입출금자유예금(개인)</td></tr>
                    <tr>
                        <td>002-00001-01</td>
                        <td>입출금자유예금(기업)</td></tr>
                    <tr>
                        <td>001-30001-00</td>
                        <td>e-스마트통장(개인)</td></tr>
                    <tr>
                        <td>001-20001-01</td>
                        <td>부자되는예금(개인-예금)</td></tr>
                    <tr>
                        <td>001-10001-01</td>
                        <td>부자되는적금(개인-적금)</td></tr>
                    <tr>
                        <td>001-10001-02</td>
                        <td>아이사랑적금(개인-적금)</td></tr>
                    <tr>
                        <td>001-30001-01</td>
                        <td>e-스마트적금(개인-적금)</td></tr>
                    <tr>
                        <td>001-40001-01</td>
                        <td>주택청약저축(개인-주택청약적금)</td></tr>
                    <tr>
                        <td>003-10001-00</td>
                        <td>상호부금</td></tr>
                    
                </tbody>
            </table>
        </div>
      </div>
    </div><!--wrap-->

</body>
</html>