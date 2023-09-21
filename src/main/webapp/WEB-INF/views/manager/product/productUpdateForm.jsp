<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>
<!-- 관리자페이지 드롭다운 사용을 위해 필요한 스크립트 -->
<script type="text/javascript" src="/resources/include/common/bootstrap/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="/resources/include/common/js/chkRegex.js"></script>
<script>
	$(function() {		
		$("#updateProductBtn").click(function(){
			Swal.fire({
			  title: '현재 내용으로 수정하시겠습니까?',
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: '수정'
			}).then((result) => {
			  if (result.isConfirmed) {
				  
				let formData = $("#updateProducts").serializeArray();
				console.log(formData);
			    $.ajax({
			    	url : "/manager/product/productUpdateProcess",
			    	method : "post",
			    	data: JSON.stringify(formData),
			    	contentType: "application/json; charset=utf-8",
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
				</tr>
			</thead>
			<tbody>
				<form id="updateProducts" name="updateProducts">
					<c:choose>
						<c:when test="${not empty updateList}">
							<c:set var="i" value="0"/>
							<c:forEach var="product" items="${updateList}" varStatus="status">
								<tr class="text-center" data-num="${product.product_no}">
									<input type="hidden" name="product_no[${i}]" value="${product.product_no}">
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
									<td class="product_price" width="125">
										<input name="product_price[${i}]" type="number" class="form-control" min="0" maxlength="7" value="${product.product_price}"/>
									</td>
									<td class="product_stock" width="100">
										<input name="product_stock[${i}]" type="number" class="form-control" min="0" maxlength="4" value="${product.product_stock}"/>
									</td>
									<td>
										<select name="product_sale_status[${i}]" class="form-select">
											<c:if test="${product.product_sale_status==1}">
												<option value="1" class="form-contol" selected>판매 중</option>
												<option value="0" class="form-contol">판매 중단</option>
											</c:if>
											<c:if test="${product.product_sale_status==0}">
												<option value="1" class="form-contol">판매 중</option>
												<option value="0" class="form-contol" selected>판매 중단</option>
											</c:if>
										</select>
									</td>
								</tr>
							<c:set var="i" value="${i + 1}" />
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
		<div class="productControll">
			<button type="button" id="updateProductBtn" class="btn btn-warning">수정 완료</button>
		</div>
	</div>
</body>
</html>