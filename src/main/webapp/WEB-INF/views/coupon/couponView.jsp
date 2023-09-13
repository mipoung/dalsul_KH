<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html lang="ko">
    <meta charset="utf-8">
    <script type="text/javascript">
    $(function() {
        $("#insertCouponBtn").click(function() {
            // 사용자가 입력한 쿠폰 정보 가져오기
            let couponName = $("#coupon_name").val();
            let couponDiscount = $("#coupon_discount").val();
            let couponLimit = $("#coupon_limit").val();
            let couponAvailability = $("#coupon_availability").is(":checked");

            // Ajax 요청을 통해 서버에 쿠폰 정보 전송
            $.ajax({
                // 요청할 URL 주소
                url: "/your-server-endpoint-url", // 실제 서버 엔드포인트 URL로 변경해야 합니다.
                // 요청 방식
                type: "POST",
                // 전송할 데이터
                data: {
                    couponName: couponName,
                    couponDiscount: couponDiscount,
                    couponLimit: couponLimit,
                    couponAvailability: couponAvailability
                },
                dataType: "text",
                error: function() {
                    alert('시스템 오류입니다. 다시 시도하시거나 관리자에게 문의하세요.');
                },
                success: function(resultData) {
                    if (resultData === "쿠폰추가성공") {
                        alert('쿠폰 정보가 성공적으로 추가되었습니다.');
                        // 입력 필드 초기화
                        $("#coupon_name").val("");
                        $("#coupon_discount").val("");
                        $("#coupon_limit").val("");
                        $("#coupon_availability").prop("checked", false);
                    } else {
                        alert('시스템 오류입니다. 다시 시도하시거나 관리자에게 문의하세요.');
                    }
                }
            });
        });
    });

    </script>
    
  </head>
  <body>
    <h5>쿠폰테이블 CRUD 제약 조건없음(정보생성,삭제,조회= 관리자 수정은 불가능,) </h5>
    <form name="useCoupon" id="useCoupon">
    	<input type="text" placeholder="쿠폰이름" name="coupon_name" id="coupon_name"/>	
    	<input type="number" placeholder="할인가격" name="coupon_discount" id="coupon_discount"/>	
    	<input type="number" placeholder="발급량 제한" name="coupon_limit" id="coupon_limit"/>	
    	<input type="radio" placeholder="발급가능여부(체크시 발급 불가설정)" name="coupon_name" id="coupon_name"/>	
    </form>
    	<button type="button" id="insertCouponBtn" name="insertCouponBtn" value="쿠폰정보추가"></button>
  </body>
</html>