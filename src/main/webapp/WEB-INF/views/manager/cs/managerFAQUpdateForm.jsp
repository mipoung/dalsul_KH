<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>FAQ 수정 폼</title>
</head>
<body>
    <h1>FAQ 수정 폼</h1>
    <!-- FAQ 수정 폼 내용 입력 폼과 버튼 등을 구현합니다. -->
    <form action="/manager/cs/managerFAQUpdate" method="post">
        <!-- 입력 폼 -->
        <input type="hidden" name="faq_no" value="${updateData.faq_no}">

        <label for="faq_title">제목:</label>
        <input type="text" id="faq_title" name="faq_title" value="${updateData.faq_title}" required><br>

        <label for="faq_question">질문:</label>
        <textarea id="faq_question" name="faq_question" required>${updateData.faq_question}</textarea><br>

        <label for="faq_answer">답변:</label>
        <textarea id="faq_answer" name="faq_answer" required>${updateData.faq_answer}</textarea><br>

        <!-- 버튼 -->
        <input type="submit" value="수정">
        <input type="button" value="취소" onclick="history.back()">
    </form>
</body>
</html>