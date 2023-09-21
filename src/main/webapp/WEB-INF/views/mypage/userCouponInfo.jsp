<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>
	</head>
	<body>
	<div class="container">
	<% 
		// Controller를 통해 가져온 String 형식의 날짜 값
		String dateStringFromController = "2023-09-22"; // 이 부분을 Controller에서 가져온 값으로 대체

		// String 형식의 날짜를 java.util.Date 객체로 변환
		java.text.SimpleDateFormat dateFormat = new java.text.SimpleDateFormat("yyyy-MM-dd");
		java.util.Date dateFromController = dateFormat.parse(dateStringFromController);

		// 현재 시간을 가져옴
		java.util.Date currentDate = new java.util.Date();

		// 날짜 비교
		if (dateFromController.after(currentDate)) {
  		  out.println("<p>" + dateStringFromController + "은(는) 현재 시간 이후입니다.</p>");
		} else if (dateFromController.before(currentDate)) {
 		   out.println("<p>" + dateStringFromController + "은(는) 현재 시간 이전입니다.</p>");
		} else {
 		   out.println("<p>" + dateStringFromController + "과(와) 현재 시간은 동일합니다.</p>");
		}
		%>
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
						<th class="text-center col-md-1">쿠폰사용가능여부</th>				
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
									<td class="text-center"><input type="button" name="updateCouponBtn" value="수정"></td>
									<td class="text-center"><input type="button" name="deleteCouponBtn" value="삭제"></td>
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