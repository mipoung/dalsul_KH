<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>
<!-- 관리자페이지 드롭다운 사용을 위해 필요한 스크립트 -->
<script type="text/javascript" src="/resources/include/common/bootstrap/js/bootstrap.bundle.min.js"></script>

 <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script>
google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawChart);

function drawChart() {
	/* ajax로 가져오기 */
  var data = google.visualization.arrayToDataTable([
    ['Task', 'Hours per Day'],
    ['막걸리',     21],
    ['소주',      11],
    ['청주',  2],
    ['전통주', 2],
    ['와인',    7]
  ]);

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
	margin-left : 50px;
	margin-right : 50px;
}

</style>

</head>
  <body>
     <!-- 매니저 헤더 -->
   <%@ include file="/WEB-INF/views/manager/managerHeader.jsp"%>
   
   		<!-- 원형 도표 -->
  		<div class="container-sm" id="piechart"></div>
 
 
 
 		<!-- 셀렉트해오기 -->
 		<table class="table">
		  <thead>
		    <tr>
		      <th scope="col">#</th>
		      <th scope="col">주종</th>
		      <th scope="col">평균가격</th>
		      <th scope="col">평균별점</th>
		      <th scope="col">판매량</th>
		      <th scope="col">가장 별점이 높은 제품</th>
		    </tr>
		  </thead>
		  <tbody>
		    <tr>
		      <th scope="row">1</th>
		      <td>Mark</td>
		      <td>Otto</td>
		      <td>@mdo</td>
		      <td>@mdo</td>
		      <td>@mdo</td>
		    </tr>
		   
		  </tbody>
		</table>

   </body>
   
</html>