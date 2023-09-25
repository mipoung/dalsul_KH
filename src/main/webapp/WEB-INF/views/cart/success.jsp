<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>
<%@ include file="/WEB-INF/views/main/header.jsp"%>
<%@ include file="/WEB-INF/views/mypage/mypageCommon.jsp"%>

<script type="text/javascript">
//숫자를 쉼표로 포맷팅하는 함수
function formatNumberWithCommas(number) {
	return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

$(document).ready(function() {
	// 페이지가 로드될 때 실행되는 함수
	// 모든 주문 상세 금액 요소에 대해 포맷팅을 적용
	$(".formatted-price").each(function() {
		var price = $(this).data("price");
		var formattedPrice = formatNumberWithCommas(price);
		$(this).text(formattedPrice);
	});
});
</script>
        <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
        }

        h1 {
            background-color: #b8bba2;
            color: #fff;
            padding: 20px;
            text-align: center;
        }

        .whole-table {
            background-color: #fff;
            padding: 20px;
            margin: 20px;
            border-radius: 5px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #ccc;
            padding: 10px;
            text-align: center;
        }

        th {
            background-color: #007bff;
            color: #fff;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .btn {
            display: inline-block;
            margin-top: 10px;
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
        }

        .btn-primary {
            background-color: #007bff;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }

        .btn-container {
            text-align: center;
            margin-top: 20px;
        }

        .btn-container .btn {
            margin: 10px;
        }
    </style>
<body>
    <h1>결제 내역</h1>
    <div class="border border-success p-2 mb-2 whole-table">
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th scope="col">상품</th>
                    <th scope="col">개수</th>
                    <th scope="col">배송비</th>
                    <th scope="col">쿠폰 사용 금액</th>
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
                        <td><span class="formatted-price" data-price="${payList.order_dlv_fee}"></span></td>
                        <td><span class="formatted-price" data-price="${payList.order_use_coupon}"></span></td>
                        <td><span class="formatted-price" data-price="${payList.order_total_price}"></span></td>
                   <!-- <td>${payList.order_dlv_fee}</td>
                        <td>${payList.order_total_price}</td>  --> 
						<td>${payList.order_delivery_info}</td>
                        <td>${payList.order_date}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <div class="btn-container">
        <a class="btn btn-primary" href="/mypage/orderlistDetailView">상세내역 조회하기</a>
        <a class="btn btn-primary" href="/">메인으로 돌아가기</a>
        </div>
    </div>
</body>
</html>