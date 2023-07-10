<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="../../resources/logo_favicon.png" type="image/x-icon">
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
</script>
</html>