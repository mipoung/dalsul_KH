<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script> 
<%@ include file="/WEB-INF/views/common/common.jsp"%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/resources/include/common/js/chkRegex.js"></script>
<script type="text/javascript">

var grandTotal = 0;
var grandTotalClone = 0;
var buyerAddrValue = "";

$(function() {
	    $.ajax({
	        url: "/mypage/leadBaseAddr",
	        method: "get",
	        data: { "user_no": "${userLogin.user_no}" }, 
	        dataType: "json",
	        success: function(response) {
	        	
	        	// response의 key값이 비어있다면 == 값을 전달받지 못했다면
	        	if(!response.keys("addr_no").length){
	        		$("#leadBaseAddr").css("visibility", "hidden");
	        	} else {
	        		//값을 제대로 전달받았다면
	        	}
	        	
	        	if (response != null) {
	                
	          	} else {
		          	// 버튼을 숨김
	          		
	            }
	        }       
	    });
	                    
	function requestPay() {
		console.log("function 시작");
		// 사용자가 API를 통해 값을 조회했는지 검사
        if (!chkData("#roadAddress", "주소를 먼저")) return;
        else if (!chkData("#detailAddress", "상세주소를")) return;
        else if (!chkData("#receiver", "받는사람(수취인)명을")) return;
        else if (!chkData("#jibunAddress", "지번주소를 재검색 후")) return;
        else if (!chkData("#name", "주소 별명을")) return;
        else if (!chkData("#postcode", "우편번호를")) return;
        // chkData = common.js에 정의된 입력값이 있는지 없는지 확인하는 메소드

        // 사용자가 입력할 수 있는 input 태그의 입력값들 중 이상한 입력값을 막기 위해 사용
        // chkInput = common.js에 정의된 한글, 영어, 번호, 쉼표, 띄어쓰기만 true를 반환하는 메소드
        else if (!chkInput("#detailAddress", "한글, 영어, 번호, 쉼표, 띄어쓰기만 입력 가능합니다.")) return;
        else if (!chkInput("#receiver", "한글, 영어, 번호, 쉼표, 띄어쓰기만 입력 가능합니다.")) return;
        else if (!chkInput("#name", "한글, 영어, 번호, 쉼표, 띄어쓰기만 입력 가능합니다.")) return;

        // 만약 값을 전달하기 전 값이 비었는지 최종적으로 확인
        if (
            $("#roadAddress").val() === "" ||
            $("#detailAddress").val() === "" ||
            $("#receiver").val() === "" ||
            $("#jibunAddress").val() === "" ||
            $("#detailAddress").val() === "" ||
            $("#receiver").val() === ""
        ) {
            alert("오류입니다.");
            // 값이 비었을 경우 return
            return;
        }
		
	  IMP.init('imp57485457'); //iamport 대신 자신의 "가맹점 식별코드"를 사용
	  IMP.request_pay({
	   pg: "html5_inicis",
	    pay_method: "card",
	    merchant_uid : 'merchant_'+new Date().getTime(),
	    name : '달술',
	    amount : grandTotalClone,
	    buyer_email : "${userInfo.user_email}",
	    buyer_name : "${userInfo.user_name}",
	    buyer_tel : "${userInfo.user_phone_num}",
	    buyer_addr : buyerAddrValue,
	    buyer_postcode : $("#postcode").val()
	  }, function (rsp) { // callback
	      if (rsp.success) {
	    	      console.log("결제가 성공했습니다.");
	    	      console.log(rsp); 
	    	      // 결제 성공 후 주문 데이터 전송
	    	     sendOrderData();
	    	     //window.location.href = "/order/success";
	    	    } else {
	    	      var msg = '결제에 실패하였습니다.';
                  msg += '에러내용 : ' + rsp.error_msg;
	    	      console.log("결제가 취소되었습니다.");
	      }
	  })
	};
	
	
	$(function(){
        $("#payBtn").click(function(){
        	//sendOrderData(); // 테스트(결제 생략)
        	requestPay();
        })
  });
	
	//클릭하여 기본배송지 리스트를 모달로 반환받을수 있는 기능 
        $("#leadBaseAddr").click(function() {
        	console.log(${userLogin.user_no})
        	 $.ajax({
                 url: "/mypage/leadBaseAddr", // 컨트롤러
                 method: "get",
                 data: {"user_no" : "${userLogin.user_no}"},
                 dataType: "text",
                 success: function(response) {
                     if (response !== null) {
                         alert("조회성공하였습니다");
                         console.log(response);
                     } else {
                         alert("시스템 오류, 잠시 후 다시 시도해 주세요.");
                     }
                 },
                 error: function(error) {
                     alert("로직오류, 관리자에게 문의하세요. 오류 확인");
                     console.error(error); // 오류를 콘솔에 출력
                 },
             });
        });
   
        
    // "주문하기" 버튼을 클릭할 때 함수 호출
    function sendOrderData() {
        console.log("sendOrderData 함수 실행");
        const deleveryAddr =
            $("#roadAddress").val() +
            $("#jibunAddress").val() +
            $("#detailAddress").val() +
            $("#extraAddress").val() +
            $("#postcode").val() +
            "수령인 :" +
            $("#receiver").val();

        // deleveryAddr 값을 postcodeValue에 할당
        var buyerAddrValue = deleveryAddr;

        let productNumbers = $(".product_no")
            .map(function() {
                return $(this).text();
            })
            .get();

        let productQuantity = $(".quantity")
            .map(function() {
                return parseInt($(this).text());
            })
            .get();

        let orderData = {
            order_delivery_info: deleveryAddr,
            order_total_price: parseInt($("#grandTotal").text().replace(",", "")),
            order_use_coupon: parseInt($("#coupon").val()),
            product_no: productNumbers,
            quantity: productQuantity,
        };
        console.log("성공?");
        console.log("orderData:", orderData);

        // AJAX를 사용하여 주문 정보와 결제 정보를 서버로 전송
        $.ajax({
            url: "/order/orderInsert", // 컨트롤러
            method: "POST",
            contentType: "application/json",
            data: JSON.stringify(orderData),
            dataType: "text",
            success: function(response) {
                if (response === "SUCCESS") {
                    alert("결제가 완료되었습니다");
                    window.location.href = "/order/success";
                } else {
                    alert("시스템 오류, 잠시 후 다시 시도해 주세요.");
                }
            },
            error: function(error) {
                alert("실패 실패");
                console.error(error); // 오류를 콘솔에 출력
            },
        });
    }
 


    // 페이지 로드가 완료되면 실행되는 함수
    window.onload = function() {

        // 모든 .cart-item 요소를 선택합니다.
        var cartItems = document.querySelectorAll(".cart-item");

        // 각 .cart-item 요소에 대한 반복문
        cartItems.forEach(function(cartItem) {
            // 상품 가격(product_price)과 수량(quantity)을 가져옵니다.
            var product_price = parseInt(cartItem.querySelector(".product_price").innerText);
            var quantity = parseInt(cartItem.querySelector(".quantity").innerText);

            // 총합(total)을 계산합니다.
            var total = product_price * quantity;

            // 총합을 천단위로 포맷팅하여 콤마(,)를 추가합니다.
            var formatTotal = total.toLocaleString();

	
            // .total 셀에 포맷팅된 총합을 출력합니다.
            cartItem.querySelector(".total").innerText = formatTotal;

            // 마지막 라인 총 합 계산
            grandTotal += total;
        });
        grandTotal = grandTotal + 3000; // 배송비 3천원 추가

        ///////////////////////////////

        // 마일리지 콤보박스 엘리먼트와 grandTotal 엘리먼트를 가져옵니다.
        var couponSelect = document.getElementById("coupon");

        // 콤보박스의 변경 이벤트에 대한 이벤트 리스너를 추가합니다.
        $("#coupon").on("click change", function() {
            grandTotalClone = grandTotal; // 총 값 복제

            // 선택한 마일리지 값을 가져옵니다.
            var selectedCoupon = parseInt(couponSelect.value);
	               //  grandTotalClone 값을 화면에 업데이트합니다.
	                 var grandTotalElement = document.getElementById("grandTotal");
	                 grandTotalElement.innerText = grandTotalClone.toLocaleString();
			

            // 선택한 마일리지에 따라 grandTotal 값을 조정합니다.
            if (selectedCoupon === 0) {
                grandTotalClone -= 0;
            } else if (selectedCoupon === 2000) {
                grandTotalClone -= 2000;
            } else if (selectedCoupon === 1000) {
                grandTotalClone -= 1000;
            }

            // grandTotalClone 값을 화면에 업데이트합니다.
            var grandTotalElement = document.getElementById("grandTotal");
            grandTotalElement.innerText = grandTotalClone.toLocaleString();

            // grandTotal 값을 계산한 후 5% 값을 계산합니다.
            var couponPercentage = 0.05; // 5%에 해당하는 비율

            // 5% 적립금을 계산합니다.
            var couponAmount = (grandTotalClone - 3000) * couponPercentage;

            // mileageMessage 요소를 가져옵니다.
            var couponMessageElement = document.getElementById("couponMessage");

            // mileageMessage에 5% 적립금을 표시합니다.
            //couponMessageElement.innerText = "결제 예정 적립금: " + couponAmount.toLocaleString() + "원";
        }); // mileageSelect.addEventListener
        $("#coupon").trigger("click");

        var grandTotalElement = document.getElementById("grandTotal");
        var formatGrandTotal = grandTotal.toLocaleString();
        grandTotalElement.innerText = formatGrandTotal;
        $("#couponMessage").text("결제 예정 적립금: " + ((grandTotal - 3000) * 0.05) + "원");

        // select 요소를 가져옵니다.
        var selectElement = document.getElementById("coupon");

        // select 요소의 변경 이벤트에 대한 이벤트 리스너를 추가합니다.
        selectElement.addEventListener("change", function() {
            // 선택한 옵션의 값을 가져옵니다.
            var selectedValue = selectElement.value;

            // 선택한 값을 어떻게 사용할지 여기에서 처리합니다.
            // 예를 들어, 선택한 값을 콘솔에 출력하거나 다른 곳에 표시할 수 있습니다.
            console.log("선택한 값: " + selectedValue);

            // 선택한 값을 원하는 위치에 표시하려면 해당 위치의 엘리먼트를 선택하고 innerText 또는 innerHTML을 사용하여 값을 설정합니다.
            var displayElement = document.getElementById("coupon_use");
            displayElement.innerText = "-" + selectedValue; // 선택한 값을 표시
        });


    };

});
</script>


