<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>
<!-- 관리자페이지 드롭다운 사용을 위해 필요한 스크립트 -->
<script type="text/javascript" src="/resources/include/common/bootstrap/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="/resources/include/common/js/chkRegex.js"></script>
<script>
	$(function() {
		// 입력 양식 enter 제거
		$("#keyword").bind("keydown", function(e){
			if(e.keyCode == 13){
				event.preventDefault();
			}
		});
		
		// 검색 대상이 변경될 때마다 처리 이벤트
		$("#search").change(function(){
			if($("#search").val() == "all"){
				$("#keyword").val("전체 목록 조회");
				$("#keyword").prop("readonly",true);
			}else if($("#search").val() != "all"){
				$("#keyword").val("");
				$("#keyword").prop("readonly",false);
				$("#keyword").focus();
			}
		});
		
		// 검색 버튼 클릭 시 이벤트
		$("#searchData").click(function(){
			if($("#search option:selected").val()!="all"){
				if(!chkData("#keyword","검색어를")) return;
			}
			goPage();
		});
		
		// 검색을 위한 함수 goPage()
		function goPage(){
			if($("#search").val()=="all"){
				$("#keyword").val("");
			}
			
			$("#f_search").attr({
				"method" : "get",
				"action" : "/manager/userManagement"
			});
			$("#f_search").submit();
		}
	});
</script>
<style>
	.container{
	margin-top: 15px;
	}
</style>
</head>
<body>
	<!-- 매니저 헤더 -->
	<%@ include file="/WEB-INF/views/manager/managerHeader.jsp"%>

	<div class="container">
		
		<!-- 회원 정보 출력 -->
		<table class="table">
			<thead class="thead-dark">
				<tr class="text-center">
					<th>일련번호</th>
					<th>이메일</th>
					<th>이름</th>
					<th>생년월일</th>
					<th>전화번호</th>
					<th>가입일</th>
					<th>회원상태</th>
					<th>선택</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${not empty user}">
						<c:forEach var="users" items="${user}" varStatus="status">
							<tr class="text-center" data-num="${users.user_no}">
								<td>${users.user_no}</td>
								<td>${users.user_email}</td>
								<td>${users.user_name}</td>
								<td>${users.user_birth}</td>
								<td>${users.user_phone_num}</td>
								<td>${users.user_reg_date}</td>
								<td>${users.user_status}</td>
								<td><input type="checkbox" class="form-check-input" value="${users.user_no}"/></td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="8" class="tac text-center">등록되거나 검색조건에 부합하는 회원이 존재하지 않습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
		
		<!-- 페이징 기능 -->
		<%-- 페이징 --%>
		<div class="text-center">
			<ul class="pagination">
				<!-- 이전 바로가기 10개 존재 여부를 prev 필드의 값으로 확인. -->
				<c:if test="${pageMaker.prev}">
					<li class="paginate_button previous">
						<a href="${pageMaker.startPage - 1}">Previous</a>
					</li>
				</c:if>
				
				<!-- 바로가기 번호 출력 -->
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
		
		<!-- 검색 기능 -->
		<div class="userSearch" style="text-align: right;">
		    <form id="f_search" name="f_search" class="form-inline justify-content-end" style="display:inline-block;">
		        <div class="form-group row">
		            <div class="col-4">
		                <select id="search" name="search" class="form-control">
		                    <option value="all">검색조건(전체)</option>
		                    <option value="user_no">일련번호</option>
		                    <option value="user_email">이메일</option>
		                    <option value="user_name">이름</option>
		                    <option value="user_status">회원상태</option>
		                </select>
		            </div>
		            <div class="col">
		                <input type="text" name="keyword" id="keyword" class="form-control" placeholder="검색어">
		            </div>
		            <div class="col-2">
		                <button class="btn btn-dark" id="searchData" type="button">검색</button>
		            </div>
		        </div>
		    </form>
		</div>
	</div>
</body>
</html>