<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css" rel="stylesheet">
<!-- <link rel="stylesheet" type="text/css" href="../css/css.css"> -->
<link rel="stylesheet" type="text/css" href="../../resources/css/product.css">
</head>
<body>
<!-- 생산실적등록 폼 -->
<div class="black-bar"> <h4 style="text-align: center; color: white; padding-top: 8px">  <i class='bx bx-edit'></i>생산실적 등록</h4></div>
		<div style="display: flex; justify-content: center; margin-bottom: 15px" >
		  <img src="../../resources/css/logo.png">
		</div>
<div class="container mt-3">
<!--  		<hr width="100%" style="border: 2px solid black"> -->

<!--         <hr width="100%" style="border: 2px solid black"> -->
<!-- 품번, 품명, 실적일, 실적수량, 불량여부, 불량사유 , 비고 -->
<form action="" method="post">
<table class="box" style="margin-top: 30px; width: 100%">
  <tbody>
    <tr>
      <td>품번</td>
      <td><input type="text" name="item_code"></td>
    </tr>
    <tr>
      <td>품명</td>
      <td><input type="text"name="item_name"></td>
    </tr>
    <tr>
      <td>실적수량</td>
      <td><input type="number"name="pfQTY" min="0"></td>
    </tr>
    <tr>
      <td>실적일</td>
      <td><input class="perf_date" type="date"name="perf_date"></td>
    </tr>
    <tr>
      <td>불량여부</td>
      <td>
      <select class="gobd" name="perf_gobd" onchange="handlegobdchange();">
      	<option value="n">불량</option>
      	<option value="y">정상</option>
      </select>
      </td>
    </tr>
    <tr>
      <td>불량사유</td>
      <td><input class="gobd-reason" type="text" name="err_reason"></td>
    </tr>
    <tr>
      <td>비고</td>
      <td><input type="text" name="remark"></td>
    </tr>
  </tbody>
</table>
<!--     <hr width="100%" style="border: 2px solid black"> -->


<!-- 작업지시등록, 취소 버튼 -->
<div style="text-align: center; margin-top: 50px">
<button class=btn-add onclick="onsubmit();"> <i class='bx bx-edit'></i> 등록</button>
<button class=btn-search onclick="window.close()">X 취소</button>
</div>

</form>

<br>
</div>
<script type="text/javascript">
	function onsubmit() {
		document.getElementsByTagName('form').submit();
		window.close();
	}
	
	function handlegobdchange() {
		if(document.querySelector('.gobd').value === "y") {
			document.querySelector('.gobd-reason').disabled = true;
		} else {
			document.querySelector('.gobd-reason').disabled = false;
		}
	}
	
	function disableFutureDates() {
		var today = new Date().toISOString().split('T')[0];
		document.querySelector('.perf_date').max = today;
	}
	
	window.addEventListener('DOMContentLoaded', function() {
		disableFutureDates();
	});
</script>
</body>
</html>
