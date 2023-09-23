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

button {
	cursor: pointer;
}

.filter1, .filter2, .filter3, .filter4, .filter5 {
	background-color: white;
	border: 2px solid rgb(242, 242, 242);
	border-radius: 5px;
	font-weight: bold;
	color: rgb(128, 128, 128);
	padding: 5px 10px; /* 버튼 내부 요소 주변의 간격 설정 */
	
	
}

.filter1 span, .filter2 span, .filter3 span, .filter4 span, .filter5 span {
	margin-right: 10px; /* <span> 태그 뒤의 간격 설정 */
}



.filter1 img, .filter2 img .filter3 span {
	margin-left: 10px; /* <img> 태그 앞의 간격 설정 */
}



/* 숨겨진 화면 표시 - 주종 ● 원료 */
.hidecheckboxout1, .hidecheckboxout4 {
	display: none;
	position: absolute;
	left: 50;
	top: 30;
	width: 20%;
	height: 20%;
	justify-content: center;
	align-items: center;
	background-color: #fff;
	border: 1px solid #ccc;
	border-radius: 5px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
	margin-top: 10px;
}

/* 숨겨진 화면 표시 - 도수 */
.hidecheckboxout2 {
	display: none;
	position: absolute;
	left: 50;
	top: 30;
	width: 20%;
	height: 14%;
	justify-content: center;
	align-items: center;
	background-color: #fff;
	border: 1px solid #ccc;
	border-radius: 5px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
	margin-top: 10px;
}

/* 숨겨진 화면 표시 - 맛 */
.hidecheckboxout3 {
	display: none;
	position: absolute;
	left: 50;
	top: 30;
	width: 20%;
	height: 7%;
	justify-content: center;
	align-items: center;
	background-color: #fff;
	border: 1px solid #ccc;
	border-radius: 5px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
	margin-top: 10px;
}

