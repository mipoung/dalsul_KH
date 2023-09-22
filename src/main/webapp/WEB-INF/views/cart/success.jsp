<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>

<body>
    <h1>결제 내역</h1>
    <div class="border border-success p-2 mb-2 whole-table">
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th scope="col">상품</th>
                    <th scope="col">개수</th>
                    <th scope="col">배송비</th>
                    <th scope="col">쿠폰사용</th>
                    <th scope="col">총합</th>
                    <th scope="col">배송지</th>
                    <th scope="col">주문 일자</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${payList}" var="payList">
                    <tr>
                        <td>${payList.product_no}</td>
                        <td>${payList.quantity}</td>
                        <td>${payList.order_dlv_fee}</td>
                        <td>${payList.order_use_coupon}</td>
                        <td>${payList.order_total_price}</td>
						<td>${payList.order_delivery_info}</td>
                        <td>${payList.order_date}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>