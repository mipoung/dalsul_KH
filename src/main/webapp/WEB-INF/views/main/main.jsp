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
	href="/resources/include/common/css/bootstrap/bootstrap.css" />
<link rel="stylesheet" type="text/css"
	href="/resources/include/mainpage/css/slick.css" />
<link rel="stylesheet" type="text/css"
	href="/resources/include/mainpage/css/slick-theme.css" />
<link rel="stylesheet" type="text/css"
	href="/resources/include/mainpage/css/header.css" />


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
	width: 100%;
	height: 35%;
	object-fit: cover;
	margin-top: 60px;
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

/* 배너 이미지 스타일 */
/*.slider_div {
	position: relative;
	background-color: #fff;
	padding: 10px;
	
	 
	width: 100%;
	height: 100%;
}

.product-title {
	margin-top: 10px;
	margin-bottom: 10px;
	font-size: 18px;
	text-align: left;
	line-height: normal;
	word-break: break-all;
	font-weight: bold;
}

.product-price {
	padding-bottom: 10px;
	text-align: left;
	font-weight: bold;
	font-size: 15px;
	margin: 0;
	padding: 0;
}

.product-reputation {
	padding-bottom: 10px;
	text-align: left;
	font-weight: bold;
	font-size: 15px;
	margin: 0;
	padding: 0;
}

.product-slide {
	border-radius: 10%;
	width: 90%;
}

.wrap_center_main {
	position: relative;
}

.wrap_center_main .slick-prev {
	left: -60px;
	padding-bottom: 100px;
}

.wrap_center_main .slick-next {
	right: -60px;
	padding-bottom: 100px;
}
*/

/* import font */
/*
@import
	url("https://spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css");

 reset 
*, ::before, ::after {
	box-sizing: border-box;
	border-width: 0;
	border-style: solid;
	border-color: theme('borderColor.DEFAULT', 'currentColor')
}

::before, ::after {
	--tw-content: ''
}

html {
	line-height: 1.5;
	-webkit-text-size-adjust: 100%;
	-moz-tab-size: 4;
	tab-size: 4;
	font-family: theme('fontFamily.sans', ui-sans-serif, system-ui,
		-apple-system, BlinkMacSystemFont, "Segoe UI", Roboto,
		"Helvetica Neue", Arial, "Noto Sans", sans-serif, "Apple Color Emoji",
		"Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji")
}

body {
	margin: 0;
	line-height: inherit
}

hr {
	height: 0;
	color: inherit;
	border-top-width: 1px
}

abbr:where([title]) {
	text-decoration: underline dotted
}

h1, h2, h3, h4, h5, h6 {
	font-size: inherit;
	font-weight: inherit
}

a {
	color: inherit;
	text-decoration: inherit
}

b, strong {
	font-weight: bolder
}

code, kbd, samp, pre {
	font-family: theme('fontFamily.mono', ui-monospace, SFMono-Regular,
		Menlo, Monaco, Consolas, "Liberation Mono", "Courier New", monospace);
	font-size: 1em
}

small {
	font-size: 80%
}

sub, sup {
	font-size: 75%;
	line-height: 0;
	position: relative;
	vertical-align: baseline
}

sub {
	bottom: -0.25em
}

sup {
	top: -0.5em
}

table {
	text-indent: 0;
	border-color: inherit;
	border-collapse: collapse
}

button, input, optgroup, select, textarea {
	font-family: inherit;
	font-size: 100%;
	line-height: inherit;
	color: inherit;
	margin: 0;
	padding: 0
}

button, select {
	text-transform: none
}

button, [type='button'], [type='reset'], [type='submit'] {
	-webkit-appearance: button;
	background-color: transparent;
	background-image: none
}

:-moz-focusring {
	outline: auto
}

:-moz-ui-invalid {
	box-shadow: none
}

progress {
	vertical-align: baseline
}

::-webkit-inner-spin-button, ::-webkit-outer-spin-button {
	height: auto
}

[type='search'] {
	-webkit-appearance: textfield;
	outline-offset: -2px
}

::-webkit-search-decoration {
	-webkit-appearance: none
}

::-webkit-file-upload-button {
	-webkit-appearance: button;
	font: inherit
}

summary {
	display: list-item
}

blockquote, dl, dd, h1, h2, h3, h4, h5, h6, hr, figure, p, pre {
	margin: 0
}

fieldset {
	margin: 0;
	padding: 0
}

legend {
	padding: 0
}

ol, ul, menu {
	list-style: none;
	margin: 0;
	padding: 0
}

textarea {
	resize: vertical
}

input::placeholder, textarea::placeholder {
	opacity: 1;
	color: theme('colors.gray.400', #9ca3af)
}

button, [role="button"] {
	cursor: pointer
}

:disabled {
	cursor: default
}

img, svg, video, canvas, audio, iframe, embed, object {
	display: block;
	vertical-align: middle
}

img, video {
	max-width: 100%;
	height: auto
}

[hidden] {
	display: none
}

* {
	font-family: 'Spoqa Han Sans Neo', 'Spoqa Han Sans JP', 'Sans-serif';
}

html {
	line-height: 1.15;
	-webkit-text-size-adjust: 100%;
	-ms-text-size-adjust: 100%;
	-ms-overflow-style: scrollbar;
	-webkit-tap-highlight-color: rgba(0, 0, 0, 0)
}

body {
	margin: 0;
	color: #212529;
	width: 100%;
	min-height: 100vh;
	min-height: -webkit-fill-abvailable;
	padding-right: 0;
	overflow: auto;
	-webkit-font-smoothing: antialiased;
	-moz-osx-font-smoothing: grayscale;
	line-height: 1.5715;
	font-size: 14px;
	-webkit-font-feature-settings: "tnum";
	font-feature-settings: "tnum";
	font-variant: tabular-nums
}

.overflow-hidden {
	overflow: hidden;
}

a {
	color: #212529;
	text-decoration: none;
	background-color: transparent;
	outline: none;
	cursor: pointer;
	transition: color .3s;
	-webkit-text-decoration-skip: objects
}

a:active {
	color: #096dd9
}

a:active, a:focus, a:hover {
	text-decoration: none;
	outline: 0
}

a[disabled] {
	color: rgba(0, 0, 0, .25);
	cursor: not-allowed;
	pointer-events: none
}

input {
	
}

.hidden_text {
	display: none;
}

.hidden_mobile {
	display: block;
}
*/
/* layout */
/*
#wrap {
	padding: 0 40px;
}

.wrap_center {
	max-width: 1141px;
	width: 100%;
	margin: 0 auto;
}

.flex_wrap {
	display: flex;
	flex-wrap: wrap;
}

#wrap_main {
	padding: 30px 0;
}

.adjust_lp16 {
	box-sizing: border-box;
	display: flex;
	flex-flow: wrap;
	margin-top: -16px;
	width: calc(100% + 16px);
	margin-left: -16px;
}

.grid_item {
	flex-basis: 25%;
	-webkit-box-flex: 0;
	flex-grow: 0;
	max-width: 25%;
	display: table;
}

.adjust_lp16 .grid_item {
	padding: 0 0 16px 16px;
}

.product-item img {
	max-width: 100%;
	border-radius: 3%;
}

@media screen and (max-width: 768px) {
	*/
	/* 화면 너비가 768px 이하인 경우에만 적용되는 스타일 */
	/*
	body {
		
	}
	#wrap {
		padding: 0 10px;
	}
	.wrap_center {
		width: 100% !important;
	}
	.box {
		width: 100% !important;
	}
	.grid_item {
		flex-basis: 50%;
		max-width: 50%;
	}
	.hidden_mobile {
		display: none;
	}
}*/
</style>
<script src="/resources/include/common/js/jquery-3.7.0.min.js"></script>
<script src="/resources/include/common/js/bootstrap/bootstrap.js"></script>
<script src="/resources/include/mainpage/js/slick.js"></script>
<script src="/resources/include/mainpage/js/slick.min.js"></script>
<script src="https://kit.fontawesome.com/312ff11b0d.js" crossorigin="anonymous"></script>
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
		
		$('.wrap_center').slick({
			dots : false,
			infinite : false,
			speed : 400,
			slidesToShow : 4,
			slidesToScroll : 4,
			responsive : [ {
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
			} ]
		});
		});
	
	

	
