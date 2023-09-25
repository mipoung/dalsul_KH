<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script> 
<%@ include file="/WEB-INF/views/common/common.jsp"%>
<%@ include file="/WEB-INF/views/main/header.jsp"%>
<%@ include file="/WEB-INF/views/mypage/mypageCommon.jsp"%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/resources/include/common/js/chkRegex.js"></script>
<script type="text/javascript">

var grandTotal = 0;
var grandTotalClone = grandTotal;
var buyerAddrValue = "";

$(function() {
	
	// 모달 열기 버튼에 대한 클릭 이벤트 핸들러
	$('#leadUserAddrBtn').click(function() {
	    // 모달을 보이게 하기
	    $('#addrModal').modal('show');
	    // 모달 열 때 서버에서 데이터를 동적으로 불러오는 함수를 호출
	    loadDataIntoModal();
	});
	
	function loadDataIntoModal() {
	    $.ajax({
	        url: "/mypage/leadBaseAddr",
	        method: "get",
	        data: { "user_no": "${userLogin.user_no}" },
	        dataType: "json",
	        success: function (response) {
	            if (response.length > 0) {
	                var $tbody = $("#deliveryAddresses"); // 수정된 부분
	                $tbody.empty(); // 기존 데이터를 지웁니다.

	                for (let i = 0; i < response.length; i++) {
	                    var addressData = response[i];
	                    var $tr = $("<tr>").append(
	                        $("<td>").text(addressData.addr_name),
	                        $("<td>").text(addressData.addr_road),
	                        $("<td>").text(addressData.addr_receiver),
	                        $("<td>").append(
	                            $("<button>")
	                                .text("선택")
	                                .click((function (addressData) {
	                                    return function () {
	                                        console.log("읽어온 주소:", addressData);

	                                        // 주소 정보를 입력 필드에 설정
	                                        $("#postcode").val(addressData.addr_post);
	                                        $("#jibunAddress").val(addressData.addr_jibun);
	                                        $("#roadAddress").val(addressData.addr_road);
	                                        $("#receiver").val(addressData.addr_receiver);
	                                        $("#name").val(addressData.addr_name);
	                                        $("#detailAddress").val(addressData.addr_detail);

	                                        // 주소 선택 모달 닫기
	                                        $("#addrModal").modal("hide");
	                                    };
	                                })(addressData))
	                        )
	                    );
	                    $tbody.append($tr);
	                }
	            } else {
	                alert("등록한 기본 배송지가 없습니다.");
	                $("#leadUserAddrBtn").css("visibility", "hidden");
	                $("#addrModal").modal("hide");
	            }
	        }
	    });
	}
	
	
	function requestPay() {
		console.log("function 시작");
		
		// 체크박스 상태 확인
        var isPickupSelected = $("#pickupCheckbox").is(":checked");
		
        

        if (!isPickupSelected) {
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
        }
	  IMP.init('imp57485457'); //iamport 대신 자신의 "가맹점 식별코드"를 사용
	  IMP.request_pay({
		pg:"html5_inicis",
		pay_method:"card",
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
        	
        	//const isPickupSelected = $("#pickupCheckbox").is(":checked");
			sendOrderData(); // 테스트(결제 생략)
        	//requestPay();
        })
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
            "수령인 : " +
            $("#receiver").val()+
            $("#pickUpInput").val();
            

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
            quantity: productQuantity
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

        // 배송비를 나타내는 엘리먼트
        var dlvFeeElement = $("#dlv_fee");
        // "픽업 할인"을 나타내는 엘리먼트
        var pickUpElement = $("#pick_up");
        // 주소지 별명 입력 필드
        var addressNameElement = $("#name");
        
        dlvFeeElement.text("3,000"); // 배송비 설정
        
       //픽업 버튼 누르면 배송정보 입력 비활성화
        $("#pickupCheckbox").change(function() {
    if ($(this).is(":checked")) {
        // 체크박스가 선택되면 주소 입력 필드 비활성화
        $("#roadAddress").prop("disabled", true);
        $("#detailAddress").prop("disabled", true);
        $("#pickUpInput").prop("disabled", true);
        $("#jibunAddress").prop("disabled", true);
        $("#name").prop("disabled", true);
        $("#postcode").prop("disabled", true);
        $("#pickUpInput").val("/픽업");
        $("#extraAddress").prop("disabled", true);
    } else {
        // 체크박스가 선택 해제되면 주소 입력 필드 활성화
        $("#roadAddress").prop("disabled", false);
        $("#detailAddress").prop("disabled", false);
        $("#receiver").prop("disabled", false);
        $("#jibunAddress").prop("disabled", false);
        $("#name").prop("disabled", false);
        $("#postcode").prop("disabled", false);
    }
    
  
    
     var isPickedUp = $(this).is(":checked");
    
    
    if (isPickedUp) {
        // "픽업" 체크박스가 선택된 경우
        grandTotalClone -= 3000; // grandTotalClone에서 3000을 차감
        // "픽업 할인" 값을 업데이트하여 음수로 표시
        pickUpElement.text("-3,000");
    } else {
        // "픽업" 체크박스가 선택 해제된 경우
        grandTotalClone += 3000; // grandTotalClone에 3000을 추가
        // "픽업 할인" 값을 업데이트하여 비우거나 0으로 표시
        pickUpElement.text("");
        
     // 주소지 별명 필드를 비웁니다.
        addressNameElement.val("");
    }
	grandTotal=grandTotalClone;
    // grandTotalClone 값을 화면에 업데이트합니다.
    $("#grandTotal").text(grandTotalClone.toLocaleString());
});
        
        /////////////////////////////////////////////
        
        // 마일리지 콤보박스 엘리먼트와 grandTotal 엘리먼트를 가져옵니다.
        var couponSelect = document.getElementById("coupon");

        // 콤보박스의 변경 이벤트에 대한 이벤트 리스너를 추가합니다.
        $("#coupon").on("click change", function() {
            grandTotalClone = grandTotal; // 총 값 복제

            // 선택한 쿠폰 값을 가져옵니다.
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
        }); 

        
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

<style>
/* input 요소 폭 설정 */
 .order_input {
    max-width: 200px; /* 최대 폭 설정 */
    width: auto; /* 필요한 만큼의 너비 사용 */
    padding: 5px;
    border: 1px solid #ccc;
    border-radius: 3px;
}

/* 페이지 전체 스타일 */
body {
    font-family: Arial, sans-serif;
    background-color: #f0f0f0;
    margin: 0;
    margin-top: 70px;
    padding: 0;
}

/* 페이지 제목 스타일 */
h1 {
    color: #333;
    margin-top: 20px;
    text-align: center;
}

#thead_table { width:80%;  text-align:center; margin: 0 auto;}
#detaliReview {margin-right: 40px;}

/* 주문자 정보 스타일 */
.mb-3 {
    margin-bottom: 20px;
    padding: 10px;
    background-color: #fff;
    border-radius: 5px;
}

label.form-label {
    font-weight: bold;
}

.order_input {
    width: 100%;
    padding: 5px;
    border: 1px solid #ccc;
    border-radius: 3px;
}

/* 체크박스 스타일 */
.form-check-label {
    font-weight: bold;
}

/* 주소 입력 스타일 */
.address_sys_container {
    background-color: #f9f9f9;
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 5px;
}

/* 쿠폰 선택 스타일 */
.couponLabel {
    font-weight: bold;
}

select.form-select {
    width: 100%;
    padding: 5px;
    border: 1px solid #ccc;
    border-radius: 3px;
}

/* 결제 예정 상품 목록 스타일 */
#orderTableDiv {
    background-color: #fff;
    padding: 20px;
    border: 1px solid #ddd;
    border-radius: 5px;
}

table.table {
    width: 100%;
    border-collapse: collapse;
}

table.table th, table.table td {
    
    padding: 8px;
}

table.table th {
    background-color: #f2f2f2;
}s
/* 추가된 스타일 */
table.table thead, table.table tfoot {
    text-align: center; /* 헤더와 푸터 가운데 정렬 */
}

/* td_title 스타일 (왼쪽 정렬) */
td.td_title {
    text-align: left; /* 텍스트 왼쪽 정렬 */
}


/* 결제 버튼 스타일 */
#payBtn {
    background-color: #007bff;
    color: #fff;
    padding: 10px 20px;
    border: none;
    border-radius: 3px;
    cursor: pointer;
}

		/* div 간격 조절 */
#input_name_box,
#input_phone_box,
#pick_up_box {
    margin-bottom: 20px; /* 간격 조절 */
}

