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
				" 작성일 : " + reply_date);
		$element.find('.panel-body').html( " 관리자 :  " + reply_answer);
		$div.append($element);
	}


</script>



</head>
<body>
<%-- 댓글 입력 화면 --%>			
		<form id="replyForm" name="replyForm">
			<div>
				<table class="table">
					<tbody>
						
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
				
			</div>	
		</div>



</body>
</html>