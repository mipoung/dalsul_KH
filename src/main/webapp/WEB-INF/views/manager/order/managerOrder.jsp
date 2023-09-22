<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>
<!-- 관리자페이지 드롭다운 사용을 위해 필요한 스크립트 -->
<script type="text/javascript" src="/resources/include/common/bootstrap/js/bootstrap.bundle.min.js"></script>


</head>
   <body>
   <!-- 매니저 헤더 -->
   <%@ include file="/WEB-INF/views/manager/managerHeader.jsp"%>
   
  <h1>주문 내역</h1>

    <div class="border border-success p-2 mb-2 whole-table">
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th scope="col">주문 번호</th>
                    <th scope="col">회원 번호</th>
                    <th scope="col">사용 쿠폰</th>
                    <th scope="col">배송비</th>
                    <th scope="col">총 주문 금액</th>
                    <th scope="col">배송  정보</th>
                    <th scope="col">주문 상태</th>
                    <th scope="col">주문 일자</th>
                    <th scope="col">주문 수정 일자</th>
                    <th scope="col">상품 일련 번호</th>
                    <th scope="col">상품명</th>
                    <th scope="col">주문 개수</th>
                    
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
                        <td>${buyer.ORDER_DELIVERY_INFO}</td>
                        <td>${buyer.ORDER_STATUS}</td>
                        <td>${buyer.ORDER_DATE}</td>
                        <td>${buyer.ORDER_UPDATE_DATE}</td>
                        <td>${buyer.PRODUCT_NO}</td>
                        <td>${buyer.PRODUCT_NAME}</td>
                        <td>${buyer.QUANTITY}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>