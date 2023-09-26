<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>

        <meta name="shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>문의사항 상세정보</title>
        <link href="/resources/include/cs/css/csList.css" rel="stylesheet" />
        <link rel="stylesheet" type="text/css" href="/resources/include/mainpage/css/header.css" />
        <link rel="stylesheet" type="text/css" href="/resources/include/mainpage/css/footer.css" />
        <script src="/resources/include/mainpage/js/header.js"></script>
        <script>
            let buttonCheck = 0; /* 버튼 클릭 여부 확인 변수 */
            $(function(){
            	
            	
                $("#pwdChk").hide(); 
        
                // 수정 버튼 클릭 시 처리 이벤트
                $("#updateFormBtn").click(function() {
                    $("#pwdChk").show(); // 비밀번호 입력창 표시
                    $("#msg").text("수정 하려면 작성 시 입력한 비밀번호를 입력해 주세요.")
                    buttonCheck = 1; // 수정 버튼 클릭
                });
        
                // 삭제 버튼 클릭 시 처리 이벤트
                $("#deleteBtn").click(function() {
                    $("#pwdChk").show(); // 비밀번호 입력창 표시
                    $("#msg").text("삭제 하려면 작성 시 입력한 비밀번호를 입력해 주세요.")
                    buttonCheck = 2; // 삭제 버튼 클릭
                });
        
                // 비밀번호 입력 양식 enter 제거
                $("#inquiry_password").bind("keydown", function(event) {
                    if (event.keyCode === 13) {
                        event.preventDefault();
                    }
                });
        
                // 비밀번호 확인 버튼 클릭 시 처리 이벤트
                $("#pwdBtn").click(function() {
                    inquiryPwdConfirm();
                });
                
                
        
                 $("#goToListBtn").click(function() {
                        window.location.href = "/inquiry/inquiryList";
                 });
                 
                // 비밀번호 확인 함수
                function inquiryPwdConfirm(){
                    //console.log("123");
                    if(!chkData('#inquiry_password', "비밀번호를")) return;
                    else{
                        $.ajax({
                            url : "/inquiry/pwdConfirm",
                            type : "post",
                            data : $("#form_password").serialize(),
                            dataType : "text",
                            error : function(){
                                alert('시스템 오류. 관리자에게 문의하세요');
                            },
                            success : function(resultData){
                                let goUrl="";
                                if(resultData == "fail"){
                                    $("#msg").text("작성시 입력한 비밀번호가 일치하지 않습니다").css("color", "red");
                                    $("#inquiry_password").select();
                                }else if(resultData=="success"){
                                    $("#msg").text("");
                                    if(buttonCheck == 1){
                                        //actionProcess("get", "/inquiry/inquiryUpdateForm");
                                        goUrl = "/inquiry/inquiryUpdateForm";
                                        $("#f_data").attr("action", goUrl);
                                        $("#f_data").submit();
                                    }else if(buttonCheck == 2){
                                        if(confirm("정말로 이 문의사항을 삭제하시겠습니까?")){
                                            //actionProcess("post", "/inquiry/inquiryDelete");
                                            goUrl = "/inquiry/inquiryDelete";
                                            $("#f_data").attr("action", goUrl);
                                            $("#f_data").submit();
                                        }
                                    }
                                }
                            }
                        });
                    }
                }	 
            });
        
                
        
        </script>
        
        <style>
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
            <form name="f_data" id="f_data" method="get">
                <input type="hidden" name="inquiry_no" value="${detail.inquiry_no}" />
            </form>
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
            <div id="page-content-wrapper" style="margin-top : 50px">

                <!-- Page content-->
                <div class="container mt-4">
                    <h1>문의사항 상세 정보</h1>
                    <table class="table table-bordered">
                        <tbody>
                            <tr>
                                <th scope="row" class="col-md-2">글번호</th>
                                <td>${detail.inquiry_no}</td>
                            </tr>
                            <tr>
                                <th scope="row">작성일</th>
                                <td>${detail.inquiry_date}</td>
                            </tr>
                            <tr>

								<th scope="row">제목</th>
                                <td>${detail.inquiry_title}</td>
                            </tr>
                            <tr>
                                <th scope="row">질문</th>
                                <td>${detail.inquiry_question}</td>
                            </tr>
                        </tbody>
                    </table>
                
                    <!-- 뒤로 가기 버튼 -->
			        <button id="goToListBtn" class="btn btn-primary" style="margin-left: 11px;">문의사항 목록으로 이동</button>
			        <!-- 수정하기 버튼 -->
			        <input type="button" value="수정하기" id="updateFormBtn" class="btn btn-primary"/>
			        <!-- 삭제하기 버튼 -->
			        <input type="button" value="삭제하기" id="deleteBtn" class="btn btn-primary"/>
                    
                    <!-- 비밀번호 확인 입력창 -->
                    <div id="pwdChk" class="container mt-4">
                        <form name="form_password" id="form_password">
                            <input type="hidden" name="inquiry_no" id="inquiry_no"
                                value="${detail.inquiry_no}" />
                            <div class="form-group">
                                <label for="inquiry_password" id="l_password">비밀번호 :</label>
                                <input type="password" class="form-control" name="inquiry_password" id="inquiry_password" />
                            </div>
                            <div class="form-group">
                                <button type="button" class="btn btn-primary" id="pwdBtn">확인</button>
                            </div>
                            <div class="form-group">
                                <span id="msg"></span>
                            </div>
                        </form>
                    </div>
                    <!-- 댓글 -->
		    		<jsp:include page="reply.jsp" /> 
            	
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