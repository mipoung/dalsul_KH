<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>

<body>
    <h1>주문 상세 내역</h1>
    <div class="border border-success p-2 mb-2 whole-table">
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th scope="col">주문 상세 번호</th>
                    <th scope="col">상품 일련 번호</th>
                    <th scope="col">주문 수량</th>
                    <th scope="col">쿠폰 사용 금액</th>
                    <th scope="col">배송비</th>
                    <th scope="col">총 상품 금액</th>
                    <th scope="col">배송 정보</th>
                    <th scope="col">주문 상태</th>
                    <th scope="col">주문 일자</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${orderListDetail}" var="orderListDetail">
                     <tr>
                        <td>${orderListDetail.order_detail_no}</td>
                        <td>${orderListDetail.product_no}</td>
                        <td>${orderListDetail.quantity}</td>
                        <td>${orderListDetail.order_use_coupon}</td>
                        <td>${orderListDetail.order_dlv_fee}</td>
                        <td>${orderListDetail.order_total_price}</td>
                        <td>${orderListDetail.order_delivery_info}</td>
                        <td>${orderListDetail.order_status}</td>
                        <td>${orderListDetail.order_date}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>