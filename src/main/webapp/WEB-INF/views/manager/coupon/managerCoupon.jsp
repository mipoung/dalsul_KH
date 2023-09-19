<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>
<!-- 관리자페이지 드롭다운 사용을 위해 필요한 스크립트 -->
<script type="text/javascript" src="/resources/include/common/bootstrap/js/bootstrap.bundle.min.js"></script>
<html lang="ko">
<script type="text/javascript">
    $(document).ready(function() {
        // "쿠폰추가하기" 버튼 클릭 시 페이지 이동
        $("#insertFormBtn").click(function() {
            window.location.href = "/coupon/couponInsertForm";
        });
    });
</script>
</head>
   <body>
   <!-- 매니저 헤더 -->
   <%@ include file="/WEB-INF/views/manager/managerHeader.jsp"%>
   <!-- 여기서 작성하시면 됩니다. -->
   
   <!-- 히든으로 다음 요청페이지로 보낼 기준 값 -->
	<form id="detailForm">
		<input type="hidden" id="coupon_no" name="coupon_no" />
	</form>
   	<!-- 검색기능 -->
	<div id="couponSearch" class="text-right">
         <form id="f_search" name="f_search" class="form-inline" style="display:inline-block;">
         	<!-- 페이징 처리를 위한 파라미터 -->
         	<input type="hidden" name="pageNum" id="pageNum"/>
         	
            <div class="form-group">
               <label>검색조건</label>
               <select id="search" name="search" class="form-control">
                  <option value="all">전체</option>
                  <option value="coupon_name">쿠폰이름 오름차순</option>             
                  <!-- 쿠폰 조회 각칼럼 높은순 -->
                  <option value="coupon_discountASC">할인율 높은순</option>
                  <option value="coupon_discountDESC">할인율 낮은순</option>
                  <option value="coupon_dateASC">생성일 빠른순</option>
                  <option value="coupon_dateDESC">생성일 늦은순</option>
                  <option value="coupon_limitASC">쿠폰사용가능량 많은순</option>
                  <option value="coupon_limitDESC">쿠폰사용가능량 적은순</option>
                  <option value="coupon_statusASC">쿠폰사용가능우선</option>
                  <option value="coupon_statusDESC">쿠폰사용 불가능 우선</option>
                  <!-- 쿠폰 조회 각칼럼 낮은순 -->
                  
               </select>
               <input type="text" name="keyword" id="keyword" placeholder="쿠폰 이름 검색" class="form-control"/>
               <button type="button" name="searchData" id="searchData" class="btn btn-success">검색</button>
            </div>
         </form>
	</div>
	
	<%--리스트 시작 --%>
		<div id="boardList" class="table-height">
			<table summary="게시판 리스트" class="table table-striped">
				<thead>
					<tr>
						<th data-value="b_num" class="order text-center col-md-1">쿠폰번호</th>
						<th class="text-center col-md-4">쿠폰이름</th>
						<th class="text-center col-md-2">쿠폰할인가격</th>
						<th data-value="b_date" class="order col-md-1">쿠폰생성일</th>
						<th class="text-center col-md-1">쿠폰발급가능수량</th>
						<th class="text-center col-md-1">사용가능 여부</th>
					</tr>
				</thead>
				<tbody id="list" class="table-striped">
					<c:choose>
						<c:when test="${not empty couponList}">
							<c:forEach var="coupon" items="${couponList}" varStatus="status">
								<tr class="text-center" data-num="${coupon.coupon_no}">
									<td>${coupon.coupon_no}</td>
									<%--<td class="goDetail text-left">${board.b_title}</td>--%>
									<td class="goDetail text-left">${coupon.coupon_name}</td>
									<td class="name">${coupon.coupon_discount}</td>
									<td class="text-left">${coupon.coupon_date}</td>
									<td class="text-center">${coupon.coupon_limit}</td>
									<td class="text-center">
										<c:if test="${coupon.coupon_status==1}">
											가능
										</c:if>
										<c:if test="${coupon.coupon_status==0}">
											불가능
										</c:if>
									</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="5" class="tac text-center">등록된 쿠폰이 존재하지 않습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
	<%--리스트 종료 --%>
	
	<%-- ============ 페이징 출력 시작 ============ --%>
		<div class="text-center">
			<ul class="pagination">
			<!-- 이전 바로가기10개 존재 여부를 prev 필드의 값으로 확인 -->
			<c:if test="${pageMaker.prev}">
					<li class="paginate_button previous">
						<a href="${pageMaker.startPage-1}">Previous</a> 
					</li>
				</c:if>
				<!-- 바로 가기 번호 출력 -->
				<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
						<li class="paginate_button ${pageMaker.cvo.pageNum == num ? 'active':''}">
							<a href="${num}">${num}</a>
						</li>
				</c:forEach>
				
				<!-- 다음 바로가기 10개 존재 여부를 next 필드의 값으로 확인 -->
				<c:if test="${pageMaker.next}">
					<li class="paginate_button next">
						<a href="${pageMaker.endPage + 1}">Next</a>
					</li>
				</c:if>
			</ul>
		</div>
		
		<%-- 쿠폰 추가하기 페이지 이동 버튼 --%>
		<div class="btn btn-success" style="text-align: right;">
			<input type="button" value="쿠폰추가하기" id="insertFormBtn" class="btn btn-success" />
		</div>
   
   
	</body>
	
</html>