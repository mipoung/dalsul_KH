<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>
<link rel="stylesheet" href="/resources/include/account/register/css/register.css"/>
<script src="/resources/include/account/register/js/register.js"></script>
<script src="/resources/include/common/js/chkRegex.js"></script>
</head>
<body>
	<h1>회원가입 화면</h1>
	<%-- 이름 :  --%>
	<div class="container">
		<div class="row">
			<div class="input-form col-md-6 mx-auto certified_div">
				<h2 class="mb-3">회원가입</h2>
				<form class="validation-form" name="registerForm" id="registerForm" novalidate>					
					<!-- 이메일 입력 -->
					<div class="mb-3">
						<label for="user_email">이메일</label>
						<input type="email" class="form-control" name="user_email" id="user_email" placeholder="예) yourmail@domain.com" required/>
						<button class="btn btn-primary btn-sm" name="send_certification_email" id="send_certification_email" type="button">인증메일발송</button>
						<button class="btn btn-primary btn-sm" name="reset_form_btn" id="reset_form_btn" type="button">다시입력</button>
						<div class="feedback"></div><br/>
					</div>
					
					<!-- 이메일 인증번호 입력 -->
					<div class="mb-3" id="certification_input">
						<label for="certification_code">인증번호</label>
						<input type="text"class="form-control" name="certification_code" id="certification_code" placeholder="예) 123456" required>
						<button class="btn btn-primary btn-sm btn-block" name="certification_btn" id="certification_btn" type="button">인증하기</button>
						<div class="feedback"></div><br/>
					</div>
					
					<!--  비밀번호 입력 -->
					<div class="mb-3">
						<label for="user_password">비밀번호</label>
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
					<button class="btn btn-primary btn-sm btn-block" name="register_btn" id="register_btn" type="button">회원가입</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>