.hidecheckboxout5 {
	display: none;
	position: absolute;
	left: 50;
	top: 30;
	width: 20%;
	height: 20%;
	justify-content: center;
	align-items: center;
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

.hidecheckboxin2 {
	display: flex;
	flex-wrap: wrap; /* 요소들이 가로로 나열되면서 자동으로 줄 바꿈됨 */
	justify-content: space-between; /* 요소들을 가로로 고르게 배치 */
	align-items: center; /* 세로로 가운데 정렬 */
	width:420px;
}

.hidecheckboxout5 {
	width: 375px;
    height: 110px;
}

.checkboxwrapper {
	display: flex;
	flex-direction: row;
	justify-content: space-between;
	align-items: center;
	padding: 5px;
	border: none;
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

.option-text {
	background-color: white;
	border: none;
	font-weight: bold;
	color: rgb(128, 128, 128);
}

.option-text2 {
	background-color: white;
	border: none;
	font-weight: bold;
	color: rgb(128, 128, 128);
	
	text-align: left;
	width: 110px;
}

.selectbar2 {
	display: flex; /* Flexbox 레이아웃 사용 */
	flex-direction: row-reverse;
	align-items: center; /* 세로로 가운데 정렬 */
}

.selectbar2 select {
	margin-right: 10px;
	
	border: none;
}

.selectbar2 select:focus {
	background-color: rgb(242, 242, 242);
	outline : none;
}

.selectbar2 select:focus option {
  background-color: white; 
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
		// 초기 상태 설정
		var isFilterVisible = [ false, false, false, false, false ];

		// filter 버튼 클릭 이벤트 핸들러
		function toggleFilterVisibility(filterIndex) {
			return function() {
				for (var i = 0; i < isFilterVisible.length; i++) {
					if (i === filterIndex) {
						continue;
					}
					isFilterVisible[i] = false;
					var checkboxOut = document.querySelector('.hidecheckboxout'
							+ (i + 1));
					var filterButton = document.querySelector('.filter'
							+ (i + 1));
					checkboxOut.style.display = 'none';
					filterButton.style.borderColor = 'rgb(242, 242, 242)';
					filterButton.style.color = 'rgb(128, 128, 128)';
				}

				isFilterVisible[filterIndex] = !isFilterVisible[filterIndex];
				var checkboxOut = document.querySelector('.hidecheckboxout'
						+ (filterIndex + 1));
				var filterButton = document.querySelector('.filter'
						+ (filterIndex + 1));
				if (isFilterVisible[filterIndex]) {
					checkboxOut.style.display = 'block';
					filterButton.style.borderColor = 'rgb(81, 151, 242)';
					filterButton.style.color = 'rgb(81, 151, 242)';
				} else {
					checkboxOut.style.display = 'none';
					filterButton.style.borderColor = 'rgb(242, 242, 242)';
					filterButton.style.color = 'rgb(128, 128, 128)';
				}
			};
		}
		
		 // 공백 영역 클릭 이벤트 핸들러
	    /* function handleDocumentClick(event) {
	        if (!event.target.classList.contains('filter') && !event.target.classList.contains('hidecheckboxout')) {
	            for (var i = 0; i < isFilterVisible.length; i++) {
	                isFilterVisible[i] = false;
	                var checkboxOut = document.querySelector('.hidecheckboxout' + (i + 1));
	                var filterButton = document.querySelector('.filter' + (i + 1));
	                checkboxOut.style.display = 'none';
	                filterButton.style.borderColor = 'rgb(242, 242, 242)';
	                filterButton.style.color = 'rgb(128, 128, 128)';
	            }
	        }
	    } */

		// 각 filter 버튼에 이벤트 핸들러 추가
		for (var i = 0; i < isFilterVisible.length; i++) {
			var filterButton = document.querySelector('.filter' + (i + 1));
			filterButton.addEventListener('click', toggleFilterVisibility(i));			
		}	
	});

	if(location.search==""){
		
	}
	
	$(function() {
		$("#select").val("${selectedValue}");
		
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
			var optionText = checkboxButton.parentElement
					.querySelector('.option-text');
			checkboxButton.addEventListener('click', function() {
				handleCheckboxAndOptionTextClick(checkboxButton, optionText); // 공통 핸들러 함수 호출
			});
		});

		// .option-text 클래스를 가진 요소들 선택
		var optionTextElements = document.querySelectorAll('.option-text');

		// 선택된 모든 .option-text 요소에 대한 클릭 이벤트 핸들러 추가
		optionTextElements.forEach(function(optionText) {
			var checkboxButton = optionText.parentElement
					.querySelector('.custom-checkbox');
			optionText.addEventListener('click', function() {
				handleCheckboxAndOptionTextClick(checkboxButton, optionText); // 공통 핸들러 함수 호출
			});
		});
		
		$("#hidecheckboxin").click(function() {
			window.location.replace("/total?selectedValue=" + $("#hidecheckboxin").val());
		})
		 $("#select").on("change", function() {
			 window.location.replace("/total?selectedValue="+$("#select").val());
		 });
		 
		// 클릭 이벤트를 처리하는 함수
		function updateURL(type) {
		  // 현재 URL을 가져옵니다.
		  var currentURL = window.location.href;
		  
		  // URL에 이미 매개변수가 있는지 확인합니다.
		  var queryString = window.location.search;

		  // 이미 매개변수가 있는 경우
		  if (queryString) {
		    // 매개변수를 파싱합니다.
		    var params = new URLSearchParams(queryString);

		    // type 매개변수를 업데이트합니다.
		    params.set('type', type);

		    // URL을 업데이트합니다.
		    var newURL = currentURL.replace(queryString, '?' + params.toString());

		    // 새 URL로 이동합니다.
		    window.location.replace = newURL;
		  } else {
		    // 매개변수가 없는 경우 새로운 매개변수를 추가합니다.
		    var newURL = currentURL + '?type=' + type;

		    // 새 URL로 이동합니다.
		    window.location.replace = newURL;
		  }
		}

		 
		/* selecting */
		/*
		  $(document).ready(function () {
		        // select 요소 변경 이벤트 감지
		        $('#select').on('change', function () {
		            var selectedValue = $(this).val();
		            
		            // 선택한 값을 Ajax 요청으로 서버에 보내기
		            $.ajax({
		                type: 'GET',
		                url: '/selecting',
		                data: { selectedValue: selectedValue },
		                success: function (data) {
		                   console.log("성공")
		                },
		                error: function (error) {
		                    console.error('Ajax 요청 실패:', error);
		                }
		            });
		        });
		    }); */
	
		 /* // 클릭된 요소의 데이터 속성을 가져오기 */
		 /*     var selectedValue = $(this).val();
			console.log("씨발");
		    // 가져온 ratingValue를 서버로 전송
		    $.ajax({
		        url: "/total", 
		        method: "GET", // GET 요청
		        data: { selectedValue: selectedValue }, // 요청 데이터 전송
		        success: function(response) {
		            // 서버 응답을 처리하는 코드
		          //  console.log("새로운 쿼리 실행 및 응답 처리", response);
		        	location.href="/total/"
		        },
		        error: function(error) {
		            // 오류 처리 코드
		            console.error("요청 중 오류 발생", error);
		        }
		    }); */
				
		/*
		$("#select").on("change", function() {
		    // 선택된 값을 가져오기
		    var selectedValue = $(this).val();

		    // 선택한 값에 따라 리다이렉션 처리
		    if (selectedValue === "rating") {
		        window.location.href = "/total?orderBy=rating";
		    } else if (selectedValue === "star_count") {
		        window.location.href = "/total?orderBy=star_count";
		    } else if (selectedValue === "price_high") {
		        window.location.href = "/total?orderBy=price_high";
		    } else if (selectedValue === "price_low") {
		        window.location.href = "/total?orderBy=price_low";
		    } else {
		    	window.location.href= "/total"; 
		    }
		    
		    $.ajax({
		        url: "/total", 
		        method: "GET", // GET 요청
		        data: { selectedValue: selectedValue }, // 요청 데이터 전송
		        success: function(response) {
		            // 서버 응답을 처리하는 코드
		            console.log("새로운 쿼리 실행 및 응답 처리", response);		      
		        },
		        error: function(error) {
		            // 오류 처리 코드
		            console.error("요청 중 오류 발생", error);
		        }
		    });	    
		});
		*/

		    
	});
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
								<button class="filter1" value="type">
									<span>주종 </span><img
										src="https://d38cxpfv0ljg7q.cloudfront.net/assets/arrow-down.png"
										width="20px" class="img" alt="arrow-down">
								</button>
								<div class="hidecheckboxout1">
									<div class="hidecheckboxin">
										<div class="checkboxwrapper">
											<div class="checkboxwrapper1">
												<div class="checkboxwrapper2">
													<button type="button" class="custom-checkbox" value="takju"  onclick="updateURL('takju')">
														<img src="/resources/images/mainpage/unchecked_square.png"
															class="ucimg">
													</button>
												</div>
												<button class="option-text" value="takju"  onclick="updateURL('takju')">탁주</button>
											</div>
										</div>
										<div class="checkboxwrapper">
											<div class="checkboxwrapper1">
												<div class="checkboxwrapper2">
													<button type="button" class="custom-checkbox" value="chungju">
														<img src="/resources/images/mainpage/unchecked_square.png"
															class="ucimg">
													</button>
												</div>
												<button class="option-text" value="chungju">청주</button>
											</div>
										</div>
										<div class="checkboxwrapper">
											<div class="checkboxwrapper1">
												<div class="checkboxwrapper2">
													<button type="button" class="custom-checkbox" value="wine">
														<img src="/resources/images/mainpage/unchecked_square.png"
															class="ucimg">
													</button>
												</div>
												<button class="option-text" value="wine">과실주</button>
											</div>
										</div>
										<div class="checkboxwrapper">
											<div class="checkboxwrapper1">
												<div class="checkboxwrapper2">
													<button type="button" class="custom-checkbox" value="soju">
														<img src="/resources/images/mainpage/unchecked_square.png"
															class="ucimg">
													</button>
												</div>
												<button class="option-text" value="soju">증류주</button>
											</div>
										</div>
										<div class="checkboxwrapper">
											<div class="checkboxwrapper1">
												<div class="checkboxwrapper2">
													<button type="button" class="custom-checkbox" value="other">
														<img src="/resources/images/mainpage/unchecked_square.png"
															class="ucimg">
													</button>
												</div>
												<button class="option-text" value="other">기타주류</button>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="filter-container">
								<button class="filter2">
									<span>도수 </span><img
										src="https://d38cxpfv0ljg7q.cloudfront.net/assets/arrow-down.png"
										width="20px" class="img" alt="arrow-down">
								</button>
								<div class="hidecheckboxout2">
									<div class="hidecheckboxin">
										<div class="checkboxwrapper">
											<div class="checkboxwrapper1">
												<div class="checkboxwrapper2">
													<button type="button" class="custom-checkbox">
														<img src="/resources/images/mainpage/unchecked_square.png"
															class="ucimg">
													</button>
												</div>
												<button class="option-text">0%-10%</button>
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
												<button class="option-text">10%-20%</button>
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
												<button class="option-text">20%-30%</button>
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
												<button class="option-text">30% 이상</button>
											</div>
										</div>
									</div>
								</div>
							</div>

							<div class="filter-container">
								<button class="filter3">
									<span>맛 </span><img
										src="https://d38cxpfv0ljg7q.cloudfront.net/assets/arrow-down.png"
										width="20px" class="img" alt="arrow-down">
								</button>

								<div class="hidecheckboxout3">
									<div class="hidecheckboxin">
										<div class="checkboxwrapper">
											<div class="checkboxwrapper1">
												<div class="checkboxwrapper2">
													<button type="button" class="custom-checkbox">
														<img src="/resources/images/mainpage/unchecked_square.png"
															class="ucimg">
													</button>
												</div>
												<button class="option-text">단맛</button>
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
												<button class="option-text">신맛</button>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="filter-container">
								<button class="filter4">
									<span>원료 </span><img
										src="https://d38cxpfv0ljg7q.cloudfront.net/assets/arrow-down.png"
										width="20px" class="img" alt="arrow-down">
								</button>
								<div class="hidecheckboxout4">
									<div class="hidecheckboxin">
										<div class="checkboxwrapper">
											<div class="checkboxwrapper1">
												<div class="checkboxwrapper2">
													<button type="button" class="custom-checkbox">
														<img src="/resources/images/mainpage/unchecked_square.png"
															class="ucimg">
													</button>
												</div>
												<button class="option-text">과일</button>
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
												<button class="option-text">꽃</button>
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
												<button class="option-text">곡물</button>
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
												<button class="option-text">약재</button>
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
												<button class="option-text">기타</button>
											</div>
										</div>
									</div>
								</div>
								
							</div>
							<div class="filter-container">
								<button class="filter5">
									<span>가격 </span><img
										src="https://d38cxpfv0ljg7q.cloudfront.net/assets/arrow-down.png"
										width="20px" class="img" alt="arrow-down">
								</button>
								<div class="hidecheckboxout5">
									<div class="hidecheckboxin2">
										<div class="checkboxwrapper">
											<div class="checkboxwrapper1">
												<div class="checkboxwrapper2">
													<button type="button" class="custom-checkbox">
														<img src="/resources/images/mainpage/unchecked_square.png"
															class="ucimg">
													</button>
												</div>
												<button class="option-text">~1만원</button>
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
												<button class="option-text2">1만원~2만원</button>
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
												<button class="option-text2">2만원~3만원</button>
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
												<button class="option-text">3만원이상</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="content">
					<div class="selectbar2">
						<select class="select" id="select" name="age">
							<option value="">------</option>
							<option value="rating">평점순</option>
							<option value="star_count">리뷰 많은 순</option>
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