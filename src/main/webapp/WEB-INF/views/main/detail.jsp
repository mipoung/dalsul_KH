<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="shortcut icon" href="/resources/images/icon.png" />
<link rel="apple-touch-icon" href="/resources/images/icon.png" />

<link rel="stylesheet" type="text/css"
	href="/resources/include/common/css/bootstrap/bootstrap.css" />
<link rel="stylesheet" type="text/css"
	href="/resources/include/mainpage/css/header.css" />
<link rel="stylesheet" type="text/css"
	href="/resources/include/mainpage/css/footer.css" />
	
<style>

	.pagewrapper {
    margin-top: 60px; /* 페이지 전체에 margin-top 적용 */
	}
	
	.contentwrapperin {
    display: flex;
    justify-content: space-between; /* 좌우 여백을 추가하는 속성 */
    margin: 0 250px; 
    
	}
	
	.left-side {
    flex: 1; /* 왼쪽 요소가 남은 공간을 모두 차지하도록 설정 */
    margin-right: 20px; /* 좌우 여백 설정 (원하는 크기로 조절) */
    
    float: left;
   
	}


	
	#image {
    	float: left; /* 왼쪽으로 배치 */
    	width: 320px; 
	}
	
	.detail-box-image {
		width: 200px;	
	}
	
	.product-image1 {
		width: 320px;
	}
	
	#info {
    float: left; 
    width: 50%; /* 너비를 50%로 설정하여 반씩 차지하도록 */
    height: 450px;
	}

	.detail-box-info {	
		height: 450px;
		
		margin-top: 60px;
		margin-left: 50px;
	}
	
	.sector-first {
    	margin-top: -50px; /* margin-top을 0으로 설정하여 취소합니다. */
    	margin-left: -30px; /* margin-left를 0으로 설정하여 취소합니다. */
	}
	
	.sector-second {
		margin-top: 35px;		
		margin-left: -25px;
	}
	
	.sector-third {
		margin-top: 45px;
    	margin-left: -25px;
	}
	
	.sector-forth {
		margin-top: 135px;
    	margin-left: -25px;
    	font-size: 35px;
	}
	
	.detailproductinfo2 {
  		/* 다른 스타일 속성들 */
 		 width: 100%; /* .detailproductinfo1의 50% 크기로 설정 */
	}

	.detail-box-image2 img.product-image2 {
 		 width: 100%; /* 이미지의 크기를 100%로 설정하여 부모 요소에 맞게 크기 조절 */
	}
	.deliveryinfo img {
 		 max-width: 70%; /* 이미지의 최대 너비를 부모 요소에 맞춰 설정 */
 		 height: auto; /* 이미지의 높이 자동 조절 */
 		 
 		 margin-left: 150px;
 		 
	}
	
	.right-side {
		float: right;
    	width: 30%; /* 우측 요소의 너비를 설정 */ 
    	 
	}
	
	.detailslidebar {
		position: sticky;
    	top: 150px;   
    	
    	border: 1px solid #ccc; /* 테두리 색깔 및 두께 설정 */
    	border-radius: 10px; /* 테두리 둥글게 설정 */
    	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2); /* 그림자 설정 */
    	padding: 10px; /* 내용과 테두리 사이 여백 설정 */
	}
	
	input[type="number"]::-webkit-outer-spin-button,
	input[type="number"]::-webkit-inner-spin-button {
    	-webkit-appearance: none;
   	 margin: 0;
	}
	
