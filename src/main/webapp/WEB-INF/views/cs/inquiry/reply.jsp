<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>
	<style>
		#item-template{display:none;
		}
		.panel-body {
        font-size: 18px;
    	}
	</style>
	<script type="text/javascript">
		
	$(function() {
		/** 기본 덧글 목록 불러오기 */
		let inquiry_no = ${detail.inquiry_no};
		listAll(inquiry_no);

		/** 글입력을 위한 Ajax 연동 처리 */
		/*$(document).on(
				"click",
				"#replyInsertBtn",
				function() {
					let insertUrl = "/replies/replyInsert";
					
					let value = JSON.stringify({
						inquiry_no : inquiry_no,
						reply_answer : $("#reply_answer").val()
					});

					$.ajax({
						url : insertUrl,
						type : "post", // 전송 시 method 방식
						headers : {
							"Content-Type" : "application/json"
						},
						dataType : "text",
						data : value,
						error : function(xhr, textStatus, errorThrown) { // 실행시 오류가 발생하였을 경우
							alert(textStatus + " (HTTP-" + xhr.status
									+ " / " + errorThrown + ")"); 
						},
						beforeSend : function() { // 전송 전 유효성 체크
							if (!checkForm("#reply_answer", "댓글내용을"))
								return false; // checkForm() 함수는 placeholder 속성을 이용하여 사용			
						},
						success : function(result) { // 서버로부터 응답코드 200으로 정상 처리가 되었을 경우
							if (result == "SUCCESS") {
								alert("댓글 등록이 완료 되었습니다.");
								dataReset(); // 입력폼 초기화
								listAll(inquiry_no);
							}
						}
					});
				});*/
		
		/*수정버튼 제어 */
		/*$(document).on("click", "button[data-btn='upBtn']", function() {
			let panel = $(this).parents("div.panel");
			let reply_no = panel.attr("data-num");
			updateForm(reply_no, panel);
		
			
			
		});*/

		/** 수정을 위한 Ajax 연동 처리 */
		/*$(document).on(
				"click",
				"#replyUpdateBtn",
				function() {
					let reply_no = $(this).attr("data-rnum");
					$.ajax({
						url : '/replies/' + reply_no,
						type : 'put',
						headers : {
							"Content-Type" : "application/json",
							"X-HTTP-Method-Override" : "PUT"
						},
						data : JSON.stringify({
							reply_answer : $("#reply_answer").val(),
						}),
						dataType : 'text',
						error : function(xhr, textStatus, errorThrown) {
							alert(textStatus + "(HTTP-" + xhr.status
									+ " / " + errorThrown + ")");
						},
						beforeSend : function() {
							if (!checkForm("#reply_answer", "댓글내용을"))
								return false;
						},
						success : function(result) {
							console.log("result:" + result);
							if (result == "SUCCESS") {
								alert("댓글 수정이 완료되었습니다.");
								dataReset();
								listAll(inquiry_no);
							}
						}
					});
				});*/
		
		
		
		/* 삭제버튼 제어 */
		/*$(document).on("click", "button[data-btn='delBtn']", function(){
			let reply_no = $(this).parents("div.panel").attr("data-num");
			deleteBtn(inquiry_no, reply_no);
		});*/
		
		
		
		
		
		
		
		

	}); // 최상위 $ 종료

	function dataReset() {
		$("#replyForm").each(function() {
			this.reset();
		});

		$("#replyForm button[type='button']").removeAttr("data-rnum");
		$("#replyForm button[type='button']").attr("id", "replyInsertBtn");
		$("#replyForm button[type='button'].sendBtn").html("저장");
		$("#replyForm button[type='button'].resetBtn").detach();
	};
	
	
	/* 글 삭제를 위한 Ajax 연동 처리 */
	/*function deleteBtn(inquiry_no, reply_no){
		if(confirm("선택하신 댓글을 삭제하시겠습니까?")){
			$.ajax({
				
				url : '/replies/' + reply_no,
				type: 'delete', // method - get(조회-R)/post(입력-C)/ put(수정-U) / delete(삭제-D) 명시
				headers : {
					"X-HTTP-Method-Override" : "DELETE"
				},
				dataType : 'text',
				error : function(xhr, textStatus, errorThrown){
					alert(textStatus + " (HTTP-" + xhr.status + " / " + errorThrown + ")");
					// alert("시스템에 문제가 있어 잠시 후 다시 진행해 주세요");
				},
				success : function(result){
					// console.log("result: " + result);
					if(result == 'SUCCESS'){
						alert("댓글 삭제가 완료되었습니다.");
						listAll(inquiry_no);
					}
				}
			});
			
		}
	};*/ // deleteBtn 종료
	
	
	

	
	/* 댓글 목록 보여주는 함수 */
	function listAll(inquiry_no) {
		$(".reply").detach(); //detach():선택한 요소를 DOM트리에서 삭제.
		let url = "/replies/all/" + inquiry_no;
		$.getJSON(url, function(data) {
			$(data).each(function(index) {
				let reply_no = this.reply_no;
				let reply_answer = this.reply_answer;
				let reply_date = this.reply_date;
				reply_answer = reply_answer.replace(/(\r\n|\r|\n)/g, "<br/>");

				template(reply_no, reply_answer, reply_date);
			});
		
		}).fail(function() {
			alert("덧글 목록을 불러오는데 실패하였습니다. 잠시후에 다시 시도해 주세요.");
		});
	}
	
	
	/* 새로운 글을 화면에 추가하기(보여주기) 위한 함수 */
	function template(reply_no, reply_answer, reply_date) {
		let $div = $("#reviewList");

		let $element = $("#item-template").clone().removeAttr('id');
		$element.attr("data-num", reply_no);
		$element.addClass("reply");
		$element.find('.panel-heading > .panel-title > .date').html(
				" / " + reply_date);
		$element.find('.panel-body').html(reply_answer);
		$div.append($element);
	}

	/** 수정 폼 화면 구현 함수 */
	/*function updateForm(reply_no, panel) {
		$("#replyForm .resetBtn").detach();

		let content = panel.find(".panel-body").html();
		content = content.replace(/(<br>|<br\/>|<br \/>)/g, '\r\n');
		$("#reply_answer").val(content);

		$("#replyForm button[type='button']").attr("id", "replyUpdateBtn");
		$("#replyForm button[type='button']").attr("data-rnum", reply_no);
		$("#replyForm button[type='button']").html("수정");
		
		
		
		//let resetButton = $("<button type='button' class='btn btn-success resetBtn'>");
		//resetButton.html("취소");
		//$("#replyForm .sendBtn").after(resetButton);
	}*/

