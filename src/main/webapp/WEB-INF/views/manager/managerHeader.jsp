 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <script>
 	$(function(){
 		$("#managerLogoutBtn").click(function(){
 	 		location.href = "/manager/managerLogout";
 	 	});
 	});
 </script>
 <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	  <div class="container-fluid">
	    <a class="navbar-brand" href="/manager/managerMain">달술 관리자 페이지</a>
	    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDarkDropdown" aria-controls="navbarNavDarkDropdown" aria-expanded="false" aria-label="Toggle navigation">
	      <span class="navbar-toggler-icon"></span>
	    </button>
	    <div class="collapse navbar-collapse" id="navbarNavDarkDropdown">
	    
	      <ul class="navbar-nav">
	        <li class="nav-item dropdown">
	          <button class="btn btn-dark dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
	            회원관리
	          </button>
	          <ul class="dropdown-menu dropdown-menu-dark">
	            <li><a class="dropdown-item" href="/manager/user/userManagement">회원 관리</a></li>
	          </ul>
	        </li>
	      </ul>
	      
	      <ul class="navbar-nav">
	        <li class="nav-item dropdown">
	          <button class="btn btn-dark dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
	            제품관리
	          </button>
	          <ul class="dropdown-menu dropdown-menu-dark">
	            <li><a class="dropdown-item" href="/manager/product/managerProduct">메인</a></li>
	            <li><a class="dropdown-item" href="#">메뉴3</a></li>
	          </ul>
	        </li>
	      </ul>
	      
	      <ul class="navbar-nav">
	        <li class="nav-item dropdown">
	          <button class="btn btn-dark dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
	            배송관리
	          </button>
	          <ul class="dropdown-menu dropdown-menu-dark">
	            <li><a class="dropdown-item" href="/manager/delivery/managerDelivery">메인</a></li>
	            <li><a class="dropdown-item" href="#">배송곤리</a></li>
	          </ul>
	        </li>
	      </ul>
	      
	      
	      <ul class="navbar-nav">
	        <li class="nav-item dropdown">
	          <button class="btn btn-dark dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
	            리뷰관리
	          </button>
	          <ul class="dropdown-menu dropdown-menu-dark">
	            <li><a class="dropdown-item" href="/manager/review/managerReviewList">리뷰 검색 및 삭제</a></li>
	            <li><a class="dropdown-item" href="/manager/review/managerReviewChart">리뷰 통계</a></li>
	          </ul>
	        </li>
	      </ul>
	      
	      
	      <ul class="navbar-nav">
	        <li class="nav-item dropdown">
	          <button class="btn btn-dark dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
	            주문관리
	          </button>
	          <ul class="dropdown-menu dropdown-menu-dark">
	            <li><a class="dropdown-item" href="/manager/order/managerOrder">주문관리</a></li>
	          </ul>
	        </li>
	      </ul>



			<ul class="navbar-nav">
				<li class="nav-item dropdown">
					<button class="btn btn-dark dropdown-toggle"
						data-bs-toggle="dropdown" aria-expanded="false">쿠폰관리</button>
					<ul class="dropdown-menu dropdown-menu-dark">
						<li><a class="dropdown-item" href="/manager/coupon/managerCouponList">쿠폰 조회</a></li>
						<li><a class="dropdown-item" href="/manager/coupon/managerCouponInsertForm">쿠폰 생성</a></li>
					</ul>
				</li>
			</ul>


			<ul class="navbar-nav">
				<li class="nav-item dropdown">
					<button class="btn btn-dark dropdown-toggle"
						data-bs-toggle="dropdown" aria-expanded="false">고객지원</button>
					<ul class="dropdown-menu dropdown-menu-dark">
						<li><a class="dropdown-item" href="/manager/cs/managerFaq">FAQ 관리</a></li>
						<li><a class="dropdown-item" href="#">공지사항 관리</a></li>
						<li><a class="dropdown-item" href="#">문의사항 관리</a></li>
					</ul>
				</li>
			</ul>


		</div>
		<div class="logoutArea">
			<button type="button" class="btn btn-dark" id="managerLogoutBtn">로그아웃</button>
		</div>
	  </div>
	</nav>