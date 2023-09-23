$(function() {
	$(".row").css("margin-top",($("body").height()/4));
	// 공백 체크
	$("input[type='text']").on("keyup blur", function() {
		if ($(this).val().replace(/\s/g, "") == "") {
			let element = $(this).prev().text();
			$(this).siblings(".feedback").text(element + "을(를) 입력해주세요");
		} else {
			$(this).siblings(".feedback").text("");
		}
	});

	// 다시입력 버튼
	$("#reset_form_btn").click(function() {
		$("#user_name, #user_birth, #user_phone_num").attr("readonly", false).val("");
		$("#certification_num").val("");
		$("#certification_input").hide();
	});

	// 휴대전화 인증번호발송
	$('#send_certification_num').click(function() {
		if (!chkName("#user_name")) return false;
		else if (!chkBirth("#user_birth")) return false;
		else if (!chkPhone("#user_phone_num")) return false;
		$.ajax({
			url: "/register/chkDuplicatedPhone",
			type: "post",
			data: { "user_phone_num": $("#user_phone_num").val() },
			dataType: "text",
			success: function(data) {
				if (data == 1) {
					Swal.fire({
						title: '<strong>이미 가입된 번호가 있어요!</strong>',
						icon: 'info',
						html:
							'달술은 한 사람당 하나의 계정만 가질 수 있어요',
						showCloseButton: true,
						showCancelButton: false,
						focusConfirm: true,
						confirmButtonText:
							'<a href="/login/loginView" style="color:white;">로그인 하러가기</a>'
					})
					return false;
				} else {
					$.ajax({
						url: "/phoneCheck/sendSMS",
						type: "post",
						dataType: "text",
						data: { "phoneNumber": $("#user_phone_num").val() },
						success: function(data) {
							if (data === "success") {
								Swal.fire("인증번호 발송 완료", "인증번호가 발송되었습니다", "success");
								$("#certification_input").css("display", "block");
								$("#user_name, #user_birth, #user_phone_num").attr("readonly", true);
							} else {
								Swal.fire("인증번호 발송 실패", "입력한 정보를 확인해주신 후<br>다시 시도해주세요.", "error");
							}
						}, error: function() {
							Swal.fire("인증번호 발송 실패", "시스템 오류로 인증번호가 발송되지 않았습니다<br>잠시후 다시 시도해주세요", "error");
						}
					});
				}
			}, error: function() {
				Swal.fire({
					icon: 'error',
					title: '시스템 오류',
					html: '잠시후 다시 시도해 주세요',
				});
				$(item).val("");
				$(item).focus();
				return false;
			}
		});
	});

	// 인증버튼
	$("#certification_btn").click(function() {
		$.ajax({
			url: "/phoneCheck/checkNumber",
			type: "post",
			data: { "requestNumber": $("#certification_num").val() },
			success: function(data) {
				if (data.success) {
					Swal.fire("인증완료", data.message, "success").then(() => {
					
						$("#certificationForm").attr({
						"method": "post",
						"action": "/register/userRegisterView"
						});

						$("#certificationForm").submit();
						
					});
				} else {
					Swal.fire("인증실패", data.message, "error");
					$("#certification_num").val("");
					$("#certification_num").focus();
				}
			}, error: function(data) {
				Swal.fire("인증실패", data, "error");
			}
		});
	});
});