</script>



</head>
<body>
<%-- 댓글 입력 화면 --%>			
		<form id="replyForm" name="replyForm">
			<div>
				<table class="table">
					<tbody>
						<!-- <tr>
							<td >
								<button type="button" id="replyInsertBtn" class="btn btn-primary">댓글 저장</button>
								<input type="button" value="뒤로가기" onclick="history.back()" class="btn btn-primary">	
							</td>
						</tr> -->
						<!-- <tr>
							<td colspan="4">
								<textarea rows="2" cols="40" name="reply_answer" id="reply_answer"></textarea>
								<button type="button" id="replyInsertBtn" class="btn btn-primary">댓글 저장</button>
								<input type="button" value="뒤로가기" onclick="history.back()" class="btn btn-primary">	
							</td>
						</tr> -->
					</tbody>
				</table>
			</div>
		</form>
		
		
		
		
		<%-- 리스트 영역 --%>
		<div id="reviewList">
			<div id="item-template" class="panel panel-success">
				<div class="panel-heading">
					<p class="panel-title">
						<span class="date" style="margin-left : 11px"></span>
					</p>
				</div>
				
				<div class="panel-body" style="margin-left : 11px"></div>
				<!-- <button type="button" data-btn="upBtn" class="btn btn-primary" style="margin-left : 11px">수정하기</button>
				<button type="button" data-btn="delBtn" class="btn btn-primary">삭제하기</button>
 -->				
			</div>	
		</div>



</body>
</html>