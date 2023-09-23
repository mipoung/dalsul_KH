<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FAQ 상세 정보</title>
    <script>
    	function goToFAQList() {
        window.location.href = "/manager/cs/managerFAQList";
    	}
        
        function goToEditPage(faqNo) {
            window.location.href = "/manager/cs/managerFAQUpdateForm?faq_no=" + faqNo;
        }
        
        function deleteFAQ(faqNo) {
            if (confirm("정말로 이 FAQ를 삭제하시겠습니까?")) {
                window.location.href = "/manager/cs/managerFAQDelete?faq_no=" + faqNo;
            }
        }
    </script>
</head>
<body>
    <h1>FAQ 상세 정보</h1>
    <!-- FAQ 상세 정보를 표시 -->
    <p>글번호: ${detail.faq_no}</p>
    <p>제목: ${detail.faq_title}</p>
    <p>작성일: ${detail.faq_date}</p>
    <p>질문: ${detail.faq_question}</p>
    <p>답변: ${detail.faq_answer}</p>

    <!-- 뒤로 가기 버튼 -->
    <button onclick="goToFAQList()">FAQ 목록으로 이동</button>

    
    <!-- 수정하기 버튼 -->
    <button onclick="goToEditPage(${detail.faq_no})">수정하기</button>
    
    <!-- 삭제하기 버튼 -->
    <button onclick="deleteFAQ(${detail.faq_no})">삭제하기</button>
</body>
</html>