</style>

	
<script src="/resources/include/common/js/jquery-3.7.0.min.js"></script>
<script src="/resources/include/common/js/bootstrap/bootstrap.js"></script>
<script src="/resources/include/mainpage/js/header.js"></script>
<script>
$(function() {
	
	// detail.product_type 값을 가져옴
    var productType = "${detail.product_type}";

    // 원하는 조건에 따라 값을 변경
    if (productType === "takju") {
        productType = "탁주";
    } else if (productType === "chungju") {
        productType = "약.청주";
        // 추가 조건에 따른 값 변경
    } else if (productType === "wine") {
    	productType = "과실주";
    } else if (productType === "soju") {
    	productType = "증류주";
    } else {
    	productType = "기타주류";
    }

    // 변경된 값을 화면에 출력
    $(".product-type").text(productType);
	
	
    // 초기 수량과 가격 설정
    var quantity = 1;
    var unitPrice = ${detail.product_price}; // 제품의 개당 가격 (원)

    // 초기 수량과 총 상품 가격 표시
    updateQuantityAndTotal();

    // "-" 버튼 클릭 시 수량 감소
    $("#decrementQuantity").click(function() {
        if (quantity > 1) {
            quantity--;
            updateQuantityAndTotal();
        }
    });

    // "+" 버튼 클릭 시 수량 증가
    $("#incrementQuantity").click(function() {
        quantity++;
        updateQuantityAndTotal();
    });

    // 수량과 총 상품 가격 업데이트 함수
    function updateQuantityAndTotal() {
        $("#quantity").val(quantity); // 수량 업데이트
        var totalPrice = quantity * unitPrice; // 총 상품 가격 계산
        $(".totalpricein").text(totalPrice + "원"); // 총 상품 가격 표시
    }
    
    // 장바구니 버튼 클릭 시 이벤트 핸들러
    $(".basket").click(function() {
        // 여기서 로그인 체크를 수행합니다.
        var isLoggedIn = checkLogin(); // 로그인 상태 확인 함수 (서버와의 통신이 필요)

        if (isLoggedIn) {
            // 로그인 상태인 경우 제품 정보 가져오기
            var productName = $(".product-name").text();
            var quantity = parseInt($("#quantity").val());
            var totalAmount = parseInt($(".totalpricein").text());

         // 데이터를 객체로 생성
            var data = {
                productName: productName,
                quantity: quantity,
                totalAmount: totalAmount
            };

            // POST 요청으로 데이터 서버에 전송
            $.ajax({
                url: "/api/add-to-cart", // 서버 엔드포인트 URL
                type: "POST",
                data: JSON.stringify(data),
                contentType: "application/json",
                success: function(response) {
                    // 성공적으로 처리된 경우
                    alert("장바구니에 추가되었습니다.");
                },
                error: function(error) {
                    // 오류 발생 시
                    alert("오류가 발생했습니다. 잠시 후 다시 시도해주세요.");
                }
            });
        } else {
            // 로그인 상태가 아닌 경우 로그인 페이지로 이동
            alert("로그인이 필요합니다. 로그인 페이지로 이동합니다.");
            window.location.href = "/login"; // 로그인 페이지 URL로 이동
        }
    });

    // 로그인 상태 확인 함수 (서버와의 통신 필요)
    function checkLogin() {
        // 여기에서 서버와의 통신을 통해 로그인 상태를 확인합니다.
        // 예를 들어, 서버 API를 호출하여 로그인 상태를 확인할 수 있습니다.
        // 실제로는 서버와의 통신 로직을 추가해야 합니다.
        // 이 함수는 로그인 상태가 true 또는 false를 반환해야 합니다.
        // 여기에서는 단순히 true를 반환하는 것으로 가정합니다.
        return true;
    }
    
});
</script>




</head>
<body>
	<div class="pagewrapper">
		<%@ include file="header.jsp"%>
		<div class="contentwrapper">
			<div class="contentwrapperin">
				<div class="left-side">
					<div class="detailproductinfo">
						<div class="detail-box" id="image">
							<div class="detail-box-image">
								<img src="resources/images/mainpage/product/${detail.product_main_image}" class="product-image1" />
							</div>							
						</div>
						<div class="detail-box" id="info">
							<div class="detail-box-info">
								<div class="sector-first">
									<div class="product-name">
										${detail.product_name}
									</div>
								</div>
								<div class="sector-second">
									<div class="product-review">
										별점 : ${detail.review_rating}[리뷰수:${detail.review_num}개]
									</div>
								</div>
								<div class="sector-third">
									<div class="flex">
										<label>주종: <span class="product-type"></span></label>			
									</div>
									<div class="flex">
										<label>도수: <span class="product-alcohol">${detail.product_alcohol}%</span></label>
									</div>
									<div class="flex">
										<label>용량: <span class="product-ml">${detail.product_ml}ml</span></label>										
									</div>
								</div>
								<div class="sector-forth">
									<div class=product-price>판매가격: ${detail.product_price}원</div>
								</div>
							</div>
						</div>
					</div>
					<div class="detailproductinfo2">
						<div class="detail-box-image2">
								<img src="resources/images/mainpage/product/${detail.product_explain_image}" class="product-image2" />
						</div>	
						<div class="deliveryinfo">
							<img src="resources/images/mainpage/product/deliveryinfo.jpg" />
						</div>
					</div>
					<div class="detailproductinfo3">
						<div id="relationproductrecommend">			
						</div>						
					</div>
					<div class="detailproductinfo4">
						<div id="productreview"></div>
					</div>
				</div>
				<div class="right-side">
					<div class="detailslidebar">
						<div class="label">
							<label>옵션</label>
						</div>
						<div class="optionselectwrapper">
							<div class="optionselect">
								<select class="optionselectin">
									<option value="option1" disabled>어떤 옵션을 원하시나요?</option>
									<option value="option2"selected>${detail.product_name}</option>									
								</select>
							</div>
						</div>
						<div class="label">
							<label>수량</label>
						</div>
						<div class="countselectwrapper">
							<div class="countselect">
								<input type="button" value="-" id="decrementQuantity"/>
								<input type="number" maxlength="3" value="1" id="quantity" />
								<input type="button" value="+" id="incrementQuantity" />
							</div>
						</div>
						<div class="label">
							<label>총 상품가격</label>
						</div>
						<div class="totalprice">
							<span class="totalpricein"></span>
						</div>
						<div class="btn-wrpper">
							<button class="basket">장바구니</button>
							<button class="purchase">구매하기</button>
						</div>
					</div>
				</div>
			</div>	
		</div>
		<%@ include file="footer.jsp"%>
	</div>
</body>
</html>