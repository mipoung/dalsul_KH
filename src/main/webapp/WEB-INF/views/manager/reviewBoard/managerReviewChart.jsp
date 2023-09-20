<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>
<!-- 관리자페이지 드롭다운 사용을 위해 필요한 스크립트 -->
<script type="text/javascript" src="/resources/include/common/bootstrap/js/bootstrap.bundle.min.js"></script>


	<script>
	$(function(){
		// 별점 값을 별 모양으로 변환
		$(".reviewRating").each(function(){
  			let rating = $(this).text();
  			$(this).css("color","red");
  		    if(rating === "5") $(this).text("★★★★★");
  		    else if(rating === "4") $(this).text("★★★★");
  			else if(rating === "3") $(this).text("★★★");
  			else if(rating === "2") $(this).text("★★");
  			else if(rating === "1") $(this).text("★");
  			else if(rating === "0") $(this).text("별점없음");
  		});
	      
  		
  		
  		
  		
  	});
	</script>
<style>
		
	
	</style>
	
   </head>
   <body>
   <!-- 매니저 헤더 -->
   <%@ include file="/WEB-INF/views/manager/managerHeader.jsp"%>
   
  	 <div id="mainSection">
	   	<h3>리뷰 통계</h3>
			
			
			
	</div>

	</body>
	
</html>