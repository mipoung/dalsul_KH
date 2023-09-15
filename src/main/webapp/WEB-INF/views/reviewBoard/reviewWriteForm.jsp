<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>


      
      <script>
      	$(function(){
      		
      		$("#r_InsertBtn").click(function(){
      			
      			$("#r_InsertForm").attr({
      				"method" : "post",
      				"action" : "/review/myReviewInsert"
      				
      				
      			})
      			
      			$("#r_InsertForm").submit();
      			
      			
      			
      		});
      		
      		
      		
      		
      	});	
      
      
      </script>
      
   </head>
   <body>
   
   <!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
  리뷰 작성하기
</button>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">리뷰 작성하기</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      <!-- 카드 시작 -->
      
      <form id="r_InsertForm">
        <div class="card mb-3" style="max-width: 540px;">
		  <div class="row g-0">
		    <div class="col-md-4">
		      <img src="/resources/images/junju.png" class="img-fluid rounded-start" alt="...">
		    </div>
		    <div class="col-md-8">
		      <div class="card-body">
		        <h5 class="card-title">제품명</h5>
		        <p class="card-text">별점<input type="text" name="rating" id="rating" value="10"/></p>
		        <p class="card-text"><small class="text-body-secondary">주문일 : </small></p>
		      </div>
		    </div>
		  </div>
		</div>
        <!-- 카드 끝 -->
        
        
        <!-- 입력 박스 시작 -->
         <div class="mb-3">
            <!-- <label for="message-text" class="col-form-label">리뷰 내용</label> -->
            <textarea class="form-control" id="message-text" rows="7" placeholder="리뷰 내용을 입력해주세요"></textarea>
          </div>
          <!-- 입력 박스 끝 -->
       </form>
       
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary" id="r_InsertBtn">등록</button>
      </div>
    </div>
  </div>
</div>
   
   </body>
</html>