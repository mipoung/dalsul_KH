 $(function() {
	 //전송버튼 클릭시 발생하는 이벤트
        $("#sendAddrBtn").click(function() { 
			//사용자가 api를 통해 값을 조회했는지 검사
            if (!chkData("#roadAddress", "주소를 먼저")) return;
            else if (!chkData("#detailAddress", "상세주소를")) return;
            else if (!chkData("#receiver", "받는사람(수취인)명을")) return;
            else if (!chkData("#jibunAddress", "지번주소를 재검색후 ")) return;
            else if (!chkData("#name", "주소 별명을")) return;
            else if (!chkData("#postcode", "우편번호를")) return;
            //chkData = coomoon.js에 정의되어있는 입력값이 있는지 없는지 확인하는 메소드
            
            //사용자가 입력할수 있는 input 태그의 입력값들중 이상한 입력값을 막기위해 사용
            //chkInput = coomoon.js에 정의되어있는 한글, 영어, 번호, 쉼표, 띄어기만 ture를 반환하는 메소드
            else if (!chkInput("#detailAddress", "한글,영어,번호,쉼표,띄어쓰기만 입력 가능합니다.")) return;
            else if (!chkInput("#receiver", "한글,영어,번호,쉼표,띄어쓰기만 입력 가능합니다.")) return;
            else if (!chkInput("#name", "한글,영어,번호,쉼표,띄어쓰기만 입력 가능합니다.")) return;
			
			//만약 값을 전달하기전 값이 비었는지 최종적으로 확인
            if ($("#roadAddress").val() === "" ||
                $("#detailAddress").val() === "" ||
                $("#receiver").val() === "" ||
                $("#jibunAddress").val() === "" ||
                $("#detailAddress").val() === "" ||
                $("#receiver").val() === "") {
                alert("오류입니다.");
            //값이 비었을경우 return
                return;
            //값이 다 있을경우 값을 특정 url로 보냄(/BaseDeliApi/insertAddr) 그리고 방식은 post, ajax로 보낸다
            } else {
				
				
				//보낼 값의 대한 정보 정의
                $.ajax({
					//요청할 url 주소
                    url: "/mypage/insertAddr",
                    //요청 방식
                    type: "post",
                    //값을 보낼 대상 form id
                    	//보낼이름 값
                    data: {	"addr_road" : $("#roadAddress").val(),
                    	   	"addr_detail" : $("#detailAddress").val(),
                    	   	"addr_receiver" : $("#receiver").val(),
                    	   	"addr_jibun" : $("#jibunAddress").val(),
                    	   	"addr_detail" : $("#detailAddress").val(),
                    	   	"addr_post" : $("#postcode").val(),
                    	   	"addr_name" : $("#name").val(),
                    	   	"user_no" : $("#user_no").val()
                    	   }, 
                    
                    //$("#sendAddrInfo").serialize(),
                    //값을 보낼 대상의 데이터 타입
                    dataType: "text",
                    //에러시 프롬프트를 통해 오류 표출
                    error: function() {
                        alert('시스템 오류입니다. 다시 시도하시거나 관리자에게 문의 하세요');
                    },
                    //성공시 MVC 패턴을 통해 테이블에 값을 추가하고 리턴은 ResponseBody의 문자열만 리턴받는다
                    //이때 성공을하면 Return을 "추가성공"을 받는데 알림창을 띄워 사용자에게 알리고 입력받은 필드의 태그들의 값을 초기화한다"
                    success: function(resultData) {
						if (resultData !== "추가성공"){
							alert(resultData);
						}
                        else if (resultData === "추가성공") {
                            alert('배송지 추가에 성공하였습니다');
                            // 입력 필드 초기화
                            $("#roadAddress").val("");
                            $("#detailAddress").val("");
                            $("#receiver").val("");
                            $("#jibunAddress").val("");
                            $("#name").val("");
                            
                            window.location.reload();
                        }
                    },error : function(){
						alert('시스템 오류입니다. 다시 시도하시거나 관리자에게 문의 하세요');
					}
                });
            }
        });
    });