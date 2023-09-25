<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>
<%@ include file="/WEB-INF/views/main/header.jsp"%>
<style>
img, svg {
    vertical-align: middle;
    width: 100px;
   }
   body{ margin-top: 70px;}
h1 { text-align:center; }
#thead_table { width:80%;  text-align:center; margin: 0 auto;}
#detaliReview {margin-right: 40px;}

.mypage_menu{
	margin-top: 100px;
}

</style>
</head>
<html>
<body>
	<%@ include file="/WEB-INF/views/mypage/mypageCommon.jsp"%>
     <h1>취소/환불 내역</h1>
    <div class="border border-success p-2 mb-2 whole-table" id="thead_table">
       <table class="table table-bordered">
            <thead>
                <tr>
                    <th scope="col">주문 상세 번호</th>
                    <th scope="col">상품 이름</th>
                    <th scope="col">상품 이미지</th>
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
                <c:forEach items="${refundDetailList}" var="refundDetailList">
                     <tr>
                        <td class="order_no" data-order-no="${refundDetailList.order_no}">${refundDetailList.order_no}</td>
                        <td data-product-no="${refundDetailList.product_no}" data-product-name="${refundDetailList.product_name}">${refundDetailList.product_name}</td>
                       	<td><img data-src="/resources/images/mainpage/product/${refundDetailList.product_main_image}" src="/resources/images/mainpage/product/${refundDetailList.product_main_image}"></td>
                        <td>${refundDetailList.quantity}</td>
                        <td>${refundDetailList.order_use_coupon}</td>
                        <td>${refundDetailList.order_dlv_fee}</td>
                        <td>${refundDetailList.order_total_price}</td>
                        <td>${refundDetailList.order_delivery_info}</td>
                        <td>${refundDetailList.order_status}</td>
                        <td data-order-date="${refundDetailList.order_date}">${refundDetailList.order_date}</td>
                        
                </c:forEach>
            </tbody>
        </table>

    </div>
</body>
</html>
