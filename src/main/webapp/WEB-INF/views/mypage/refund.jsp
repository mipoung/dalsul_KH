<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>

<script>
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
#user_info_div{
    -webkit-text-size-adjust: 100%;
    -webkit-tap-highlight-color: rgba(0,0,0,0);
    --swiper-theme-color: #007aff;
    -webkit-font-smoothing: antialiased;
    font-feature-settings: "tnum";
    font-variant: tabular-nums;
    font-size: 13px;
    font-weight: 400;
    line-height: 13px;
    font-family: Spoqa Han Sans Neo,"sans-serif";
    color: inherit;
    box-sizing: border-box;
    width: 1144px;
    margin: 0px auto;
    text-align: center;
    border-radius: 20px;
    border: 1px solid rgb(224, 224, 224);
    padding: 30px 60px 50px;
}

#user_info_div > div {
	margin : 0 auto;
}

.user_info_header{
	-webkit-text-size-adjust: 100%;
	-webkit-tap-highlight-color: rgba(0,0,0,0);
	--swiper-theme-color: #007aff;
	-webkit-font-smoothing: antialiased;
	font-feature-settings: "tnum";
	font-variant: tabular-nums;
	font-size: 17px;
	font-weight: 400;
	line-height: 13px;
	text-align: center;
	font-family: Spoqa Han Sans Neo,"sans-serif";
	color: inherit;
	box-sizing: border-box;
	cursor: auto;
	width: 100%;
	height: 30px;
	padding-bottom: 15px;
	display: flex;
	-webkit-box-align: center;
	align-items: center;
	-webkit-box-pack: justify;
	justify-content: space-between;
	border-bottom: 0.5px solid rgb(255, 222, 168);
}

#user_info_detail{
	-webkit-text-size-adjust: 100%;
    -webkit-tap-highlight-color: rgba(0,0,0,0);
    --swiper-theme-color: #007aff;
    -webkit-font-smoothing: antialiased;
    font-feature-settings: "tnum";
    font-variant: tabular-nums;
    font-size: 15px;
    font-weight: 400;
    line-height: 13px;
    text-align: center;
    font-family: Spoqa Han Sans Neo,"sans-serif";
    color: inherit;
    box-sizing: border-box;
    width: 100%;
    background-color: rgb(255, 255, 255);
    display: flex;
    flex-direction: column;
    padding-top: 30px;
}

#user_info_detail{
	-webkit-text-size-adjust: 100%;
    -webkit-tap-highlight-color: rgba(0,0,0,0);
    --swiper-theme-color: #007aff;
    -webkit-font-smoothing: antialiased;
    font-feature-settings: "tnum";
    font-variant: tabular-nums;
    font-size: 15px;
    font-weight: 400;
    line-height: 13px;
    text-align: center;
    font-family: Spoqa Han Sans Neo,"sans-serif";
    color: inherit;
    box-sizing: border-box;
    width: 100%;
    background-color: rgb(255, 255, 255);
    display: flex;
    flex-direction: column;
    padding-top: 30px;
}

.user-details-label{
	float:left;
}

.user-details-data{
	float : right;
	font-weight : bold;
}

.user-details-row{
	margin-bottom : 15px;
}

.update-password{
	color : #368AFF;
}

.delete-user > a {
	color : #FF3636;
}

.update-password, .delete-user{
	text-align : right;
	font-weight: bold;
	font-size : 15px;
	margin-bottom : 20px;
	text-decoration:underline;
}

.container {	
	margin-top : 65px;
}

img, svg {
    vertical-align: middle;
    width: 100px;
}

</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/main/header.jsp"%>
	<div class="container">
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
                        <td><span class="formatted-price" data-price="${refundDetailList.order_use_coupon}"></span></td>
                        <td><span class="formatted-price" data-price="${refundDetailList.order_dlv_fee}"></span></td>
                   		<td><span class="formatted-price" data-price="${refundDetailList.order_total_price}"></span></td>
                    <!--<td>${refundDetailList.order_use_coupon}</td>
                        <td>${refundDetailList.order_dlv_fee}</td>
                        <td>${refundDetailList.order_total_price}</td>  --> 
                        <td>${refundDetailList.order_delivery_info}</td>
                        <td>${refundDetailList.order_status}</td>
                        <td data-order-date="${refundDetailList.order_date}">${refundDetailList.order_date}</td>      
                	</c:forEach>
           	 	</tbody>
        	</table>
    	</div>
	</div>
</body>
</html>