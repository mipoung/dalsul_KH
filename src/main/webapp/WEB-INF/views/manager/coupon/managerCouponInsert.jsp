<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html lang="ko">
<!-- 관리자페이지 드롭다운 사용을 위해 필요한 스크립트 -->
<script type="text/javascript" src="/resources/include/common/bootstrap/js/bootstrap.bundle.min.js"></script>
    <meta charset="utf-8">
	<script type="text/javascript" src="/resources/include/coupon/couponInsert.js"></script>
  </head>
  <body>
    <form name="useCoupon" id="useCoupon">
    	<input type="text" placeholder="쿠폰이름" name="coupon_name" id="coupon_name"/>	
    	<input type="number" placeholder="할인가격" name="coupon_discount" id="coupon_discount" min="500"/>	
    	<input type="number" placeholder="발급량 제한" name="coupon_limit" id="coupon_limit" min="0"/>	
    	 <label><input type="radio" name="coupon_status" value="1" checked>발급 가능 설정</label>
    	 <label><input type="radio" name="coupon_status" value="0">발급 불가능 설정</label>
    	<input type="button" id="insertCouponBtn" name="insertCouponBtn" value="쿠폰추가">
    </form>
  </body>
</html>