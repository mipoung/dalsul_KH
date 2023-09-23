<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>
<script src="/resources/include/common/js/chkRegex.js"></script>
<script>
const passwordChkRegex = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!#$%()*+,-./:;=?@[\]^_~|{}])[A-Za-z\d!#$%()*+,-./:;=?@[\]^_~|{}]{8,16}$/;
$(function(){
	$("#user_info_div").css("margin-top",window.innerHeight/4);
	
	// 비밀번호 형식 체크
	$("#user_password").on("keyup blur", function() {
		if (passwordChkRegex.test($(this).val())) {
			$(this).siblings(".feedback").text("사용 가능한 비밀번호 입니다").css("color", "green");
		} else {
			$(this).siblings(".feedback").text("사용 불가능한 비밀번호 입니다").css("color", "red");
		}
	});

	// 비밀번호 확인 체크
	$("#password_confirm").on("keyup blur", function() {
		if ($("#user_password").val() != $(this).val()) {
			$(this).siblings(".feedback").text("비밀번호가 일치하지 않습니다").css("color", "red");
		} else {
			$(this).siblings(".feedback").text("비밀번호가 일치합니다").css("color", "green");
		}
	});
	
	$("#change_password_btn").click(function(){
		if (!chkPassword("#user_password")) return;
		else if (!chkPwdConfirm("password_confirm")) return;
		
		$.ajax({
			url : "/edit/updatePasswordchk",
			method : "post",
			data : {
						"userPassword" : $("#prev_password").val(),
						"changePassword" : $("#user_password").val()
				   },
			dataType : "text",
			success : function(result){
				if(result=="SUCCESS"){
					
					Swal.fire({
						icon: 'success',
						title: '비밀번호가 변경되었습니다',
						html: '다시 로그인해주세요'
					}).then( ()=>{
						location.href = "/login/userLogout";
					});
				} else {
					Swal.fire({
						icon: 'error',
						title: '현재 비밀번호가 일치하지 않습니다',
						html: '비밀번호를 다시 입력해 주세요'
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
		});
	});
	
});
</script>
<style>
#change_password_btn{
	float:right; 
}

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
    border-radius: 20px;
    border: 1px solid rgb(224, 224, 224);
}

#user_info_div > div {
	margin : 0 auto;
}

.certified_div{
	margin : 20px 0px;
}
</style>
</head>
<body>
	<div class="container">
	<%@ include file="/WEB-INF/views/main/header.jsp"%>
	<div id="user_info_div">
		<div class="row">
			<div class="input-form col-md-10 mx-auto certified_div">
				<h3 class="mb-3">비밀번호 변경</h3>
				<form class="validation-form" name="registerForm" id="registerForm" novalidate>					
					<!--  비밀번호 입력 -->
					<div class="mb-3">
						<label for="prev_password">현재 비밀번호</label>
						<input type="password"class="form-control" name="prev_password" id="prev_password" required>
						<div class="feedback"></div><br/>
					</div>
					
					<!--  비밀번호 입력 -->
					<div class="mb-3">
						<label for="user_password">변경 비밀번호</label>
						<input type="password"class="form-control" name="user_password" id="user_password" placeholder="8~16자 영어, 숫자, 특수문자(&quot;, &apos;, &lt;, &gt;, &amp; 불가능) 조합(영어 대소문자 구분)" required>
						<div class="feedback"></div><br/>
					</div>
					
					<!-- 비밀번호 확인 -->
					<div class="mb-3">
						<label for="password_confirm">비밀번호 확인</label>
						<input type="password"class="form-control" name="password_confirm" id="password_confirm" required>
						<div class="feedback"></div><br/>
					</div>
					
					<!-- 회원 가입 버튼 -->
					<button class="btn btn-primary btn-sm btn-block" name="change_password_btn" id="change_password_btn" type="button">비밀번호 변경</button>
				</form>
			</div>
		</div>
	</div>
	</div>
</body>
</html>