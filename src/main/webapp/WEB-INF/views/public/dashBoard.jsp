<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="../../resources/logo_favicon.png" type="image/x-icon">
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<meta charset="UTF-8">
<title>Dash Board</title>
<jsp:include page="../common/header.jsp"/>
<style type="text/css">

</style>
</head>
<body id="body-pd">
<h1>대시보드</h1>

<div class="emp_count">
  <canvas id="emp_count"  width ="300" height="300"></canvas>
</div>

<!-- 라인별 생산률 그래프 -->
<h2>라인별 생산률</h2>
<canvas id="canvas"></canvas>
<!-- 라인별 생산률 그래프 -->

<p>vacationCount:${vacationCount }</p>
<p>pvacationCount:${pvacationCount }</p>
<p>bvacountCount:${bvacountCount }</p>
<p>selectNowIndate:${selectNowIndate }</p>
<p>selectNowEdate:${selectNowEdate }</p>
<p>outScheduleToday:${outScheduleToday }</p>
<p>outCompleteToday:${outCompleteToday }</p>


</body>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>

const emp_count = document.getElementById('emp_count');

new Chart(emp_count, {
  type: 'pie',
  data: {
    labels: ['임직원', '전일 일용근로자', '오전 일용근로자', '오후 일용근로자'],
    datasets: [{
      label: '직원 현황',
      data: [${empCount}, ${alCount_all}, ${alCount_am}, ${alCount_pm}],
      borderWidth: 2
    }]
  },
  options: {
	responsive: false,
    scales: {
      y: {
        beginAtZero: true
      }
    }
  }
}); // chart end

// ----------------------   라인별 생산률 -----------------------------
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
// ----------------------   라인별 생산률 ------------------------------

</script>
</html>