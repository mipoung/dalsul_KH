<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true" %>	
<link rel="stylesheet" type="text/css"
	href="/resources/include/mainpage/css/header.css" />
<script src="/resources/include/mainpage/js/header.js"></script>
	
<div id="main" class="fixed-top">
		<ul class="nav fixied-top">
			<nav id="navbar-example1" class="navbar bg-white px-3 mb-3" style="background-color:white">
				<a class="navbar-brand" href="/"><img id="logo"
					src="/resources/images/dalsul_logo.png"></a>
				<ul class="nav nav-pills">
					<li class="nav-item" id="subscribe"><a class="nav-link"
						href="/">구독</a></li>
					<li class="nav-item" id="store"><a class="nav-link"
						href="/total">스토어</a></li>
					<form class="d-flex" role="search">
						<input class="form-control me-2" type="search"
							placeholder="무엇을 찾고 계신가요?" aria-label="Search" id="search">
					</form>
				</ul>
			</nav>
			<nav id="navbar-example2" class="navbar bg-white px-3 mb-3" data-bs-theme="blue">
				<c:choose>
                <c:when test="${empty sessionScope.userLogin}">
                    <!-- 사용자가 로그인하지 않은 경우 -->
                    <a class="navbar-brand" href="/login/userLoginView">로그인/회원가입 ></a>
                </c:when>
                <c:otherwise>
                    <!-- 사용자가 로그인한 경우 -->
                    <a class="navbar-brand" href="/mypage/userInfoDetailView">${userLogin.user_name} 님</a>
                    <a class="navbar-brand" style="opacity: 0.3; font-size: 16px;"  href="/login/userLogout">로그아웃</a>
                </c:otherwise>
            	</c:choose>
				<ul class="nav nav-pills">
					<li class="nav-item"><a class="nav-link"
						href="/faq/FAQList">고객센터</a></li>
				</ul>
				<a class="nav-link" href="/cartList"><img id="img2"
					src="/resources/images/mainpage/basketIcon.png"></a>
			</nav>
		</ul>
	</div>
	