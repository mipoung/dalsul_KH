<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		
		<title>문의사항 상세정보</title>
		<script>
    	function goToInquiryList() {
        window.location.href = "/inquiry/inquiryList";
    	}
        
        function goToEditPage(inquiryNo) {
            window.location.href = "/inquiry/inquiryUpdateForm?inquiry_no=" + inquiryNo;
        }
        
        function deleteInquiry(inquiryNo) {
            if (confirm("정말로 이 문의사항을 삭제하시겠습니까?")) {
                window.location.href = "/inquiry/inquiryDelete?inquiry_no=" + inquiryNo;
            }
        }
    </script>
		

	</head>
	<body>
		<h1>문의사항 상세 정보</h1>
    	<!-- FAQ 상세 정보를 표시 -->
    	<p>글번호: ${detail.inquiry_no}</p>
    	<p>제목: ${detail.inquiry_title}</p>
    	<p>작성일: ${detail.inquiry_date}</p>
    	<p>질문: ${detail.inquiry_question}</p>
    	
    	 <!-- 뒤로 가기 버튼 -->
    	<button onclick="goToInquiryList()">문의사항 목록으로 이동</button>

    
    	<!-- 수정하기 버튼 -->
    	<button onclick="goToEditPage(${detail.inquiry_no})">수정하기</button>
    
    	<!-- 삭제하기 버튼 -->
    	<button onclick="deleteInquiry(${detail.inquiry_no})">삭제하기</button>
	</body>
</html>