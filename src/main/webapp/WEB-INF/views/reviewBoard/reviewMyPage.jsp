<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>
<%@ include file="/WEB-INF/views/main/header.jsp"%>
<%@ include file="/WEB-INF/views/mypage/mypageCommon.jsp"%>
<script  src="/resources/include/reviewBoard/js/jquery.cookie.js"></script>
<script type="text/javascript" src="/resources/include/reviewBoard/js/reviewMyPage.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/include/reviewBoard/css/reviewList.css"/>

      <title>리뷰조회 reviewList</title>
      
      
      <style>
      	.mypage_menu{
      		margin-top :70px;
      	}
      
      </style>

   </head>
   
  
   <body>
 
   	
   	<input type="hidden" id="user_no" value="${sessionScope.UserLogin.user_no}">
   	
   	
   	
   	<div id="myReviewSize">
   	
   	
   	
   	
   	
   	<h5 style="text-align:center;">마이페이지 리뷰 조회  ✍️</h5>

	<div class="card-body">
		 <c:choose>
		    <c:when test="${not empty bestReview}">
		        <c:forEach var="bestReivew" items="${bestReview}" varStatus="status">
		        	
	            	<form id="r_BestListForm">
					    <div class="card mb-3" id="bestReviewDiv" data-review-no="${bestReivew.review_no}">
						  <div class="row g-0">
						  <p id="bestReviewHeader">가장 많은 추천을 받은 리뷰</p>
						    <div class="col-md-4">
						      <img src="/resources/images/common/icon.png" class="img-fluid rounded-start" alt="...">
						      ${bestReivew.product_main_image}
						    </div>
						    <div class="col-md-8">
						      <div class="card-body">
						        <h6 class="card-title">글번호: ${bestReivew.review_no} | 유저: ${bestReivew.user_no} | ${bestReivew.review_date} | ${bestReivew.product_name} </h6>
						        <p class="card-text text-left" id="reviewContent" data-review-content="${bestReivew.review_content}">${bestReivew.review_content }</p>
						        
						      </div>
						      <div id="cordBtn">
						       <div class="reviewRating" id="reviewRating" data-review-rating="${bestReivew.review_rating}">${bestReivew.review_rating}</div>
						       <button type="button" class="btn btn-primary btn-sm float-end reviewLikeBtn">좋아요 <span class="badge text-bg-warning likeCount">${bestReivew.review_like_count}</span></button>
						      
						      	 	<!-- 로그인 세션 확인 및 사용자가 작성자와 동일한 경우 삭제 버튼 표시 loginUser은 로그인 세션 이름 -->
						            <c:if test="${not empty sessionScope.UserLogin and sessionScope.UserLogin.user_no == review.user_no}">
						               	  <button type="button" class="btn btn-warning btn-sm float-end r_UpdateFormBtn" data-bs-toggle="modal" data-bs-target="#exampleModal">수정</button>
						    			  <button type="button" class="btn btn-warning btn-sm float-end r_DeleteBtn" data-user-no="${bestReivew.user_no}">삭제</button>
						            </c:if>
						      </div>
						     
						    </div>
						  </div>
						</div>
						
					</form>
		        </c:forEach>
		    </c:when>
		</c:choose>

						
		<!-- --------------- -->				
							  
		<c:choose>
			<c:when test="${not empty reviewList}">
				<c:forEach var="review" items="${reviewList}" varStatus="status">
				
				
	 		 <!-- 카드 시작 -->
	 		 <form id="r_ListForm">
			    <div class="card mb-3" data-review-no="${review.review_no}">
				  <div class="row g-0">
				    <div class="col-md-4" data-image-no="${review.product_main_image}">
				      <img src="/resources/images/mainpage/product/${review.product_main_image}" class="img-fluid rounded-start" alt="...">
				     
				    </div>
				    <div class="col-md-8">
				      <div class="card-body">
				      	<span id="productNameSpan" data-product-name="${review.product_name}"></span>
				        <h6 class="card-title">글번호: ${review.review_no} | 유저: ${review.user_no} | ${review.review_date} | ${review.product_name} </h6>
				        <p class="card-text text-left" id="reviewContent" data-review-content="${review.review_content}">${review.review_content }</p>
				        
				      </div>
				      <div id="cordBtn">
				       <div class="reviewRating" id="reviewRating" data-review-rating="${review.review_rating}">${review.review_rating}</div>
				       <button type="button" class="btn btn-primary btn-sm float-end reviewLikeBtn">추천수 <span class="badge text-bg-warning likeCount">${review.review_like_count}</span></button>
				      
				      	 	<!-- 로그인 세션 확인 및 사용자가 작성자와 동일한 경우 삭제 버튼 표시 loginUser은 로그인 세션 이름 -->
				          
				               	  <button type="button" class="btn btn-warning btn-sm float-end r_UpdateFormBtn" data-bs-toggle="modal" data-bs-target="#exampleModal">수정</button>
				    			  <button type="button" class="btn btn-warning btn-sm float-end r_DeleteBtn" data-user-no="${review.user_no}">삭제</button>
				            
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
				
	
  	</div>
  	
<%@ include file="/WEB-INF/views/main/footer.jsp"%>
</html>