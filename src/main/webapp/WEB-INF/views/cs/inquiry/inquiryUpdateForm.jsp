<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>문의사항 수정 폼</title>
</head>
<body>
    <h1>문의사항 수정 폼</h1>
    <!-- FAQ 수정 폼 내용 입력 폼과 버튼 등을 구현합니다. -->
    <form action="/inquiry/inquiryUpdate" method="post">
        <!-- 입력 폼 -->
        <input type="hidden" name="inquiry_no" value="${updateData.inquiry_no}">
		<input type="hidden" name="user_no" value="${user_no}"> <!--글의 inquiry_no, 로그인한 사용자의 USER_NO -->
		
        <label for="inquiry_title">제목:</label>
        <input type="text" id="inquiry_title" name="inquiry_title" value="${updateData.inquiry_title}" required><br>

        <label for="inquiry_question">질문:</label>
        <textarea id="inquiry_question" name="inquiry_question" required>${updateData.inquiry_question}</textarea><br>


        <!-- 버튼 -->
        <input type="submit" value="수정">
        <input type="button" value="취소" onclick="history.back()">
    </form>
</body>
</html>