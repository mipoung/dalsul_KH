<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
      <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
      
      <title>리뷰조회 reviewList</title>
      
      <link rel="shortcut icon" href="/resources/image/icon.png" />
      <link rel="apple-touch-icon" href="/resources/image/icon.png" />
      <link rel="stylesheet" type="text/css" href="/resources/include/css/reviewList.css"/>
      
      <!--[if lt IE 9]>
      <script src="../js/html5shiv.js"></script>
      <![endif]-->
      
      <script>
      	$(function(){
      		// 별점 관련 스크립트 
      		let selectedStar = 0; // 클릭된 별의 수
			
			$("#star1").hover(function(){
			    colorStars(1);
			}, function(){
			    colorStars(selectedStar);
			}).click(function(){
			    selectedStar = 1;
			    colorStars(selectedStar);

			    $("#review_rating").val(selectedStar);
			    
			});

			$("#star2").hover(function(){
			    colorStars(2);
			}, function(){
			    colorStars(selectedStar);
			}).click(function(){
			    selectedStar = 2;
			    colorStars(selectedStar);

			    $("#review_rating").val(selectedStar);
			    
			});

			$("#star3").hover(function(){
			    colorStars(3);
			}, function(){
			    colorStars(selectedStar);
			}).click(function(){
			    selectedStar = 3;
			    colorStars(selectedStar);

			    $("#review_rating").val(selectedStar);
			    
			});

			$("#star4").hover(function(){
			    colorStars(4);
			}, function(){
			    colorStars(selectedStar);

			    $("#review_rating").val(selectedStar);
			    
			}).click(function(){
			    selectedStar = 4;
			    colorStars(selectedStar);

			    $("#review_rating").val(selectedStar);
			    
			});

			$("#star5").hover(function(){
			    colorStars(5);
			}, function(){
			    colorStars(selectedStar);

			    $("#review_rating").val(selectedStar);
			    
			}).click(function(){
			    selectedStar = 5;
			    colorStars(selectedStar);

			    $("#review_rating").val(selectedStar);
			    
			
			});

			function colorStars(num) {
			    // 모든 별을 회색으로 초기화
			    $("#star1, #star2, #star3, #star4, #star5").css("color","gray");

			    // 지정된 숫자만큼의 별을 빨간색으로 칠하기
			    for(let i = 1; i <= num; i++) {
			        $("#star" + i).css("color", "red");
			    }
			}
			
			
			
			
			
	

      		
      		
      	

      		
      		
      		
      		
      		
      		/////
      		
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
      			var userNo = $(this).attr("data-user-no");
      		   
      		    
      		    console.log("User No: " + userNo);
      		   
      		    
      		    $("#r_ListForm").append('<input type="hidden" name="user_no" value="' + userNo + '">');
      		    $("#r_ListForm").append('<input type="hidden" name="review_no" value="' + reviewNo + '">');

      		
      			$("#r_ListForm").attr({
      				"method" : "post",
      				"action" : "/review/myReviewDelete"
      				
      			});
      			
      			$("#r_ListForm").submit();
      			
      			
      		});
      		
      		
      		
      		// 리스트에서 수정 버튼 클릭(모달창 띄우면서 폼 불러오기)
      		$(".r_UpdateFormBtn").click(function(){
      			// list 에서 값을 가져와서 모달창으로 보내주기
      			
      			var reviewNo = $(this).closest(".card.mb-3").attr("data-review-no");
      			console.log("Review No: " + reviewNo);
      			
      			
      			/* 리스트에 있는 리뷰 별점 값 가져오기 */
      			$(document).on('click', '.r_UpdateFormBtn', function() {
      			    // 가장 가까운 .card.mb-3 부모 요소를 찾고, 그 안에서 .reviewRating 요소를 찾아 data-review-rating 값을 가져온다.
      			    var ratingValue = $(this).closest('.card.mb-3').find('.reviewRating').data('review-rating');
      			  	
      			  	$("#review_rating").val(ratingValue);
      			  	
     			    console.log("폼에 입력된 별점 : " + $("#review_rating").val());
     			    
      			 
      			});
				
      		   
      			
      			
      			// 글 번호를 myReviewData의 value에 대입
      			$("#review_no").val(reviewNo);
      			
      			
      		});
      		
      		
      		
      		// 모달창에서 수정버튼 클릭
      		$(".r_UpdateBtn").click(function(){
      			
      			$("#r_UpdateForm").attr({
      				"method" : "post",
      				"action" : "/review/reviewUpdate"
      				
      			});
      			$("#r_UpdateForm").submit();
      			
      		});
      		
      		
      		
      		
      		
      		
      	})
      
      
      </script>
      
      
       
      
   </head>
   
  
   <body>
   <!--
   	<form id="f_myReviewData">
   		 <input type="text" id="review_no" name="review_no" value=""> 
   		
   	</form>
   	-->
   	<br>
   	
   	
   		
		
	<!-- ----------- 기본 컨테이너 ------------ 
	
	
	<div class="container review">
 		
		<c:choose>
			<c:when test="${not empty reviewList}">
				<c:forEach var="review" items="${reviewList}" varStatus="status">
				
				
					<div class=reviewBox>
						<div class=reviewHeader>글 번호: ${review.review_no} | 유저ID: ${review.user_no} | 제품명 | ${review.review_date}</div>
						<div class=reviewBody>${review.review_content}</div>
						<div class="likeBtn">
							<span>${review.review_like}</span>
							<button type="button" class="btn btn-outline-primary">좋아요</button>
							
							<button type="button" class="btn btn-outline-danger">수정</button>
							<button type="button" class="btn btn-outline-danger">삭제</button>
							
							
				            <c:if test="${not empty sessionScope.loginUser and sessionScope.loginUser.user_no == review.user_no}">
				                <button type="button" class="btn btn-outline-danger" id="updateBtn">수정</button>
				                <button type="button" class="btn btn-outline-danger" id="deleteBtn">삭제</button>
				            </c:if>
						</div>
						
							  
					</div>
					
				</c:forEach>
			
			</c:when>
			<c:otherwise>
				<div>
					<div class="tac text-center">등록된 게시글이 존재하지 않습니다.</div>
				</div>
			</c:otherwise>
		
		</c:choose>
		
		
		
		
		
		
	</div>
	-->
	
	
	
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
								      <img src="/resources/images/junju.png" class="img-fluid rounded-start" alt="...">
								    </div>
								    <div class="col-md-8">
								      <div class="card-body">
								        <h6 class="card-title">${review.review_no} | ${review.user_no} | ${review.review_date} | 제품명 </h6>
								        <p class="card-text text-left" id="reviewContent">${review.review_content }</p>
								        
								      </div>
								      <div id="cordBtn">
								       <div class="reviewRating" id="reviewRating" data-review-rating="${review.review_rating}">${review.review_rating}</div>
								       <button type="button" class="btn btn-primary btn-sm float-end">좋아요 <span class="badge text-bg-warning">${review.review_like}</span></button>
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
				<div class="modal fade" id="exampleModal" tabindex="-1"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
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
												<img src="/resources/images/junju.png"
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
										<textarea class="form-control" id="message-text" rows="7" placeholder="리뷰 내용을 입력해주세요" name="review_content"></textarea>
									</div>
									<!-- 입력 박스 끝 -->
									
									
									<!-- 글 번호 저장을 위한 히든 폼 -->
									<input type="hidden" id="review_no" name="review_no" value=0 >
									<!-- 별점 저장을 위한 히든 폼 -->
									<input type="hidden" id="review_rating" name="review_rating" value=0 />
									
								</form>
			
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
								<button type="button" class="btn btn-primary r_UpdateBtn">수정</button>
							</div>
						</div>
					</div>
				</div>

	
   
   
   </body>
</html>