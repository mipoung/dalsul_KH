<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>
<script type="text/javascript" src="/resources/include/js/addressAPI/addressAPIupdate.js"></script>
<script type="text/javascript" src="/resources/include/js/addressAPI/addressAPIinsert.js"></script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script> 
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

<script>
var grandTotal = 0;
$(function(){
	  $("#payBtn").click(function(){
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
	    name : '아메리카노',
	    amount : grandTotal,
	    buyer_email : 'iamport@siot.do',
	    buyer_name : '구매자',
	    buyer_tel : '010-1234-5678',
	    buyer_addr : '서울특별시 강남구 삼성동',
	    buyer_postcode : '123-456'
	  }, function (rsp) { // callback
	      if (rsp.success) {
	    	  console.log(rsp);
	      } else {
	        console.log(rsp);
	      }
	  });
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
		cartItems
				.forEach(function(cartItem) {
					// 상품 가격(price)과 수량(quantity)을 가져옵니다.
					var price = parseInt(cartItem.querySelector(".price").innerText);
					var quantity = parseInt(cartItem.querySelector(".quantity").innerText);

					// 총합(total)을 계산합니다.
					var total = price * quantity;

					// 총합을 천단위로 포맷팅하여 콤마(,)를 추가합니다.
					var formatTotal = total.toLocaleString();

					// .total 셀에 포맷팅된 총합을 출력합니다.
					cartItem.querySelector(".total").innerText = formatTotal;
				});
		
			//마지막 라인 총 합 계산
	        var cartItems = document.querySelectorAll(".cart-item");
	        //var grandTotal = 0;

	        cartItems.forEach(function(cartItem) {
	            var price = parseInt(cartItem.querySelector(".price").innerText);
	            var quantity = parseInt(cartItem.querySelector(".quantity").innerText);
	            var total = price * quantity;
	            var formatTotal = total.toLocaleString();
	            cartItem.querySelector(".total").innerText = formatTotal;
	            grandTotal += total;
	        });

	        var grandTotalElement = document.getElementById("grandTotal");
	        var formatGrandTotal = grandTotal.toLocaleString();
	        grandTotalElement.innerText = formatGrandTotal;

		
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
	 <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="홍길동">
		 <label for="exampleFormControlInput1" class="form-label">핸드폰 번호</label>
		 <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="xxx-xxxx-xxxx">
		  <label for="exampleFormControlInput1" class="form-label">주소</label>
	<!-- <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="주소 입력">-->
</div>		
 <div class="address_sys_container">		
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
    </div><br/><!-- 주소입력 컨테이터 종료 -->		
		
		

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
					<tr id="cartItem-${cartList.product_id}" class="cart-item">
						<td class="product_id">${cartList.product_id}</td>
						<td class="price-quantity"><span class="price">${cartList.price}</span>
						<td class="quantity">${cartList.quantity}</td>
						<td class="total"></td>
					</tr>
				</c:forEach>
				<tr id="totalRow">
            <td colspan="2">총 합</td>
            <td colspan="2" id="grandTotal"></td>
        </tr>
			</tbody>
		</table>
	
		<div id="totalDiv">
			<button onclick="requestPay()" id="payBtn">결제하기</button>
		</div>
		
	</div>
</div>

</body>



</html>
