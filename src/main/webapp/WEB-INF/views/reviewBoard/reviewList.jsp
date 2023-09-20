<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>
<script  src="/resources/include/reviewBoard/js/jquery.cookie.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/include/reviewBoard/css/reviewList.css"/>
<script type="text/javascript" src="/resources/include/reviewBoard/js/reviewList.js"></script>
      <title>리뷰조회 reviewList</title>
      <!-- 주석-->
     
 
      
       
      
   </head>
   
  
   <body>
   <!--
   	<form id="f_myReviewData">
   		 <input type="text" id="review_no" name="review_no" value=""> 
   		
   	</form>
   	-->
   	<br>
   	<input type="hidden" id="user_no" value="${sessionScope.UserLogin.user_no}">
   	
   	
   	<form id="detailReviewOrderBy">
   		<!-- 정렬데이터 전송을 위한 폼 -->
		<input type="hidden" id="reviewOrderBy" name="reviewOrderBy" value="">
   	
   	</form>
   		
	

	<div class="card-body">
		 <c:choose>
		    <c:when test="${not empty bestReview}">
		        <c:forEach var="bestReview" items="${bestReview}" varStatus="status">
		        	
	            	<form id="r_BestListForm">
					    <div class="card mb-3" id="bestReviewDiv" data-review-no="${bestReview.review_no}" style="max-width: 700px;">
						  <div class="row g-0">
						  <p id="bestReviewHeader">가장 많은 추천을 받은 리뷰</p>
						    <div class="col-md-4">
						      <img src="/resources/images/mainpage/product/${bestReview.product_main_image}" class="img-fluid rounded-start" alt="...">
						      
						    </div>
						    <div class="col-md-8">
						      <div class="card-body">
						        <h6 class="card-title">${bestReview.review_no} | ${bestReview.user_no} | ${bestReview.review_date} | ${bestReview.product_name} </h6>
						        <p class="card-text text-left" id="reviewContent" data-review-content="${bestReview.review_content}">${bestReview.review_content }</p>
						        
						      </div>
						      <div id="cordBtn">
						       <div class="reviewRating" id="reviewRating" data-review-rating="${bestReview.review_rating}">${bestReview.review_rating}</div>
						       <button type="button" class="btn btn-primary btn-sm float-end reviewLikeBtn">좋아요 <span class="badge text-bg-warning likeCount">${bestReview.review_like_count}</span></button>
						      
						      	 	<!-- 로그인 세션 확인 및 사용자가 작성자와 동일한 경우 삭제 버튼 표시 loginUser은 로그인 세션 이름 -->
						            <c:if test="${not empty userLogin and userLogin.user_no == bestReview.user_no}">
						               	  <button type="button" class="btn btn-warning btn-sm float-end r_UpdateFormBtn" data-bs-toggle="modal" data-bs-target="#exampleModal">수정</button>
						    			  <button type="button" class="btn btn-warning btn-sm float-end r_DeleteBtn" data-user-no="${bestReview.user_no}">삭제</button>
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
			    <div class="card mb-3" data-review-no="${review.review_no}" style="max-width: 700px;">
				  <div class="row g-0">
				    <div class="col-md-4">
				      <img src="/resources/images/mainpage/product/${review.product_main_image}" class="img-fluid rounded-start" alt="...">
				      
				    </div>
				    <div class="col-md-8">
				      <div class="card-body">
				        <h6 class="card-title" data-product-no="${review.product_no}">${review.review_no} | ${review.user_no} | ${review.review_date} | ${review.product_name} </h6>
				        <p class="card-text text-left" id="reviewContent" data-review-content="${review.review_content}">${review.review_content }</p>
				        
				      </div>
				      <div id="cordBtn">
				       <div class="reviewRating" id="reviewRating" data-review-rating="${review.review_rating}">${review.review_rating}</div>
				       <button type="button" class="btn btn-primary btn-sm float-end reviewLikeBtn">좋아요 <span class="badge text-bg-warning likeCount">${review.review_like_count}</span></button>
				      
				      	 	<!-- 로그인 세션 확인 및 사용자가 작성자와 동일한 경우 삭제 버튼 표시 loginUser은 로그인 세션 이름 -->
				             <c:if test="${not empty userLogin and userLogin.user_no == review.user_no}">
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
									
									<!-- 제품 넘버 저장을 위한 히든 폼 -->
									<input type="hidden" id="product_no" name="product_no" value="" />
									
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