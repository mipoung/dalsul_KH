<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>

<script>
	//페이지 로드 시 상단 수량 총합을 계산하여 표시하는 함수
	function updateTotalForAllItems() {
		console.log("updateTotalForAllItems 2번");
		let totalSum = 0; // 모든 상품의 총합을 저장할 변수
	
		// 상단 총합 계산
		$(".cart-item").each(function() {
			updateTotal($(this));
			console.log("car-item each function");
		});
		
		// 모든 상품의 총합 계산
		$(".cart-item").each(
		function() {
			let total = parseInt($(this).find(".total").text().replace(/,/g, ''));
			totalSum += total;
		});
	
		// 총합을 <p> 태그 안에 넣기 (쉼표로 포맷팅) 하단총합 콤마
		$("#list > h1").text("총 합 " + numberWithCommas(totalSum) + "원");
	
		// 가격과 총합을 쉼표(,)로 표시 (가격 총합 콤마)
		$(".price").each(function() {
			console.log("price each");
			let price = parseInt($(this).text().replace(/,/g, ''));
			$(this).text(numberWithCommas(price));
		});
		
		// 상단 총합 콤마
		$(".total").each(function() {
			console.log("total each");
			let total = parseInt($(this).text().replace(/,/g, ''));
			$(this).text(numberWithCommas(total));
		});
	}
	
	// 총 합 계산
	function updateTotal(item) {
		console.log("updateTotal");
		let price = parseInt(item.find(".price").text().replace(/,/g, ''));
		let quantity = parseInt(item.find(".quantity").text());
		let total = price * quantity;
		item.find(".total").text(total); // 총합
	}
	
	// 쉼표로 숫자 포맷팅하는 함수
	function numberWithCommas(number) {
		console.log("numberWithCommas");
		return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
	// 실제 삭제 동작 함수
	function deleteConfirm(product_id) {
		console.log("deleteConfirm function");
	    if (deleteCheck === 1) {
	        $.ajax({
	            url: "/cart/cartDelete", // 삭제 요청을 보낼 URL
	            type: "GET",
	            data: {
	                "product_id": product_id
	            },
	            dataType: "text",
	            error: function() {
	                alert("시스템 오류입니다. 관리자에게 문의하세요.");
	            },
	            success: function(data) {
	                // 예를 선택한 경우, 해당 상품 행을 삭제
	                $("#cartItem-" + product_id).remove();
	                // 삭제 후 총 합을 다시 계산 및 업데이트
	                updateTotalForAllItems();
	            }
	        });
	    } else {
	        // 아니요를 선택한 경우 아무런 동작 없음
	    }
	}
	
	$(function() {
		// 페이지 로드 시 상단 총합을 계산한 뒤 updateTotalForAllItems() 메소드를 실행한다 
		
		// 페이지 로드 시 총합을 업데이트
		updateTotalForAllItems();
		
		
		
		$("#payBtn").click(function() {
			 window.location.href = "/cart/orderList";
		});
		
		// 삭제 버튼을 클릭했을 때
		$(".deleteBtn").click(function() {
			console.log("deleteBtn click");
		    // 확인 창을 띄우고 사용자의 선택을 저장
		    if (confirm("정말 삭제하시겠습니까?")) {
		        deleteCheck = 1; // 예를 선택한 경우
		        const product_id = $(this).data("product-id");
		        deleteConfirm(product_id);
		    } else {
		        deleteCheck = 0; // 아니요를 선택한 경우
		    }
		});
		
		//장바구니 수량 추가(+)
		$(".plusBtn").click(
				function() {
					console.log("plusBtn click");
					const product_id = $(this).attr("data-product-id");
					let product_quantity = parseInt(($(this).closest("tr")
							.find(".quantity").text()).replace(/,/g, ''));
					//console.log(product_id + product_quantity);
					$.ajax({
						"url" : "/cart/cartPlus",
						"method" : "get",
						"data" : {
							"product_id" : product_id
						},
						"dataType" : "text",
						success : function(data) {
							if (data == 1) {
								$("#cartItem-" + product_id + " > .quantity")
										.text(product_quantity + 1);
								updateTotal($("#cartItem-" + product_id)); // 총합 업데이트
								updateTotalForAllItems();
							} else {
								alert("111시스템 오류입니다. 잠시 후 다시 시도해주세요.");
							}
						},
						error : function() {
							alert("시스템 오류입니다. 잠시 후 다시 시도해주세요.");
						}
					});
		}); //end of plusBtn

		//장바구니 수량 감소(-)
		$(".minusBtn").click(
				function() {
					console.log("minusBtn");
					const product_id = $(this).attr("data-product-id");
					let product_quantity = parseInt(($(this).closest("tr")
							.find(".quantity").text()).replace(/,/g, ''));

					// 만약 수량이 1 이하이면 알림창 띄우기
					if (product_quantity <= 1) {
						alert("수량이 1개 이상이여야 합니다.");
						return; // 함수 종료
					}

					$.ajax({
						"url" : "/cart/cartMinus",
						"method" : "get",
						"data" : {
							"product_id" : product_id
						},
						"dataType" : "text",
						success : function(data) {
							if (data == 1) {
								$("#cartItem-" + product_id + " > .quantity")
										.text(product_quantity - 1);
								updateTotal($("#cartItem-" + product_id)); // 총합 업데이트
								updateTotalForAllItems();
							} else {
								alert("111시스템 오류입니다. 잠시 후 다시 시도해주세요.");
							}
						},
						error : function() {
							alert("시스템 오류입니다. 잠시 후 다시 시도해주세요.");
						}
					});
		}); //end of minus click
		
	});
	
</script>
</head>
<body>
	<h1>장바구니</h1>
	<div class="border border-success p-2 mb-2 whole-table">
		<table class="table table-bordered">
			<thead>
				<tr>
					<th scope="col">상품 ID</th>
					<th scope="col">가격</th>
					<th scope="col">수량</th>
					<th scope="col">총합</th>
					<th scope="col">동작</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${cartList}" var="cartList">
					<tr id="cartItem-${cartList.product_id}" class="cart-item">
						<td class="product_id" >${cartList.product_id}</td>
						<td class="price-quantity">
							<button type="button" class="btn btn-primary btn-sm minusBtn" data-product-id="${cartList.product_id}">-</button> 
							<span class="price">${cartList.price}</span>
							<button type="button" class="btn btn-primary btn-sm plusBtn" data-product-id="${cartList.product_id}">+</button>
						</td>
						<td class="quantity">${cartList.quantity}</td>
						<td class="total"></td>
						<td>
							<button type="button" class="btn btn-danger btn-sm deleteBtn"
								data-product-id="${cartList.product_id}">x</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<form id="cartForm" class="cartForm">
	<input type="hidden" name="orderData" id="orderData"/>
		<div id="list">
			<h1 id="totalSum"></h1>
			<div id="btn">
				<button type="button" id="payBtn">결제하기</button>
			</div>
		</div>
	</form>

</body>
</html>