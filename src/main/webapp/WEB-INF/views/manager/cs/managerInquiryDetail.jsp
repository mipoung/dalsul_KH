<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>
<!-- 관리자페이지 드롭다운 사용을 위해 필요한 스크립트 -->
<script type="text/javascript"
	src="/resources/include/common/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- Bootstrap CSS 및 JavaScript 포함 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>

<!-- Popper.js 포함 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.10.2/umd/popper.min.js"></script>
<title>inquiry 상세 정보</title>
<script>
    	function goToInquiryList() {
        window.location.href = "/manager/cs/managerInquiryList";
    	}
        

        
        function deleteInquiry(inquiryNo) {
            if (confirm("정말로 이 inquiry를 삭제하시겠습니까?")) {
                window.location.href = "/manager/cs/managerInquiryDelete?inquiry_no=" + inquiryNo;
            }
        }
    </script>
</head>
<body>
	<%@ include file="/WEB-INF/views/manager/managerHeader.jsp"%>
	<div class="container mt-4">
		<h1>문의사항 상세 정보</h1>
		<table class="table table-bordered">
			<tbody>
				<tr>
					<th scope="row" class="col-md-2">글번호</th>
					<td>${detail.inquiry_no}</td>
				</tr>
				<tr>
					<th scope="row">작성일</th>
					<td>${detail.inquiry_date}</td>
				</tr>
				<tr>

					<th scope="row">제목</th>
					<td>${detail.inquiry_title}</td>
				</tr>
				<tr>
					<th scope="row">질문</th>
					<td>${detail.inquiry_question}</td>
				</tr>
			</tbody>
		</table>
		<!-- 뒤로 가기 버튼 -->
		<button onclick="goToInquiryList()" class="btn btn-primary">inquiry
			목록으로 이동</button>


		<%-- <!-- 수정하기 버튼 -->
    <button onclick="goToEditPage(${detail.inquiry_no})">수정하기</button>--%>
		<!-- 삭제하기 버튼 -->
		<button onclick="deleteInquiry(${detail.inquiry_no})"
			class="btn btn-primary">삭제하기</button>

		<!-- 댓글 -->
		<jsp:include page="managerReply.jsp" />
	</div>
</body>
</html>