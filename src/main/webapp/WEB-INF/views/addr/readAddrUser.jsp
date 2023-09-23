<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<script type="text/javascript">
		 $(function() {
		// 모달 열기 버튼에 대한 클릭 이벤트 핸들러
		$('#leadUserAddrBtn').click(function() {
		    // 모달을 보이게 하기
		    $('#addrModal').modal('show');
		    // 모달 열 때 서버에서 데이터를 동적으로 불러오는 함수를 호출
		    loadDataIntoModal();
		});
		
		function loadDataIntoModal() {
		    $.ajax({
		        url: "/mypage/leadBaseAddr",
		        method: "get",
		        data: { "user_no": "${userLogin.user_no}" },
		        dataType: "json",
		        success: function (response) {
		            if (response.length > 0) {
		                var $tbody = $("<tbody>");
		                for (let i = 0; i < response.length; i++) {
		                    var addressData = response[i];
		                    var $tr = $("<tr>").append(
		                        $("<th>").text(addressData.addr_name),
		                        $("<th>").text(addressData.addr_road),
		                        $("<th>").text(addressData.addr_receiver),
		                        $("<th>").append($("<button>").text("선택")).click((function (address) {
		                            return function () {
		                                console.log("읽어온 주소:", address);

		                                // 주소 정보를 입력 필드에 설정
		                                $("#postcode").val(address.addr_post);
		                                $("#jibunAddress").val(address.addr_jibun);
		                                $("#roadAddress").val(address.addr_road);
		                                $("#receiver").val(address.addr_receiver);
		                                $("#name").val(address.addr_name);
		                                $("#detailAddress").val(address.addr_detail);

		                                // 주소 선택 모달 닫기
		                                $("#addrModal").modal("hide");
		                            };
		                        })(addressData))
		                    );
		                    $tbody.append($tr);
		                }
		                $("#deliveryAddresses table tbody").empty().append($tbody);
		            } else {
		            	// 주소 선택 모달 닫기
		                alert("등록한 기본 배송지가 없습니다.");
		                $("#leadUserAddrBtn").css("visibility", "hidden");
                        $("#addrModal").modal("hide");
		            }
		        }
		    });
		}
	});
		</script>
	</head>
	<body>
		<div class="modal fade" id="addrModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">배송지 목록</h5>
      </div>
      <div class="modal-body">
        	<div id="deliveryAddresses">
       			<table  class="table table-striped">
       				<thead>
       					<tr>
       						<th>배송지이름</th>
       						<th>도로명주소</th>
       						<th>수령인이름</th>
       						<th>선택</th>
       					</tr>
       				</thead>
       				<tbody>
       					<!-- 클릭을하면 모달창을 생성하고 그안에 관련 정보를 보여주는 곳 -->
       				</tbody>
       			</table>
       		</div>
      </div>
    </div>
  </div>
</div>
	</body>
	</html>