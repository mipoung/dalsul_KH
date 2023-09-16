<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 관리자 페이지 헤더 -->
<!-- common.js는 관리자 페이지 헤더에 포함되어 있어서 여기서는 지우셔도 됩니다. -->
<%@ include file="/WEB-INF/views/manager/managerPage.jsp"%>


	<script>
	$(function(){
		// 별점 변환
		$(".reviewRating").each(function(){
  			let rating = $(this).text();
  			$(this).css("color","red");
  		    if(rating === "5") $(this).text("★★★★★");
  		    else if(rating === "4") $(this).text("★★★★");
  			else if(rating === "3") $(this).text("★★★");
  			else if(rating === "2") $(this).text("★★");
  			else if(rating === "1") $(this).text("★");
  			else if(rating === "0") $(this).text("별점없음");
  		});
	      
  		
  		
  		// 삭제
  		
  		
 		
  		$(".r_DeleteBtn").click(function(){
  			if(confirm("삭제하시겠습니까?")){
	  			var userNo = $(this).attr("data-user-no");
	  			var reviewNo = $(this).closest('tr').attr("data-review-no"); // This will get the review_no from the closest tr element
	  			
	  			console.log("User No: " + userNo);
	  			console.log("Review No: " + reviewNo);
	  				//폼에 user_no 값을 설정하려면:
	  		   $("#r_ListForm").append('<input type="hidden" name="user_no" value="' + userNo + '">');
	  		    $("#r_ListForm").append('<input type="hidden" name="review_no" value="' + reviewNo + '">');
	  		
	  			$("#r_ListForm").attr({
	  				"method" : "post",
	  				"action" : "/manager/managerReviewDelete"
	  				
	  			})
	  			
	  			$("#r_ListForm").submit();
  			}
  			
  		});
  		
  		
  		
  		/*********************/
  		
  		
  		/* 검색 대상이 별경될 때마다 처리 이벤트 */
		$("#search").change(function(){
			if($("#search").val()=="all"){
				$("#keyword").val("전체 목록 조회합니다");
			} else if ($("#search").val() != "all"){
				$("#keyword").val("");
				$("#keyword").focus();
			}
		});
  		
  		
  		
  		
		/* 검색 버튼 클릭 시 처리 이벤트 */
		$("#searchData").click(function(){
			if($("#search").val()!="all"){ // 검색대상(search)의 값이 all이 아니면 키워드(검색할 단어)가 반드시 필요.
					if(!chkData("#keyword","검색어를")) return;
			}
			$("#pageNum").val(1);
			
			goPage();
			
			
			
			/* else if($("#search").val()=="all"){ // 검색대상(search)의 값이 all이면 전체 검색으로 키워드가 필요하지 않음.
					$("#keyword").val("");
			}  
			
			
			$("#f_search").attr({
					"method":"get",
					"action":"/board/boardList"
			});
			
			
			$("#f_search").submit();
			*/
							
		});
  		
  		
		$(".paginate_button a").click(function(e){
			e.preventDefault();
			$("#f_search").find("input[name='pageNum']").val($(this).attr("href"));
			goPage();
		})
		
		
  		
		/* 검색을 위한 실질적인 처리 함수 */
		function goPage(){
			if($("#search").val()=="all"){
				$("#keyword").val("");
			}
			
			$("#f_search").attr({
				"method" : "GET",
				"action" : "/manager/managerReviewList"
			});
			$("#f_search").submit();
			
		}
		  
		
		
		
		
		
		/* 정렬을 위한 전송 */
		$("#orderByReviewNo").click(function(){
			$("#f_search").attr({
				"method" : "GET",
				"action" : "/manager/managerReviewList"
			});
			$("#f_search").submit();
			
		});
		
		$("#orderByUserNo").click(function(){
			$("orderByReviewNo").val("");
			$("#f_search").attr({
				"method" : "GET",
				"action" : "/manager/managerReviewList"
			});
			$("#f_search").submit();
			
		});
		
		
  		
		
		
		
		
		/* 더보기 
		function moreContent(id, addCount) {
		    // 기존의 startCount 값을 가져옵니다.
		    var startCount = parseInt($("#startCount").val());
		    var viewCount = parseInt($("#viewCount").val());
		    
		    // startCount 값을 업데이트합니다.
		    $("#startCount").val(startCount + viewCount);

		    // AJAX를 사용하여 새로운 데이터를 가져옵니다.
		    $.ajax({
		        url: "/review/managerReviewList",
		        method: "GET",
		        data: {
		            startCount: $("#startCount").val(),
		            viewCount: 2  // 이 값을 5로 설정하면 5개씩 가져옵니다.
		        },
		        success: function(data) {
		            // 여기서 'data'는 새로운 목록 항목들을 포함하는 HTML 또는 JSON이어야 합니다.
		            // HTML을 반환하면 아래와 같이 처리하면 됩니다:
		            console.log(data);
		            $("#yourTableId tbody").append(data);
		            
		            // JSON을 반환하면 JSON 데이터를 파싱하여 테이블 행을 동적으로 생성해야 합니다.
		        },
		        error: function(err) {
		            console.error("데이터 로딩 실패:", err);
		        }
		    });
		}
		**********************
		$("#more_btn_a").click(function() {
		    moreContent();
		});

  		*/
  		
  		
  		
  		
  	});
	
	
	</script>