/* pick_up_box의 테두리 제거 */
#pick_up_box {
    border: none;
}

#leadBaseAddr {
	margin-left: 25px;
    margin-bottom: 20px;
}
td.td_title {
    text-align: left;
}

</style>

<h1>주문 내역</h1>

    
<div class="mb-3">
	<div id="input_name_box">
	<label for="exampleFormControlInput1" class="form-label">주문회원 이름</label>
	 <input type="text" id="order_name" class="order_input" value="${userInfo.user_name}"/><br/>
	 </div>
	 
	 <div id="input_phone_box">
		 <label for="exampleFormControlInput1" class="form-label">핸드폰 번호</label>
		 <input type="text" id="phone" class="order_input" value="${userInfo.user_phone_num}">
	</div>	 
	 <div class="mb-3" id="pick_up_box">
	 <form action="process.jsp" method="post">
		<label for="pickupCheckbox" class="form-check-label">픽업</label>
		<input type="checkbox" class="form-check-input" id="pickupCheckbox" name="pickupCheckbox" value="1">
	</form>
	</div>
		  
	<!-- <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="주소 입력">-->
	
	<div id="addrForm">
	
	 <label for="exampleFormControlInput1" class="form-label">주소</label>
		<form id="addrForm" name="addrForm">
	<%@ include file="/WEB-INF/views/addr/addressAPI.jsp" %>
 </form> 
	</div>
	<div>
	<input type="button" value="기본배송지 불러오기" id="leadUserAddrBtn" class="btn btn-primary" data-toggle="modal" data-target="#addrModal">
	</div>
 	
	<!-- 쿠폰 사용 -->
	
