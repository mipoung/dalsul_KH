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
<title>공지사항 상세 정보</title>
<script>
    	function goToNoticeList() {
        window.location.href = "/manager/cs/managerNoticeList";
    	}
        
        function goToEditPage(noticeNo) {
            window.location.href = "/manager/cs/managerNoticeUpdateForm?notice_no=" + noticeNo;
        }
        
        function deleteNotice(noticeNo) {
            if (confirm("정말로 이 공지사항을 삭제하시겠습니까?")) {
                window.location.href = "/manager/cs/managerNoticeDelete?notice_no=" + noticeNo;
            }
        }
    </script>
</head>
<body>
	<!-- 매니저 헤더 -->
	<%@ include file="/WEB-INF/views/manager/managerHeader.jsp"%>
	<div class="container mt-4">
		<h1>공지사항 상세 정보</h1>
		<table class="table table-bordered">
			<tbody>
				<tr>
					<th scope="row" class="col-md-2">글번호</th>
					<td>${detail.notice_no}</td>
				</tr>
				<tr>
					<th scope="row">작성일</th>
					<td>${detail.notice_date}</td>
				</tr>
				<tr>

					<th scope="row">제목</th>
					<td>${detail.notice_title}</td>
				</tr>
				<tr>
					<th scope="row">내용</th>
					<td>${detail.notice_subject}</td>
				</tr>
			</tbody>
		</table>
		<!-- 뒤로 가기 버튼 -->
		<button onclick="goToNoticeList()" class="btn btn-primary">공지사항
			목록으로 이동</button>


		<!-- 수정하기 버튼 -->
		<button onclick="goToEditPage(${detail.notice_no})"
			class="btn btn-primary">수정하기</button>

		<!-- 삭제하기 버튼 -->
		<button onclick="deleteNotice(${detail.notice_no})"
			class="btn btn-primary">삭제하기</button>
	</div>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="/resources/include/cs/js/csList.js"></script>
</body>
</html>