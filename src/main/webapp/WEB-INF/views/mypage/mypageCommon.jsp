<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.mypage_menu {
	-webkit-text-size-adjust: 100%;
	-webkit-tap-highlight-color: rgba(0, 0, 0, 0);
	--swiper-theme-color: #007aff;
	-webkit-font-smoothing: antialiased;
	font-feature-settings: "tnum";
	font-variant: tabular-nums;
	font-size: 13px;
	font-weight: 400;
	line-height: 13px;
	font-family: Spoqa Han Sans Neo, "sans-serif";
	color: inherit;
	box-sizing: border-box;
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
}

#user_info {
	-webkit-text-size-adjust: 100%;
	-webkit-tap-highlight-color: rgba(0, 0, 0, 0);
	--swiper-theme-color: #007aff;
	-webkit-font-smoothing: antialiased;
	font-feature-settings: "tnum";
	font-variant: tabular-nums;
	font-size: 13px;
	font-weight: 400;
	line-height: 13px;
	text-align: center;
	font-family: Spoqa Han Sans Neo, "sans-serif";
	color: inherit;
	box-sizing: border-box;
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
	font-size: 13px;
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
</style>
<div class="mb-3 mypage_menu">
	<div class="member-info-wrapper" id="user_info">
		<div class="name-header">
			<div class="name-text">TEST님</div>
		</div>
		<div class="member-info-column-wrapper">
			<div class="member-info-column">
				<div class="member-info-label blue first">잔여 포인트 : 1,000</div>
				<div class="member-info-label blue">잔여 쿠폰 : 2</div>
			</div>
		</div>
	</div>
	<div class="side-bar-wrapper" id="mypage_side_bar">
		<div>
			<div class="side-bar-row">
				<div class="SideBarStyle__SideBarLabel-sc-totysz-2 gNNtxj">구독관리</div>
				<!-- <img src="https://d38cxpfv0ljg7q.cloudfront.net/icon.s2.calendar.gear.png"alt="subscription"> -->
			</div>
		</div>
		<div>
			<div class="side-bar-row">
				<div class="SideBarStyle__SideBarLabel-sc-totysz-2 fEDWQV">주문
					내역</div>
				<!-- <img src="https://d38cxpfv0ljg7q.cloudfront.net/icon.s2.receipt.check.png" alt="orders"> -->
			</div>
		</div>
		<div>
			<div class="side-bar-row">
				<div class="SideBarStyle__SideBarLabel-sc-totysz-2 fEDWQV">취소
					/ 환불 내역</div>
				<!-- <img src="/images/modules/myDamhwa/cs-orders-icon.png" alt="csOrders"> -->
			</div>
		</div>
		<div>
			<div class="jsx-2510134797 tooltip-container">
				<div class="side-bar-row">
					<div class="SideBarStyle__SideBarLabel-sc-totysz-2 fEDWQV">리뷰</div>
					<!-- <img src="https://d38cxpfv0ljg7q.cloudfront.net/icon.s2.bubble.star.png" alt="reviews"> -->
				</div>
			</div>
		</div>
		<div>
			<div class="side-bar-row">
				<div class="SideBarStyle__SideBarLabel-sc-totysz-2 fEDWQV">회원정보</div>
				<!-- <img src="https://d38cxpfv0ljg7q.cloudfront.net/icon.s2.person.card.png" alt="userInfo"> -->
			</div>
		</div>
		<div>
			<div class="side-bar-row">
				<div class="SideBarStyle__SideBarLabel-sc-totysz-2 fEDWQV">배송지
					관리</div>
				<!-- <img src="https://d38cxpfv0ljg7q.cloudfront.net/icon.s2.truck.png" alt="shippingAddress"> -->
			</div>
		</div>
	</div>
</div>