<h1>주문 내역</h1>

<div class="mb-3">
	<label for="exampleFormControlInput1" class="form-label">주문회원 이름</label>
	 <input type="text" id="name" value="${userInfo.user_name}"/>
		 <label for="exampleFormControlInput1" class="form-label">핸드폰 번호</label>
		 <input type="text"  id="phone" value="${userInfo.user_phone_num}"><br/>
		 
	 <div class="mb-3">
	 <form action="process.jsp" method="post">
		<label for="pickupCheckbox" class="form-check-label">픽업</label>
		<input type="checkbox" class="form-check-input" id="pickupCheckbox" name="pickup" value="pickup">
	</form>
	</div>
		  
	<!-- <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="주소 입력">-->
	 <label for="exampleFormControlInput1" class="form-label">주소</label>
<form id="addrForm" name="addrForm">
	<%@ include file="/WEB-INF/views/addr/addressAPI.jsp" %>
   </form> 
</div>
		<input type="button" value="기본배송지 불러오기" name="leadBaseAddr" id="leadBaseAddr">
 <div class="address_sys_container" >		
 <!-- <input type="hidden" id="addrInfo" name="order_delevery_info" value=""/> -->
 
   </div><br/>	
		<!-- 주소입력 컨테이터 종료 -->	
		
	<!-- 쿠폰 사용 -->
