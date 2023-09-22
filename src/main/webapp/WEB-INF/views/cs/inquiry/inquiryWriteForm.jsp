<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>

        <meta name="shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>문의사항 작성 폼</title>
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
            #inquiry_password{
				width:350px;
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
                    <h1>문의사항 작성 폼</h1>
                    <form action="/inquiry/inquiryInsert" method="post" name="insertForm" id="insertForm" class="container">
                        <!-- 입력 폼 -->
                        <c:if test="${userLogin==null}">
                            <input type="hidden" name="user_no" value="999999999"> <!--글의 inquiry_no, 로그인한 사용자의 USER_NO -->
                        </c:if>
                        <c:if test="${userLogin!=null}">
                            <input type="hidden" name="user_no" value="${userLogin.user_no}"> <!--글의 inquiry_no, 로그인한 사용자의 USER_NO -->
                        </c:if>
                        
                        <div class="form-group">
                            <label for="inquiry_title">제목:</label>
                            <input type="text" id="inquiry_title" name="inquiry_title" required class="form-control">
                        </div>
                    
                        <div class="form-group">
                            <label for="inquiry_question">질문:</label>
                            <textarea id="inquiry_question" name="inquiry_question" required class="form-control"></textarea>
                        </div>
                        <div class="form-group">
                            <label for="inquiry_password">비밀번호:</label>
                            <input type="password" id="inquiry_password" class="form-control" name="inquiry_password" required/><br>
                        </div>
                    	<c:if test="${userLogin!=null}">
                			<input type="hidden" name="user_name" value="${userLogin.user_name}">
                    	</c:if>
                    	<c:if test="${userLogin==null}">
                			<input type="hidden" name="user_name" value="익명">
                        </c:if>
                        <!-- 버튼 -->
                        <input type="submit" id="inquirybtn" name="inquirybtn" class="btn btn-primary" value="작성">
                        <input type="button" id="inquirybtn" name="inquirybtn" class="btn btn-secondary" value="취소" onclick="history.back()">
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