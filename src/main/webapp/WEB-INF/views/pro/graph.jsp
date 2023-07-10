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
	var values = result.map(function(obj) {
	  return obj.result;
	});

	console.log(values);
// 	console.log(result);
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
	      data: values,
	      backgroundColor: ['pink', 'skyblue'], // 각 데이터셋에 원하는 색상을 지정
	      borderWidth: 1
	    }]
	  },
	  options: {
	    scales: {
	      y: {
	        beginAtZero: true
	      }
	    },
	    responsive: false,
	    plugins: {
	      legend: {
	        display: true, // 범례를 표시
	        labels: {
	          generateLabels: function(chart) {
	            var data = chart.data;
	            if (data.labels.length && data.datasets.length) {
	              return data.labels.map(function(label, index) {
	                var dataset = data.datasets[0];
	                var value = dataset.data[index];
	                return {
	                  text: label, // 라인별 생산률 텍스트
	                  fillStyle: dataset.backgroundColor[index],
	                  hidden: isNaN(dataset.data[index]),

	                  // 기타 속성 설정
	                  // ...
	                };
	              });
	            }
	            return [];
	          }
	        }
	      }
	    }
	  }
	});
});

</script>



</head>
<body>
<h2>라인에 따른 생산률</h2>
<%-- ${graphListJson} --%>
<canvas id="canvas"></canvas>


</body>
</html>