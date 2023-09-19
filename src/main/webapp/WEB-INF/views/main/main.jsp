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
<link rel="stylesheet" type="text/css"
	href="/resources/include/mainpage/css/header.css" />
<link rel="stylesheet" type="text/css"
	href="/resources/include/mainpage/css/footer.css" />

<style>

/* 슬라이드 모음 */

/* 배너 버튼 스타일 */
.slick-prev, .slick-next {
	z-index: 2; /* 다른 요소 위에 표시하기 위한 z-index 설정 */
}

.slick-prev {
	left: 15px; /* 왼쪽 버튼의 위치 설정 */
}

.slick-next {
	right: 15px; /* 오른쪽 버튼의 위치 설정 */
}

.mainslide {
	width: 100%;
	display: block;
	height: 35%;
	object-fit: cover;
	margin-top: 55px;
}

.slick-prev::before {
	content: "\f104"; /* "\f104"는 Font Awesome에서 왼쪽 화살표 아이콘의 유니코드입니다. */
	font-family: "Font Awesome 5 Free"; /* Font Awesome 5 아이콘 폰트 사용 설정 */
	font-weight: 900; /* Font Awesome 아이콘의 두께 설정 */
	font-size: 20px; /* 아이콘 크기 조절 */
	color: #999; /* 아이콘 색상 설정 */
}

.slick-next::before {
	content: "\f105"; /* "\f105"는 Font Awesome에서 오른쪽 화살표 아이콘의 유니코드입니다. */
	font-family: "Font Awesome 5 Free"; /* Font Awesome 5 아이콘 폰트 사용 설정 */
	font-weight: 900; /* Font Awesome 아이콘의 두께 설정 */
	font-size: 20px; /* 아이콘 크기 조절 */
	color: #999; /* 아이콘 색상 설정 */
}
/* 상품소개 슬라이드 모음 */
.product-slide, .product-title, .product-price, .product-reputation {
	width: 250px;
}

.product-slide {
	border-radius: 5px;
}



.wrapperout {
    display: flex;
    justify-content: center; /* 수평 가운데 정렬 */
    align-items: center; /* 수직 가운데 정렬 */
    flex-wrap: wrap; /* 필요한 경우 상품 슬라이드를 여러 행에 배치 */
    gap: 20px; /* 각 상품 슬라이드 사이의 간격 조정 */
}
</style>
<script src="/resources/include/common/js/jquery-3.7.0.min.js"></script>
<script src="/resources/include/common/bootstrap/js/bootstrap.js"></script>
<script src="/resources/include/mainpage/js/slick.js"></script>
<script src="/resources/include/mainpage/js/slick.min.js"></script>
<script src="https://kit.fontawesome.com/312ff11b0d.js"
	crossorigin="anonymous"></script>
<script src="/resources/include/mainpage/js/header.js"></script>

<script>
	$(function() {
		$('.center').slick({
			dots : true, // 하단에 점으로 순서 표시 옵션
			infinite : true, // 무한 반복 옵션
			speed : 400, // 슬라이드 이동 속도(ms)
			slidesToShow : 1, // 한 화면에 보여질 컨텐트 개수
			adaptiveHeight : true, // 슬라이드 높이 맞춤 
			autoplay : true, // 자동 이동 옵션
			autoplaySpeed : 3000, // 자동 이동 속도(ms)
			arrows : true, // 옆으로 이동하는 화살표 표시

			draggable : false, // 드레그 옵션
			responsive : [ // 반응형 왭 구현 옵션	
			{
				breakpoint : 960, // 화면 사이즈 960px
				settings : {
					slidesToShow : 4
				// 위에 옵션이 디폴트, 여기에 추가하면 변경
				}
			}, {
				breakpoint : 760, // 화면 사이즈 760px
				settings : {
					slidesToShow : 5
				// 위에 옵션이 디폴트, 여기에 추가하면 변경
				}
			} ]
		});
	});
	$(function() {
		$('.wrapperout').slick({
			dots : false,
			infinite : false,
			speed : 400,
			slidesToShow: 4,
			slidesToScroll: 4,    
			/*responsive : [ {
				breakpoint : 1024,
				settings : {
					slidesToShow : 3,
					slidesToScroll : 3,
					infinite : true,
					dots : true
				}
			}, {
				breakpoint : 600,
				settings : {
					slidesToShow : 2,
					slidesToScroll : 2
				}
			}, {
				breakpoint : 480,
				settings : {
					slidesToShow : 1,
					slidesToScroll : 1
				}
			} ]*/
		});
	});
</script>

</head>
<body>

	<%@ include file="header.jsp"%>
	<!-- header.jsp 파일 포함 -->

	<!-- 사이트 소개 슬라이드 모음 시작 -->
	<div class="center">
		<div>
			<img src="resources/images/mainpage/mainslide1.jpg" class="mainslide" />
		</div>
		<div>
			<img src="resources/images/mainpage/mainslide2.jpg" class="mainslide" />
		</div>
		<div>
			<img src="resources/images/mainpage/mainslide3.jpg" class="mainslide" />
		</div>
		<div>
			<img src="resources/images/mainpage/mainslide4.jpg" class="mainslide" />
		</div>
		<div>
			<img src="resources/images/mainpage/mainslide5.jpg" class="mainslide" />
		</div>
		<div>
			<img src="resources/images/mainpage/mainslide6.jpg" class="mainslide" />
		</div>
		<div>
			<img src="resources/images/mainpage/mainslide7.png" class="mainslide" />
		</div>
		<div>
			<img src="resources/images/mainpage/mainslide8.jpg" class="mainslide" />
		</div>
		<div>
			<img src="resources/images/mainpage/mainslide9.jpg" class="mainslide" />
		</div>
	</div>
	<h2> NEW </h2>
	<!-- 상품 소개 슬라이드 모음 시작 !-->
	<div class="wrapperout">
			<c:forEach var="product" items="${products}">		
							<a href="/"> <img src="resources/images/mainpage/product/${product.product_main_image}" alt="" class="product-slide" />
							<div class="product-title">${product.product_name}</div>
							<div class="product-price">${product.product_price}원</div>
							<div class="product-reputation">
								별점 :
								<c:choose>
									<c:when test="${not empty product.review_rating}">
                               			 ${product.review_rating}
                            		</c:when>
										<c:otherwise>
                                		0
                            			</c:otherwise>
								</c:choose>
								| 리뷰 :
								<c:choose>
									<c:when test="${not empty product.review_num}">
                                		${product.review_num}개
                           			 </c:when>
										<c:otherwise>
                               			 0개
                          				 </c:otherwise>
								</c:choose>
							</div>
						</a>						
			</c:forEach>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>

