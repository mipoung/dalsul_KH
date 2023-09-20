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
</style>
<script>
	$(function(){
		$("#loginBtn").click(function(){
			$.ajax({
				url : "/manager/managerLoginProcess",
				type : "post",
				data : $("#loginForm").serialize(),
				success : function(data){
					if(data=="SUCCESS"){
						location.href="/manager/managerMain";
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
				<input type="email" id="manager_email" name="manager_email" class="form-control" placeholder="이메일을 입력해 주세요" /> 
			</div>

			<!-- 비밀번호 입력 -->
			<div class="form-outline mb-4">
				<input type="password" id="manager_password" name="manager_password" class="form-control" placeholder="비밀번호를 입력해 주세요" />
			</div>

			<div class="form-outline mb-4">
				<!-- Submit button -->
				<button type="button" id="loginBtn" class="btn btn-primary btn-block">로그인</button>
				<!-- Register buttons -->
			</div>
		</form>
		</div>
		</div>
		</div>
</body>
</html>