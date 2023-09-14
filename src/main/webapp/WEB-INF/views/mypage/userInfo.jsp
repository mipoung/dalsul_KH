<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>
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

.user_info_header{
	-webkit-text-size-adjust: 100%;
	-webkit-tap-highlight-color: rgba(0,0,0,0);
	--swiper-theme-color: #007aff;
	-webkit-font-smoothing: antialiased;
	font-feature-settings: "tnum";
	font-variant: tabular-nums;
	font-size: 13px;
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
    font-size: 13px;
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
    font-size: 13px;
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
	float:right;
}
</style>
</head>
<body>
	<div class="container">
		<%@ include file="/WEB-INF/views/mypage/mypageCommon.jsp"%>
		<div id="user_info_div">
			<div class="user_info_header">
				<div class="title">회원정보</div>
			</div>
			<div id="user_info_detail">
				<div class="user-details-row">
					<div class="user-details-label">회원명</div>
					<div class="user-details-data">홍길동</div>
				</div>
				<div class="user-details-row">
					<div class="user-details-label">비밀번호</div>
					<div class="user-details-data">********</div>
				</div>
				<div class="user-details-row">
					<div class="user-details-label">이메일</div>
					<div class="user-details-data">tester@gmail.com</div>
				</div>
				<div class="user-details-row">
					<div class="user-details-label">휴대폰 번호</div>
					<div class="user-details-data">010-1234-5678</div>
				</div>
				<div class="style__UserEditLink-sc-1vzgze2-1 kGnFzH">수정</div>
				<div class="style__UserEditLink-sc-1vzgze2-1 kGnFzH">회원탈퇴</div>
			</div>
		</div>
	</div>
</body>
</html>