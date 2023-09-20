<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>

<script>
/*
	$(function(){
		$.ajax({
			url : "/mypage/getUserInfo",
			method : "post",
			data : {"user_no" : ${uvo.user_no}},
			dataType : "json",
			success : function(resultData){
				$("#user_name").text(resultData.user_name);
				$("#user_email").text(resultData.user_email);
				$("#user_phone_num").text(resultData.user_phone_num.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3'));
			}, error : function(){
				alert("시스템 오류");
			}
		});
		
		$(".delete-user").click(function(){
			if(prompt("정말 탈퇴하시겠어요? 😥\n탈퇴를 원하시면 '탈퇴합니다'를 입력해 주세요.")==="탈퇴합니다"){
				$.ajax({
					url : "/edit/deleteUserAccount",
					method : "post",
					dataType : "text",
					success : function(result){
						if(result=="SUCCESS"){
							alert("정상적으로 탈퇴되었습니다");
							location.href = "/login/userLogout";	
						}else{
							Swal.fire({
								icon: 'error',
								title: '탈퇴 진행도중 오류가 발생하였습니다',
								html: '잠시후 다시 시도해 주세요'
							});	
						}
					}, error(){
						Swal.fire({
							icon: 'error',
							title: '시스템 오류...',
							html: '잠시후 다시 시도해 주세요'
						});
						return;
					}
				})
			}
		});
	});
*/
</script>
</head>
<body>
	<div class="container">
		<%@ include file="/WEB-INF/views/mypage/mypageCommon.jsp"%>
		<h1>유저 배송지 조회 리스트 페이지입니다.</h1>
	</div>
</body>
</html>