<style>
		.table{
			width :100%;
		}
		
		.miniSize {
			width :130px;
		}
		
		.bigSize {
			width :400px;
		}
		
		#pageNav {
			
			    margin: 0 auto;
			    width: 100px;
			    margin-bottom : 100px;

		}
		
		#packageNameSpan{
			color : blue;
			font-size : 13px;
		}
		
		.mb-3 {
			display :inline-flex;
		}
		
		#searchData {
			width : 150px;
		}
		
		#search{
			width : 250px;
		}
	
	</style>
	
   </head>
   <body>
   
   
   
   	<h3>리뷰 관리</h3>

	<button id="orderByReviewNo">리뷰 번호 순</button>
	<button id="orderByUserNo">유저 번호 순</button>
	<button id="orderByReviewLike">추천 순</button>
	<button id="orderByReviewRating">별점 순</button>

	<%-- =================검색 기능 시작================== --%>
		<div id="boardSearch" class="text-right"> 
		
			<form id="f_search" name="f_search" class="form-inline">
					<%-- 페이징 처리를 위한 파라미터 --%>
					<input type="hidden" name="pageNum" id="pageNum" value="${pageMaker.cvo.pageNum}">
					<input type="hidden" name="amount" id="amount" value="${pageMaker.cvo.amount}">
					<%-- 페이징 처리를 위한 파라미터 끝 --%>
					
					<!-- 정렬을 위한 폼 -->
					<input type="hidden" name="orderByReivew" id="orderByReivew" value="" />
					
			<!-- 
				<div class="form-group">
					 <label>검색조건</label>
					 <select id="search" name="search"  class="form-control">
								<option value="all">전체 목록 조회</option>
								<option value="review_no">리뷰번호</option>
								<option value="user_no">유저번호</option>
								<option value="review_content">내용</option>
								<option value="review_rating">별점</option>
								<option value="product_name">제품 이름</option>
					</select>
					<input type="text" name="keyword" id="keyword" value="검색어를 입력하세요" class="form-control" />
					<button type="button" id="searchData" class="btn btn-success">검색</button>
				</div>
				 -->
				 
				 
				   <div class="mb-3">
				    <select class="form-select" id="search" name="search" required aria-label="select example">
						<option value="all">전체 목록 조회</option>
						<option value="review_no">리뷰번호</option>
						<option value="user_no">유저번호</option>
						<option value="review_content">내용</option>
						<option value="review_rating">별점</option>
						<option value="product_name">제품 이름</option>
				    </select>
				    <input type="text" name="keyword" id="keyword" value="검색어를 입력하세요" class="form-control" />
				    <button type="button" id="searchData" class="btn btn-success">검색</button>
				  </div>
				 
				 
			</form>
		
		</div>



	





	<!-- 조회 시작 -->

	<form id="r_ListForm">
		<!-- 더보기 위한 폼 -->
		<input type="hidden" name="viewCount" id="viewCount" value="0">
		<input type="hidden" name="startCount" id="startCount" value="0">
	
	<table class="table">
		<thead>
			<tr>
				<th scope="col" class="text-center miniSize">리뷰번호<br>유저번호</th>
				<th scope="col" class="text-center">제품명(제품번호)</th>
				<th scope="col" class="text-center bigSize">내용</th>
				<th scope="col" class="text-center miniSize">별점</th>
				<th scope="col" class="text-center miniSize">추천수</th>
				<th scope="col" class="text-center miniSize">작성일</th>
				<th scope="col" class="text-center miniSize">삭제</th>
			</tr>
		</thead>
		
		<tbody>
			
			 	<!-- 데이터 출력 -->
					<c:choose>
						<c:when test="${not empty reviewList}">
							<c:forEach var="review" items="${reviewList}" varStatus="status">
								<tr class="text-center" data-review-no = "${review.review_no}">
									<td class=miniSize>${review.review_no}<br>${review.user_no}</td>
									<td class="text-left miniSize">${review.product_name}(${review.product_no})<br>${review.product_type}</td>
									<td class="text-left">${review.review_content}</td>
									<td class="text-left reviewRating miniSize">${review.review_rating}</td>
									<td class="text-left miniSize">${review.review_like_count}</td>
									<td class="text-center miniSize">${review.review_date}</td>
									<td class="text-center miniSize"><button class="btn btn-outline-secondary r_DeleteBtn" type="button" id="button-addon2" data-user-no="${review.user_no}">삭제</button></td>
									
								</tr>
							</c:forEach>
						
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="5" class="tac text-center">등록된 게시글이 존재하지 않습니다.</td>
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
			

	</body>
	
</html>