</script>

</head>
<body>
	
	<%@ include file="header.jsp" %> <!-- header.jsp 파일 포함 -->
	
	<!-- 사이트 소개 슬라이드 모음 시작 -->
	<div class="center">
		<div>
			<img src="resources/images/mainpage/mainslide1.jpg"
				class="mainslide" />
		</div>
		<div>
			<img src="resources/images/mainpage/mainslide2.jpg"
				class="mainslide" />
		</div>
		<div>
			<img src="resources/images/mainpage/mainslide3.jpg"
				class="mainslide" />
		</div>
		<div>
			<img src="resources/images/mainpage/mainslide4.jpg"
				class="mainslide" />
		</div>
		<div>
			<img src="resources/images/mainpage/mainslide5.jpg"
				class="mainslide" />
		</div>
		<div>
			<img src="resources/images/mainpage/mainslide6.jpg"
				class="mainslide" />
		</div>
		<div>
			<img src="resources/images/mainpage/mainslide7.png"
				class="mainslide" />
		</div>
		<div>
			<img src="resources/images/mainpage/mainslide8.jpg"
				class="mainslide" />
		</div>
		<div>
			<img src="resources/images/mainpage/mainslide9.jpg"
				class="mainslide" />
		</div>
	</div>
	<!-- 상품 소개 슬라이드 모음 시작 !-->
	
	<main class="wrap_center_main">
	 <div class="wrap_center">
		 <div class="wrap_center">
			<div class="slider">
				<c:forEach var="product" items="${products}">
					<div class="slider_div">
						<a href="/"> 
							<img src="/img/main/${product.product_main_image}" alt="" class="product-slide" />
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
                                ${product.review_num}
                            </c:when>
									<c:otherwise>
                                0
                            </c:otherwise>
								</c:choose>
							</div>
						</a>
					</div>
				</c:forEach>
			</div>
		</div>
	</main>
</body>
</html>

