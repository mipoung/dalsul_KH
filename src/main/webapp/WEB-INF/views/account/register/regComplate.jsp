<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>
<title>회원가입 완료</title>
<link rel="stylesheet" href="/resources/include/account/register/css/terms.css"/>
<script src="/resources/include/account/register/js/terms.js"></script>
</head>
<body>
	<div class="container">
	<%@ include file="/WEB-INF/views/main/header.jsp"%>
	<div id="user_info_div">
			<div class="input-form col-md-10 mx-auto certified_div">
				<h2 class="mb-6">어서오세요!</h2>
				<h5>이용 약관 동의 후 회원가입을 진행할 수 있어요</h5>
				<form class="validation-form" name="terms_form" id="terms_form" novalidate>
					<label class="form-check-label" for="agreeAll">
						<input class="form-check-input" type="checkbox" value="agreeAll" id="agreeAll">
						모두 동의하기
  					</label><br>
  					
  					<textarea class="form-control" id="useTermsContent" rows="8" readonly="readonly">
제 1조 (목적)
이 약관은 담화컴퍼니 주식회사(전자상거래 사업자)(이하 "회사")가 운영하는 인터넷사이트 달술(이하 "달술")에서 제공하는 전자상거래 관련 서비스(이하 "서비스")를 이용함에 있어 달술와 이용자의 권리, 의무 및 책임사항을 규정함을 목적으로 합니다.
※ 「PC통신, 스마트폰 앱, 무선 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 준용합니다」

제 2조 (정의)
① "달술"이란 회사가 재화 또는 용역(이하 "재화 등"이라 함)을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 등을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 서비스를 운영하는 사업자의 의미로도 사용합니다.
② "이용자"란 "달술"에 접속하여 이 약관에 따라 "달술"가 제공하는 서비스를 받는 회원 및 비회원을 말합니다.
③ "회원"이라 함은 "달술"에 회원등록을 한 자로서, 계속적으로 "달술"가 제공하는 서비스를 이용할 수 있는 자를 말합니다.
④ "비회원"이라 함은 회원에 가입하지 않고 "달술"가 제공하는 서비스를 이용하는 자를 말합니다.
⑤ "콘텐츠"란 회사 또는 이용자가 서비스 상에 게시 또는 등록하는 모든 글, 사진, 동영상, 각종 파일, 링크, 회원소개 등(부호, 문자, 영상, 그림 등 그 형태를 불문합니다) 달술 내에서 게시 또는 사용되는 일체의 정보를 말합니다.
  					</textarea>
  					<input class="form-check-input" type="checkbox" value="useTerms" id="useTerms">
  					<label class="form-check-label" for="useTerms">이용 약관 동의 *(필수)</label><br><br>
  					
  					<textarea class="form-control" id="personalInfoTermsContent" rows="8" readonly="readonly">
달술 주식회사(이하 “회사”)는 개인정보 보호 관련 법령에 따라 고객의 개인정보를 보호하고 이와 관련한 고충을 신속하고 원활하게 처리할 수 있도록 하기 위하여 다음과 같이 개인정보 처리방침을 수립·공개합니다.

“회사”는 개인정보 처리방침 페이지를 통하여 이용자들이 제공하는 개인정보가 어떠한 용도와 방식으로 이용되고 있으며 개인정보보호를 위해 어떠한 조치가 취해지고 있는지 알려 드립니다. “회사”는 해당 페이지를 홈페이지 첫 화면에 공개함으로써 이용자들이 언제나 용이하게 보실 수 있도록 조치하고 있습니다. 개인정보 처리방침을 개정하는 경우나 개인정보 처리방침이 변경될 경우 또한 개인정보 처리방침 페이지를 통해 고지하고 있습니다. 이용자들께서는 사이트 방문 시 수시로 확인하실 것을 권장드립니다.
  					</textarea>
  					
  					<input class="form-check-input" type="checkbox" value="personalInfoTerms" id="personalInfoTerms">
  					<label class="form-check-label" for="personalInfoTerms">개인정보 수집 및 이용 동의 *(필수)</label><br><br>
  					
					<!-- 회원 가입 버튼 -->
					<button class="btn btn-primary btn-sm btn-block" name="agreeTermsBtn" id="agreeTermsBtn" type="submit" disabled="disabled">동의하고 성인인증 하기</button>
				</form>
			</div>
		</div>
		</div>
</body>
</html>