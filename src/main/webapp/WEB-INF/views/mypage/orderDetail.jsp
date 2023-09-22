<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>
<script type="text/javascript">
$(function() {
    // refund 버튼 클릭 이벤트 핸들러 등록
    /* $("#refund").on("click", function() {
        var confirmResult = confirm("환불하시겠습니까?");
        if (confirmResult) {
            var detailNo = $(this).closest('tr').find('td:first-child').text();
            console.log(detailNo);
            $("#order_detail_no").val(detailNo);
            $("#refundForm").submit();
            
        } else {
            // 사용자가 취소(No)를 누른 경우 아무 동작 없음 (현재 페이지 유지)
        }
    }); */
    
    $("#refund").click(function(){
    	var confirmResult = confirm("환불하시겠습니까?");
        if (confirmResult) {
        	$.ajax({
        		url : "/mypage/refundDetailView",
        		method : "get",
        		data : {"order_no":$(".order_no:first").text()},
        		dataType : "text",
        		error : function(){
        			alert("시스템 오류, 잠시후 다시 시도해 주세요.");
        		}, success : function(resultData){
        			if(resultData=="SUCCESS"){
        				alert("환불 신청이 완료되었습니다");
        				location.href="/mypage/orderlistDetailView";
        			}else{
        				alert("환불 신청 도중 오류가 발생했습니다.\n잠시후 다시 시도해 주세요.");
        			}
        		}
        	});
        }
    });
});


</script>


<body>
    <h1>주문 상세 내역</h1>
    <div class="border border-success p-2 mb-2 whole-table">
     <form id="refundForm" method="get" action="/mypage/refundDetailView">
    	<input type="hidden" id="order_detail_no" name="order_detail_no" />
    </form>
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
                    <th scope="col">리뷰</th> 
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${orderListDetail}" var="orderListDetail">
                     <tr>
                        <td class="order_no">${orderListDetail.order_no}</td>
                        <td>${orderListDetail.product_no}</td>
                        <td>${orderListDetail.quantity}</td>
                        <td>${orderListDetail.order_use_coupon}</td>
                        <td>${orderListDetail.order_dlv_fee}</td>
                        <td>${orderListDetail.order_total_price}</td>
                        <td>${orderListDetail.order_delivery_info}</td>
                        <td>${orderListDetail.order_status}</td>
                        <td>${orderListDetail.order_date}</td>
                        <td><button class="btn btn-primary">리뷰</button></td> 
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    <div class="text-center">
        <button class="btn btn-danger" id="refund" name="refund">환불/취소</button>

        <a href="/" class="btn btn-secondary">메인 페이지 돌아가기</a> 
    </div>
</body>
</html>