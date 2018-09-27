<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
</head>
<body>
<%@ include file="../include/admin_menu.jsp" %>
<%-- <%@ include file="../include/session_check.jsp" %> --%>
 <!-- 구글 차트 호출을 위한 js 파일 -->
<script type="text/javascript" 
src="https://www.google.com/jsapi"></script>
<script>
	//구글 차트 라이브러리 로딩
	google.load("visualization","1", {
		"packages":["corechart"]
	});
	//라이브러리 로딩이 완료되면 drawChart 함수 호출
	google.setOnLoadCallback(drawChart);
	function drawChart(){
		//차트 그리기에 필요한 json 데이터 로딩
		var jsonData=$.ajax({
			url: "${path}/chart/cart_money_list.do",
			dataType: "json",
			async: false
		}).responseText;
		console.log(jsonData);
		//json => 데이터테이블
		var data=new google.visualization.DataTable(jsonData);
		console.log("데이터 테이블:"+data);
		 /* var chart=new google.visualization.PieChart(
				document.getElementById("chart_div"));  */
 		 /* var chart=new google.visualization.LineChart(
				document.getElementById("chart_div"));  */
		 var chart=new google.visualization.ColumnChart(
					document.getElementById("chart_div"));	 	
// curveType: "function" => 곡선 처리				
		chart.draw(data, {
			title: "차트 예제",
			//curveType: "function",
			width: 600,
			height: 440
		});
	}
</script>
</head>
<body>
<%@ include file="../include/admin_menu.jsp" %>
<br><br><br><br><br><br><br><br>
<div id="chart_div" align="center"></div>
<br>
<div align="center">
<button id="btn" type="button" onclick="drawChart()" class="btn btn-success">
refresh</button>
</div>
<%@ include file="../include/footer.jsp" %>

</body>
</html>