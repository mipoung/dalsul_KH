<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="/resources/include/mainpage/css/header.css" />
<link rel="stylesheet" type="text/css" href="/resources/include/mainpage/css/footer.css" />
<script src="/resources/include/mainpage/js/header.js"></script>
<%@ include file="/WEB-INF/views/common/common.jsp"%>
	</head>
	<body>
	<div style="margin-top: 65px">
        <%@ include file="/WEB-INF/views/main/header.jsp"%>
        <!-- header.jsp 파일 포함 -->
    </div>
	<div class="container">
		<%@ include file="/WEB-INF/views/mypage/mypageCommon.jsp"%>
		<h4 class="text-center">내 쿠폰정보</h4>
		<form id="detailCoupon">
			<input type="hidden" id="coupon_no" name="coupon_no" value="${userLogin.user_no}" />
		</form>
	<%--리스트 시작 --%>
		<div id="boardList" class="table-height">
			<table summary="게시판 리스트" class="table table-striped">
				<thead>
					<tr>
						<th data-value="c_no" class="order text-center col-md-1">쿠폰발급번호</th>
						<th class="text-center col-md-2">쿠폰이름</th>
						<th class="text-center col-md-2">쿠폰할인가격</th>
						<th data-value="c_date" class="text-center col-md-4">쿠폰발급날짜</th>
						<th class="text-center col-md-2">쿠폰사용여부</th>				
					</tr>
				</thead>
				<tbody id="list" class="table-striped">
					<c:choose>
						<c:when test="${not empty coupon}">
							<c:forEach var="coupon" items="${coupon}">
								<tr class="text-center" data-num="${coupon.coupon_no}">
									<td>${coupon.coupon_recive_no}</td>
									<td class="goDetail text-left">${coupon.coupon_name}</td>
									<td class="name">${coupon.coupon_discount}</td>
									<td class="text-center">${coupon.coupon_recive_date}</td>
									<td class="text-center">
										<c:if test="${coupon.coupon_recive_status==1}">
											쿠폰미사용
										</c:if>
										<c:if test="${coupon.coupon_recive_status==0}">
											쿠폰사용
										</c:if>
									</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="6" class="tac text-center">발급받은 쿠폰이 존재하지 않습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
		<%-- 리스트 종료 --%>
		</div>
	</body>
	</html>