$(function() {
	$("#deleteAddrBtn").click(function() {
		if(!confirm("정말 삭제하시겠습니까?")){
			return;
		}
		let addr_no = $("#addr_no").val();
		let user_no = $("#user_no").val();
		
		$.ajax({
			// 요청할 url 주소
			url: "/addr/deleteAddr",
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
	});
});