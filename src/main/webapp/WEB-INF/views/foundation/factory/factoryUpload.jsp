<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link rel="stylesheet" type="text/css" href="../../resources/css/product.css">
<!-- <link rel="stylesheet" type="text/css" href="../css/css.css"> -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" type="text/css" href="../css/product.css">
</head>
<script type="text/javascript">
	function onInsert() {
		var frObj = $("#fr");
		var formData = frObj.serialize(); // 폼 데이터를 직렬화합니다.
		if (frObj[0].checkValidity()) {
		$.ajax({
			url : "/foundation/factory/factoryUpload", // 요청을 보낼 서버의 URL
			type : "POST", // HTTP 요청 방식 (POST)
			data : formData, // 전송할 데이터 (직렬화된 폼 데이터)
			success : function(response) {
				alert("작성 성공!");
				opener.location.reload();
				window.close(); // 윈도우 창을 닫습니다.
			},
			error : function(xhr, status, error) {
				alert("빈칸을 입력해주세요!");
			}
		});
	}else {
		alert("입력란을 채워주세요!");
	}
	}
</script>
<body>
	<!-- 창고등록 폼 -->
	<div class="black-bar">
		<h4 style="text-align: center; color: white; padding-top: 8px">
			<i class='bx bx-edit'></i>공장 등록
		</h4>
	</div>
	<div
		style="display: flex; justify-content: center; margin-bottom: 15px">
		<img src="../../../resources/css/logo.png">
	</div>
	<div class="container mt-3">
		<!--  		<hr width="100%" style="border: 2px solid black"> -->

		<!--         <hr width="100%" style="border: 2px solid black"> -->
		<!-- 창고코드(패턴자동생성), 창고명, 관리자명, 사용여부, 구분(냉장,냉동,상온) -->
		<form id="fr" action="" method="post">
			<table class="box" style="margin-top: 30px; width: 100%">
				<tbody>
					<tr>
						<td>공장코드</td>
						<!--       <td><input type="text" name="factory_code" required="required"></td> -->
						<td>공장 코드는 FAC01 형식으로 자동 입력됩니다.</td>
					</tr>
					<tr>
						<td>공장명</td>
						<td><input type="text" name="factory_name"
							required="required"></td>
					</tr>
				</tbody>
			</table>
			<!--     <hr width="100%" style="border: 2px solid black"> -->


			<!-- 창고등록, 취소 버튼 -->
			<div style="text-align: center; margin-top: 50px">
				<button type="button" class="btn btn-outline-primary" onclick="onInsert();">
					<i class='bx bx-edit'></i> 등록
				</button>
				<button class="btn btn-danger" onclick="window.close()">X 취소</button>
			</div>

		</form>

		<br>
	</div>
</body>
</html>
