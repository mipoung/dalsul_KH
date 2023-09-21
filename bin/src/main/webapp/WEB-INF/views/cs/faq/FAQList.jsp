<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
 <script>
		$(function(){
				
			

			  $(".goDetail").click(function(){
				 let faq_no = $(this).parents("tr").attr("data-num");
					console.log(faq_no);
				 $("#faq_no").val(faq_no);
				 
				 $("#detailForm").attr({
					 "method" : "get", 
					 "action" : "/faq/FAQDetail"
				 });
				 $("#detailForm").submit();
				  
				  
			  });
			  
			  
			  
			  
			 /* 검색 후 검색 대상과 검색 단어 출력 */
			let word="<c:out value='${FAQVO.keyword}' />";
			let value="";
			if(word!=""){
				$("#keyword").val("<c:out value='${FAQVO.keyword}' />");
				$("#search").val("<c:out value='${FAQVO.search}' />");
				
				
				if($("#search").val()!='faq_title'){

					if($("#search").val()=='faq_question') value = "#list tr td.goDetail"; 
					else if($("#search").val()=='faq_answer') value="#list tr td.name";
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
					"action" : "/faq/FAQList"
				});
				$("#f_search").submit();
				
			}

			  
			  
			  
			  
			  
			  
			  
		});
	  </script>

</head>
<body>

	<h1 class="mb-4">FAQ List</h1>
		
		

		<!-- 검색기능 -->
		<div id ="faqSearch" class="text-right">
			<form id="f_search" name="f_search" class="form-inline">
				<input type="hidden" name="pageNum" value="${pageMaker.cvo.pageNum}"/>
				<input type="hidden" name="amount" id="amount" value="${pageMaker.cvo.amount}">
				
				<div class="form-group">
					<label>검색조건</label>
					<select id="search" name="search" class="form-control">
						<option value="all">전체 목록 조회</option>
						<option value="faq_title">제목</option>
						<option value="faq_answer">답변</option>
					</select>
					<input type="text" name="keyword" id="keyword" class="form-control" />
					<button type="button" id="searchData">검색</button>
				</div>
			</form>
		</div>		
		<!-- 리스트 -->
		
				<!-- FAQ 목록 테이블 -->
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>글번호</th>
					<th>제목</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody>
				<!-- FAQ 목록 데이터 반복 출력 -->
				<c:forEach items="${faqList}" var="faq">
					<tr>
						<td>${faq.faq_no}</td>
						<td><a href="/faq/FAQDetail?faq_no=${faq.faq_no}">
								${faq.faq_title} </a></td>
						<td>${faq.faq_date}</td>
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
		<a href="/faq/managerFAQWriteForm" class="btn btn-primary">작성하기</a>

	




	<!-- Bootstrap JS 및 jQuery -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>