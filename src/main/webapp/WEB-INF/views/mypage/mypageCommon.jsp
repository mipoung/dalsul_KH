<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
body{
	font-family: 'Noto Sans KR', sans-serif;
}

.mypage_menu, #user_info{
	-webkit-text-size-adjust: 100%;
	-webkit-tap-highlight-color: rgba(0, 0, 0, 0);
	--swiper-theme-color: #007aff;
	-webkit-font-smoothing: antialiased;
	font-feature-settings: "tnum";
	font-variant: tabular-nums;
	font-size: 15px;
	font-weight: 400;
	line-height: 13px;
	color: inherit;
	box-sizing: border-box;
}

.mypage_menu {
	width: 1144px;
	margin: 0px auto;
	text-align: center;
	max-width: 1144px;
	height: 110px;
	border-radius: 10px;
	background-color: rgb(255, 255, 255);
	display: flex;
	-webkit-box-pack: justify;
	justify-content: space-between;
	-webkit-box-align: center;
	align-items: center;
	border: 1px solid rgb(224, 224, 224);
	margin-bottom: 10px;
	padding: 23px 0px 23px 22px;
	margin-top : 15px;
}

#user_info {
	min-width: 364px;
	height: 100%;
	display: flex;
	-webkit-box-pack: justify;
	justify-content: space-between;
	-webkit-box-align: center;
	align-items: center;
	border-right: 0.5px solid rgb(178, 178, 178);
	padding: 6px 31px 0px 0px;
}

#mypage_side_bar {
	-webkit-text-size-adjust: 100%;
	-webkit-tap-highlight-color: rgba(0, 0, 0, 0);
	--swiper-theme-color: #007aff;
	-webkit-font-smoothing: antialiased;
	font-feature-settings: "tnum";
	font-variant: tabular-nums;
	font-size: 15px;
	font-weight: 400;
	line-height: 13px;
	text-align: center;
	font-family: Spoqa Han Sans Neo, "sans-serif";
	color: inherit;
	box-sizing: border-box;
	width: 100%;
	display: flex;
	justify-content: space-evenly;
	-webkit-box-align: center;
	align-items: center;
	padding: 6px 0px;
}

.benefit > div{
	text-align : left;
	padding : 3px 0px;
}

.mypage_menu_detail img{
	width : 48px;
	margin : 5px;
}
</style>

<script>
$(function(){
	// 현재 페이지 url의 path정보 가져오기 ex)userInfoDetailView
	const page = (window.location.pathname).replace("/mypage/","");
	$("."+page).css("color","#FFBB00");
	
	$(".go_detail").hover(function() {        
        $(this).css({
        	"cursor" : "pointer",
        	"transition" : "color 0.3s",
        	"color" : "#FFBB00"
        });
	}, function(){
		$(this).css({
        	"cursor" : "pointer",
        	"transition" : "color 0.3s",
        	"color" : "#000000"
        });
	});
	
	// 마이페이지 이동
	$(".go_detail").click(function(){
		location.href="/mypage/"+$(this).children().attr("class");
	});
	
});
</script>
<div class="mb-3 mypage_menu">
	<div class="member-info-wrapper" id="user_info">
		<div class="name-header">
			<div class="name-text">${userLogin.user_name}님</div>
		</div>
		<div class="user_info">
			<div class="benefit">
				<div class="point">잔여 포인트 : 1,000</div>
				<div class="coupon">잔여 쿠폰 : 2</div>
			</div>
		</div>
	</div>
	<div class="mypage_menu_detail" id="mypage_side_bar">
		<div class="go_detail">
			<div class="userInfoDetailView">
				<div>회원 정보관리</div>
				<img src="/resources/images/mypage/mypageHeader/userinfo.png"alt="userInfo">
			</div>
		</div>
		<div class="go_detail">
			<div class="orderlistDetailView">
				<div>주문 내역</div>
				<img src="/resources/images/mypage/mypageHeader/receipt.png" alt="order_list">
			</div>
		</div>
		<div class="go_detail">
			<div class="refundDetailView">
				<div>취소 / 환불 내역</div>
				<img src="/resources/images/mypage/mypageHeader/refund.png" alt="csOrders_list">
			</div>
		</div>
		<div class="go_detail">
			<div class="reviewDetailView">
				<div>리뷰</div>
				<img src="/resources/images/mypage/mypageHeader/review.png" alt="reviews">
			</div>
		</div>
		<div class="go_detail">
			<div class="userAddrInfo">
				<div>배송지 관리</div>
				<img src="/resources/images/mypage/mypageHeader/truck.png" alt="address">
			</div>
		</div>
	</div>
</div>