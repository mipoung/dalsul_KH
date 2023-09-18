<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>
<style>
body {
	min-height: 100vh;
}

.input-form {
	max-width: 680px;
	margin-top: 80px;
	padding: 32px;
	background: #fff;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	-webkit-box-shadow: 0 10px 20px 0 rgba(0, 0, 0, 0.35);
	-moz-box-shadow: 0 10px 20px 0 rgba(0, 0, 0, 0.35);
	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.35)
}

.feedback{
	padding-top : 5px;
	font-weight : bold;
	color : red;
}

.form-util{
	margin-top:5px;
}

.form-util div{
	display: inline-block;
}

.form-util div:last-child {
	float : right ;
}
</style>
<script>
	$(function(){
		$("#registerBtn").click(function(){
			window.location = "/register/termsView";
		});
		
		$("#loginBtn").click(function(){
			$.ajax({
				url : "/login/userLoginProcess",
				type : "post",
				data : $("#loginForm").serialize(),
				success : function(data){
					if(data=="SUCCESS"){
						location.href="/";
					}else{
						Swal.fire({
							icon: 'error',
							title: '로그인 실패',
							html: '아이디 또는 비밀번호가 일치하지 않습니다'
						});
					}
				}, error(data){
					Swal.fire({
						icon: 'error',
						title: '시스템 오류',
						html: '잠시후 다시 시도해 주세요.'
					});
				}
			});
		});
	});
</script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="input-form col-md-6 mx-auto certified_div">
			<h2 class="mb-3">로그인</h2>
			<form name="loginForm" id="loginForm">
			<!-- 이메일 입력 -->
			<div class="form-outline mb-4">
				<input type="email" id="user_email" name="user_email" class="form-control" placeholder="이메일을 입력해 주세요" /> 
			</div><br>

			<!-- 비밀번호 입력 -->
			<div class="form-outline mb-4">
				<input type="password" id="user_password" name="user_password" class="form-control" placeholder="비밀번호를 입력해 주세요" />
			</div><br>

			<div class="form-outline mb-4">
				<!-- Submit button -->
				<button type="button" id="loginBtn" class="btn btn-primary btn-block mb-4">로그인</button>
				<!-- Register buttons -->
				<button type="button" id="registerBtn" class="btn btn-secondary btn-block mb-4">이메일 회원가입</button>
			</div>
			<!-- 2 column grid layout for inline styling -->
			<div class="form-outline mb-4">
				<div class="col d-flex justify-content-center">
					<!-- 이메일 기억하기 -->
					<div class="form-util">
						<div id="">
							<input class="form-check-input" type="checkbox" value="" id="form2Example31" checked />
							<label class="form-check-label" for="form2Example31"> 이메일 기억하기 </label>
						</div>
						<div>
							<a href="/login/findAccount">아이디 / 비밀번호 찾기</a>
						</div>
					</div>
				</div>
			</div>
		</form>
		</div>
		</div>
		</div>
</body>
</html>