<div class="mb-3">
    <label for="coupon" class="couponLabel">쿠폰</label>
    <select id="coupon" class="coupon">
        <option value="0"></option>
        <option value="1000">1,000원</option>
        <option value="2000">2,000원</option>
    </select>
</div>


<div class="mb-3">
	<label for="exampleFormControlTextarea1" class="form-label">결제 예정 상품</label>
	<div id="orderTableDiv">
		<table class="table">
			<thead>
				<tr>
					<th scope="col">상품 번호</th>
					<th scope="col">상품명</th>
					<th scope="col">가격</th>
					<th scope="col">수량</th>
					<th scope="col">총합</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${cartListDetail}" var="cartListDetail">
					<tr id="cartItem-${cartListDetail.product_no}" class="cart-item">
						<td class="product_no">${cartListDetail.product_no}</td>
						<td class="product_name">${cartListDetail.product_name}</td>
						<td class="product_price-quantity"><span class="product_price">${cartListDetail.product_price}</span></td>
						<td class="quantity">${cartListDetail.quantity}</td>
						<td class="total"></td>
					</tr>
				</c:forEach>
		
		<tr id="dlv_fee">
			<td colspan="4">배송비</td>
			<td colspan="1">3,000</td>	
		</tr>
		<tr id="coupon tr">
			<td colspan="4">쿠폰 사용</td>
			<td colspan="1" id="coupon_use"></td>
		</tr>
				
		<tr id="totalRow">
            <td colspan="4">총 합</td>
            <td colspan="1" id="grandTotal"></td>
        </tr>
			</tbody>
		</table>
		<form name="t_data" id="t_data">
   			<input type="hidden" name="order_total_price" value="" />
   			<input type="hidden" name="order_use_coupon" value="" />
   		</form>
		<!-- <span id="couponMessage"></span> -->
		
		<div id="totalDiv">
			<button id="payBtn">결제하기</button>
		</div>

	</div>
</div>
</body>
</html>
