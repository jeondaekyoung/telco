<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath }" scope="request" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>고객자격코드검색</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <link href="${ctx }/resources/css/pop.css" type="text/css" rel="stylesheet">
</head>

<body>
    <div id="wrap">
        <div class="srch">
            <div class="srch-inner">
                <!-- ul>
                    <li>
	                    <label for="code">고객자격코드</label>
	                    <input id="code" type="text" style="margin:0 21px 0 10px;"/>
                        <label for="type">고객자격유형</label>
                        <select id="type" style="margin:0 21px 0 10px;">
                        	<option>고객자격유형<option>
                        </select>
                        *미입력시 전체
                    </li>
                </ul-->
            </div>
        </div>
        <div class="qualify-info01">
            <table class="qualify" >
                <caption>고객자격코드검색창</caption>
                <colgroup>
                    <col style="width:50px" >
                    <col style="width:50px" >
                    <col>
                    <col style="width:100px" >
                    <col style="width:100px" >
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col">순번</th>
                        <th scope="col">코드</th>
                        <th scope="col">고객자격코드명</th>
                        <th scope="col">개인법인구분</th>
                        <th scope="col">자격과세</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th>1</th>
                        <td>000</td>
                        <td>내국인-당행직원</td>
                        <td>1:개인</td>
                        <td>01:개인과세</td>
                    </tr>
                    <tr>
                        <th>2</th>
                        <td>001</td>
                        <td>내국인-개인</td>
                        <td>1:개인</td>
                        <td>01:개인과세</td>
                    </tr>
                    <tr>
                        <th>3</th>
                        <td>002</td>
                        <td>내국인-주민번호미부여자</td>
                        <td>1:개인</td>
                        <td>01:개인과세</td>
                    </tr>
                    <tr>
                        <th>4</th>
                        <td>003</td>
                        <td>재외국민-(거주자)여권보유자</td>
                        <td>1:개인</td>
                        <td>01:개인과세</td>
                    </tr>
                    <tr>
                        <th>5</th>
                        <td>004</td>
                        <td>재외국민-(비거주자)여권보유자</td>
                        <td>1:개인</td>
                        <td>03:제한과세</td>
                    </tr>
                    <tr>
                        <th>6</th>
                        <td>007</td>
                        <td>외국인-(거주자)외국인등록증보유자</td>
                        <td>1:개인</td>
                        <td>01:개인과세</td>
                    </tr>
                    <tr>
                        <th>7</th>
                        <td>008</td>
                        <td>외국인-(비거주자)외국인등록증보유자</td>
                        <td>1:개인</td>
                        <td>03:제한과세</td>
                    </tr>
                    <tr>
                        <th>8</th>
                        <td>011</td>
                        <td>외국인-(비거주자)증권거래자</td>
                        <td>1:개인</td>
                        <td>01:개인과세</td>
                    </tr>
                    <tr>
                        <th>9</th>
                        <td>012</td>
                        <td>외국국적동포-(거주자)국내거소증 소유자</td>
                        <td>1:개인</td>
                        <td>01:개인과세</td>
                    </tr>
                    <tr>
                        <th>10</th>
                        <td>013</td>
                        <td>외국국적동포-(비거주자)국내거소증 소유자</td>
                        <td>1:개인</td>
                        <td>03:제한과세</td>
                    </tr>
                    <tr>
                        <th>11</th>
                        <td>014</td>
                        <td>개인사업자-개인사업자</td>
                        <td>2:개인사업자</td>
                        <td>01:개인과세</td>
                    </tr>
                    <tr>
                        <th>12</th>
                        <td>016</td>
                        <td>개인사업자-외국인,재외국인</td>
                        <td>2:개인사업자</td>
                        <td>01:개인과세</td>
                    </tr>
                    <tr>
                        <th>13</th>
                        <td>040</td>
                        <td>비영리법인-비영리법인(기타)</td>
                        <td>3:법인</td>
                        <td>04:법인과세</td>
                    </tr>
                    <tr>
                        <th>14</th>
                        <td>050</td>
                        <td>영리법인-영리법인</td>
                        <td>3:법인</td>
                        <td>04:법인과세</td>
                    </tr>
                    <tr>
                        <th>15</th>
                        <td>060</td>
                        <td>임의단체-임의단체</td>
                        <td>3:법인</td>
                        <td>01:개인과세</td>
                    </tr>
                </tbody>
            </table>    
        </div>
    </div>
</body>