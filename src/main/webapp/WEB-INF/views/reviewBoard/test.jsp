<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ include file="/WEB-INF/views/common/common.jsp"%>--%>
<script src="/resources/include/reviewBoard/js/jquery-3.7.0.min.js"></script>
<script src="/resources/include/common/js/common.js"></script>
<script src="/resources/include/reviewBoard/dist2/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/include/reviewBoard/dist2/css/bootstrap.css"/>  
     
      <script>
      	$(function(){
      		// 모달창 띄우는 버튼 누르면 실행
      		// 날짜 가져오기
      		$(".ReviewInsertFormBtn").click(function(){
      			var productListDate = $(".productListDate").data("product-date");
      			var productName = $(".productName").data("product-name");
      			
      			/* 제품번호 가져오기 */
   				var productNo = $(".productNo").data("product-no");
      			$("#product_no").val(productNo);
      			alert("제품번호:"+productNo);
      			
   				console.log(productName);
   				$(".orderDate").text("주문일 : "+productListDate);
   				$(".productName").text(productName);
      			
      		})
      	
      		
      		
      		// 유효성 체크하고 작성하기
   			$("#r_InsertBtn").click(function(){
   				
   				
   				if(!chkData("#message-text", "내용을")) return;
   				else if(!chkData("#review_rating", "별점을")) return;
   				
				
      			$("#r_InsertForm").attr({
      				"method" : "post",
      				"action" : "/review/myReviewInsert"
      			});
      			
      			
      			$("#r_InsertForm").submit();
   				
   				
   			});
      		
      		
      		
      		
      		
      		// 리뷰리스트
      		$("#detailReviewList").click(function(){
      			location.href = "/review/detailReviewList";
      		});
      		$("#myReviewList").click(function(){
      			location.href = "/review/myReviewList";
      		});
      		$("#managerReviewList").click(function(){
      			location.href = "/review/managerReviewList";
      		});
      		
      		
      		
      		/*
    		// 마이페이지 리뷰 작성폼 이동(필요없음)
      		$("#reviewWriteForm").click(function(){
      			$("#f_review").attr({
      				"method" : "get",
      				"action" : "/review/reviewWriteForm"
      				
      			});
      			
      			$("#f_review").submit();
      			
      			
      		});
      		*/
      		
      		
      		
      		
      		
      		
      		
      		
      		
      		// 별점 색 회색으로 초기화
      		$("#star > span").css("color", "gray");
      		
      		// 작성 모달에서 별점 클릭했을 때 색 변환하고 값 넣기
      		$("#star > span").click(function(){
      			$("#star > span").css("color", "gray");
      		    if(this === $("#star1")[0]){
      		        $(this).css("color","red");
      		      	$("#review_rating").val(1);
      		    } else if(this === $("#star2")[0]){
      		    	$("#star1").css("color","red");
      		   		$(this).css("color","red");
      		   		$("#review_rating").val(2);
      		    } else if(this === $("#star3")[0]){
      		    	$("#star1").css("color","red");
      		    	$("#star2").css("color","red");
      		   		$(this).css("color","red");
      		  		$("#review_rating").val(3);
      		    } else if(this === $("#star4")[0]){
      		    	$("#star1").css("color","red");
      		    	$("#star2").css("color","red");
      		    	$("#star3").css("color","red");
      		   		$(this).css("color","red");
      		  		$("#review_rating").val(4);
      		    } else if(this === $("#star5")[0]){
      		    	$("#star1").css("color","red");
      		    	$("#star2").css("color","red");
      		    	$("#star3").css("color","red");
      		    	$("#star4").css("color","red");
      		   		$(this).css("color","red");
      		 	 	$("#review_rating").val(5);
      		    } 
      		    console.log("저장된 별점 값 : "+$("#review_rating").val());
      		    
      		    
      		});
      		
      		
      		
      		/********* 모달창 취소버튼 눌렀을 때 별점 색상 회색으로 초기화, 리뷰 내용 초기화 ********/
      		$("#r_CancelBtn").click(function(){
      			$("#star > span").css("color", "gray");
      			$("#message-text").val("");
      		});
      		$(".btn-close").click(function(){
      			$("#star > span").css("color", "gray");
      			$("#message-text").val("");
      		});
      		/***********************************************************************/

      		
      		
      		
      		
      		
      		
      		
      		

      		// 모달창 글자수 보여주기
      		$('#message-text').keyup(function (e) {
      			let content = $(this).val();
      		    
	      		    // 글자수 세기
	      		    if (content.length == 0 || content == '') {
	      		    	$('#textCount').text('0자/250자');
	      		    } else {
	      		    	$('#textCount').text(content.length + '/250자');
	      		    } 
      		    
      		    
		      		  if (content.length > 250) {
		      	        // 250자 넘으면 알림창 뜨도록
		      	        alert('글자수는 250자까지 입력 가능합니다.');
	      	  		  };
      		    
      		    
      		});	
      		
      		
      		
      		
      		
			
      		
      		
      		
      		
      	});
      </script>
      <style>
      	td, tr {
      		border : 1px solid;
      	}
      	
      	
   		#star > span {
   			cursor: pointer;
		}
		
		#textCount {
			font-size : 13px;
			text-align : right;
			margin-top:5px;
			color:gray;
		}
      	
     
      
      </style>
      
      
   </head>
   <body>
   
   	
  <br>
   	
   	<!-- 리뷰리스트 이동 -->
    <button id="detailReviewList">detailReviewList</button>
   	<button id="myReviewList">myReviewList</button>
   	<button id="managerReviewList">managerReviewList</button>
   
   
   
   <hr>
   		<!-- 리뷰 작성 구현 -->

	<p>마이페이지 주문내역(주문번호 order_no, 주문한 제품 번호 product_no)와 세션 user_no를 받아야됨</p>
	<ul>
		<li>사용자의 주문 내역 데이터베이스를 조회하여 해당 상품을 구매한 기록이 있는지 확인</li>
		<li>상품에 대한 리뷰를 작성할 때 주문번호도 함께 기록, 이렇게 함으로써 동일한 상품이더라도 주문번호가 다르면 별개로 취급할 수 있음</li>
		<li>리뷰 데이터베이스를 조회하여 해당 상품에 대해 사용자가 이미 리뷰를 작성했는지 확인</li>
		<li>이미 리뷰를 작성한 상품은 추가적인 리뷰 작성이 불가능하도록 설정</li>
	</ul>
	<div>
		<p>주문내역</p>
		<table>
			<tr>
				<td>주문번호</td>
				<td>제품번호</td>
				<td>주문제품</td>
				<td>제품번호</td>
				<td>주문일</td>
				
				
			</tr>
			<tr>
				<td class="orderNo" data-order-no="1">1</td>
				<td class="productNo" data-product-no="5">5</td>
				<td class="productName" data-product-name="죄와벌">죄와벌</td>
				<td class="productNo" data-product-no="333">333</td>
				<td class="productListDate" data-product-date="2012-02-22">2012-02-22</td>
			</tr>
		
		</table>
	
	</div>
	
	
	
	<!-- 리뷰 작성 폼 -->
	
	<!-- Button trigger modal -->
	<button type="button" class="btn btn-primary ReviewInsertFormBtn" data-bs-toggle="modal" data-bs-target="#exampleModal">마이페이지에서 리뷰 작성하기</button>

	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" data-bs-backdrop="static"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					
					<h1 class="modal-title fs-5" id="exampleModalLabel">리뷰 작성하기</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<!-- 카드 시작 -->

					<form id="r_InsertForm">
						<div class="card mb-3" style="max-width: 540px;">
							<div class="row g-0">
								<div class="col-md-4">
									<img src="/resources/images/common/icon.png"
										class="img-fluid rounded-start" alt="...">
								</div>
								<div class="col-md-8">
									<div class="card-body">
										<h5 class="card-title productName">제품명</h5>
										<div id=star>
												<span id="star1">★</span>
												<span id="star2">★</span>
												<span id="star3">★</span>
												<span id="star4">★</span>
												<span id="star5">★</span>
											
											</div>
											
										<p class="card-text">
											<small class="text-body-secondary orderDate"></small>
										</p>
									</div>
								</div>
							</div>
						</div>
						<!-- 카드 끝 -->


						<!-- 입력 박스 시작 -->
						<div class="mb-3">
							<!-- <label for="message-text" class="col-form-label">리뷰 내용</label> -->
							<textarea class="form-control" id="message-text" rows="7" placeholder="리뷰 내용을 입력해주세요(250자 이내)" name="review_content" maxlength="250"></textarea>
							<div id="textCount">0/250자</div>
						</div>
						<!-- 입력 박스 끝 -->
						
						
							<!-- 글 번호 저장을 위한 히든 폼(글작성시엔 필요 없음) -->
							<!-- <input type="hidden" id="review_no" name="review_no" value=0 > -->
							
							<!-- 주문번호를 저장할 히든폼 -->
							<input type="hidden" id="review_order_no" name="review_order_no" value="" />
							<!-- 별점 저장을 위한 히든 폼 -->
							<input type="hidden" id="review_rating" name="review_rating" value="" />
							<!-- 제품 번호 저장을 위한 히든폼 -->
							<input type="hidden" id="product_no" name="product_no" value="" />
							
						
					</form>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="r_CancelBtn">취소</button>
					<button type="button" class="btn btn-primary" id="r_InsertBtn">등록</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 리뷰 작성 구현 끝 -->
	
	
	
	
	

  
  
   </body>
</html>