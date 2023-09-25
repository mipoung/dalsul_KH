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
    <title>FAQ 수정 폼</title>
    <style>
    	#faq_title{
			width:500px;
		}
		#faq_question{
			width:500px;
			
		}
		#faq_answer{
			width:500px;
			height:200px;
		}
    </style>
</head>
<body>
	<%@ include file="/WEB-INF/views/manager/managerHeader.jsp"%>
	<div class="container mt-4">
    <h1>FAQ 수정</h1>
    
    <!-- FAQ 수정 폼 내용 입력 폼과 버튼 등을 구현합니다. -->
    <form action="/manager/cs/managerFAQUpdate" method="post">
        <!-- 입력 폼 -->
        <input type="hidden" name="faq_no" value="${updateData.faq_no}">
		<div class="form-group">
        	<label for="faq_title">제목:</label>
        	<input type="text" id="faq_title" name="faq_title" value="${updateData.faq_title}" required class="form-control"><br>
		</div>
		<div class="form-group">
        	<label for="faq_question">질문:</label>
        	<textarea id="faq_question" name="faq_question" required class="form-control">${updateData.faq_question}</textarea><br>
		</div>
		<div class="form-group">
        	<label for="faq_answer">답변:</label>
        	<textarea id="faq_answer" name="faq_answer" required class="form-control">${updateData.faq_answer}</textarea><br>
		</div>
        <!-- 버튼 -->
        <input type="submit" value="수정" class="btn btn-primary">
        <input type="button" value="취소" class="btn btn-secondary" onclick="history.back()">
        
    </form>
    </div>
</body>
</html>