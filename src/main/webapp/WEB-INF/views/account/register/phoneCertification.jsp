<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>
<link rel="stylesheet" href="/resources/include/account/register/css/phoneCertification.css"/>
<script src="/resources/include/account/register/js/phoneCertification.js"></script>
<script src="/resources/include/common/js/chkRegex.js"></script>
</head>
<body>
	<div class="container">
	<%@ include file="/WEB-INF/views/main/header.jsp"%>
		<div class="row">
			<div class="input-form col-md-6 mx-auto certified_div">
				<h2 class="mb-3">성인인증</h2>
				<form class="validation-form" name="certificationForm" id="certificationForm" novalidate>
					<!-- 이름 입력 -->
					<div class="mb-3">
						<label for="user_name">이름</label>
						<input type="text" class="form-control" name="user_name" id="user_name" placeholder="예) 홍길동" required>
						<div class="feedback"></div><br/>
					</div>
					
					<!-- 생년월일 입력 -->
					<div class="mb-3">
						<label for="user_birth">생년월일</label>
						<input type="text"class="form-control" name="user_birth" id="user_birth" placeholder="예) 19870123" required>
						<div class="feedback"></div><br/>
					</div>
					
					<!-- 휴대전화번호 입력 -->
					<div class="mb-3">
						<label for="user_phone_num">휴대전화번호</label>
						<input type="text"class="form-control" name="user_phone_num" id="user_phone_num" placeholder="예) 01012345678" required>
						<button class="btn btn-primary btn-sm" name="send_certification_num" id="send_certification_num" type="button">인증번호발송</button>
						<button class="btn btn-primary btn-sm" name="reset_form_btn" id="reset_form_btn" type="button">다시입력</button>
						<div class="feedback"></div><br/>
					</div>
					
					<!-- 휴대전화 인증번호 입력 -->
					<div class="mb-3" id="certification_input">
						<label for="certification_num">인증번호</label>
						<input type="text"class="form-control" name="certification_num" id="certification_num" placeholder="예) 123456" required>
						<button class="btn btn-primary btn-sm btn-block" name="certification_btn" id="certification_btn" type="button">인증하기</button>
						<div class="feedback"></div><br/> 
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>