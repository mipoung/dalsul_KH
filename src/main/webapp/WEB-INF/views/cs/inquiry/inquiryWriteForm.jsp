<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>문의사항 작성 폼</title>
</head>
<body>
    <h1>FAQ 작성 폼</h1>
    <!-- FAQ 작성 폼 내용 입력 폼과 버튼 등을 구현합니다. -->
    <form action="/inquiry/inquiryInsert" method="post">
        <!-- 입력 폼 -->
        <label for="inquiry_title">제목:</label>
        <input type="text" id="inquiry_title" name="inquiry_title" required><br>

        <label for="inquiry_question">질문:</label>
        <textarea id="inquiry_question" name="inquiry_question" required></textarea><br>


        <!-- 버튼 -->
        <input type="submit" value="작성">
        <input type="button" value="취소" onclick="history.back()">
    </form>
</body>
</html>