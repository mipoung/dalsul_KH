<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>

        <meta name="shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>공지사항 상세 정보</title>
        <link href="/resources/include/cs/css/csList.css" rel="stylesheet" />
        <link rel="stylesheet" type="text/css" href="/resources/include/mainpage/css/header.css" />
        <link rel="stylesheet" type="text/css" href="/resources/include/mainpage/css/footer.css" />
        <script src="/resources/include/mainpage/js/header.js"></script>
        <script>
            function goToNoticeList() {
        window.location.href = "/notice/noticeList";
    	}
        
        function goToEditPage(noticeNo) {
            window.location.href = "/notice/managerNoticeUpdateForm?notice_no=" + noticeNo;
        }
        
        function deleteNotice(noticeNo) {
            if (confirm("정말로 이 공지사항을 삭제하시겠습니까?")) {
                window.location.href = "/notice/managerNoticeDelete?notice_no=" + noticeNo;
            }
        }
        </script>
        <style>

        </style>
    </head>
    <body>
    	<div>
    		<%@ include file="/WEB-INF/views/main/header.jsp"%>
			<!-- header.jsp 파일 포함 -->
    	</div>
  
        <div class="d-flex" id="wrapper">
            <!-- Sidebar-->
            <div class="border-end bg-white" id="sidebar-wrapper">
                <div class="sidebar-heading border-bottom bg-light">고객지원</div>
                <div class="list-group list-group-flush">
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/faq/FAQList">FAQ</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/notice/noticeList">공지사항</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/inquiry/inquiryList">문의사항</a>

                </div>
            </div>
            <!-- Page content wrapper-->
            <div id="page-content-wrapper">

                <!-- Page content-->
                <div class="container mt-4">
                    <h1>공지사항 상세 정보</h1>
                    <table class="table table-bordered">
                        <tbody>
                            <tr>
                                <th scope="row" class="col-md-2">글번호</th>
                                <td>${detail.notice_no}</td>
                            </tr>
                            <tr>
                                <th scope="row">작성일</th>
                                <td>${detail.notice_date}</td>
                            </tr>
                            <tr>

								<th scope="row">제목</th>
                                <td>${detail.notice_title}</td>
                            </tr>
                            <tr>
                                <th scope="row">내용</th>
                                <td>${detail.notice_subject}</td>
                            </tr>
                        </tbody>
                    </table>
                    <!-- 뒤로 가기 버튼 -->
			        <button onclick="goToNoticeList()" class="btn btn-primary" id="noticeBtn">FAQ 목록으로 이동</button>
			        <!-- 수정하기 버튼 -->
			        <button onclick="goToEditPage(${detail.notice_no})" class="btn btn-primary" id="noticeBtn">수정하기</button>
			        <!-- 삭제하기 버튼 -->
			        <button onclick="deleteNotice(${detail.notice_no})" class="btn btn-primary" id="noticeBtn">삭제하기</button>
                    
            	</div>
        	</div>
        	        	
		</div>
	     
	                <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="/resources/include/cs/js/csList.js"></script>
        <%@ include file="/WEB-INF/views/main/footer.jsp"%>
    </body>
</html>