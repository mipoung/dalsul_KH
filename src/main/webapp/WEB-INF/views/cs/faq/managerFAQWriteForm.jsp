<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>FAQ 작성 폼</title>
</head>
<body>
    <h1>FAQ 작성 폼</h1>
    <!-- FAQ 작성 폼 내용 입력 폼과 버튼 등을 구현합니다. -->
<<<<<<<< HEAD:src/main/webapp/WEB-INF/views/manager/cs/managerFAQWriteForm.jsp
    <form action="/manager/cs/managerFAQInsert" method="post">
========
    <form action="/faq/managerFAQInsert" method="post">
>>>>>>>> 64f026d8882ec660f1984d563e088515528e80b0:src/main/webapp/WEB-INF/views/cs/faq/managerFAQWriteForm.jsp
        <!-- 입력 폼 -->
        <label for="faq_title">제목:</label>
        <input type="text" id="faq_title" name="faq_title" required><br>

        <label for="faq_question">질문:</label>
        <textarea id="faq_question" name="faq_question" required></textarea><br>

        <label for="faq_answer">답변:</label>
        <textarea id="faq_answer" name="faq_answer" required></textarea><br>

        <!-- 버튼 -->
        <input type="submit" value="작성">
        <input type="button" value="취소" onclick="history.back()">
    </form>
</body>
</html>