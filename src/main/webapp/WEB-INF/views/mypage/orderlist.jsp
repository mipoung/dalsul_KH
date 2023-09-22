<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>
<script>
$(function(){
    $(".order-detail-link > a").click(function() {
        // data-order-no 값을 가져와서 변수에 저장
        var orderNo = $(this).closest('.order-detail-link').data('order-no');
        console.log(orderNo)
        // 해당 값을 숨겨진 input 요소에 설정
        $('#no').val(orderNo);
        
        // 숨겨진 input 요소의 값을 콘솔에 출력
        console.log($('#no').val());
        <%--
    	$("#no").attr({
			"method" : "get",
			"action" : "mypage/orderlistDetailView"
		});
		--%>
		$("#orderForm").submit();
    });
})


</script>

<body>
    <h1>주문 내역</h1>
   <form id="orderForm" method="get" action="/mypage/orderListDetail">
    	<input type="hidden" id="no" name="order_no" />
	</form>

    <div class="border border-success p-2 mb-2 whole-table">
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th scope="col">주문 번호</th>
                    <th scope="col">총 금액</th>
                    <th scope="col">주문 날짜</th>
                    <th scope="col">주문 상태</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${orderList}" var="orderList">
                     <tr>
                        <td class="order-detail-link"  data-order-no="${orderList.order_no}">
                           <a href="javascript:void(0)"> ${orderList.order_no}</a>
                        </td>
                        <td>${orderList.order_total_price}</td>
                        <td>${orderList.order_date}</td>
                        <td>${orderList.order_status}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>