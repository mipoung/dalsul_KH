<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>
<script src="/resources/include/common/js/chkRegex.js"></script>
<script>
const passwordChkRegex = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!#$%()*+,-./:;=?@[\]^_~|{}])[A-Za-z\d!#$%()*+,-./:;=?@[\]^_~|{}]{8,16}$/;
$(function(){
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
			url : "",
			method : "post",
			data : {"userPassword" : $("#prev_password").val()},
			dataType : "text",
			success : function(result){
				
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
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="input-form col-md-6 mx-auto certified_div">
				<h2 class="mb-3">비밀번호 변경</h2>
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
</body>
</html>