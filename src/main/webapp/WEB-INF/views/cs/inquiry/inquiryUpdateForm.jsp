<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>

        <meta name="shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>문의사항 수정 폼</title>
        <link href="/resources/include/cs/css/csList.css" rel="stylesheet" />
        <link rel="stylesheet" type="text/css" href="/resources/include/mainpage/css/header.css" />
        <link rel="stylesheet" type="text/css" href="/resources/include/mainpage/css/footer.css" />
        <script src="/resources/include/mainpage/js/header.js"></script>
        <script>
			
        </script>
        <style>
			#inquirybtn{
				margin-top : 10px;
			}
			#inquiry_title{
				width:500px;
			}
			#inquiry_question{
				width:500px;
				height:200px;
			}
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
                    <h1>문의사항 수정 폼</h1>
                    <form action="/inquiry/inquiryUpdate" method="post" name="updateForm" id="updateForm" class="container">
                        <!-- 입력 폼 -->
                        <input type="hidden" name="inquiry_no" value="${updateData.inquiry_no}">
                        <c:if test="${user_no==null}">
                            <input type="hidden" name="user_no" value="999999999"> <!--글의 inquiry_no, 로그인한 사용자의 USER_NO -->
                        </c:if>
                        <c:if test="${user_no!=null}">
                            <input type="hidden" name="user_no" value="${user_no}"> <!--글의 inquiry_no, 로그인한 사용자의 USER_NO -->
                        </c:if>
                        
                        <div class="form-group">
                            <label for="inquiry_title">제목:</label>
                            <input type="text" id="inquiry_title" name="inquiry_title" value="${updateData.inquiry_title}" required class="form-control">
                        </div>
                    
                        <div class="form-group">
                            <label for="inquiry_question">질문:</label>
                            <textarea id="inquiry_question" name="inquiry_question" required class="form-control">${updateData.inquiry_question}</textarea>
                        </div>
                    
                        <!-- 버튼 -->
                        <button type="submit" id="inquirybtn" name="inquirybtn" class="btn btn-primary">수정</button>
                        <button type="button" id="inquirybtn" name="inquirybtn" class="btn btn-secondary" onclick="history.back()">취소</button>
                    </form>
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