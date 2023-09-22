<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>
<!-- 관리자페이지 드롭다운 사용을 위해 필요한 스크립트 -->
<script type="text/javascript" src="/resources/include/common/bootstrap/js/bootstrap.bundle.min.js"></script>
<script>
$(function(){
    $("#saveButton").on("click", function () {
        saveOrderStatus();
    });

    function saveOrderStatus() {
        var selectedOrders = [];
        var selects = $(".orderStatusSelect");

        selects.each(function () {
            var orderNo = $(this).data("order-no"); //order_no의 값
            var orderStatus = $(this).val();	//상태값
            if (orderStatus !== "상태변경") {
                selectedOrders.push({ orderNo: orderNo, orderStatus: orderStatus });
            }
            console.log("Order No: " + orderNo);
            console.log("Order Status: " + orderStatus);
        });
         $.ajax({
             type: "GET",
             url: "/controller-url", // 실제 컨트롤러 URL로 변경하세요.
             data: JSON.stringify(selectedOrders),
             contentType: "application/json; charset=utf-8",
             success: function (data) {
                 // 성공적으로 업데이트되었을 때 수행할 동작을 추가합니다.
                 // 예를 들어, 화면 갱신 또는 메시지 표시 등을 할 수 있습니다.
             },
             error: function (error) {
                 // 오류 처리 로직을 추가합니다.
             }
         });
     }
	
	
}); //function 끝	


</script>

</head>
   <body>
   <!-- 매니저 헤더 -->
   <%@ include file="/WEB-INF/views/manager/managerHeader.jsp"%>
   
  <h1>주문 내역</h1>
		<button id="saveButton" onclick="saveOrderStatus()">저장</button>	
    <div class="border border-success p-2 mb-2 whole-table">
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th scope="col">주문 번호</th>
                    <th scope="col">회원 번호</th>
                    <th scope="col">사용 쿠폰</th>
                    <th scope="col">배송비</th>
                    <th scope="col">총 주문 금액</th>
					<th scope="col">상품 일련 번호</th>
                    <th scope="col">상품명</th>
                    <th scope="col">주문 개수</th>
                    <th scope="col">배송  정보</th>
                    <th scope="col">주문 상태</th>
                    <th scope="col">주문 상태 변경</th>
                    <th scope="col">주문 일자</th>
                    <th scope="col">주문 수정 일자</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${buyerList}" var="buyer" varStatus="status">
                     <tr>
                        <td>${buyer.ORDER_NO}</td>
                        <td>${buyer.USER_NO}</td>
                        <td>${buyer.ORDER_USE_COUPON}</td>
                        <td>${buyer.ORDER_DLV_FEE}</td>
                        <td>${buyer.ORDER_TOTAL_PRICE}</td>
                        <td>${buyer.PRODUCT_NO}</td>
                        <td>${buyer.PRODUCT_NAME}</td>
                        <td>${buyer.QUANTITY}</td>
                        <td>${buyer.ORDER_DELIVERY_INFO}</td>
                        <td>${buyer.ORDER_STATUS}</td>
               <td><select class="orderStatusSelect" id="orderStatus" name="orderStatus" data-order-no="${buyer.ORDER_NO}">
               			<option value="상태변경">상태변경</option>
					    <option value="결제완료">결제완료</option>
					    <option value="배송출발">배송출발</option>
					    <option value="배송완료">배송완료</option>
					    <option value="취소완료">취소완료</option>
				</select></td>
                        <td>${buyer.ORDER_DATE}</td>
                        <td>${buyer.ORDER_UPDATE_DATE}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        	
        	
    </div>
</body>
</html>