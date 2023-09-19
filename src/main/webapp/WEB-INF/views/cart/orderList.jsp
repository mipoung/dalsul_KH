<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/common/common.jsp"%>
<script type="text/javascript" src="/resources/include/addressAPI/addressAPIupdate.js"></script>
<script type="text/javascript" src="/resources/include/addressAPI/addressAPIinsert.js"></script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script> 
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

<script>
var grandTotal = 0;
$(function(){
	  $("#payBtn").click(function(){
		// window.location.href = "/order/insertOrder";
		 requestPay();
	  })
});	

	var IMP = window.IMP; 
	IMP.init("imp57485457"); 

	
	function requestPay() {
		
		
	  IMP.init('imp57485457'); //iamport 대신 자신의 "가맹점 식별코드"를 사용
	  IMP.request_pay({
	    pg: "html5_inicis.INIBillTst",
	    pay_method: "card",
	    merchant_uid : 'merchant_'+new Date().getTime(),
	    name : '달술',
	    amount : grandTotal,
	    buyer_email : 'iamport@siot.do',
	    buyer_name : "${userInfo.user_name}",
	    buyer_tel : "${userInfo.user_phone_num}",
	    buyer_addr : '서울특별시 강남구 삼성동',
	    buyer_postcode : '123-456'
	  }, function (rsp) { // callback
	      if (rsp.success) {
	    	  console.log(rsp);
	      } else {
	        console.log(rsp);
	      }
	  });
	  <%--
	// JavaScript 함수를 이용하여 입력된 주소 정보를 가져옵니다.
	  function getAddressInfo() {
	      // HTML 입력 요소로부터 값을 가져옵니다.
	      var receiver = document.getElementById("receiver").value;
	      var name = document.getElementById("name").value;
	      var postcode = document.getElementById("postcode").value;
	      var roadAddress = document.getElementById("roadAddress").value;
	      var jibunAddress = document.getElementById("jibunAddress").value;
	      var detailAddress = document.getElementById("detailAddress").value;
	      var extraAddress = document.getElementById("extraAddress").value;

	      // 주소 정보를 ","로 구분하여 합칩니다.
	      var addressInfo = [receiver, name, postcode, roadAddress, jibunAddress, detailAddress, extraAddress].join(',');

	      // SQL 쿼리에 바인딩할 때 사용할 변수에 값을 할당합니다.
	      var orderDeliveryInfo = addressInfo;

	      // orderDeliveryInfo 값을 SQL 쿼리에 바인딩하여 서버로 전송하면 됩니다.
	      
	      // 예시: 서버로 데이터 전송하는 코드 (Ajax를 사용하는 경우)
	      // $.ajax({
	      //     type: "POST",
	      //     url: "your_server_url",
	      //     data: {
	      //         orderDeliveryInfo: orderDeliveryInfo
	      //     },
	      //     success: function(response) {
	      //         // 성공 시 처리
	      //     },
	      //     error: function(error) {
	      //         // 오류 시 처리
	      //     }
	      // });
	  }

	  --%>
	};
	
	function msg(rsp) {
	    console.log(rsp);
	    if (rsp.success) {
	      var msg = '결제가 완료되었습니다.';
	      alert(msg);
	      location.href = "결제 완료 후 이동할 페이지 url"
	    } else {
	      var msg = '결제에 실패하였습니다.';
	      msg += '에러내용 : ' + rsp.error_msg;
	      alert(msg);
	    }
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
				var total = product_price * quantity ;
	
				// 총합을 천단위로 포맷팅하여 콤마(,)를 추가합니다.
				var formatTotal = total.toLocaleString();
	
				// .total 셀에 포맷팅된 총합을 출력합니다.
				cartItem.querySelector(".total").innerText = formatTotal;
		
			//마지막 라인 총 합 계산
	      //  var cartItems = document.querySelectorAll(".cart-item");
	        //var grandTotal = 0;

	           
	            grandTotal += total;
		});
	            grandTotal=grandTotal+3000; //배송비 3천원 추가
	           
	           ///////////////////////////////
	           
	            // 마일리지 콤보박스 엘리먼트와 grandTotal 엘리먼트를 가져옵니다.
	            var couponSelect = document.getElementById("coupon");
	            
	            // 콤보박스의 변경 이벤트에 대한 이벤트 리스너를 추가합니다.
	            couponSelect.addEventListener("change", function() {
	            	grandTotalClone = grandTotal;//총 값 복제
	            	
	                // 선택한 마일리지 값을 가져옵니다.
	                var selectedCoupon = parseInt(couponSelect.value);

	                // 선택한 마일리지에 따라 grandTotal 값을 조정합니다.
	                if (selectedCoupon === 0) {
	                	grandTotalClone-=0;
 				   } else if (selectedCoupon === 2000) {
 					  grandTotalClone -= 2000;
   					 } else if (selectedCoupon === 1000) {
   						grandTotalClone -= 1000;
 				   }
	                

	               //  grandTotalClone 값을 화면에 업데이트합니다.
	                 var grandTotalElement = document.getElementById("grandTotal");
	                 grandTotalElement.innerText = grandTotalClone.toLocaleString();
					
				<%--	/////////////////////////////////////
	     		//마일리지 사용 함수
// 초기 총 결제금액을 설정합니다.
    var originalUseMileageValue = 0;

    // "use_mileage" 입력 필드에 포커스가 들어왔을 때 이벤트 처리
    $("#use_mileage").on("focus", function() {
        // 현재 입력된 값을 저장합니다.
        originalUseMileageValue = parseInt($(this).val()) || 0;
    });

    // 다른 곳을 클릭할 때 "use_mileage" 입력 필드에서 포커스를 제거합니다.
    $(document).on("click", function(event) {
        var target = $(event.target);
        var useMileageInput = $("#use_mileage");
        if (!target.is(useMileageInput)) {
            // 현재 입력된 값을 가져옵니다.
            var currentUseMileageValue = parseInt(useMileageInput.val()) || 0;

            // 입력된 값과 원래 값의 차이를 계산합니다.
            var difference = currentUseMileageValue - originalUseMileageValue;

            // 만약 입력된 값이 0이면, 원래 값으로 복구합니다.
            if (currentUseMileageValue === null) {
                grandTotalClone += difference;
                originalUseMileageValue = 0;
            } else {
                // 그렇지 않으면 차감합니다.
                grandTotalClone -= difference;
            }

            // 페이지에 표시된 총 결제금액을 업데이트합니다.
            var grandTotalElement = document.getElementById("grandTotal");
            grandTotalElement.innerText = grandTotalClone.toLocaleString();
            console.log(grandTotalClone.toLocaleString());
        }
    });
	     		--%>
	            ///////////////////////////////////////
		         // grandTotal 값을 계산한 후 5% 값을 계산합니다.
		            var couponPercentage = 0.05; // 5%에 해당하는 비율
	
		            // 5% 적립금을 계산합니다.
		            var couponAmount = (grandTotalClone-3000) * couponPercentage;
		         
		            // mileageMessage 요소를 가져옵니다.
		            var couponMessageElement = document.getElementById("couponMessage");
	
		            // mileageMessage에 5% 적립금을 표시합니다.
		            couponMessageElement.innerText = "결제 예정 적립금: " + couponAmount.toLocaleString() + "원";
				}); //mileageSelect.addEventListener


	        var grandTotalElement = document.getElementById("grandTotal");
	        var formatGrandTotal = grandTotal.toLocaleString();
	        grandTotalElement.innerText = formatGrandTotal;
	        $("#couponMessage").text("결제 예정 적립금: " + ((grandTotal-3000) * 0.05) + "원");
	        
	     // select 요소를 가져옵니다.
	    	var selectElement = document.getElementById("coupon");

	    	// select 요소의 변경 이벤트에 대한 이벤트 리스너를 추가합니다.
	    	selectElement.addEventListener("change", function () {
	    	    // 선택한 옵션의 값을 가져옵니다.
	    	    var selectedValue = selectElement.value;

	    	    // 선택한 값을 어떻게 사용할지 여기에서 처리합니다.
	    	    // 예를 들어, 선택한 값을 콘솔에 출력하거나 다른 곳에 표시할 수 있습니다.
	    	    console.log("선택한 값: " + selectedValue);

	    	    // 선택한 값을 원하는 위치에 표시하려면 해당 위치의 엘리먼트를 선택하고 innerText 또는 innerHTML을 사용하여 값을 설정합니다.
	    	    var displayElement = document.getElementById("coupon_use");
	    	    displayElement.innerText = "-" + selectedValue ; // 선택한 값을 표시
	    	});

	        /* $("#coupon").change(function(){
	        	let amount = grandTotalClone;
	        	
                // 선택한 쿠폰 값을 가져옵니다.
                let couponValue = parseInt($("#coupon option:selected").val());

                // 선택한 쿠폰 따라 amount 값을 조정합니다.
                if (couponValue === 0) {
                	amount-=0;
				   } else if (couponValue === 2000) {
					   amount -= 2000;
					 } else if (couponValue === 1000) {
						 amount -= 1000;
				   }

                // grandTotalClone 값을 화면에 업데이트합니다.
                  var grandTotalElement = document.getElementById("grandTotal");
                  grandTotalElement.innerText = amount.toLocaleString();

     
            
	         // grandTotal 값을 계산한 후 5% 값을 계산합니다.
	            var mileagePercentage = 0.05; // 5%에 해당하는 비율

	            // 5% 적립금을 계산합니다.
	            var mileageAmount = (amount-3000) * mileagePercentage;
	         
	            // mileageMessage 요소를 가져옵니다.
	            var mileageMessageElement = document.getElementById("mileageMessage");

	            // mileageMessage에 5% 적립금을 표시합니다.
	            mileageMessageElement.innerText = "결제 예정 적립금: " + mileageAmount.toLocaleString() + "원";
	        }); */
	};
	
	  
    <%--주소 스크립트 --%>
          function execDaumPostcode() {
              new daum.Postcode({
                  oncomplete: function(data) {
                      // 팝업에서 검색결과 항목을 클릭했을 때 실행할 코드를 작성하는 부분.

                      // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                      // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                      let roadAddr = data.roadAddress; // 도로명 주소 변수
                      let extraRoadAddr = ''; // 참고 항목 변수

                      // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                      // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                      if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                          extraRoadAddr += data.bname;
                      }
                      // 건물명이 있고, 공동주택일 경우 추가한다.
                      if (data.buildingName !== '' && data.apartment === 'Y') {
                          extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                      }
                      // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                      if (extraRoadAddr !== '') {
                          extraRoadAddr = ' (' + extraRoadAddr + ')';
                      }

                      // 우편번호와 주소 정보를 해당 필드에 넣는다.
                      document.getElementById('postcode').value = data.zonecode;
                      document.getElementById("roadAddress").value = roadAddr;
                      document.getElementById("jibunAddress").value = data.jibunAddress;

                      // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                      if (roadAddr !== '') {
                          document.getElementById("extraAddress").value = extraRoadAddr;
                      } else {
                          document.getElementById("extraAddress").value = '';
                      }

                      let guideTextBox = document.getElementById("guide");
                      // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                      if (data.autoRoadAddress) {
                          let expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                          guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                          guideTextBox.style.display = 'block';
                      } else if (data.autoJibunAddress) {
                          var expJibunAddr = data.autoJibunAddress;
                          guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                          guideTextBox.style.display = 'block';
                      } else {
                          guideTextBox.innerHTML = '';
                          guideTextBox.style.display = 'none';
                      }
                
                      /* 메소드 실행후 api 반환값 확인
                      console.log(data.address + " 기본주소");
                      console.log(data.jibunAddress + " 지번");
                      console.log(data.roadAddress + " 도로명주소 반환");
                      console.log(data.zonecode + " 우편번호 반환5자리");
                     */
                  }
              }).open();
          }
      
          $(function() {
        	   
        	   /*배송지 정보보러가기 클릭시 상세 페이지 이동을 위한 처리 이벤트*/
        	   $("#infoAddrBtn").click(function() {
        	   
        	      $("#useAddr").attr({
        	         "method":"get",
        	         "action":"/addr/selectAddr"
        	      });
        	      $("#useAddr").submit();
        	   });
        	   
        	   /*기본배송 주소지 정보수정페이지 이동하기, 클릭시 입력받은 배송지테이블 일련번호를 기준으로 입력받은 값들을 보여주는 페이지로 이동하는 이벤트*/
        	   $("#updateAddrFormBtn").click(function() {
        	      
        	      $("#useAddr").attr({
        	         "method":"get",
        	         "action":"/addr/updateAddrForm"
        	      });
        	      $("#useAddr").submit();
        	   });   
        	   
        	 });
	
