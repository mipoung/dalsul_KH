<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>

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
		$(".product_price").each(function() {
			console.log("product_price each");
			let product_price = parseInt($(this).text().replace(/,/g, ''));
			$(this).text(numberWithCommas(product_price));
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
		let product_price = parseInt(item.find(".product_price").text().replace(/,/g, ''));
		let quantity = parseInt(item.find(".quantity").text());
		let total = product_price * quantity;
		item.find(".total").text(total); // 총합
	}
	
	// 쉼표로 숫자 포맷팅하는 함수
	function numberWithCommas(number) {
		console.log("numberWithCommas");
		return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
	// 실제 삭제 동작 함수
	function deleteConfirm(product_no) {
		console.log("deleteConfirm function");
	    if (deleteCheck === 1) {
	        $.ajax({
	            url: "/cart/cartDelete", // 삭제 요청을 보낼 URL
	            type: "GET",
	            data: {
	                "product_no": product_no
	            },
	            dataType: "text",
	            error: function() {
	                alert("시스템 오류입니다. 관리자에게 문의하세요.");
	            },
	            success: function(data) {
	                // 예를 선택한 경우, 해당 상품 행을 삭제
	                $("#cartItem-" + product_no).remove();
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
			 window.location.href = "/cart/cartListDetail";
			// 선택된 체크박스의 정보를 가져오기
			<%--
		    const selectedItems = [];
		    $(".product-checkbox:checked").each(function() {
		        const product_no = $(this).data("product-id");
		        selectedItems.push(product_no);
		    });

		    // 선택된 항목이 없을 경우 경고 메시지 표시
		    if (selectedItems.length === 0) {
		        alert("결제할 상품을 선택해주세요.");
		        return;
		    }
			--%>
		    // 선택된 상품 번호 목록을 결제 페이지로 전달
		    const queryParams = selectedItems.join(",");
		    window.location.href = "/cart/cartListDetail?selectedItems=" + queryParams;
			
			
		});
		
		// 삭제 버튼을 클릭했을 때
		$(".deleteBtn").click(function() {
			console.log("deleteBtn click");
		    // 확인 창을 띄우고 사용자의 선택을 저장
		    if (confirm("정말 삭제하시겠습니까?")) {
		        deleteCheck = 1; // 예를 선택한 경우
		        const product_no = $(this).data("product-id");
		        deleteConfirm(product_no);
		    } else {
		        deleteCheck = 0; // 아니요를 선택한 경우
		    }
		});
		
		//장바구니 수량 추가(+)
		$(".plusBtn").click(
				function() {
					console.log("plusBtn click");
					const product_no = $(this).attr("data-product-id");
					let product_quantity = parseInt(($(this).closest("tr")
							.find(".quantity").text()).replace(/,/g, ''));
					//console.log(product_no + product_quantity);
					$.ajax({
						"url" : "/cart/cartPlus",
						"method" : "get",
						"data" : {
							"product_no" : product_no
						},
						"dataType" : "text",
						success : function(data) {
							console.log(data);
							if (data == 1) {
								$("#cartItem-" + product_no + " > .quantity")
										.text(product_quantity + 1);
								updateTotal($("#cartItem-" + product_no)); // 총합 업데이트
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
               const product_no = $(this).attr("data-product-id");
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
                     "product_no" : product_no
                  },
                  "dataType" : "text",
                  success : function(data) {
                     if (data == 1) {
                        $("#cartItem-" + product_no + " > .quantity")
                              .text(product_quantity - 1);
                        updateTotal($("#cartItem-" + product_no)); // 총합 업데이트
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
					<th scope="col">상품번호</th>
					<th scope="col">상품명</th>
					<th scope="col">가격</th>
					<th scope="col">수량</th>
					<th scope="col">총합</th>
					<th scope="col">삭제</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${cartList}" var="cartList">
					<tr id="cartItem-${cartList.product_no}" class="cart-item">
						<!--  <td class="product_no" >${cartList.product_no}</td>-->
						<td class="product_no">
       				       <input type="checkbox" class="product-checkbox" data-product-id="${cartList.product_no}">
						<td class="product_name" >${cartList.product_name}</td>
						<td class="product_price-quantity">
							<button type="button" class="btn btn-primary btn-sm minusBtn" data-product-id="${cartList.product_no}">-</button> 
							<span class="product_price">${cartList.product_price}</span>
							<button type="button" class="btn btn-primary btn-sm plusBtn" data-product-id="${cartList.product_no}">+</button>
						</td>
						<td class="quantity">${cartList.quantity}</td>
						<td class="total"></td>
						<td>
							<button type="button" class="btn btn-danger btn-sm deleteBtn"
								data-product-id="${cartList.product_no}">x</button>
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