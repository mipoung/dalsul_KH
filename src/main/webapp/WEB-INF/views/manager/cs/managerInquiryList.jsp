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
<title>inquiry</title>
        <script>
            $(function(){
                    
                
    
                  $(".goDetail").click(function(){
                     let inquiry_no = $(this).parents("tr").attr("data-num");
                        console.log(inquiry_no);
                     $("#inquiry_no").val(inquiry_no);
                     
                     $("#detailForm").attr({
                         "method" : "get", 
                         "action" : "/manager/cs/managerInquiryDetail"
                     });
                     $("#detailForm").submit();
                      
                      
                  });
                  
                  
                  
                  
                 /* 검색 후 검색 대상과 검색 단어 출력 */
                let word="<c:out value='${InquiryVO.keyword}' />";
                let value="";
                if(word!=""){
                    $("#keyword").val("<c:out value='${InquiryVO.keyword}' />");
                    $("#search").val("<c:out value='${InquiryVO.search}' />");
                    
                    
                    if($("#search").val()!='inquiry_title'){
    
                        if($("#search").val()=='inquiry_title') value = "#list tr td.goDetail"; 
                        else if($("#search").val()=='inquiry_subject') value="#list tr td.name";
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
                        "action" : "/manager/cs/managerInquiryList"
                    });
                    $("#f_search").submit();
                    
                }
    
                  
                  
                  
                  
                  
                  
                  
            });
          </script>

</head>
   <body>
   <!-- 매니저 헤더 -->
   <%@ include file="/WEB-INF/views/manager/managerHeader.jsp"%>
   
   
   <!-- 여기서 작성하시면 됩니다. -->
    <div id ="inquirySearch" class="text-right">
			<form id="f_search" name="f_search" class="form-inline">
				<input type="hidden" name="pageNum" value="${pageMaker.cvo.pageNum}"/>
				<input type="hidden" name="amount" id="amount" value="${pageMaker.cvo.amount}">
				
				<div class="form-row align-items-center">
				    <div class="col-auto">
				        <label class="sr-only" for="search">검색조건</label>
				        <select class="form-select" id="search" name="search" aria-label="Default select example" style="width:250px">
				            <option value="inquiry_title">제목</option>
				            <option value="inquiry_question">내용</option>
				        </select>
				    </div>
				    <div class="col-auto">
				        <input type="text" name="keyword" id="keyword" class="form-control" placeholder="검색어를 입력하세요" style="width:250px" />
				    </div>
				    <div class="col-auto">
				        <button type="button" id="searchData" class="btn btn-primary">검색</button>
				    </div>
				</div>
			</form>
		</div>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th class="text-center col-md-1">글번호</th>
					<th class="text-center col-md-5">제목</th>
					<th class="text-center col-md-1">작성자</th>
					<th data-value="b_date" class="text-center order col-md-1">작성일</th>
				</tr>
			</thead>
			<tbody>
				<!-- inquiry 목록 데이터 반복 출력 -->
				<c:forEach items="${inquiryList}" var="inquiry">
					<tr>
						<td>${inquiry.inquiry_no}</td>
						<td><a href="/manager/cs/managerInquiryDetail?inquiry_no=${inquiry.inquiry_no}">
								${inquiry.inquiry_title} </a></td>
						<td>${inquiry.user_name}</td>
						<td>${inquiry.inquiry_date}</td>
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
	<!-- <a href="/manager/cs/managerInquiryWriteForm" class="btn btn-primary" style="margin-bottom: 15px">작성하기</a>-->   
   
   
   	<!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="/resources/include/cs/js/csList.js"></script>
   
	</body>
	
</html>