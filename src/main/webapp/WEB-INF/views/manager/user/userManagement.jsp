<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>
<!-- 관리자페이지 드롭다운 사용을 위해 필요한 스크립트 -->
<script type="text/javascript" src="/resources/include/common/bootstrap/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="/resources/include/common/js/chkRegex.js"></script>
<script>
	$(function() {
		// 검색 후 검색 대상과 검색 단어 출력
		let word = "<c:out value='${userVO.keyword}'/>";
		let value = "";
		if(word!=""){
			$("#keyword").val("<c:out value='${userVO.keyword}'/>");
			$("#search").val("<c:out value='${userVO.search}'/>");
		}
		
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
		
		// 목록 페이지 이동
		$(".paginate_button a").click(function(e) {
			e.preventDefault();
			$("#f_search").find("input[name='pageNum']").val($(this).attr("href"));
			goPage();
		});
		
		// 삭제 버튼 클릭 시 이벤트
		$("#deleteUserBtn").click(function(){
			if(ChkSelect() == false) return;
			Swal.fire({
			  title: '정말로 삭제하시겠습니까?',
			  html: "선택한 회원이 데이터베이스에서 물리적으로 삭제되며<br>복구가 불가능합니다",
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: '삭제'
			}).then((result) => {
			  if (result.isConfirmed) {
			    $.ajax({
			    	url : "/manager/user/dropUsers",
			    	method : "post",
			    	data : $("#selectedUsers").serialize(),
			    	dataType : "text",
			    	success : function(result){
			    		if(result === "SUCCESS"){
			    			Swal.fire({
					    	  icon: 'success',
					    	  title: '성공적으로 삭제되었습니다.'
					    	}).then( function(){
					    		location.href="/manager/user/userManagement";
					    	});
			    		} else {
			    			Swal.fire({	
					    	  icon: 'error',
					    	  title: '시스템 오류...',
					    	  text: '잠시후 다시 시도해 주세요',
					    	})
			    		}
			    	}, error : function(error){
			    		Swal.fire({
					    	  icon: 'error',
					    	  title: '시스템 오류...',
					    	  text: 'Error Code'+error,
					    });
			    	}
			    });
			  }
			})
		});
		
		// 관리자 등록 버튼 클릭 시
		$("#regManagerBtn").click(function(){
			if(ChkSelect() == false) return;
			Swal.fire({
			  title: '선택된 사용자를 관리자로 등록하시겠습니까?',
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: '등록'
			}).then((result) => {
			  if (result.isConfirmed) {
			    $.ajax({
			    	url : "/manager/user/appointManager",
			    	method : "post",
			    	data : $("#selectedUsers").serialize(),
			    	dataType : "text",
			    	success : function(result){
			    		if(result === "SUCCESS"){
			    			Swal.fire({
					    	  icon: 'success',
					    	  title: '성공적으로 등록되었습니다.'
					    	}).then( function(){
					    		location.href="/manager/user/userManagement";
					    	});
			    		} else {
			    			Swal.fire({	
					    	  icon: 'error',
					    	  title: '시스템 오류...',
					    	  text: '잠시후 다시 시도해 주세요',
					    	})
			    		}
			    	}, error : function(error){
			    		Swal.fire({
					    	  icon: 'error',
					    	  title: '시스템 오류...',
					    	  text: 'Error Code'+error,
					    });
			    	}
			    });
			  }
			})
		});
		
	}); // end of page load function
	
	function ChkSelect(){
		const check_item = $("[name='selectedItems']:checked").length;
		if(check_item === 0){
			Swal.fire({	
		      icon: 'warning',
		      title: '체크 박스를 선택해 주세요.'
		    });
			return false;
		}else{
			return true;
		}
	}
	
	// 검색을 위한 함수 goPage()
	function goPage(){
		if($("#search").val()=="all"){
			$("#keyword").val("");
		}
		
		$("#f_search").attr({
			"method" : "get",
			"action" : "/manager/user/userManagement"
		});
		$("#f_search").submit();
	}
</script>
<style>
.container{
	margin-top: 15px;
}
/* 페이징 컨테이너 스타일 */
.pagination_area {
    text-align: center;
}

/* 페이징 목록 스타일 */
.pagination {
    list-style: none;
    display: inline-flex;
    padding: 0;
}

/* 페이징 아이템 스타일 */
.pagination li {
    margin-right: 5px;
}

/* 활성화된 페이징 아이템 스타일 */
.pagination li.active {
    font-weight: bold;
}

/* 이전 및 다음 버튼 스타일 */
.pagination li.previous,
.pagination li.next {
    font-weight: bold;
}

/* 링크 스타일 */
.pagination a {
    text-decoration: none;
    color: white; /* 링크 색상은 원하는 색상으로 변경 가능 */
    background-color : #212529;
    padding: 5px 10px;
    border: 1px solid #212529;
    border-radius: 4px;
    transition: background-color 0.3s, color 0.3s;
}

/* 활성화된 페이징 아이템의 링크 스타일 */
.pagination li.active a {
    background-color: white; /* 활성화된 페이징 아이템 배경 색상 */
    color: black; /* 활성화된 페이징 아이템 텍스트 색상 */
    cursor: default;
}

/* 이전 및 다음 버튼의 링크 스타일 */
.pagination li.previous a,
.pagination li.next a {
    background-color: #212529; /* 이전 및 다음 버튼 배경 색상 */
    color: white; /* 이전 및 다음 버튼 텍스트 색상 */
}

/* 링크 호버 효과 */
.pagination a:hover {
    background-color: white; /* 호버 시 배경 색상 변경 */
    color: black; /* 호버 시 텍스트 색상 변경 */
}

.userControll{
	float: right;
}

</style>
</head>
<body>
	<!-- 매니저 헤더 -->
	<%@ include file="/WEB-INF/views/manager/managerHeader.jsp"%>

	<div class="container">
		
		<!-- 회원 정보 출력 -->
		<div>
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
				<form id="selectedUsers" name="selectedUsers">
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
									<td>
										<input type="checkbox" name="selectedItems" class="form-check-input" value="${users.user_no}"/>
									</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="8" class="tac text-center">등록되거나 검색조건에 부합하는 회원이 존재하지 않습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</form>
			</tbody>
		</table>
		</div>
		
		<!-- 페이징 기능 -->
		<div class="pagination_area" style="text-align: center;">
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
			
			<!-- 선택 회원 삭제, 관리자 등록 기능 -->
			<div class="userControll">
				<button type="button" id="regManagerBtn" class="btn btn-success">관리자 등록</button>
				<button type="button" id="deleteUserBtn" class="btn btn-danger">삭제</button>
			</div>
		</div>
		
		<!-- 검색 기능 -->
		<div class="userSearch" style="text-align: right;">
		    <form id="f_search" name="f_search" class="form-inline justify-content-end" style="display:inline-block;">
		    	<input type="hidden" name="pageNum" id="pageNum" value="${pageMaker.startPage}">
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
		                <input type="text" name="keyword" id="keyword" class="form-control" placeholder="검색어" value="전체 목록 조회" readonly="true">
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