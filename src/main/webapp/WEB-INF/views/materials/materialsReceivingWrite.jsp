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

<script>
	$(document).ready(function() {
		$(".btn-add").click(function() {
			var frObj = $("#fr");
			var formData = frObj.serialize(); // 폼 데이터를 직렬화합니다.
			$.ajax({
				url : "/materials/materialsReceivingWrite", // 요청을 보낼 서버의 URL
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

	//품명 검색 팝업창
	function openItem(title, code, name, item_code, item_name) {
		window.open("/materials/matItelList?title="+title+"&code="+code+"&name="+name+"&item_code="+item_code+"&item_name="+item_name, "popup",
				"width=500, height=600,left=100, top=100");
	}
</script>


</head>
<body>
	<div class="black-bar">
		<h4 style="text-align: center; color: white; padding-top: 8px">
			<i class='bx bx-edit'></i> 자재입고 등록
		</h4>
	</div>
	<!-- 작업지시등록 폼 -->
	<div
		style="display: flex; justify-content: center; margin-bottom: 15px">
		<img src="../../resources/css/logo.png">
	</div>
	<div class="container mt-3">
		<!--  		<hr width="100%" style="border: 2px solid black"> -->

		<!--         <hr width="100%" style="border: 2px solid black"> -->

		<form role="form" id="fr">
			<table class="box" style="margin-top: 30px; width: 100%">
				<tbody>
					<%-- ${lineList} --%>
					<tr>
						<td>등록자</td>
						<td><input type="text" name="employee_id"></td>
					</tr>
					<tr>
						<td>입고일자</td>
						<td><input type="date" name="rvDate"></td>
					</tr>
					<tr>
						<td>제품정보</td>
						<td><input type="text" name="material_code" onclick="openItem('품번조회', '품번코드', '품번명');" placeholder="품번코드"></td>
						<td><input type="text" name="material_name" placeholder="품번명" readonly></td>
					</tr>
					<tr>
						<td>업체정보</td>
						<td><input type="text" name="cus_code" onclick="openItem('업체조회', '업체코드', '업체명');" placeholder="업체코드"></td>
						<td><input type="text" name="cus_name" placeholder="업체명" readonly></td>
					</tr>
					<tr>
						<td>창고정보</td>
						<td><input type="text" name="wh_code" onclick="openItem('창고조회', '창고코드', '창고명');" placeholder="창고코드"></td>
						<td><input type="text" name="wh_name" placeholder="창고명" readonly></td>
					</tr>
					<tr>
						<td>입고수량</td>
						<td><input type="number" name="rvQTY"></td>
					</tr>
					<tr>
						<td>입고LOT</td>
						<td><input type="number" id="item_name" name="rvBOX"
							style="border: 1px solid" width="50%"></td>
						</td>
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
				<button type="button" class=btn-add>
					<i class='bx bx-edit'></i> 등록
				</button>
				<button class=btn-search onclick="window.close()">X 취소</button>
			</div>

		</form>

		<br>
	</div>
</body>
</html>
