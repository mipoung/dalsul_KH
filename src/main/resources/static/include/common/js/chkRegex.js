//입력값 테스트 체크 확인 함수
function chkData(item, msg) {
	if ($(item).val().replace(/\s/g, "") == "") {
		alert(msg + " 입력해 주세요.");
		$(item).val("");
		$(item).focus();
		return false;
	} else {
		return true;
	}
}


/* 파일명객체, 이미지파일 여부를 확인하기 위한 확장자 확인 함수 */
function chkFile(item) {
	/*jQuery.inArray(찾을 갑스 검색 대상의 배열): 배열내의 값을 찾아서 인덱스를 반환(요소가 없을 경우 -1 반환)
		pop(): 배열의 마지막 요소를 제거한 후 , 제거한 요소를 반환
	*/
	let ext = item.val().split('.').pop().toLowerCase();
	if(jQuery.inArray(ext, ['gif', 'png', 'jpg']) == -1) {
		alert('gif , png, jpg 파일만 업로드 할 수 있습니다.');
		item.val("");
		return false;
	}else {
		return true;
	}
}

// 입력값을 검증하는 함수 (띄어쓰기, 괄호, 쉼표도 허용)
function chkInput(selector, errorMsg) {
    let inputVal = $(selector).val();
    let regex = /^[0-9a-zA-Z가-힣\s(),]+$/; // 숫자, 한글, 영어, 띄어쓰기, 괄호, 쉼표만 허용하는 정규식
    if (!regex.test(inputVal)) {
        alert(errorMsg);
        $(selector).focus();
        return false;
    }
    return true;
}
        
        //입력값 테스트 체크 확인 함수
function chkData(item, msg) {
	if ($(item).val().replace(/\s/g, "") == "") {
		alert(msg + " 입력해 주세요.");
		$(item).val("");
		$(item).focus();
		return false;
	} else {
		return true;
	}
}

function formCheck(item, msgItem, msg){
   	if($(item).val().replace(/\s/g, "") == "") {
    	$(msgItem).val($(msg)+" 입력해 주세요.");
    	$(item).val("");
    	$(item).focus();
    	return false;
 	} else {
    	return true;
 	}
}


// 이메일 체크 함수
function chkEmail(value) {
	const item = $(value).val().replace(/\s/g, "");
	const emailChkRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
	if (emailChkRegex.test(item) == false) {
		Swal.fire({
			icon: 'error',
			title: '이메일 형식 오류...',
			html: '올바른 이메일 주소를 입력해 주세요.',
		});
		$(item).val("");
		$(item).focus();
		return false;
	} else {
		return true;
	}
}

// 비밀번호 체크 함수
function chkPassword(value) {
	const item = $(value).val().replace(/\s/g, "");
	if (passwordChkRegex.test(item) == false) {
		Swal.fire({
			icon: 'error',
			title: '비밀번호 형식 오류...',
			html: '올바른 비밀번호 형식을 입력해 주세요.<br>(8~16자 영어, 숫자, 특수문자 조합)',
		});
		$(item).val("");
		$(item).focus();
		return false;
	} else {
		return true;
	}
}

// 비밀번호 확인 체크 함수
function chkPwdConfirm() {
	if ($("#user_password").val() != $("#password_confirm").val()) {
		Swal.fire({
			icon: 'error',
			title: '비밀번호 확인 오류...',
			html: '비밀번호 확인이 일치하지 않습니다',
		});
		return false;
	} else {
		return true;
	}
}

/*	이름 체크
			이름은 2~10자 한글로 구성된다. */
function chkName(value) {
	const item = $(value).val().replace(/\s/g, "");
	const nameChkRegex = /^[가-힣]{2,10}$/;
	if (nameChkRegex.test(item) == false) {
		Swal.fire({
			icon: 'error',
			title: '이름 입력 오류...',
			html: '올바른 이름을 입력해 주세요.<br>(한글 2~10자)',
		});
		$(item).val("");
		$(item).focus();
		return false;
	} else {
		return true;
	}
}

/*	생년월일 체크
	생년월일은 주민등록번호 앞 6자리와 뒷자리 1자리로 구성된다.*/
function chkBirth(value) {
	const date = new Date();
	const item = $(value).val().replace(/\s/g, "");
	const birthChkRegex = /^(19\d\d|20[0-2]\d)(0[1-9]|1[0-2])(0[1-9]|[12]\d|3[01])$/;
	if (birthChkRegex.test(item) == false) {
		Swal.fire({
			icon: 'error',
			title: '생년월일 입력 오류...',
			html: '올바른 생년월일을 입력해 주세요.<br>(예 : 19870123)',
		});
		$(item).val("");
		$(item).focus();
		return false;
	} else if (date.getFullYear() - parseInt(item.substring(0, 4)) < 19) { //미성년자
		Swal.fire({
			icon: 'error',
			title: '이런...',
			html: '달술은 성인만 이용할 수 있어요'
		});
		$(item).val("");
		$(item).focus();
		return false;
	} else {
		return true;
	}
}

/*	휴대전화번호 체크
	휴대전화번호는 010과 숫자 8자리로 구성된다. */
function chkPhone(value) {
	const item = $(value).val().replace(/\s/g, "");
	const phoneChkRegex = /^010[0-9]{8}$/;
	// 중복가입자 체크
	if (phoneChkRegex.test(item) == false) {
		Swal.fire({
			icon: 'error',
			title: '휴대전화번호 입력 오류...',
			html: '올바른 휴대전화번호를 입력해 주세요.<br>(010으로 시작하는 8자리 휴대전화 번호)',
		});
		$(item).val("");
		$(item).focus();
		return false;
	} else {
		return true;
	}
}

/*	휴대전화번호 인증번호 체크
	인증번호는 숫자 6자리로 구성된다. */
function chkCertified(value) {
	const item = $(value).val().replace(/\s/g, "");
	const birthChkRegex = /^[0-9]{6}$/;
	if (birthChkRegex.test(item) == false) {
		Swal.fire({
			icon: 'error',
			title: '인증번호 입력 오류...',
			html: '올바른 인증번호를 입력해 주세요.<br>(숫자 6자리)',
		});
		$(item).val("");
		$(item).focus();
		return false;
	} else {
		return true;
	}
}

// 30자까지 입력되고, 한글, 숫자, 띄어쓰기만 허용하는 함수
function chkKorean(item, msg) {
    const inputVal = $(item).val(); // 입력 필드의 값을 가져옴
    const koreanRegex = /^[가-힣0-9\s]+$/; // 한글, 숫자, 띄어쓰기만 허용하는 정규표현식

    if (!koreanRegex.test(inputVal)) {
        alert(msg + " 한글, 숫자, 띄어쓰기만 입력해 주세요.");
        $(item).val("");
        $(item).focus();
        return false;
    } else if (inputVal.length > 30) {
        alert(msg + " 30자 이하로 입력해 주세요.");
        $(item).val("");
        $(item).focus();
        return false;
    } else {
        return true;
    }
}



// 공백체크와 숫자인지 아닌지 체크
function chkDataNum(item, msg) {
	if ($(item).val().replace(/\s/g, "") == "") {
		alert(msg + " 입력해 주세요.");
		$(item).val("");
		$(item).focus();
		return false;
	} else if (isNaN($(item).val().replace(/\s/g, ""))) {
		alert("숫자만 입력해 주세요.");
		$(item).val("");
		$(item).focus();
		return false;
	} else {
		return true;
	}
}

