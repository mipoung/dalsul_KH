<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>
<!-- 관리자페이지 드롭다운 사용을 위해 필요한 스크립트 -->
<script type="text/javascript" src="/resources/include/common/bootstrap/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<link rel="stylesheet" href="/resources/include/manager/css/managerCommon.css"/>

	<script>
	
	$(function(){
		
		var rawData = [
		    ['주종', '리뷰 수', '평균별점', '평균알콜도수', '풍선크기']
		  
		];
		
		// html에서 데이터 반복문으로 꺼내고 다시 스크립트로 가져와서 배열에 추가
		$("#dataContainer .dataItem").each(function() {
		    var productType = $(this).find(".productType").text();
		    var reviewCount = $(this).find(".reviewCount").text();
		    var avgRating = $(this).find(".avgRating").text();
		    var avgAlcohol = $(this).find(".avgAlcohol").text();
		    var avgPrice = $(this).find(".avgPrice").text();
		    rawData.push([productType, parseFloat(reviewCount), parseFloat(avgRating), parseFloat(avgAlcohol), parseFloat(reviewCount)]);
		});
		/*parseFloat(avgPrice)*/

		 
		 console.log(rawData);
		
		
		
	      google.charts.load('current', {'packages':['corechart']});
	      google.charts.setOnLoadCallback(drawSeriesChart);

	    function drawSeriesChart() {

	      var data = google.visualization.arrayToDataTable(rawData);

	      var options = {
	    		    title: '풍선에 마우스를 올리면 해당 주종의 평균 도수가 막대 그래프에 표시됩니다.',
	    		    hAxis: {
	    		        title: '리뷰 수',
	    		        viewWindow: {
	    		            min: 0,
	    		            max: 'auto'
	    		        }
	    		    },
	    		    vAxis: {
	    		        title: '평균 별점',
	    		        viewWindow: {
	    		            min: 0,
	    		            max: 5.5
	    		        }
	    		    },
	    		    bubble: {
	    		        textStyle: {
	    		            fontSize: 11
	    		        }
	    		    }
	    		};

	      var chart = new google.visualization.BubbleChart(document.getElementById('series_chart_div'));
	      chart.draw(data, options);
	    }
	      
  		
  		
  		
  		
  	});
	</script>
	<style>
		
		
		
	
	</style>
	
   </head>
   <body>
   <!-- 매니저 헤더 -->
   <%@ include file="/WEB-INF/views/manager/managerHeader.jsp"%>
   
  	 <div id="mainSection">
	   	
	    <div id="series_chart_div" style="width: 900px; height: 500px;"></div>
	    
	    
	    
	    
	    
	  <div id="mainCount">
			    <h3 id="mainSubject">리뷰 통계</h3>
			    
			    <c:choose>
			 		<c:when test="${not empty reviewStaticsData}">
				 		<c:forEach var="items" items="${reviewStaticsData}">
						    <table class="table">
							    <thead>
								    <tr>
								      <th scope="col" class="text-center bg-body-secondary" >전체 리뷰 수</th>
								      <th scope="col" class="text-center bg-body-secondary">전체 리뷰 평균 별점</th>
								      <th scope="col" class="text-center bg-body-secondary">오늘 작성된 리뷰</th>
								      <th scope="col" class="text-center bg-body-secondary">가장 많은 추천을 받은 리뷰</th>
								    </tr>
								  </thead>
								  <tbody class="table-group-divider">
								    <tr>
								      <td class="text-center">${items.review_count}</td>
								      <td class="text-center">${items.avg_review_rating}</td>
								      <td class="text-center">${items.review_today}</td>
								      <td class="text-center">리뷰번호 : ${items.max_like_review_no}<br>제품명 : ${items.max_like_product_name}
								      							<br>추천수 : ${items.review_like_count}<br>별점 : ${items.max_review_rating}</td>
								      
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
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
			    <!-- 서버에서 받아온 데이터를 여기서 반복해 꺼낸다음 이 값을 스크립트로 가져감 -->
			    <div id="dataContainer" style="display : none;">
				    <c:forEach items="${revieweChartData}" var="dataItem">
				        <div class="dataItem">
				            <span class="productType">${dataItem.product_type}</span>
				            <span class="reviewCount">${dataItem.review_count}</span>
				            <span class="avgRating">${dataItem.avg_review_rating}</span>
				            <span class="avgAlcohol">${dataItem.avg_product_alcohol}</span>
				            <span class="avgPrice">${dataItem.avg_product_price}</span>
				        </div>
				    </c:forEach>
				</div>
			    
		</div>	
			
			
			
	</div>

	</body>
	   <%@ include file="/WEB-INF/views/main/footer.jsp"%>
</html>