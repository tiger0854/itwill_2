<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>

<script>
	function onInsert() {
		var frObj = $("#fr");
		var formData = frObj.serialize();

		if (frObj[0].checkValidity()) {
			Swal.fire({
				title : "작성 성공!",
				text : "작성이 성공하였습니다.",
				icon : "success",
				showCancelButton : false,
				confirmButtonText : "확인"
			}).then(function(result) {
				if (result.isConfirmed) {
					$.ajax({
						url : "/qc/qualityWrite",
						type : "POST",
						data : formData,
						success : function(response) {
							opener.location.reload();
							window.close();
						},
						error : function(xhr, status, error) {
							Swal.fire("작성 실패!");
						}
					});
				}
			});
		} else {
			Swal.fire("입력란을 채워주세요!");
		}
	}

	function itemSearch() {
		var childWindow = window.open("/qc/qualityItemList", "popup",
				"width=500, height=600,left=100, top=100");
		childWindow.onbeforeunload = getRelatedMaterials;
	}
	
	function employeeSearch() {
		var childWindow = window.open("/qc/employeeItemList", "popup",
				"width=500, height=600,left=100, top=100");
		childWindow.onbeforeunload = getRelatedMaterials;
	}
</script>
<!-- 	        opener.document.getElementById("re_code").value = a; -->
<!-- 	        opener.document.getElementById("re_qty").value = b; -->
<!-- 	        opener.document.getElementById("item_code").value = c; -->
<!-- 	        opener.document.getElementById("item_name").value = d; -->
<!-- 	        opener.document.getElementById("employee_id").value = e; -->
<!-- 	        window.close(); -->

</head>
<body>
	<div class="black-bar">
		<h4 style="text-align: center; color: white; padding-top: 8px">
			<i class='bx bx-edit'></i> 작업지시 등록
		</h4>
	</div>
	<!-- 작업지시등록 폼 -->
	<div
		style="display: flex; justify-content: center; margin-bottom: 15px">
		<!-- 		  <img src="../../resources/css/logo.png"> -->
	</div>
	<div class="container mt-3">
		<!--  		<hr width="100%" style="border: 2px solid black"> -->

		<!--         <hr width="100%" style="border: 2px solid black"> -->

		<form role="form" id="fr">
			<table class="box" style="margin-top: 30px; width: 100%">
				<tbody>
					<%-- ${lineList} --%>
					<td><input type="hidden" name="pQTY" value=0></td>

					<tr>
						<td>작업지시</td>
						<td><input type="button" class="btn btn-primary"
							value="상품 검색" onclick="itemSearch();"></td>
					</tr>
					<tr>
						<td>작업지시번호</td>
						<td><input type="text" name="wo_code" id="wo_code" readonly required></td>
					</tr>
					<tr>
						<td>상품이름</td>
						<td><input type="text" name="item_name" id="item_name" readonly required></td>
					</tr>
					<tr>
						<td>검수자 검색</td>
						<td><input type="button" class="btn btn-primary"
							value="검수자 검색" onclick="employeeSearch();"></td>
					</tr>
					<tr>
						<td>검수자</td>
						<td><input type="text" name="employee_name" id="employee_name" readonly required></td>
						<td><input type="hidden" name="employee_id" id="employee_id"></td>
					</tr>
				</tbody>
			</table>
			<!--     <hr width="100%" style="border: 2px solid black"> -->


			<!-- 작업지시등록, 취소 버튼 -->
			<div style="text-align: center; margin-top: 50px">
				<button type="button" class="btn btn-primary" id="add"
					onclick="onInsert();">
					<i class='bx bx-edit'></i> 등록
				</button>
				<button class=btn-search onclick="window.close()">X 취소</button>
			</div>

		</form>

		<br>
	</div>
</body>
</html>
