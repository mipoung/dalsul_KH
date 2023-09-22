<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FAQ 상세 정보</title>
    <script>
    	function goToInquiryList() {
        window.location.href = "/manager/cs/managerInquiryList";
    	}
        
/*         function goToEditPage(inquiryNo) {
            window.location.href = "/manager/cs/managerInquiryUpdateForm?inquiry_no=" + inquiryNo;
        } */
        
        function deleteInquiry(inquiryNo) {
            if (confirm("정말로 이 inquiry를 삭제하시겠습니까?")) {
                window.location.href = "/manager/cs/managerInquiryDelete?inquiry_no=" + inquiryNo;
            }
        }
    </script>
</head>
<body>
    <h1>inquiry 상세 정보</h1>
    <!-- inquiry 상세 정보를 표시 -->
    <p>글번호: ${detail.inquiry_no}</p>
    <p>제목: ${detail.inquiry_title}</p>
    <p>작성일: ${detail.inquiry_date}</p>
    <p>질문: ${detail.inquiry_question}</p>
    <%-- <p>답변: ${detail.faq_answer}</p> --%>

    <!-- 뒤로 가기 버튼 -->
    <button onclick="goToInquiryList()">inquiry 목록으로 이동</button>

    
    <%-- <!-- 수정하기 버튼 -->
    <button onclick="goToEditPage(${detail.inquiry_no})">수정하기</button>
 --%>    
    <!-- 삭제하기 버튼 -->
    <button onclick="deleteInquiry(${detail.inquiry_no})">삭제하기</button>
    <!-- 댓글 -->
	<jsp:include page="managerReply.jsp" /> 
</body>
</html>