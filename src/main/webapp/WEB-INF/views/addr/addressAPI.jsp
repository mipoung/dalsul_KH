<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html>
<html lang="ko">
</head>

<script type="text/javascript">
 $(function() {
	
	/*배송지 정보보러가기 클릭시 상세 페이지 이동을 위한 처리 이벤트*/
	$("#infoAddrBtn").click(function() {
	
		$("#useAddr").attr({
			"method":"get",
			"action":"/addr/selectAddr"
		});
		$("#useAddr").submit();
	});
	
	/*기본배송 주소지 정보수정페이지 이동하기, 클릭시 입력받은 배송지테이블 일련번호를 기준으로 입력받은 값들을 보여주는 페이지로 이동하는 이벤트*/
	$("#updateAddrFormBtn").click(function() {
		
		$("#useAddr").attr({
			"method":"get",
			"action":"/addr/updateAddrForm"
		});
		$("#useAddr").submit();
	});	
	

	
 });
	</script>
    <div class="address_sys_container">
    <!-- 주소지 입력 API -->
        <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
        <script>
            function execDaumPostcode() {
                new daum.Postcode({
                    oncomplete: function(data) {
                        // 팝업에서 검색결과 항목을 클릭했을 때 실행할 코드를 작성하는 부분.

                        // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                        let roadAddr = data.roadAddress; // 도로명 주소 변수
                        let extraRoadAddr = ''; // 참고 항목 변수

                        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                        if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                            extraRoadAddr += data.bname;
                        }
                        // 건물명이 있고, 공동주택일 경우 추가한다.
                        if (data.buildingName !== '' && data.apartment === 'Y') {
                            extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                        if (extraRoadAddr !== '') {
                            extraRoadAddr = ' (' + extraRoadAddr + ')';
                        }

                        // 우편번호와 주소 정보를 해당 필드에 넣는다.
                        document.getElementById('postcode').value = data.zonecode;
                        document.getElementById("roadAddress").value = roadAddr;
                        document.getElementById("jibunAddress").value = data.jibunAddress;

                        // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                        if (roadAddr !== '') {
                            document.getElementById("extraAddress").value = extraRoadAddr;
                        } else {
                            document.getElementById("extraAddress").value = '';
                        }

                        let guideTextBox = document.getElementById("guide");
                        // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                        if (data.autoRoadAddress) {
                            let expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                            guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                            guideTextBox.style.display = 'block';
                        } else if (data.autoJibunAddress) {
                            var expJibunAddr = data.autoJibunAddress;
                            guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                            guideTextBox.style.display = 'block';
                        } else {
                            guideTextBox.innerHTML = '';
                            guideTextBox.style.display = 'none';
                        }
						
                        /* 메소드 실행후 api 반환값 확인
                        console.log(data.address + " 기본주소");
                        console.log(data.jibunAddress + " 지번");
                        console.log(data.roadAddress + " 도로명주소 반환");
                        console.log(data.zonecode + " 우편번호 반환5자리");
                    	*/
                    }
                }).open();
            }
        </script>
        <!-- 주소지 입력 Api 종료 -->
     
        <!-- 배송지정보를 입력받을,입력하는데 필요한 input태그 --> 
        <div class="container">
   <div class="row" style="display: inline-block;">
            <div class="address_sys_container">
                <!-- 주소 입력 필드 -->
                <div class="form-group">
                    <input type="text" id="postcode" onclick="execDaumPostcode()" placeholder="우편번호" readonly="readonly" name="postcode" class="form-control">
                </div>
                <div class="form-group">
                    <input type="text" id="roadAddress" placeholder="도로명주소" onclick="execDaumPostcode()" readonly="readonly" name="roadAddress" class="form-control">
                </div>
                <div class="form-group">
                   
                    <input type="text" id="jibunAddress" placeholder="지번주소" onclick="execDaumPostcode()" readonly="readonly" name="jibunAddress" class="form-control">
                </div>
                <div class="form-group">
                   
                    <input type="text" id="detailAddress" placeholder="상세주소" name="detailAddress" class="form-control">
                </div>
                <div class="form-group">
                  
                    <input type="text" id="receiver" placeholder="받는사람(수취인) 이름" name="receiver" class="form-control">
                </div>
                <div class="form-group">
                   
                    <input type="text" id="name" name="name" placeholder="주소지 별명" class="form-control">
                </div>
                <div class="form-group">
                   
                    <input type="text" id="extraAddress" onclick="execDaumPostcode()" placeholder="참고항목" readonly="readonly" name="extraAddress" class="form-control">
                </div>
                <input type="hidden" id="pickUpInput" name="pickup" value="">
                <div class="form-group">
                    <input type="button" onclick="execDaumPostcode()" value="주소찾기" class="btn btn-primary">
                </div>
                <span id="guide" style="color:#999;display:none"></span>
    		</div>
		</div>
	</div>
</div><!-- 주소입력 컨테이터 종료 -->
</body>
</html>