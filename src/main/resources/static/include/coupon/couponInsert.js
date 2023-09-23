   $(function () {
    // 할인가격 입력 필드의 포커스가 해제될 때 호출되는 함수
    $("#coupon_discount").on("blur", function () {
        // 입력된 값 가져오기
        let discountValue = $(this).val();

        // 입력된 값에서 숫자만 허용하도록 정규식을 수정
        discountValue = discountValue.replace(/[^0-9]/g, "");

        // 입력된 값이 500 미만인 경우
        if (parseInt(discountValue) < 500) {
            discountValue = 500; // 값을 500원으로 변경
            alert("할인 가격은 500 이상이어야 합니다.");
        } else if (parseInt(discountValue) > 10000) {
            discountValue = 10000; // 값을 10000원으로 변경
            alert("할인 가격은 10000 이하여야 합니다.");
        } else if (parseInt(discountValue) % 500 !== 0) {
            // 500 단위가 아닌 경우
            discountValue = Math.ceil(discountValue / 500) * 500;
            alert("할인 가격은 500 단위로 입력해야 합니다.");
        }

        $(this).val(discountValue); // 변경된 값을 다시 입력 필드에 설정
    });

    // 발급량 제한 입력 필드의 포커스가 해제될 때 호출되는 함수
    $("#coupon_limit").on("blur", function () {
        // 입력된 값 가져오기
        let limitValue = $(this).val();

        // 입력된 값에서 숫자만 허용하도록 정규식을 수정
        limitValue = limitValue.replace(/[^0-9]/g, "");

        $(this).val(limitValue); // 변경된 값을 다시 입력 필드에 설정
    });

    // 라디오 버튼을 기본적으로 체크
    $("#coupon_status").prop("checked", true);

    $("#insertCouponBtn").click(function () {
        // 사용자가 입력한 쿠폰 정보 가져오기
        let coupon_name = $("#coupon_name").val();
        let coupon_discount = $("#coupon_discount").val();
        let coupon_limit = $("#coupon_limit").val();
        let coupon_status = $("input[name='coupon_status']:checked").val();

        // 입력값 검사
        if (
            !chkKorean("#coupon_name", "쿠폰이름을") ||
            !chkInput("#coupon_discount", "올바른 할인 가격을 입력해 주세요.") ||
            !chkInput("#coupon_limit", "올바른 발급량 제한을 입력해 주세요.")
        ) {
            return; // 하나라도 검사에서 실패하면 요청을 보내지 않음
        }
		
		if (confirm("이 설정 대로 쿠폰 정보를 추가하시겠습니까?")) {
        // Ajax 요청을 통해 서버에 쿠폰 정보 전송
        $.ajax({
            // 요청할 URL 주소 (실제 서버 엔드포인트 URL로 변경해야 합니다.)
            url: "/manager/coupon/insertCoupon",
            // 요청 방식
            type: "post",
            // 전송할 데이터
            data: {
                coupon_name: coupon_name,
                coupon_discount: coupon_discount,
                coupon_limit: coupon_limit,
                coupon_status: coupon_status
            },//보낼 값 데이터 정의 종료
            dataType: "text",
            error: function () {
                alert("시스템 오류입니다. 다시 시도하시거나 관리자에게 문의하세요.");
            },//ajax 값전송 오류시 선언 종료
            success: function (resultData) {
                if (resultData === "쿠폰추가성공") {
                    alert("쿠폰 정보가 성공적으로 추가되었습니다.");
                    // 입력 필드 초기화
                    $("#coupon_name").val("");
                    $("#coupon_discount").val("");
                    $("#coupon_limit").val("");
                    
                    // 라디오 버튼 체크 초기화
                    $("#coupon_status").prop("checked", true);
                    
                    location.reload();
                } else {
                    alert("시스템 오류입니다. 다시 시도하시거나 관리자에게 문의하세요.");
              	  }//ajax 오류시 선언 종료
          	  	},//ajax 성공시 선언 종료
        	});//ajax 선언 종료
   		 };// 프롬프트 true시 실행 선언 종료
	});// inserbtn 기능 종료

});//최상위 종료
