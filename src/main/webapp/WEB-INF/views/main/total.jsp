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

/* 숨겨진 화면 표시 */
.hidecheckboxout {
	display: none;
	position: absolute;
	left: 50;
	top: 30;
	width: 20%;
	height: 25%;
	justify-content: center;
	align-items: center;
	display: none;
	background-color: #fff;
	border: 1px solid #ccc;
	border-radius: 5px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
	margin-top: 10px;
}

.hidecheckboxin {
	display: flex;
	flex-wrap: wrap; /* 요소들이 가로로 나열되면서 자동으로 줄 바꿈됨 */
	justify-content: space-between; /* 요소들을 가로로 고르게 배치 */
	align-items: center; /* 세로로 가운데 정렬 */
}

.checkboxwrapper {
	display: flex;
	flex-direction: row;
	justify-content: space-between;
	align-items: center;
	padding: 5px;
	border: 1px solid #ccc;
	border-radius: 5px;
	margin: 5px;
	width: calc(50% - 10px); /* 가로로 두 개씩 출력 */
}

.checkboxwrapper1 {
	display: flex; /* 내부 요소를 가로로 배치 */
	justify-content: space-between; /* 내부 요소를 가로로 고르게 배치 */
	align-items: center; /* 내부 요소를 세로로 가운데 정렬 */
}

.custom-checkbox {
	background-color: white;
	border: none;
}

.ucimg {
	width: 25px;
	height: 25px;
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
<script>

document.addEventListener("DOMContentLoaded", function() {
    // 페이지가 로드될 때 숨겨진 상태로 설정
    var checkboxOut = document.querySelector('.hidecheckboxout');
    checkboxOut.style.display = 'none';

    // 버튼 클릭 시 숨김 상태를 토글하고 배경색을 변경
    var filterButton = document.querySelector('.filter');
    var isFilterVisible = false;

    filterButton.addEventListener('click', function() {
        if (!isFilterVisible) {
            checkboxOut.style.display = 'block'; // 보이도록 변경
            filterButton.style.borderColor = 'rgb(81, 151, 242)'; // 테두리 색상을 파란색으로 변경
            filterButton.style.color = 'rgb(81, 151, 242)'; // 글자색을 파란색으로 변경
        } else {
            checkboxOut.style.display = 'none'; // 숨김 처리
            filterButton.style.backgroundColor = ''; // 배경색 제거
        }

        isFilterVisible = !isFilterVisible; // 상태를 토글
    });
});
$(function () {
	// 클릭 이벤트 핸들러 함수
	function handleCheckboxAndOptionTextClick(checkboxButton, optionText) {
	    // 이미지 요소 선택
	    var img = checkboxButton.querySelector('.ucimg');

	    // 이미지의 현재 src 값을 확인하여 이미지를 토글
	    var currentSrc = img.src;
	    if (currentSrc.includes("unchecked_square.png")) {
	        img.src = "/resources/images/mainpage/checked_square.png";
	    } else {
	        img.src = "/resources/images/mainpage/unchecked_square.png";
	    }
	}

	// .custom-checkbox 클래스를 가진 요소들 선택
	var checkboxElements = document.querySelectorAll('.custom-checkbox');

	// 선택된 모든 .custom-checkbox 요소에 대한 클릭 이벤트 핸들러 추가
	checkboxElements.forEach(function(checkboxButton) {
	    var optionText = checkboxButton.parentElement.querySelector('.option-text');
	    checkboxButton.addEventListener('click', function() {
	        handleCheckboxAndOptionTextClick(checkboxButton, optionText); // 공통 핸들러 함수 호출
	    });
	});

	// .option-text 클래스를 가진 요소들 선택
	var optionTextElements = document.querySelectorAll('.option-text');

	// 선택된 모든 .option-text 요소에 대한 클릭 이벤트 핸들러 추가
	optionTextElements.forEach(function(optionText) {
	    var checkboxButton = optionText.parentElement.querySelector('.custom-checkbox');
	    optionText.addEventListener('click', function() {
	        handleCheckboxAndOptionTextClick(checkboxButton, optionText); // 공통 핸들러 함수 호출
	    });
	});
});






</script>

</script>


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
									<span>주종 </span><img
										src="https://d38cxpfv0ljg7q.cloudfront.net/assets/arrow-down.png"
										width="20px" class="img" alt="arrow-down">
								</button>
								<div class="hidecheckboxout">
									<div class="hidecheckboxin">
										<div class="checkboxwrapper">
											<div class="checkboxwrapper1">
												<div class="checkboxwrapper2">
													<button type="button" class="custom-checkbox">
														<img src="/resources/images/mainpage/unchecked_square.png"
															class="ucimg">
													</button>
												</div>
												<button class="option-text">탁주</button>
											</div>
										</div>
										<div class="checkboxwrapper">
											<div class="checkboxwrapper1">
												<div class="checkboxwrapper2">
													<button type="button" class="custom-checkbox">
														<img src="/resources/images/mainpage/unchecked_square.png"
															class="ucimg">
													</button>
												</div>
												<button class="option-text">청주</button>
											</div>
										</div>
										<div class="checkboxwrapper">
											<div class="checkboxwrapper1">
												<div class="checkboxwrapper2">
													<button type="button" class="custom-checkbox">
														<img src="/resources/images/mainpage/unchecked_square.png"
															class="ucimg">
													</button>
												</div>
												<button class="option-text">과실주</button>
											</div>
										</div>
										<div class="checkboxwrapper">
											<div class="checkboxwrapper1">
												<div class="checkboxwrapper2">
													<button type="button" class="custom-checkbox">
														<img src="/resources/images/mainpage/unchecked_square.png"
															class="ucimg">
													</button>
												</div>
												<button class="option-text">증류주</button>
											</div>
										</div>
										<div class="checkboxwrapper">
											<div class="checkboxwrapper1">
												<div class="checkboxwrapper2">
													<button type="button" class="custom-checkbox">
														<img src="/resources/images/mainpage/unchecked_square.png"
															class="ucimg">
													</button>
												</div>
												<button class="option-text">기타소주</button>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="filter-container">
								<button class="filter">
									<span>도수 </span><img
										src="https://d38cxpfv0ljg7q.cloudfront.net/assets/arrow-down.png"
										width="20px" class="img" alt="arrow-down">
								</button>
							</div>
							<div class="filter-container">
								<button class="filter">
									<span>맛 </span><img
										src="https://d38cxpfv0ljg7q.cloudfront.net/assets/arrow-down.png"
										width="20px" class="img" alt="arrow-down">
								</button>
							</div>
							<div class="filter-container">
								<button class="filter">
									<span>원료 </span><img
										src="https://d38cxpfv0ljg7q.cloudfront.net/assets/arrow-down.png"
										width="20px" class="img" alt="arrow-down">
								</button>
							</div>
							<div class="filter-container">
								<button class="filter">
									<span>가격 </span><img
										src="https://d38cxpfv0ljg7q.cloudfront.net/assets/arrow-down.png"
										width="20px" class="img" alt="arrow-down">
								</button>
							</div>
						</div>
					</div>
				</div>
				<div class="content">
					<div class="selectbar2">
						<select class="select" id="outlined-age-native-simple" name="age">
							<option value="recommend">추천순</option>
							<option value="released_at">최신순</option>
							<option value="rating">평점순</option>
							<option value="star_count">리뷰 많은 순</option>
							<option value="selling_count">판매순</option>
							<option value="price_high">높은 가격순</option>
							<option value="price_low">낮은 가격순</option>
						</select>
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