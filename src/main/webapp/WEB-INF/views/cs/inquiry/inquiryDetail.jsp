<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>

<title>문의사항 상세정보</title>


<script>
	let buttonCheck = 0; /* 버튼 클릭 여부 확인 변수 */
	$(function(){
		$("#pwdChk").hide(); 

		// 수정 버튼 클릭 시 처리 이벤트
		$("#updateFormBtn").click(function() {
			$("#pwdChk").show(); // 비밀번호 입력창 표시
			$("#msg").text("작성 시 입력한 비밀번호를 입력해 주세요.").css("color", "yellow");
			buttonCheck = 1; // 수정 버튼 클릭
		});

		// 삭제 버튼 클릭 시 처리 이벤트
		$("#deleteBtn").click(function() {
			$("#pwdChk").show(); // 비밀번호 입력창 표시
			$("#msg").text("작성 시 입력한 비밀번호를 입력해 주세요.").css("color", "green");
			buttonCheck = 2; // 삭제 버튼 클릭
		});

		// 비밀번호 입력 양식 enter 제거
		$("#inquiry_password").bind("keydown", function(event) {
			if (event.keyCode === 13) {
				event.preventDefault();
			}
		});

		// 비밀번호 확인 버튼 클릭 시 처리 이벤트
		$("#pwdBtn").click(function() {
			inquiryPwdConfirm();
		});
		
		

		 $("#goToListBtn").click(function() {
	            window.location.href = "/inquiry/inquiryList";
	     });
		 
		// 비밀번호 확인 함수
		function inquiryPwdConfirm(){
			//console.log("123");
			if(!chkData('#inquiry_password', "비밀번호를")) return;
			else{
				$.ajax({
					url : "/inquiry/pwdConfirm",
					type : "post",
					data : $("#form_password").serialize(),
					dataType : "text",
					error : function(){
						alert('시스템 오류. 관리자에게 문의하세요');
					},
					success : function(resultData){
						let goUrl="";
						if(resultData == "fail"){
							$("#msg").text("작성시 입력한 비밀번호가 일치하지 않습니다").css("color", "red");
							$("#inquiry_password").select();
						}else if(resultData=="success"){
							$("#msg").text("");
							if(buttonCheck == 1){
								//actionProcess("get", "/inquiry/inquiryUpdateForm");
								goUrl = "/inquiry/inquiryUpdateForm";
								$("#f_data").attr("action", goUrl);
								$("#f_data").submit();
							}else if(buttonCheck == 2){
								if(confirm("정말로 이 문의사항을 삭제하시겠습니까?")){
									//actionProcess("post", "/inquiry/inquiryDelete");
									goUrl = "/inquiry/inquiryDelete";
									$("#f_data").attr("action", goUrl);
									$("#f_data").submit();
								}
							}
						}
					}
				});
			}
		}	 
	});

		

</script>

</head>
<body>
	<div>
		<form name="f_data" id="f_data" method="get">
			<input type="hidden" name="inquiry_no" value="${detail.inquiry_no}"/>
			<%-- <input type="hidden" name="user_no" value="${detail.user_no}"/> --%>
		</form>
		<div>
			<h1>문의사항 상세 정보</h1>
			<!-- 문의사항 상세 정보를 표시 -->
			<p>글번호: ${detail.inquiry_no}</p>
			<p>제목: ${detail.inquiry_title}</p>
			<p>작성일: ${detail.inquiry_date}</p>
			<p>질문: ${detail.inquiry_question}</p>
		</div>
		<div>
			<!-- 뒤로 가기 버튼 -->
			<button id="goToListBtn">문의사항 목록으로 이동</button>

			<!-- 수정하기 버튼 -->
			<input type="button" value="수정하기" id="updateFormBtn" />

			<!-- 삭제하기 버튼 -->
			<input type="button" value="삭제하기" id="deleteBtn" />

			<!-- 비밀번호 확인 입력창 -->
			<div id="pwdChk">
    			<form name="form_password" id="form_password">
        			<input type="hidden" name="inquiry_no" id="inquiry_no" value="${detail.inquiry_no}" />
        			<label for="inquiry_password" id="l_password">비밀번호 : </label>
        			<input type="password" name="inquiry_password" id="inquiry_password"/>
        			<button type="button" id="pwdBtn">확인</button>
        			<span id="msg"></span>
    			</form>
			</div>
		</div>
	</div>
</body>
</html>