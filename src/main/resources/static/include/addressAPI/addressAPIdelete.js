function deleteAddrProcess(addr_no,user_no) {
	//삭제 버튼을 클릭시 발생하는 이벤트 
	if (!confirm("정말 삭제하시겠습니까?")) {
		return;
	}
	
	$.ajax({
		// 요청할 url 주소
		url: "/mypage/deleteAddr",
		// 요청 방식
		type: "post",
		// 값 전달
		data: { addr_no, user_no },
		dataType: "text",
		error: function() {
			alert('시스템 오류입니다. 다시 시도하시거나 관리자에게 문의 하세요');
		},
		success: function(resultData) {
			if (resultData === "삭제성공") {
				alert('배송지 삭제에 성공하였습니다');
				// 입력 필드 초기화
				window.location.reload();
			} else {
				alert('시스템 오류입니다. 다시 시도하시거나 관리자에게 문의 하세요');
			}
		}
	});
}