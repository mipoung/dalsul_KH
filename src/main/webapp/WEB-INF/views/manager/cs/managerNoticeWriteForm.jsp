<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>
<!-- 관리자페이지 드롭다운 사용을 위해 필요한 스크립트 -->
<script type="text/javascript" src="/resources/include/common/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- Bootstrap CSS 및 JavaScript 포함 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>

<!-- Popper.js 포함 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.10.2/umd/popper.min.js"></script>
    <title>공지사항 작성 폼</title>
     <style>

		#notice_title{
			width:500px;
		}
		#notice_subject{
			width:500px;
			height:200px;
		}

        </style>
</head>
<body>
	<%@ include file="/WEB-INF/views/manager/managerHeader.jsp"%>
	<div class="container mt-4">
    	<h1>공지사항 작성</h1>
    <!-- FAQ 작성 폼 내용 입력 폼과 버튼 등을 구현합니다. -->
    	<form action="/manager/cs/notice/managerNoticeInsert" method="post" class="container">
        	<!-- 입력 폼 -->
        	<div class="form-group">
        		<label for="notice_title">제목:</label>
        		<input type="text" id="notice_title" name="notice_title" required class="form-control"><br>
			</div>
			<div class="form-group">
        		<label for="notice_subject">내용:</label>
        		<textarea id="notice_subject" name="notice_subject" required class="form-control"></textarea><br>
			</div>

        <!-- 버튼 -->
        <input type="submit" value="작성" class="btn btn-primary">
        <input type="button" value="취소" class="btn btn-secondary" onclick="history.back()">
    </form>
    </div>
</body>
</html>