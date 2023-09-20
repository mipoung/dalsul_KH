<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>
<!-- 관리자페이지 드롭다운 사용을 위해 필요한 스크립트 -->
<script type="text/javascript" src="/resources/include/common/bootstrap/js/bootstrap.bundle.min.js"></script>

 <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

 
<script>

var serverData = JSON.parse('${chartData}'); // Java 객체를 JSON 문자열로 변환했다고 가정
console.log(serverData);
google.charts.load('current', {'packages':['corechart']});
//google.charts.setOnLoadCallback(drawChart);
google.charts.setOnLoadCallback(function() {
       drawChart(serverData);
});
 
 var chartArray = [['Task', 'Hours per Day']];
 
//serverData를 반복하여 chartArray에 데이터 추가
 serverData.forEach(function(item) {
     chartArray.push([item.product_type, item.product_type_count]);
 });
 
 
// 구글 차트
function drawChart() {
  var data = google.visualization.arrayToDataTable(chartArray);

  var options = {
    title: '현재 등록된 제품 주종별 비율'
  };

  var chart = new google.visualization.PieChart(document.getElementById('piechart'));

  chart.draw(data, options);
}






</script>

<style>
#piechart{
	height: 400px;
}

.table {

	margin-bottom : 50px;
	width : 90%;
	margin : 0 auto;
	margin-bottom : 50px;
}

#mainCount {
	
	width : 100%;
	margin : 0 auto;

}

#mainBoard {
	margin-left : 8%;

}



</style>

</head>
  <body>
     <!-- 매니저 헤더 -->
   <%@ include file="/WEB-INF/views/manager/managerHeader.jsp"%>
   
   		<!-- 원형 도표 -->
  		<div class="container-sm" id="piechart"></div>
 
 		<div id="mainCount">
 		<h4 id="mainBoard">오늘의 통계</h4>
 		<c:choose>
	 		<c:when test="${not empty count}">
		 		<c:forEach var="count" items="${count}">
				    <table class="table">
					    <thead>
						    <tr>
						      <th scope="col" class="text-center bg-body-secondary" >전체 회원 수</th>
						      <th scope="col" class="text-center bg-body-secondary">등록된 제품 수</th>
						      <th scope="col" class="text-center bg-body-secondary">등록된 리뷰 수</th>
						      <th scope="col" class="text-center bg-body-secondary">오늘 가입한 회원 수</th>
						      <th scope="col" class="text-center bg-body-secondary">오늘 등록된 제품 수</th>
						      <th scope="col" class="text-center bg-body-secondary">오늘 등록된 리뷰 수</th>
						    </tr>
						  </thead>
						  <tbody class="table-group-divider">
						    <tr>
						      <td class="text-center">${count.users_count}</td>
						      <td class="text-center">${count.product_count}</td>
						      <td class="text-center">${count.review_count}</td>
						      <td class="text-center">${count.today_users_count}</td>
						      <td class="text-center">${count.today_product_count}</td>
						      <td class="text-center">${count.today_review_count}</td>
						    </tr>
					    </tbody>
					</table>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="5" class="tac text-center">등록된 게시글이 존재하지 않습니다.</td>
				</tr>
			</c:otherwise>
		</c:choose>
 		</div>
 		
 		<!-- 셀렉트해오기 -->
 		<h4 id="mainBoard">주종별 통계</h4>
 		<table class="table">
 		
		  <thead>
		    <tr>
		      <th scope="col" class="text-center bg-body-secondary">주종</th>
		      <th scope="col" class="text-center bg-body-secondary">평균가격</th>
		      <th scope="col" class="text-center bg-body-secondary">평균별점</th>
		      <th scope="col" class="text-center bg-body-secondary">가장 별점이 높은 제품</th>
		    </tr>
		  </thead>
		  
		    
		  <tbody id="list" class="table-group-divider">
					<!-- 데이터 출력 -->
					<c:choose>
						<c:when test="${not empty chartData}">
							<c:forEach var="mainData" items="${result}" varStatus="status">
								<tr class="text-center">
									<td class="text-center text-primary">${mainData.product_type}</td>
									<td class="text-center">${mainData.avg_price} 원</td>
									<td class="text-center">${mainData.avg_rating}</td>
									<td class="text-center">${mainData.best_product}</td>
								</tr>
							</c:forEach>
						
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="5" class="tac text-center">등록된 게시글이 존재하지 않습니다.</td>
							</tr>
						</c:otherwise>
					
					</c:choose>
					
			</tbody>
		   
		
		</table>

   </body>
   <%@ include file="/WEB-INF/views/main/footer.jsp"%>
</html>