</script>

<h1>주문 내역</h1>

<div class="mb-3">
	<label for="exampleFormControlInput1" class="form-label">이름</label>
	 <input type="text" id="name" value="${userInfo.user_name}"/>
		 <label for="exampleFormControlInput1" class="form-label">핸드폰 번호</label>
		 <input type="text"  id="phone" value="${userInfo.user_phone_num}"><br/>
		 
	 <div class="mb-3">
		<label for="pickupCheckbox" class="form-check-label">픽업</label>
		<input type="checkbox" class="form-check-input" id="pickupCheckbox" name="pickup" value="pickup">
	</div>
		  
	<!-- <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="주소 입력">-->
	 <label for="exampleFormControlInput1" class="form-label">주소</label>
</div>		
 <div class="address_sys_container" >		
 <!-- 배송지정보를 입력받을,입력하는데 필요한 input태그 --> 
 		<input type="text" id="receiver" placeholder="받는사람(수취인) 이름" name="receiver">
 		<input type="text" id="name" name="name" placeholder="주소지 별명">
 		<input type="button" onclick="execDaumPostcode()" value="주소찾기"><br/>
        <input type="text" id="postcode" onclick="execDaumPostcode()" placeholder="우편번호" readonly="readonly" name="postcode">
        <input type="text" id="roadAddress" placeholder="도로명주소" onclick="execDaumPostcode()" readonly="readonly" name="roadAddress">
        <input type="text" id="jibunAddress" placeholder="지번주소" onclick="execDaumPostcode()" readonly="readonly" name="jibunAddress"><br/>
        <span id="guide" style="color:#999;display:none"></span>
        <input type="text" id="detailAddress" placeholder="상세주소" name="detailAddress">
        <input type="text" id="extraAddress" onclick="execDaumPostcode()" placeholder="참고항목" readonly="readonly" name="extraAddress">
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
					<th scope="col">상품</th>
					<th scope="col">가격</th>
					<th scope="col">수량</th>
					<th scope="col">총합</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${cartList}" var="cartList">
					<tr id="cartItem-${cartList.product_no}" class="cart-item">
						<td class="product_no">${cartList.product_no}</td>
						<td class="product_price-quantity"><span class="product_price">${cartList.product_price}</span>
						<td class="quantity">${cartList.quantity}</td>
						<td class="total"></td>
					</tr>
				</c:forEach>
		<tr id="dlv_fee">
			<td colspan="3">배송비</td>
			<td colspan="1">3,000</td>	
		</tr>
		<tr id="coupon tr">
			<td colspan="3">쿠폰 사용</td>
			<td colspan="1" id="coupon_use"></td>
		</tr>

		<tr id="totalRow">
            <td colspan="2">총 합</td>
            <td colspan="2" id="grandTotal"></td>
        </tr>

   		
			</tbody>
		</table>
		
		<span id="couponMessage"></span>
		
		<div id="totalDiv">
			<button onclick="requestPay()" id="payBtn">결제하기</button>
		</div>
		
	</div>
</div>

</body>



</html>
