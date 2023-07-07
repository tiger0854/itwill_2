<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>Insert title here</title>
<script type="text/javascript">



$(document).ready(function(){
	
	  var result = JSON.parse('${graphListJson}');
	  var values = Object.values(result);
// 	  alert(values);
// 	  console.log(values);
// 	  var line1 = result[0]
// 	  console.log(result[key]);

	console.log(values);
	console.log(result);
	canvas = document.getElementById('canvas');
	canvas.width = 500.467; // 너비 설정 (숫자 값만 사용)
	canvas.height = 219.733; // 높이 설정 (숫자 값만 사용)
	canvas.style.display = 'block';
	canvas.style.boxSizing = 'border-box';
	canvas.style.width = '439.467px';
	canvas.style.height = '219.733px';
	
	ctx = canvas.getContext('2d');
	
	myChart = new Chart(ctx, {
	  type: 'bar',
	  data: {
	    labels: ["라인1","라인2"], // 배열로 라벨 지정
	    datasets: [{
	      label: '작업지시 생산률',
	      data: result[0],
	      borderWidth: 1
	    }]
	  },
	  options: {
	    scales: {
	      y: {
	        beginAtZero: true
	      }
	    },
	    responsive: false
	  }
	});
});

</script>



</head>
<body>
<h2>그래프</h2>
${graphListJson}
<canvas id="canvas"></canvas>


</body>
</html>