<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>
<!-- 관리자페이지 드롭다운 사용을 위해 필요한 스크립트 -->
<script type="text/javascript" src="/resources/include/common/bootstrap/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="/resources/include/common/js/chkRegex.js"></script>
<script>
	$(function() {
		// 검색 후 검색 대상과 검색 단어 출력
		let word = "<c:out value='${productVO.keyword}'/>";
		let value = "";
		if(word!=""){
			$("#keyword").val("<c:out value='${productVO.keyword}'/>");
			$("#search").val("<c:out value='${productVO.search}'/>");
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
		
		// 상품 수정 버튼 클릭 시 이벤트
		$("#updateProductBtn").click(function(){
			if(ChkSelect() == false) return;
			
			$("#selectedProducts").attr({
				"action" : "/manager/product/productUpdateForm",
				"method" : "get"
			});
			
			$("#selectedProducts").submit();
		});
		
		// 상품 삭제 버튼 클릭 시 이벤트
		$("#deleteProductBtn").click(function(){
			if(ChkSelect() == false) return;
			Swal.fire({
			  title: '정말로 삭제하시겠습니까?',
			  html: "선택한 상품이 데이터베이스에서 물리적으로 삭제됩니다",
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: '삭제'
			}).then((result) => {
			  if (result.isConfirmed) {
			    $.ajax({
			    	url : "/manager/product/productDelete",
			    	method : "post",
			    	data : $("#selectedProducts").serialize(),
			    	dataType : "text",
			    	success : function(result){
			    		if(result === "SUCCESS"){
			    			Swal.fire({
					    	  icon: 'success',
					    	  title: '성공적으로 삭제되었습니다.'
					    	}).then( function(){
					    		location.href="/manager/product/productListView";
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
		transSearchKeyword();
		if($("#search").val()=="all"){
			$("#keyword").val("");
		}
		
		$("#f_search").attr({
			"method" : "get",
			"action" : "/manager/product/productListView"
		});
		$("#f_search").submit();
	}
	
	function transSearchKeyword(){
		if($("#search").val()=="product_type"){
			switch($("#keyword").val()){
				case "탁주" : $("#keyword").val("takju"); break;
				case "청주" : $("#keyword").val("chungju"); break;
				case "와인" : $("#keyword").val("wine"); break;
				case "소주" : $("#keyword").val("soju"); break;
			}
		}
		else if($("#search").val()=="product_taste"){
			switch($("#keyword").val()){
				case "단맛" : $("#keyword").val("sweet"); break;
				case "신맛" : $("#keyword").val("acidity"); break;
			}
		}
		else if($("#search").val()=="product_base"){
			switch($("#keyword").val()){
				case "과일" : $("#keyword").val("fruit"); break;
				case "과채" : $("#keyword").val("fruit"); break;
				case "곡물" : $("#keyword").val("nut"); break;
				case "견과" : $("#keyword").val("nut"); break;
				case "약재" : $("#keyword").val("herb"); break;
				case "기타" : $("#keyword").val("other"); break;
			}
		}
		else if($("#search").val()=="product_sale_status"){
				switch($("#keyword").val().replace(/ /g,"")){
				case "판매중" : $("#keyword").val("1"); break;
				case "판매중단" : $("#keyword").val("0"); break;
			}
		}
		return;
	}
</script>
<style>
th:nth-child(2) {
	width:370px;
}

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
    padding-left: 250px;
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

.productControll{
	float: right;
}

</style>
</head>
<body>
	<!-- 매니저 헤더 -->
	<%@ include file="/WEB-INF/views/manager/managerHeader.jsp"%>

	<div class="container">
		
		<!-- 상품 정보 출력 -->
		<div>
		<table class="table">
			<thead class="thead-dark">
				<tr class="text-center">
					<th>상품일련번호</th>
					<th>상품명</th>
					<th>주종</th>
					<th>용량</th>
					<th>알콜도수</th>
					<th>맛</th>
					<th>원료</th>
					<th>가격</th>
					<th>재고</th>
					<th>판매상태</th>
					<th>선택</th>
				</tr>
			</thead>
			<tbody>
				<form id="selectedProducts" name="selectedProducts">
					<c:choose>
						<c:when test="${not empty productList}">
							<c:forEach var="product" items="${productList}" varStatus="status">
								<tr class="text-center" data-num="${product.product_no}">
									<td>${product.product_no}</td>
									<td>${product.product_name}</td>
									<td>
										<c:if test="${product.product_type=='takju'}">탁주</c:if>
										<c:if test="${product.product_type=='chungju'}">청주</c:if>
										<c:if test="${product.product_type=='wine'}">와인</c:if>
										<c:if test="${product.product_type=='soju'}">소주</c:if>
									</td>
									<td>${product.product_ml}ml</td>
									<td>${product.product_alcohol}%</td>
									<td>
										<c:if test="${product.product_taste=='sweet'}">단맛</c:if>
										<c:if test="${product.product_taste=='acidity'}">신맛</c:if>
									</td>
									<td>
										<c:if test="${product.product_base=='fruit'}">과일・과채</c:if>
										<c:if test="${product.product_base=='flower'}">꽃</c:if>
										<c:if test="${product.product_base=='nut'}">곡물・견과</c:if>
										<c:if test="${product.product_base=='herb'}">약재</c:if>
										<c:if test="${product.product_base=='other'}">기타</c:if>
										
									</td>
									<td class="product_price">${product.product_price}</td>
									<td>${product.product_stock}</td>
									<td>
										<c:if test="${product.product_sale_status==1}">판매 중</c:if>
										<c:if test="${product.product_sale_status==0}">판매 중단</c:if>
									</td>
									<td>
										<input type="checkbox" name="selectedItems" class="form-check-input" value="${product.product_no}"/>
									</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="11" class="tac text-center">등록되거나 검색조건에 부합하는 상품이 존재하지 않습니다.</td>
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
			
			<div class="productControll">
				<button type="button" id="regProductBtn" class="btn btn-success">제품 등록</button>
				<button type="button" id="updateProductBtn" class="btn btn-warning">제품 수정</button>
				<button type="button" id="deleteProductBtn" class="btn btn-danger">제품 삭제</button>
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
		                    <option value="product_no">일련번호</option>
		                    <option value="product_type">주종</option>
		                    <option value="product_taste">맛</option>
		                    <option value="product_base">원료</option>
		                    <option value="product_sale_status">판매여부</option>
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