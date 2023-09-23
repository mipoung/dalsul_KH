<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>
<!-- 관리자페이지 드롭다운 사용을 위해 필요한 스크립트 -->
<script type="text/javascript" src="/resources/include/common/bootstrap/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="/resources/include/reviewBoard/js/managerReviewList.js"></script>
<link rel="stylesheet" href="/resources/include/reviewBoard/css/managerReviewList.css"/>
	
	
</head>
<body>
<!-- 매니저 헤더 -->
<%@ include file="/WEB-INF/views/manager/managerHeader.jsp"%>
 
	<div id="mainSection">
	  	<h3>리뷰 관리</h3>
		<%-- =================검색 기능 시작================== --%>
		<div id="FlexDiv">
				<div id="Flex1">
					<div id="boardSearch" class="text-right"> 
					
						<form id="f_search" name="f_search" class="form-inline">
								<%-- 페이징 처리를 위한 파라미터 --%>
							<input type="hidden" name="pageNum" id="pageNum" value="${pageMaker.cvo.pageNum}">
							<input type="hidden" name="amount" id="amount" value="${pageMaker.cvo.amount}">
							<%-- 페이징 처리를 위한 파라미터 끝 --%>
							
							<!-- 정렬데이터 전송을 위한 폼 -->
							<input type="hidden" id="reviewOrderBy" name="reviewOrderBy" value="">
				
							 
							 <!-- 날짜 범위로 검색 -->
							<div>
								<input type="date" id="searchDate1" name="searchDate1" value="2023-09-12"/> <span>~</span>
								<input type="date" id="searchDate2" name="searchDate2"/>
							</div>
			
							<!-- 검색 옵션 -->
							<div class="mb-3">
								<select class="form-select" id="search" name="search" required aria-label="select example">
									<option value="all">전체 목록 조회</option>
									<option value="review_no">리뷰번호</option>
									<option value="user_no">유저번호</option>
									<option value="review_content">내용</option>
									<option value="review_rating">별점</option>
									<!-- <option value="product_name">제품 이름</option> -->
								</select> 
								<input type="text" name="keyword" id="keyword" placeholder="전체 목록 조회" readonly class="form-control" />
								<button type="button" id="searchData" class="btn btn-success">검색</button>
							</div>
					</form>
				
				</div>
		</div>
			<div id="Flex2">
			<!-- 리뷰 통계 표시 -->
				
			</div>
		</div>
			<%-- =================검색 기능 끝================== --%>
	
	
	
		 <!-- 정렬 버튼 -->
		<div class="btn-group-sm" role="group" aria-label="Basic radio toggle button group">
			<input type="radio" class="btn-check orderbyBtn" id="btnradio1" autocomplete="off" value="obReviewNo"> 
			<label class="btn btn-outline-primary" for="btnradio1">리뷰번호 순</label> 
			
			<input type="radio" class="btn-check orderbyBtn" id="btnradio2" autocomplete="off" value="obUserNo"> 
			<label class="btn btn-outline-primary" for="btnradio2">유저번호 순</label> 
		
			<input type="radio" class="btn-check orderbyBtn" id="btnradio3" autocomplete="off" value="obLikeCount"> 
			<label class="btn btn-outline-primary" for="btnradio3">좋아요 순</label> 
			
			<input type="radio" class="btn-check orderbyBtn" id="btnradio4" autocomplete="off" value="obReviewDate"> 
			<label class="btn btn-outline-primary" for="btnradio4">작성일 순</label> 
			<span>(내림차순)</span>
		</div>
	
	
	
	
	<!-- 조회 시작 -->
	
	<form id="r_ListForm">
		<!-- 더보기 위한 폼 -->
		<input type="hidden" name="viewCount" id="viewCount" value="0">
		<input type="hidden" name="startCount" id="startCount" value="0">
	
		<table class="table table-hover">
			<thead>
				<tr class=table-light>
					<th scope="col" class="text-center miniSize">리뷰번호<br>(유저번호)</th>
					<td scope="col" class="text-center">제품명<br>(제품번호)</td>
					<td scope="col" class="text-center">주종<br>(용량)</td>
					<td scope="col" class="text-center">가격</td>
					<td scope="col" class="text-center bigSize">내용</td>
					<td scope="col" class="text-center miniSize">별점</td>
					<td scope="col" class="text-center miniSize">추천수</td>
					<td scope="col" class="text-center miniSize">작성일</td>
					<td scope="col" class="text-center miniSize">삭제</td>
				</tr>
			</thead>
	
			<tbody>
				
				<!-- 데이터 출력 -->
				<c:choose>
					<c:when test="${not empty reviewList}">
						<c:forEach var="review" items="${reviewList}" varStatus="status">
							<tr class="text-center" data-review-no="${review.review_no}">
								<td class=miniSize>${review.review_no}<br>(${review.user_no})</td>
								<td class="miniSize">${review.product_name}<br>(${review.product_no})</td>
								<td class=miniSize>${review.product_type}(${review.product_ml}ML)</td>
								<td class=miniSize>${review.product_price}원</td>
								<td class="text-left">${review.review_content}</td>
								<td class="text-left reviewRating miniSize">${review.review_rating}</td>
								<td class="text-left miniSize">${review.review_like_count}</td>
								<td class="text-center miniSize">${review.review_date}</td>
								<td class="text-center miniSize">
									<button class="btn btn-outline-danger r_DeleteBtn" type="button" id="button-addon2" data-user-no="${review.user_no}">삭제</button>
								</td>
							</tr>
						</c:forEach>
					</c:when>
					
					<c:otherwise>
						<tr>
							<td colspan="8" class="tac text-center">등록된 게시글이 존재하지 않습니다.</td>
						</tr>
					</c:otherwise>
	
				</c:choose>
			</tbody>
	
	
		</table>
	
	
		<%-- =========== 페이징 출력 시작 ============ --%>
	
			<nav aria-label="Page navigation example" id="pageNav">
			  <ul class="pagination">
			  
			 	 <c:if test="${pageMaker.prev}">
					 <li class="page-item paginate_button"><a class="page-link" href="${pageMaker.startPage - 1}">Previous</a></li>
				</c:if>
			    
			    <!--  바로가기 번호 출력  -->
				<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
					<li class="page-item paginate_button ${pageMaker.cvo.pageNum == num ? 'active':''}">
						<a class="page-link" href="${num}">${num}</a>
					</li>
				</c:forEach>
			
			    
			    <c:if test="${pageMaker.next}">
					<li class="page-item paginate_button">
						<a class="page-link" href="${pageMaker.endPage + 1 }">Next</a>
					</li>
				</c:if>
			    
			  </ul>
			</nav>
		
			
	</form>
	
	<%-- =========== 페이징 종료 ============== --%>
</div>

</body>
	   <%@ include file="/WEB-INF/views/main/footer.jsp"%>
</html>