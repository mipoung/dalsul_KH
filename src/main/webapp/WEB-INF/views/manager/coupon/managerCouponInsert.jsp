<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html lang="ko">
    <meta charset="utf-8">
	<script type="text/javascript" src="/resources/include/coupon/couponInsert.js"></script>
	<script type="text/javascript">
		$(function() {
			
		});
	</script>
  </head>
  <body>
     <!-- 매니저 헤더 -->
   <%@ include file="/WEB-INF/views/manager/managerHeader.jsp"%>
   
    <h5>쿠폰테이블 CRUD 제약 조건없음(쿠폰 정보생성o ,조회  관리자 삭제 = 로직오류(불가능), 관리자 정보 쿠폰수정 = 발급가능여부만 수정구현해야함) </h5>
    <form name="useCoupon" id="useCoupon">
    	<input type="text" placeholder="쿠폰이름" name="coupon_name" id="coupon_name"/>	
    	<input type="number" placeholder="할인가격" name="coupon_discount" id="coupon_discount" min="500"/>	
    	<input type="number" placeholder="발급량 제한" name="coupon_limit" id="coupon_limit" min="0"/>	
    	 <label><input type="radio" name="coupon_status" value="1" checked> 발급 가능</label>
    	 <label><input type="radio" name="coupon_status" value="0"> 발급 불가능</label>
    </form>
    <!--  -->
    	<input type="button" id="insertCouponBtn" name="insertCouponBtn" value="쿠폰추가">
    	<input type="button" id="couponListBtn" name="couponListBtn" value="전체생성쿠폰 조회" onclick="location.href='/coupon/couponList'">
  </body>
</html>