<div class="mb-3">
    <label for="coupon" class="couponLabel">쿠폰</label>
    <select id="coupon" class="form-select order_input" aria-label="Default select example">
        <option value="0">쿠폰 선택</option>
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
		
		<tr id="dlv_fee_tr">
			<td colspan="4" class="td_title">배송비</td>
			<td colspan="1" id="dlv_fee"></td>	
		</tr>
		<tr id="coupon tr">
			<td colspan="4" class="td_title">쿠폰 사용</td>
			<td colspan="1" id="coupon_use"></td>
		</tr>
		<tr id="dlv_free">
			<td colspan="4" class="td_title">픽업 할인</td>
			<td colspan="1" id="pick_up"></td>
		</tr>
				
		<tr id="totalRow">
            <td colspan="4" class="td_title">총 합</td>
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
			<button id="payBtn" class="btn btn-primary">결제하기</button>
		</div>
	
	<!-- 배송주소지 정보를 읽어온 모달 div -->
	<div class="modal fade" id="addrModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">배송지 목록</h5>
      </div>
      <div class="modal-body">
        <div>
          <table class="table table-striped">
            <thead>
              <tr>
                <th>배송지이름</th>
                <th>도로명주소</th>
                <th>수령인이름</th>
                <th>선택</th>
              </tr>
            </thead>
            <tbody id="deliveryAddresses">
              <!-- 클릭을하면 모달창을 생성하고 그 안에 관련 정보를 보여주는 곳 -->
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
</div>
	
	
	</div>
</div>
</body>
</html>
