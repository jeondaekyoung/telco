<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
   <div id="header">
        <div class="gnb">
            <h1><a href="${ctx }/views/main.jsp"><img src="${ctx }/resources/image/logo/h1logo.png" alt="텔코"></a></h1>
            <div class="nav_wrap m_hide">
                <div class="gnb_ul">
                   <ul>
						<li><a href="${ctx }/views/customer/0200_register.jsp">고객/CRM</a></li>
						<li><a href="${ctx }/views/bankbook/0010.jsp">수신/공통</a></li>
						<li><a href="${ctx }/views/electronic/3801.jsp">전자금융</a></li>
						<li><a href="#">부수/대행</a></li>
						<li><a href="${ctx }/views/customer/3701.jsp">신용카드</a></li>
						<c:if test="${sessionScope.userName ne null }">
                    		<li class="last"><a style="cursor:normal">${sessionScope.userName }님</a></li>
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
                    <ul><li><a href="${ctx }/views/customer/3701.jsp">카드발급</a></li></ul>
                    <c:if test="${sessionScope.userName ne null }">
                    	<ul style="margin-left:0">
                    		<c:if test="${sessionScope.userSepa eq  '교사' }">
                    			<li class="last"><a href="${ctx }/admin/register.do">관리자</a></li>
                    		</c:if>
                    		<li><a href="${ctx }/logout.do">로그아웃</a></li>
                    	</ul>
                    </c:if>
                </div>
            </div>
            <div class="burger">
			      <div class="x"></div>
			      <div class="y"></div>
			      <div class="z"></div>
			    </div>
            <div class="m_nav_wrap">           		
            	<div class="m_gnb_ul">            		
            		<ul>
            			<li class="bigmenu01"><a>고객/CRM</a>
            				<ul>
            					<li><a href="${ctx }/views/customer/0200_register.jsp">고객관리</a></li>
		                        <li><a href="${ctx }/views/customer/0009.jsp">거래내역조회</a></li>
		                        <li><a href="${ctx }/views/add/0231.jsp">자금세탁방지 고객관리</a></li>
            				</ul>
            			</li>
						<li class="bigmenu02"><a>수신/공통</a>
            				<ul>
            					<li><a href="${ctx }/views/bankbook/0010.jsp">수신신규</a></li>
		                        <li><a href="${ctx }/views/bankbook/0002.jsp">입금</a></li>
		                        <li><a href="${ctx }/views/bankbook/0003.jsp">지급</a></li>
		                        <li><a href="${ctx }/views/automatic/1701.jsp">자동이체</a></li>
		                        <li><a href="${ctx }/views/bankbook/0080.jsp">통장정리</a></li>
		                        <li><a href="${ctx }/views/bankbook/0008.jsp">통장재발행</a></li>
		                        
		                        <li><a href="${ctx }/views/check/1401.jsp">자기앞수표 채번</a></li>
		                        <li><a href="${ctx }/views/check/1402.jsp">자기앞수표 발행</a></li>
		                        <li><a href="${ctx }/views/check/1403.jsp">자기앞수표 지급</a></li>
		                        
		                        <li><a href="${ctx }/views/add/1821.jsp">타행수표 즉시지급거래</a></li>
		                        <li><a href="${ctx }/views/add/0007.jsp">사고신고관리</a></li>
		                        <li><a href="${ctx }/views/add/0070.jsp">주의사고 등록/해제</a></li>
		                        <li><a href="${ctx }/views/bankbook/0004.jsp">해지</a></li>
		                        <li><a href="${ctx }/views/add/1099.jsp">거래취소</a></li>
            				</ul>
            			</li>
						<li class="bigmenu03"><a>전자금융</a>
            				<ul>
            					<li><a href="${ctx }/views/electronic/3801.jsp">전자금융</a></li>
            				</ul>
            			</li>
						<li class="bigmenu04"><a>부수/대행</a>
            				<ul>
            					<li><a>준비중입니다</a></li>
            				</ul>
            			</li>
						<li class="bigmenu05"><a>신용카드</a>
            				<ul>
            					<li><a href="${ctx }/views/customer/3701.jsp">카드발급</a></li>
            				</ul>
            			</li>
            			<c:if test="${sessionScope.userName ne null }">
                    		<c:if test="${sessionScope.userSepa eq '교사' }">
                    			<li class="bigmenu06"><a>관리자</a>
                    				<ul>
	                    				<li class="nav_dir"><a href="#" class="nav_hold">이용자 등록</a></li>
										<li><a href="${ctx }/views/admin/search.jsp">이용자 검색</a></li>
										<li><a href="${ctx }/views/admin/info.jsp">이용자 정보</a></li>
                    				</ul>
                    			</li>
                    		</c:if>
	                    	<li><a href="${ctx }/logout.do">로그아웃</a></li>
	                    </c:if>
            		</ul>
            	</div>
            </div>
        </div>
    </div>