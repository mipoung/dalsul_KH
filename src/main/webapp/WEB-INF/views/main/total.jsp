<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />

<title>메인페이지</title>

<link rel="shortcut icon" href="/resources/images/icon.png" />
<link rel="apple-touch-icon" href="/resources/images/icon.png" />


<link rel="stylesheet" type="text/css"
	href="/resources/include/common/bootstrap/css/bootstrap.css" />
<link rel="stylesheet" type="text/css"
	href="/resources/include/mainpage/css/slick.css" />
<link rel="stylesheet" type="text/css"
	href="/resources/include/mainpage/css/slick-theme.css" />

<style>
/* body {
	width: 100%;
} */
.mainwrapper {
	margin-top: 100px;
}


.selectbarwrapper {
    display: flex;
     
    justify-content: center; /* 가로로 가운데 정렬 */
    align-items: center; /* 세로로 가운데 정렬 */
    
     gap: 40px;
     
     margin-bottom: 40px; 
}

.content {
	width: 1000px;
	margin: 0 auto;
}

.filter {
	background-color: white;
	
	
	border: 2px solid rgb(242, 242, 242);
	border-radius: 5px;
	
	font-weight: bold;
	color: rgb(128, 128, 128);
	
	 padding: 5px 10px; /* 버튼 내부 요소 주변의 간격 설정 */
}

.filter span {
    margin-right: 10px; /* <span> 태그 뒤의 간격 설정 */
}

.filter img {
    margin-left: 10px; /* <img> 태그 앞의 간격 설정 */
}


.selectbar2 {
    display: flex; /* Flexbox 레이아웃 사용 */
    flex-direction: row-reverse;
    align-items: center; /* 세로로 가운데 정렬 */
}

.selectbar2 select {
	magin-right: 10px;
} 

.product {
	display: grid;
	grid-template-columns: repeat(4, 1fr); /* 4개의 열을 생성합니다. */
	grid-gap: 20px; /* 각 열과 행 사이의 간격 설정 */
	align-content: center;
	justify-content: space-evenly;
}

.wrapperin1 {
	padding: 10px; /* 각 항목의 내부 여백 설정 */
	text-align: left; /* 텍스트 가운데 정렬 */
	width: 250px;
}


a {
	text-decoration: none; /* 텍스트 디코레이션 제거 */
	color: inherit; /* 링크 텍스트 색상을 상위 요소에서 상속받음 */
}

.product-slide, .product-title, .product-price, .product-reputation {
	width: 250px;
	height: auto;
	max-height: 333.33px;
	margin-right: 5px;
	border-radius: 5px;
}

.product-info {
	margin-top: 10px;
}

.product-title, .product-price {
	font-weight: bold;
}

.product-reputation {
	font-size: 12px;
	color: rgb(128, 128, 128);
}
</style>

<script src="/resources/include/common/js/jquery-3.7.0.min.js"></script>



</head>
<body>
	<div class="totalwrapper">
		<%@ include file="header.jsp"%>
		<div class="mainwrapper">
			<div class="contentwrapper">
				<div class="selectbarout">
					<div class="selectbarin">
						<div class="selectbarwrapper">
							<div class="filter-container">
								<button class="filter">
									<span>주종  </span><img
										src="https://d38cxpfv0ljg7q.cloudfront.net/assets/arrow-down.png"
										width="20px" class="img" alt="arrow-down">
										
								</button>
							</div>
							<div class="filter-container">
								<button class="filter">
									<span>도수  </span><img
										src="https://d38cxpfv0ljg7q.cloudfront.net/assets/arrow-down.png"
										width="20px" class="img" alt="arrow-down">
								</button>
							</div>
							<div class="filter-container">
								<button class="filter">
									<span>맛  </span><img
										src="https://d38cxpfv0ljg7q.cloudfront.net/assets/arrow-down.png"
										width="20px" class="img" alt="arrow-down">
								</button>
							</div>
							<div class="filter-container">
								<button class="filter">
									<span>원료  </span><img
										src="https://d38cxpfv0ljg7q.cloudfront.net/assets/arrow-down.png"
										width="20px" class="img" alt="arrow-down">
								</button>
							</div>
							<div class="filter-container">
								<button class="filter">
									<span>가격  </span><img
										src="https://d38cxpfv0ljg7q.cloudfront.net/assets/arrow-down.png"
										width="20px" class="img" alt="arrow-down">
								</button>
							</div>
						</div>
					</div>
				</div>
				<div class="content">
					<div class="selectbar2">
						<select
							class="select" id="outlined-age-native-simple" name="age">
							<option value="recommend">추천순</option>
							<option value="released_at">최신순</option>
							<option value="rating">평점순</option>
							<option value="star_count">리뷰 많은 순</option>
							<option value="selling_count">판매순</option>
							<option value="price_high">높은 가격순</option>
							<option value="price_low">낮은 가격순</option></select>
					</div>
					<div class="product">
						<c:forEach var="total" items="${total}">
							<div class="wrapperin1">
								<a href="/detail?product_no=${total.product_no}"> <img
									src="resources/images/mainpage/product/${total.product_main_image}"
									alt="" class="product-slide" />
									<div class="product-info">
										<div class="product-title">${total.product_name}</div>
										<div class="product-price">${total.product_price}원</div>
										<div class="product-reputation">
											별점 :
											<c:choose>
												<c:when test="${not empty total.review_rating}">
                               			 ${total.review_rating}
                            		</c:when>
												<c:otherwise>
                                		0
                            			</c:otherwise>
											</c:choose>
											| 리뷰 :
											<c:choose>
												<c:when test="${not empty total.review_num}">
                                		${total.review_num}개
                           			 </c:when>
												<c:otherwise>
                               			 0개
                          				 </c:otherwise>
											</c:choose>
										</div>
									</div>
								</a>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>

		</div>
		<%@ include file="footer.jsp"%>
	</div>
</body>
</html>