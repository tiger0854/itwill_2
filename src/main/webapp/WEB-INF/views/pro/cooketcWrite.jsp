<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css"
	rel="stylesheet">
<!-- <link rel="stylesheet" type="text/css" href="../css/css.css"> -->
<link rel="stylesheet" type="text/css"
	href="../../resources/css/product.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script type="text/javascript">
	function handlegobdchange() {
		if (document.querySelector('.gobd').value === "n") {
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

	$(document).ready(function() {
		$(".btn-add").click(function() {
			var frObj = $("#fr");
			var formData = frObj.serialize(); // 폼 데이터를 직렬화합니다.
			$.ajax({
				url : "/pro/cooketcWrite", // 요청을 보낼 서버의 URL
				type : "POST", // HTTP 요청 방식 (POST)
				data : formData, // 전송할 데이터 (직렬화된 폼 데이터)
				success : function(response) {
					alert("작성 성공!");
					opener.location.reload();
					window.close(); // 윈도우 창을 닫습니다.
				},
				error : function(xhr, status, error) {
					console.error("에러 발생:", error);
				}
			});
		});
	});
	

	
</script>
</head>
<body>

	<!-- 생산실적등록 폼 -->
	<div class="black-bar">
		<h4 style="text-align: center; color: white; padding-top: 8px">
			<i class='bx bx-edit'></i>생산실적 등록
		</h4>
	</div>
	<div
		style="display: flex; justify-content: center; margin-bottom: 15px">
		<img src="../../resources/css/logo.png">
	</div>
	<div class="container mt-3">
		<!--  		<hr width="100%" style="border: 2px solid black"> -->
		<!--         <hr width="100%" style="border: 2px solid black"> -->
		<!-- 품번, 품명, 실적일, 실적수량, 불량여부, 불량사유 , 비고 -->
		<form id="fr" role="form" method="post" action="">
			<table class="box" style="margin-top: 30px; width: 100%">
				<tbody>
					<tr>
						<td>품번</td>
						<td><input type="text" name="item_code"
							value="${cvo.item_code }" readonly></td>
					</tr>
					<tr>
						<td>품명</td>
						<td><input type="text" name="item_name"
							value="${cvo.item_name }" readonly></td>
					</tr>
					<tr>
						<td>자재코드</td>
						<td><input type="text" name="material_code"
							value="${cvo.material_code }" readonly></td>
					</tr>
					<tr>
						<td>자재이름</td>
						<td><input type="text" name="material_name"
							value="${cvo.material_name }" readonly></td>
					</tr>
					<tr>
						<td>지시수량</td>
						<td><input type="number" name="coQTY" value="${cvo.coQTY }"
							readonly></td>
					</tr>
					<tr>
						<td>실적수량</td>
						<td><input type="number" name="cfQTY" min="0"></td>
					</tr>
					<tr>
						<td>실적일</td>
						<td><input class="perf_date" type="date" name="cerf_date"></td>
					</tr>
					<tr>
						<td>불량여부</td>
						<td><select class="gobd" name="cerf_gobd"
							onchange="handlegobdchange();">
								<option value="n">정상</option>
								<option value="y">불량</option>
						</select></td>
					</tr>
					<tr>
						<td>불량사유</td>
						<td><input class="gobd-reason" type="text" name="err_reason"></td>
					</tr>
					<tr>
						<td>조리시간</td>
						<td>
							<select name="co_time">
								<c:forEach var="minute" begin="1" end="59" step="1">
									<option value="${minute}">${minute}분</option>
								</c:forEach>
							</select></td>
					</tr>
				</tbody>
			</table>
			<!--     <hr width="100%" style="border: 2px solid black"> -->

			
			<!-- 작업지시등록, 취소 버튼 -->
			<div style="text-align: center; margin-top: 50px">
				<button class=btn-add>
					<i class='bx bx-edit'></i> 등록
				</button>
				<button class=btn-search onclick="window.close()">X 취소</button>
			</div>
		</form>
		<br>
	</div>


</body>
</html>
