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
<link rel="stylesheet" type="text/css"
	href="../../resources/css/product.css">
<!-- <link rel="stylesheet" type="text/css" href="../css/css.css"> -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" type="text/css" href="../css/product.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
</head>
</head>
<script type="text/javascript">
	function onInsert() {
		var frObj = $("#fr");
		var formData = frObj.serialize(); // 폼 데이터를 직렬화합니다.

		Swal.fire({
			type : "success",
			showCancelButton : false,
			confirmButtonColor : "green",
			confirmButtonText : "작성성공!",
			closeOnConfirm : false
		}).then(function(result) {
			if (result.value) {
				$.ajax({
					url : "/foundation/warehouse/warehouseUpload",
					type : "POST",
					data : formData,
					success : function(response) {
						opener.location.reload();
						window.close();
					},
					error : function(xhr, status, error) {
						alert("빈칸을 입력해주세요!");
					}
				});
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
			<i class='bx bx-edit'></i>창고 등록
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
						<td>창고코드</td>
						<td>창고코드는 창고 타입에 따라 자동으로 입력됩니다.</td>
					</tr>
					<tr>
						<td>창고명</td>
						<td><input type="text" name="wh_name" required="required"></td>
					</tr>
					<tr>
						<td>창고용량</td>
						<td><input type="number" name="wh_size" required="required"></td>
					</tr>
					<tr>
						<td>재고/자재</td>
						<td><select name="retail_code">
								<option value="재고">재고 창고</option>
								<option value="자재">자재 창고</option>
						</select></td>
					</tr>
					<tr>
						<td>냉장/냉동/상온</td>
						<td><select name="wh_type">
								<option value="냉장">냉장</option>
								<option value="냉동">냉동</option>
								<option value="상온">상온</option>
						</select></td>
					</tr>
				</tbody>
			</table>
			<!--     <hr width="100%" style="border: 2px solid black"> -->


			<!-- 창고등록, 취소 버튼 -->
			<div style="text-align: center; margin-top: 50px">
				<button type="button" class="btn btn-outline-primary"
					onclick="onInsert();">
					<i class='bx bx-edit'></i> 등록
				</button>
				<button class="btn btn-danger" onclick="window.close()">X
					취소</button>
			</div>

		</form>

		<br>
	</div>
</body>
</html>
