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
	<!-- 매니저 헤더 -->
   <%@ include file="/WEB-INF/views/manager/managerHeader.jsp"%>
    <div class="container mt-4">
                    <h1>FAQ 상세 정보</h1>
                    <table class="table table-bordered">
                        <tbody>
                            <tr>
                                <th scope="row" class="col-md-2">글번호</th>
                                <td>${detail.faq_no}</td>
                            </tr>
                            <tr>
                                <th scope="row">작성일</th>
                                <td>${detail.faq_date}</td>                            </tr>
                            <tr>

								<th scope="row">제목</th>
                                <td>${detail.faq_title}</td>
                            </tr>
                            <tr>
                                <th scope="row">질문</th>
                                <td>${detail.faq_question}</td>
                            </tr>
                            <tr>
                                <th scope="row">답변</th>
                                <td>${detail.faq_answer}</td>
                            </tr>
                        </tbody>
                    </table>

    <!-- 뒤로 가기 버튼 -->
    <button onclick="goToFAQList()" class="btn btn-primary" id="faqBtn">FAQ 목록으로 이동</button>

    
    <!-- 수정하기 버튼 -->
    <button onclick="goToEditPage(${detail.faq_no})" class="btn btn-primary" id="faqBtn">수정하기</button>
    
    <!-- 삭제하기 버튼 -->
    <button onclick="deleteFAQ(${detail.faq_no})" class="btn btn-primary" id="faqBtn">삭제하기</button>
    </div>
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="/resources/include/cs/js/csList.js"></script>
</body>
</html>