<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<link rel="icon" href="../../resources/logo_favicon.png" type="image/x-icon">
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<meta charset="UTF-8">
<title>대시보드</title>
<jsp:include page="../common/header.jsp"/>
<script type="text/javascript">

</script>

</head>
<body id="body-pd">
<div style="margin: auto;margin-left: 100px;">
<div style="display: flex;margin:auto;margin-top: 100px;">
  <div id="card" style="width: 300px;padding: 20px">
		
		<h5><i class='bx bxs-clinic' ></i>금일 입고예정</h5>
			<h3><b>${selectNowIndate } 건</b></h3>
		</div>
		 <div id="card" style="width: 300px;padding: 20px">
		<h5><i class='bx bxs-clinic' ></i>금일 입고완료 </h5>
			<h3><b>${selectNowEdate } 건</b></h3>
		</div>
		
				 <div id="card" style="width: 300px;padding: 20px">
		<h5><i class='bx bx-log-out-circle' ></i>금일 출고예정 </h5>
			<h3><b>${outScheduleToday }건</b></h3>
		</div>
		
				 <div id="card" style="width: 300px;padding: 20px">
		<h5><i class='bx bx-log-out-circle' ></i>금일 출고완료 </h5>
			<h3><b>${outCompleteToday } 건</b></h3>
		</div>
		</div>

<div style="display: flex;">
<!-- 라인별 생산률 그래프 -->
<div id="card" style="width: 700px;padding: 20px">
<h4>라인별 생산률</h4>
<hr>
<canvas id="canvas"></canvas>
</div>
<!-- 라인별 생산률 그래프 -->

<!-- 불량률 -->
<div id="card" style="width: 700px;padding: 20px">
<h4>불량률 현황</h4>
<hr>
<canvas id="canvas_err"></canvas>
</div>
<!-- 불량률 -->
</div>

<!-- 인사 관련 내용 -->
<div style="display: flex;">
<div id="card" style="width: 500px;padding: 20px">
<h4>임직원 현황</h4>
<hr>
  <canvas id="emp_count"  width ="300" height="300"></canvas>
</div>
<div>
  <div id="card" style="width: 300px;padding: 20px">
		
		<h5><i class='bx bxs-user-voice'></i>현재 휴가자</h5>
		${vacationCount }명
		</div>
		 <div id="card" style="width: 300px;padding: 20px">
		<h5><i class='bx bxs-user-voice'></i>휴가 신청자</h5>
			${pvacationCount } 명
		</div>
		</div>
		</div>
		</div>
		
</body>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
//----------------------  불량률 현황-----------------------------
const errQTY = "${errQTY }";
const totalQTY = "${totalQTY }";

var errRate = (Math.round((errQTY / totalQTY) * 1000) / 1000)*100;

const canvas_err = document.getElementById('canvas_err');

canvas_err.style.width = '600.467px';
canvas_err.style.height = '219.733px';

new Chart(canvas_err, {
  type: 'bar',
  data: {
    labels: ['불량률 현황'],
    datasets: [{
      label: '목표치',
      data: [20],
      backgroundColor: ['green'],
      borderWidth: 1
    },{
        label: '불량률',
        data: [errRate ],
        backgroundColor: ['red'],
        borderWidth: 1
      }
    
    ]
  },
  options: {
	 responsive: false,
    scales: {
      y: {
        beginAtZero: true
      }
    }
  }
});
//----------------------  불량률 현황-----------------------------

//----------------------  임직원 현황-----------------------------
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
//----------------------  임직원 현황-----------------------------
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
	canvas.style.width = '600.467px';
	canvas.style.height = '219.733px';
	
	ctx = canvas.getContext('2d');
	
	myChart = new Chart(ctx, {
	  type: 'bar',
	  data: {
	    labels: ["1번 라인","2번 라인"], // 배열로 라벨 지정
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