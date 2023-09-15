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
