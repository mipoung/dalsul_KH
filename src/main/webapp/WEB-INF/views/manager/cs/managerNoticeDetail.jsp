<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
    <h1>공지사항 상세 정보</h1>
    <!-- FAQ 상세 정보를 표시 -->
    <p>글번호: ${detail.notice_no}</p>
    <p>제목: ${detail.notice_title}</p>
    <p>작성일: ${detail.notice_date}</p>
    <p>내용: ${detail.notice_subject}</p>

    <!-- 뒤로 가기 버튼 -->
    <button onclick="goToNoticeList()">공지사항 목록으로 이동</button>

    
    <!-- 수정하기 버튼 -->
    <button onclick="goToEditPage(${detail.notice_no})">수정하기</button>
    
    <!-- 삭제하기 버튼 -->
    <button onclick="deleteNotice(${detail.notice_no})">삭제하기</button>
</body>
</html>