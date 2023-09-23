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

.form-util div{
	display: inline-block;
}

.form-util div:last-child {
	float : right ;
}


.row{
	vertical-align: middle;
	height: body;
}

</style>
<script>
	//쿠키 저장하기 
	// setCookie => saveid함수에서 넘겨준 시간이 현재시간과 비교해서 쿠키를 생성하고 지워주는 역할
	function setCookie(cookieName, value, exdays) {
		let exdate = new Date();
		exdate.setDate(exdate.getDate() + exdays);
		let cookieValue = escape(value) + ((exdays == null) ? "" : "; expires=" + exdate.toGMTString());
		document.cookie = cookieName + "=" + cookieValue;
	}
	
	// 쿠키 삭제
	function deleteCookie(cookieName) {
		let expireDate = new Date();
		expireDate.setDate(expireDate.getDate() - 1);
		document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
	}
	 
	// 쿠키 가져오기
	function getCookie(cookieName) {
		cookieName = cookieName + '=';
		let cookieData = document.cookie;
		let start = cookieData.indexOf(cookieName);
		let cookieValue = '';
		if (start != -1) { // 쿠키가 존재하면
			start += cookieName.length;
			let end = cookieData.indexOf(';', start);
			if (end == -1) // 쿠키 값의 마지막 위치 인덱스 번호 설정 
				end = cookieData.length;
			cookieValue = cookieData.substring(start, end);
		}
		return unescape(cookieValue);
	}

	$(function(){
		$(".row").css("margin-top",($("body").height()/4));
		
		// 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
	    let key = getCookie("dalsul");
	    $("#user_email").val(key); 
	     
	    // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
	    if($("#user_email").val() != ""){ 
	        $("#check_email").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
	    }
		
		// 회원가입 버튼 클릭 시
		$("#registerBtn").click(function(){
			window.location = "/register/termsView";
		});
		
		// 로그인 버튼 클릭 시
		$("#loginBtn").click(function(){
			$.ajax({
				url : "/login/userLoginProcess",
				type : "post",
				data : $("#loginForm").serialize(),
				success : function(data){
					if(data=="SUCCESS"){
						if($("#check_email").is(":checked")){ // ID 저장하기 체크했을 때,
				            setCookie("dalsul", $("#user_email").val(), 31); // 31일 동안 쿠키 보관
				        } else { // ID 저장하기 체크 해제 시,
				            deleteCookie("dalsul");
				        }
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
	<%@ include file="/WEB-INF/views/main/header.jsp"%>
		<div class="row">
			<div class="input-form col-md-6 mx-auto certified_div">
				<h2 class="mb-3">어서오세요!</h2>
				<form name="loginForm" id="loginForm">
					<!-- 이메일 입력 -->
					<div class="form-outline mb-3">
						<input type="email" id="user_email" name="user_email" class="form-control" placeholder="이메일을 입력해 주세요" /> 
					</div>
		
					<!-- 비밀번호 입력 -->
					<div class="form-outline mb-3">
						<input type="password" id="user_password" name="user_password" class="form-control" placeholder="비밀번호를 입력해 주세요" />
					</div>
		
					<div class="form-outline mb-4">
						<!-- Submit button -->
						<button type="button" id="loginBtn" class="btn btn-primary btn-block">로그인</button>
						<!-- Register buttons -->
						<button type="button" id="registerBtn" class="btn btn-secondary btn-block">이메일 회원가입</button>
					</div>
					<!-- 2 column grid layout for inline styling -->
					<div class="form-outline mb-4">
							<!-- 이메일 기억하기 -->
							<div class="form-util">
								<div id="">
									<input class="form-check-input" type="checkbox" id="check_email"/>
									<label class="form-check-label" for="check_email"> 이메일 기억하기 </label>
								</div>
								<div>
									<a href="/login/findAccount">아이디 / 비밀번호 찾기</a>
								</div>
							</div>
					</div>
				</form>
			</div>
			</div>
		</div>
</body>
</html>