<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>공지사항 작성 폼</title>
</head>
<body>
    <h1>공지사항 작성 폼</h1>
    <!-- FAQ 작성 폼 내용 입력 폼과 버튼 등을 구현합니다. -->
    <form action="/notice/adminNoticeInsert" method="post">
        <!-- 입력 폼 -->
        <label for="notice_title">제목:</label>
        <input type="text" id="notice_title" name="notice_title" required><br>

        <label for="notice_subject">내용:</label>
        <textarea id="notice_subject" name="notice_subject" required></textarea><br>


        <!-- 버튼 -->
        <input type="submit" value="작성">
        <input type="button" value="취소" onclick="history.back()">
    </form>
</body>
</html>