<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>
<script  src="/resources/include/reviewBoard/js/jquery.cookie.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/include/reviewBoard/css/reviewList.css"/>
      <title>리뷰조회 reviewList</title>
      <!-- 주석22123 123123123-->
      <script>
      	$(function(){
      		
      		// 리뷰리스트에서 별점을 별로 치환하기
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
      		
      		
      		
      		// 수정 모달에서 별점 클릭했을 때 색 변환하고 값 넣기
      		
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

      		


      		
      		
      		
      		// 삭제
      		$(".r_DeleteBtn").click(function(){
      			if(confirm("정말 삭제 하시겠습니까?")){
	      			var userNo = $(this).attr("data-user-no");
	      			var reviewNo = $(this).closest(".card.mb-3").attr("data-review-no");
	      			
	      		    console.log("User No: " + userNo);
	      		   
	      		    
	      		    $("#r_ListForm").append('<input type="hidden" name="user_no" value="' + userNo + '">');
	      		    $("#r_ListForm").append('<input type="hidden" name="review_no" value="' + reviewNo + '">');
	
	      		
	      			$("#r_ListForm").attr({
	      				"method" : "post",
	      				"action" : "/review/myReviewDelete"
	      				
	      			});
	      			
	      			$("#r_ListForm").submit();
      			}
      			
      		});
      		
      		
      		
      		/**************** 리스트에서 수정 버튼 클릭(모달창 띄우면서 폼 불러오기) ****************/
      		$(".r_UpdateFormBtn").click(function(){
      			// 수정 폼 내용 초기화
      			$("#message-text").val("");
      			
      			
      			// jsp에서 리뷰번호 가져오기
      			var reviewNo = $(this).closest(".card.mb-3").attr("data-review-no");
      			console.log("Review No: " + reviewNo);
      			
      			// 가져온 리뷰 번호를 myReviewData의 value에 대입
      			$("#review_no").val(reviewNo);
      			
      			
      			/* 리스트에 있는 리뷰 별점 값 가져오기 */
      			$(document).on('click', '.r_UpdateFormBtn', function() {
      			    // 가장 가까운 .card.mb-3 부모 요소를 찾고, 그 안에서 .reviewRating 요소를 찾아 data-review-rating 값을 가져온다.
      			    var ratingValue = $(this).closest('.card.mb-3').find('.reviewRating').data('review-rating');
      			  	
      			    // 모달창에 별점 설정
      			  	$("#review_rating").val(ratingValue);
      			  	
     			    console.log("폼에 입력된 별점 : " + $("#review_rating").val());
     			    
     			    
     			    // 별점 색 변경
     			    if($("#review_rating").val() === "1"){
     			    	$("#star1").css("color","red");
     			    	
     			    } else if($("#review_rating").val() === "2"){
     			    	$("#star1").css("color","red");
     			    	$("#star2").css("color","red");
     			    } else if($("#review_rating").val() === "3"){
     			    	$("#star1").css("color","red");
     			    	$("#star2").css("color","red");
     			    	$("#star3").css("color","red");
     			    } else if($("#review_rating").val() === "4"){
     			    	$("#star1").css("color","red");
     			    	$("#star2").css("color","red");
     			    	$("#star3").css("color","red");
     			    	$("#star4").css("color","red");
     			    } else if($("#review_rating").val() === "5"){
     			    	$("#star1").css("color","red");
     			    	$("#star2").css("color","red");
     			    	$("#star3").css("color","red");
     			    	$("#star4").css("color","red");
     			    	$("#star5").css("color","red");
     			    }; 
     			    
     			    
      			 
      			});


      		});
      		/*******************리스트에서 수정 버튼 클릭(모달창 띄우면서 폼 불러오기) 끝 ************************/
      		
      		
      		
      		
      		
      		

      		/********* 모달창 취소버튼 눌렀을 때 별점 색상 회색으로 초기화 ********/
      		$("#r_CancelBtn").click(function(){
      			$("#star > span").css("color", "gray");
      		});
      		$(".btn-close").click(function(){
      			$("#star > span").css("color", "gray");
      		});
      		/***********************************************************************/
      		
      		
      		
      		
      		
      		
      		
      		
      		
      		// 모달창에서 수정버튼 클릭
      		$(".r_UpdateBtn").click(function(){
      			if(confirm("수정 하시겠습니까?")){
      			
	      			$("#r_UpdateForm").attr({
	      				"method" : "post",
	      				"action" : "/review/reviewUpdate"
	      				
	      			});
	      			$("#r_UpdateForm").submit();
      			}
      		});
      		
      		
      		
      		
      		
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
	      	        // 200자 넘으면 알림창 뜨도록
	      	        alert('글자수는 250자까지 입력 가능합니다.');
      	  		  };
      		    
      		    
      		});	
      		
      		
      		/********************
      		
      		

      		$(".reviewLikeBtn").click(function(){
      			var $thisBtn = $(this);
      		    var review_no = $thisBtn.closest('.card').data('review-no');
      			  var user_no = $("#user_no").val();  // user_no 값을 가져옵니다.
      		    $.ajax({
      				url : "/review/likePlus",
      				type: "POST",
      				data: { review_no: review_no, user_no: user_no },
      				 success: function(response){
      					$thisBtn.find(".likeCount").text(response);
      					console.log(response);
      		        },
      				error : function(error){
      					console.error('Error',error);
      				}
      				
      				
      			});
      			
      			
      			
      		});
      		
      		/********************/
      		
   			$(".reviewLikeBtn").click(function(){
   				var cardElement = $(this).closest('.card');
   				var review_no = $(this).closest('.card').data('review-no');
   				var cookieName = 'review_' + review_no;
   				console.log(cookieName);
   				
   				// 해당 리뷰에 대한 쿠키가 있는지 확인
   			    if(!$.cookie(cookieName)) {
   				    // 쿠키에 리뷰 ID 저장 (24시간 동안 유효)
   			        $.cookie(cookieName, true, { expires: 24, path: '/' });
   			    	
   				    // ajax로 좋아요 +1 하고 갯수 반환받기
	   			     $.ajax({
	       				url : "/review/likePlus",
	       				type: "GET",
	       				data: { review_no: review_no },
	       				 success: function(response){
	       					$(this).text();
	       					console.log($(this).text()); // 반환받은 값으로 버튼 숫자 바꾸기?
	       		        },
	       				error : function(error){
	       					console.error('Error',error);
	       				}
	       				
	       				
	       			});
   			    
   			    } else {
   			        alert("이미 추천하셨습니다.");
   			    }
   				
   			});
      		
      		
      		
      		
      	});
      
      
      </script>
      <style>
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
   <!--
   	<form id="f_myReviewData">
   		 <input type="text" id="review_no" name="review_no" value=""> 
   		
   	</form>
   	-->
   	<br>
   	<h2>제품번호 <span>12</span></h2>
   	<input type="hidden" id="user_no" value="${sessionScope.UserLogin.user_no}">
   	
   		
	
	
	
	<!-- 새로운 디자인 -->
	
	
				
				<!-- 리뷰 리스트 시작 -->
						<div class="card text-center">
						
						  <div class="card-header">
							    <ul class="nav nav-tabs card-header-tabs">
							      <li class="nav-item">
							       	 <a class="nav-link active" aria-current="true" href="#">최신 순</a>
							      </li>
							      <li class="nav-item">
							    	    <a class="nav-link" href="#">별점 순</a>
							      </li>
							      <li class="nav-item">
							     	   <a class="nav-link" href="#">좋아요 순</a>
							      </li>
							    </ul>
						  </div>
						  
						  <div class="card-body">
						  
												  
							<c:choose>
								<c:when test="${not empty reviewList}">
									<c:forEach var="review" items="${reviewList}" varStatus="status">
									
									
						 		 <!-- 카드 시작 -->
						 		 <form id="r_ListForm">
							    <div class="card mb-3" data-review-no="${review.review_no}" style="max-width: 700px;">
								  <div class="row g-0">
								    <div class="col-md-4">
								      <img src="/resources/images/common/icon.png" class="img-fluid rounded-start" alt="...">
								    </div>
								    <div class="col-md-8">
								      <div class="card-body">
								        <h6 class="card-title">${review.review_no} | ${review.user_no} | ${review.review_date} | 제품명 </h6>
								        <p class="card-text text-left" id="reviewContent">${review.review_content }</p>
								        
								      </div>
								      <div id="cordBtn">
								       <div class="reviewRating" id="reviewRating" data-review-rating="${review.review_rating}">${review.review_rating}</div>
								       <button type="button" class="btn btn-primary btn-sm float-end reviewLikeBtn">좋아요 <span class="badge text-bg-warning .likeCount">${review.review_like_count}</span></button>
								       <!-- 
								       <button type="button" class="btn btn-warning btn-sm float-end r_UpdateFormBt" data-bs-toggle="modal" data-bs-target="#exampleModal">수정</button>
								       <button type="button" class="btn btn-warning btn-sm float-end r_DeleteBtn" data-user-no="${review.user_no}">삭제</button>
								        -->
								      	 	<!-- 로그인 세션 확인 및 사용자가 작성자와 동일한 경우 삭제 버튼 표시 loginUser은 로그인 세션 이름 -->
								            <c:if test="${not empty sessionScope.UserLogin and sessionScope.UserLogin.user_no == review.user_no}">
								               	  <button type="button" class="btn btn-warning btn-sm float-end r_UpdateFormBtn" data-bs-toggle="modal" data-bs-target="#exampleModal">수정</button>
								    			  <button type="button" class="btn btn-warning btn-sm float-end r_DeleteBtn" data-user-no="${review.user_no}">삭제</button>
								            </c:if>
								      </div>
								     
								    </div>
								  </div>
								</div>
								
								</form>
								<!-- 카드 끝 -->
								
								
								
									</c:forEach>
								</c:when>
									<c:otherwise>
										<div>
											<div class="tac text-center">등록된 게시글이 존재하지 않습니다.</div>
										</div>
									</c:otherwise>
							</c:choose>
										
								
								
								
								
						  </div>
					</div>
				<!--  리뷰 리스트 끝  -->
				

				
				
				<!-- 리뷰 수정 Modal -->
				<!--  작성 내용을 ajax를 이용해 가져와야 할 것 같음 -->
				<!--  -->
				<div class="modal fade" id="exampleModal" data-bs-backdrop="static" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h1 class="modal-title fs-5" id="exampleModalLabel">리뷰 수정하기</h1>
								<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							</div>
							
							<div class="modal-body">
								<!-- 카드 시작 -->
			
								<form id="r_UpdateForm">
									<div class="card mb-3" style="max-width: 540px;">
										<div class="row g-0">
											<div class="col-md-4">
												<img src="/resources/images/common/icon.png"
													class="img-fluid rounded-start" alt="...">
											</div>
											<div class="col-md-8">
												<div class="card-body">
													<h5 class="card-title">제품명</h5>
													<div id=star>
															<span id="star1">★</span>
															<span id="star2">★</span>
															<span id="star3">★</span>
															<span id="star4">★</span>
															<span id="star5">★</span>
														
														</div>
														
													<p class="card-text">
														<small class="text-body-secondary">주문일 : </small>
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
									
									
									<!-- 글 번호 저장을 위한 히든 폼 -->
									<input type="hidden" id="review_no" name="review_no" value="" />
									<!-- 별점 저장을 위한 히든 폼 -->
									<input type="hidden" id="review_rating" name="review_rating" value="" />
									
								</form>
			
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="r_CancelBtn">취소</button>
								<button type="button" class="btn btn-primary r_UpdateBtn">수정</button>
							</div>
						</div>
					</div>
				</div>

	
   
   
   </body>
</html>