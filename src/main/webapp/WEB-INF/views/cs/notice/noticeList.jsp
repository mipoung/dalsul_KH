<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>

        <meta name="shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>고객지원</title>
        <link href="/resources/include/cs/css/csList.css" rel="stylesheet" />
        <link rel="stylesheet" type="text/css" href="/resources/include/mainpage/css/header.css" />
        <link rel="stylesheet" type="text/css" href="/resources/include/mainpage/css/footer.css" />
        <script src="/resources/include/mainpage/js/header.js"></script>
        <script>
            $(function(){
            
            
    
              $(".goDetail").click(function(){
                 let notice_no = $(this).parents("tr").attr("data-num");
                    console.log(notice_no);
                 $("#notice_no").val(notice_no);
                 
                 $("#detailForm").attr({
                     "method" : "get", 
                     "action" : "/notice/noticeDetail"
                 });
                 $("#detailForm").submit();
                  
                  
              });
              
              
              
              
             /* 검색 후 검색 대상과 검색 단어 출력 */
            let word="<c:out value='${NoticeVO.keyword}' />";
            let value="";
            if(word!=""){
                $("#keyword").val("<c:out value='${NoticeVO.keyword}' />");
                $("#search").val("<c:out value='${NoticeVO.search}' />");
                
                
                if($("#search").val()!='notice_title'){
    
                    if($("#search").val()=='notice_title') value = "#list tr td.goDetail"; 
                    else if($("#search").val()=='notice_subject') value="#list tr td.name";
                    console.log($(value+":contains('"+word+"')").html());
                    
                    
                    $(value+":contains('"+word+"')").each(function(){
                        let regex = new RegExp(word, 'gi'); // g: 전역 플래그, i:대소문자구문없음
                        
                        $(this).html($(this).html().replace(regex,"<span class='required'>"+word+"</span>"));
                        
                    });
                }
                
            }
              
              
              
            /* 입력 양식 enter 제거 */
            $("#keyword").bind("keydown", function(event){
                if (event.keyCode == 13) {
                    event.preventDefault();
                }
            });
              
              
              
             
            /* 검색 버튼 클릭 시 처리 이벤트 */
            $("#searchData").click(function(){
                    if($("#search").val()!="all"){ // 검색대상(search)의 값이 all이 아니면 키워드(검색할 단어)가 반드시 필요.
                            if(!chkData("#keyword","검색어를")) return;
                    }
                    $("#pageNum").val(1);
                    goPage();
                    
                    
                    
                    
                                
            });
            
            
            $(".paginate_button a").click(function(e){
                e.preventDefault();
                $("#f_search").find("input[name='pageNum']").val($(this).attr("href"));
                goPage();
            })
              
              
              
            /* 검색을 위한 실질적인 처리 함수 */
            function goPage(){
                if($("#search").val()=="all"){
                    $("#keyword").val("");
                }
                
                $("#f_search").attr({
                    "method" : "get",
                    "action" : "/notice/noticeList"
                });
                $("#f_search").submit();
                
            }
    
              
              
              
              
              
              
              
        });
        </script>
		<style>
			#keyword{
				width:300px;
			}
			#search{
				width:210px;
            }
            .form-row > div {
				display : inline-block;
			}
			#searchData{
                margin-bottom: 5px;	
            }
            .pagination {
				justify-content: center;
				margin-top: 20px;
			}
			.pagination li {
			    display: inline-block;
			    margin-right: 5px;
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
                <div class="container-fluid">
                    <h1 class="mt-4">공지사항</h1>
		<!-- 검색기능 -->
		<div id ="noticeSearch" class="text-right">
			<form id="f_search" name="f_search" class="form-inline">
				<input type="hidden" name="pageNum" value="${pageMaker.cvo.pageNum}"/>
				<input type="hidden" name="amount" id="amount" value="${pageMaker.cvo.amount}">
				
				<div class="form-row align-items-center">
				    <div class="col-auto">
				        <label class="sr-only" for="search">검색조건</label>
				        <select class="form-select" id="search" name="search" aria-label="Default select example">
				            <option value="notice_title">제목</option>
				            <option value="notice_subject">내용</option>
				        </select>
				    </div>
				    <div class="col-auto">
				        <input type="text" name="keyword" id="keyword" class="form-control" placeholder="검색어를 입력하세요" />
				    </div>
				    <div class="col-auto">
				        <button type="button" id="searchData" class="btn btn-primary">검색</button>
				    </div>
				</div>
			</form>
		</div>		
		<!-- 리스트 -->
		
				<!-- 공지사항 목록 테이블 -->
		<table class="table table-bordered">
			<thead>
				<tr>
					<th class="text-center col-md-1">글번호</th>
					<th class="text-center col-md-6">제목</th>
					<th data-value="b_date" class="order col-md-1">작성일</th>
				</tr>
			</thead>
			<tbody>
				<!-- 공지사항 목록 데이터 반복 출력 -->
				<c:forEach items="${noticeList}" var="notice">
					<tr>
						<td>${notice.notice_no}</td>
						<td><a href="/notice/noticeDetail?notice_no=${notice.notice_no}">
								${notice.notice_title} </a></td>
						<td>${notice.notice_date}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		

		<!-- 페이징 -->
		<div class="text-center">
			<ul class="pagination">
				<!--  이전 바로가기 10개 존재 여부를 prev 필드의 값으로 확인  -->
				<c:if test="${pageMaker.prev}">
					<li class="paginate_button previous">
						<a href="${pageMaker.startPage - 1}">Previous</a>
					</li>
				</c:if>
				
				<!--  바로가기 번호 출력  -->
				<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
					<li class="paginate_button ${pageMaker.cvo.pageNum == num ? 'active':''}">
						<a href="${num}">${num}</a>
					</li>
				</c:forEach>
				
				<!-- 다음 바로가기 10개 존재 여부를 next 필드의 값으로 확인 -->
				<c:if test="${pageMaker.next}">
					<li class="paginate_button next">
						<a href="${pageMaker.endPage + 1 }">Next</a>
					</li>
				</c:if>
				
				
			</ul>
		
		
		</div>


		
		<!-- 작성하기 -->
		<a href="/notice/managerNoticeWriteForm" class="btn btn-primary" style="margin-bottom: 15px">작성하기</a>
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