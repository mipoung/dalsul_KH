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
</style>

<script>
	$(function(){
		$.ajax({
			url : "/mypage/getUserInfo",
			method : "post",
			data : {"user_no" : ${uvo.user_no}},
			dataType : "json",
			success : function(resultData){
				$("#user_name").text(resultData.user_name);
				$("#user_email").text(resultData.user_email);
				$("#user_phone_num").text(resultData.user_phone_num.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3'));
			}, error : function(){
				alert("시스템 오류");
			}
		});
		
		$(".delete-user").click(function(){
			if(prompt("정말 탈퇴하시겠어요? 😥\n탈퇴를 원하시면 '탈퇴합니다'를 입력해 주세요.")==="탈퇴합니다"){
				$.ajax({
					url : "/edit/deleteUserAccount",
					method : "post",
					dataType : "text",
					success : function(result){
						if(result=="SUCCESS"){
							alert("정상적으로 탈퇴되었습니다");
							location.href = "/login/userLogout";	
						}else{
							Swal.fire({
								icon: 'error',
								title: '탈퇴 진행도중 오류가 발생하였습니다',
								html: '잠시후 다시 시도해 주세요'
							});	
						}
					}, error(){
						Swal.fire({
							icon: 'error',
							title: '시스템 오류...',
							html: '잠시후 다시 시도해 주세요'
						});
						return;
					}
				})
			}
		});
	});
</script>
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
					<div class="user-details-data" id="user_name"></div>
				</div>
				<div class="user-details-row">
					<div class="user-details-label">비밀번호</div>
					<div class="user-details-data">********</div>
				</div>
				<div class="user-details-row">
					<div class="user-details-label">이메일</div>
					<div class="user-details-data" id="user_email"></div>
				</div>
				<div class="user-details-row">
					<div class="user-details-label">휴대폰 번호</div>
					<div class="user-details-data" id="user_phone_num"></div>
				</div><br>
				<div class="update-password"><a href="/edit/updatePasswordView">비밀번호 변경</a></div>
				<div class="delete-user"><a href="javascript:void(0);">회원 탈퇴</a></div>
			</div>
		</div>
	</div>
</body>
</html>