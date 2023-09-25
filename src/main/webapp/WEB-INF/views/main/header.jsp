<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true" %>	
<link rel="stylesheet" type="text/css"
	href="/resources/include/mainpage/css/header.css" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>



<style>
* {
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: bold;
}
</style>	
	
<script src="/resources/include/mainpage/js/header.js"></script>

<script>

$(function() {

	 var isUserLoggedIn = ${not empty userLogin.user_no};
	    
	// 링크를 클릭했을 때 처리
	document.getElementById("imgtag").addEventListener("click", function(event) {
    
	event.preventDefault(); // 기본 동작을 중지 (링크 클릭 시 이동을 막음)

    if (isUserLoggedIn) {
        // 사용자가 로그인한 경우, 장바구니 페이지로 이동
        window.location.href = "/cart/cartList";
    } else {
        	// 사용자가 로그인하지 않은 경우, 로그인 페이지로 이동
        	window.location.href = "/login/userLoginView";
    	}
	});
});
</script>
	
<div id="main" class="fixed-top">
		<ul class="nav fixied-top">
			<nav id="navbar-example1" class="navbar bg-white px-3 mb-3" style="background-color:white">
				<a class="navbar-brand" href="/"><img id="logo"
					src="/resources/images/dalsul_logo.png"></a>
				<ul class="nav nav-pills">				
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

			<c:choose>
				<c:when test="${empty sessionScope.userLogin}">
					<!-- 사용자가 로그인되어 있지 않은 경우 -->
					<a class="nav-link" href="/login/userLoginView"><img id="img2"
						src="resources/images/mainpage/basketIcon.png"></a>
				</c:when>
				<c:otherwise>
					<!-- 사용자가 로그인된 경우 -->
					<a class="nav-link" href="/cart/cartList"><img id="img2"
						src="/resources/images/mainpage/basketIcon.png"></a>
				</c:otherwise>
			</c:choose>
			</nav>
		</ul>
	</div>
	