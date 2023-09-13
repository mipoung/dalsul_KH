const passwordChkRegex = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!#$%()*+,-./:;=?@[\]^_~|{}])[A-Za-z\d!#$%()*+,-./:;=?@[\]^_~|{}]{8,16}$/;
let emailStatus = false;

$(function() {
	// 공백 체크
	$("input").on("keyup blur", function() {
		if ($(this).val().replace(/\s/g, "") == "") {
			let element = $(this).prev().text();
			$(this).siblings(".feedback").text(element + "을(를) 입력해주세요");
		} else {
			$(this).siblings(".feedback").text("");
		}
	});

	// 비밀번호 형식 체크
	$("#user_password").on("keyup blur", function() {
		if (passwordChkRegex.test($(this).val())) {
			$(this).siblings(".feedback").text("사용 가능한 비밀번호 입니다").css("color", "green");
		} else {
			$(this).siblings(".feedback").text("사용 불가능한 비밀번호 입니다").css("color", "red");
		}
	});

	// 비밀번호 확인 체크
	$("#password_confirm").on("keyup blur", function() {
		if ($("#user_password").val() != $(this).val()) {
			$(this).siblings(".feedback").text("비밀번호가 일치하지 않습니다").css("color", "red");
		} else {
			$(this).siblings(".feedback").text("비밀번호가 일치합니다").css("color", "green");
		}
	});

	// 이메일 인증 발송
	$('#send_certification_email').click(function() {
		if (!chkEmail("#user_email")) return false;
		$.ajax({
			url: "/register/chkDuplicatedMail",
			type: "post",
			data: { "user_email": $("#user_email").val() },
			dataType: "text",
			success: function(data) {
				if (data == 1) {
					Swal.fire({
						title: '<strong>이미 가입된 메일이 있어요!</strong>',
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
						url: "/emailCheck/sendEmail",
						type: "post",
						dataType: "text",
						data: { "emailAddr": $("#user_email").val() },
						success: function(data) {
							if (data === "success") {
								Swal.fire("인증번호 발송 완료", "인증번호가 발송되었습니다", "success");
								$("#certification_input").css("display", "block");
								$("#user_email").attr("readonly", true);
							} else {
								Swal.fire("인증번호 발송 실패", "입력한 정보를 확인해주신 후<br>다시 시도해주세요.", "error");
							}
						}, error: function(data) {
							Swal.fire("인증번호 발송 실패", "시스템 오류로 인증번호가 발송되지 않았습니다<br>잠시후 다시 시도해주세요", "error");
						}
					}); //ajax
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
	// 이메일 인증버튼
	$("#certification_btn").click(function() {
		$.ajax({
			url: "/emailCheck/checkCode",
			type: "post",
			data: { "requestCode": $("#certification_code").val() },
			success: function(data) {
				if (data.success) {
					Swal.fire("인증완료", data.message, "success");
					$("#certification_code").attr("readonly", true);
					$("#certification_btn").attr("disabled", true);
					emailStatus = true;
				} else {
					Swal.fire("인증실패", data.message, "error");
					$("#certification_code").val("");
					$("#certification_code").focus();
				}
			}, error: function(data) {
				Swal.fire("인증실패", data, "error");
			}
		});
	});

	// 다시입력 버튼
	$("#reset_form_btn").click(function() {
		$("#user_email").attr("readonly", false).val("");
		$("#certification_code").val("");
		$("#certification_input").hide();
	});


	// 회원가입 버튼 클릭
	$("#register_btn").click(function() {
		if (!chkEmail("#user_email")) return;
		else if (!chkPassword("#user_password")) return;
		else if (!chkPwdConfirm()) return;
		else if (emailStatus == false) {
			Swal.fire({
				icon: 'error',
				title: '이메일 인증을 진행해 주세요.',
			});
		}

		$("#registerForm").attr({
			"method": "post",
			"action": "/register/registeringProcess"
		});

		$("#registerForm").submit();

	});
});