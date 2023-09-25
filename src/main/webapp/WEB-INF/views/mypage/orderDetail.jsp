<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>
<%@ include file="/WEB-INF/views/main/header.jsp"%>
<%@ include file="/WEB-INF/views/mypage/mypageCommon.jsp"%>
<script type="text/javascript">
$(function() {

    
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
    /* 페이지 전체 스타일 */
    body {
        font-family: Arial, sans-serif;
        background-color: #f0f0f0;
        margin: 0;
        margin-top: 70px;
        padding: 0;
    }

    /* 페이지 제목 스타일 */
    h1 {
        color: #333;
        margin-top: 20px;
        text-align: center;
    }

    /* 테이블 스타일 */
    table.table {
        width: 100%;
        border-collapse: collapse;
    }

    table.table th,
    table.table td {
        padding: 8px;
        text-align: center;
    }

    table.table th {
        background-color: #f2f2f2;
    }

    /* 이미지 스타일 */
    td > img[src] {
        width: 100px;
    }

    /* 환불 버튼 스타일 */
    #refund {
        background-color: #d9534f;
        color: #fff;
        padding: 10px 20px;
        border: none;
        border-radius: 3px;
        cursor: pointer;
    }

    /* 메인 페이지 돌아가기 버튼 스타일 */
    .btn-primary {
        background-color: #007bff;
        color: #fff;
        padding: 10px 20px;
        border: none;
        border-radius: 3px;
        cursor: pointer;
    }

    /* 전체 테이블 스타일 */
    .whole-table {
        border: 1px solid #5bc0de;
        border-radius: 5px;
        padding: 10px;
        margin-bottom: 20px;
    }

    /* 주문 상세 번호 스타일 */
    .order_no {
        font-weight: bold;
    }

    /* 리뷰 작성 버튼 스타일 */
    .btn-primary.ReviewInsertFormBtn {
        background-color: #5bc0de;
    }
    
    	td > img[src]{
		width :100px;
	}
	
</style>


<body>
    <h1>주문 상세 내역</h1>
    <c:if test="${not empty msg}">
	   <script type="text/javascript">
	       alert('${msg}');
	       
	   </script>
	</c:if>
    
    <div class="border border-success p-2 mb-2 whole-table">
     <form id="refundForm" method="get" action="/mypage/refundDetailView">
    	<input type="hidden" id="order_detail_no" name="order_detail_no" />
    </form>
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
                    <th scope="col">리뷰</th> 
                </tr>
            </thead>
            <tbody>
             <c:forEach items="${orderListDetail}" var="orderListDetail">
                <tr>
                    <td class="order_no" data-order-no="${orderListDetail.order_no}">${orderListDetail.order_no}</td>
                    <td data-product-no="${orderListDetail.product_no}" data-product-name="${orderListDetail.product_name}">${orderListDetail.product_name}</td>
                    <td><img data-src="/resources/images/mainpage/product/${orderListDetail.product_main_image}" src="/resources/images/mainpage/product/${orderListDetail.product_main_image}"></td>
                    <td>${orderListDetail.quantity}</td>
                    <td>${orderListDetail.order_use_coupon}</td>
            <!--    <td>${orderListDetail.order_dlv_fee}</td> --> 
                    <td><span class="formatted-price" data-price="${orderListDetail.order_dlv_fee}"></span></td>
                    <td><span class="formatted-price" data-price="${orderListDetail.order_total_price}"></span></td>
                    <td>${orderListDetail.order_delivery_info}</td>
                    <td>${orderListDetail.order_status}</td>
                    <td data-order-date="${orderListDetail.order_date}">${orderListDetail.order_date}</td>
                    <td>
	                        <!-- 리뷰 작성 여부에 따라 버튼 상태 변경 -->
	                         <c:choose>
				                <c:when test="${productReviewMap[orderListDetail.product_no] == 0}">
				                    <button class="btn btn-primary ReviewInsertFormBtn" data-bs-toggle="modal" data-bs-target="#exampleModal">리뷰 작성</button>
				                    
				                </c:when>
				                <c:otherwise>
				                    <p>리뷰 작성완료</p>
				                </c:otherwise>
				             </c:choose>
				             <!-- 리뷰 작성 여부에 따라 버튼 상태 변경 끝 -->
                        </td> 
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    <div class="text-center">
        <button class="btn btn-danger" id="refund" name="refund">환불/취소</button>
        <!--  <a href="/" class="btn btn-secondary">메인 페이지 돌아가기</a> -->
        <a href="/" class="btn btn-primary" tabindex="-1" role="button" aria-disabled="true">메인 페이지 돌아가기</a>
    </div>
    
    
<%@ include file="/WEB-INF/views/reviewBoard/reviewWrite.jsp"%>