<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../../resources/css/product.css">
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
<link rel="stylesheet" type="text/css" href="../css/product.css">
</head>
<script type="text/javascript">
	function onUpdate(item_code) {
		var frObj = $("#fr");
		var formData = frObj.serialize(); // 폼 데이터를 직렬화합니다.
		if (frObj[0].checkValidity()) {
		$.ajax({
			url : "/foundation/itemdetail/itemdetailUpdate?item_code="
					+ item_code, // 요청을 보낼 서버의 URL
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
	<!-- 상품 수정 폼 -->
	<div class="black-bar">
		<h4 style="text-align: center; color: white; padding-top: 8px">
			<i class='bx bx-edit'></i>상품 수정 하기
		</h4>
	</div>
	<div
		style="display: flex; justify-content: center; margin-bottom: 15px">
		<img src="../../../resources/css/logo.png">
	</div>
	<div class="container mt-3">
		<!--  		<hr width="100%" style="border: 2px solid black"> -->

		<!--         <hr width="100%" style="border: 2px solid black"> -->
		<!-- 품번, 품명, 자재유형(완제품,부자재), 재고단위, 사용여부,단가 등록 -->
		<form id="fr" action="" method="post">

			<table class="box" style="margin-top: 30px; width: 100%">
				<tbody>
					<tr>
						<td>품번</td>
						<td>${vo.item_code }</td>
					</tr>
					<tr>
						<td>품명</td>
						<td><input type="text" name="item_name"
							value="${vo.item_name }"></td>
					</tr>
					<tr>
						<td>재고단위</td>
						<td><input type="text" name="unit" value="${vo.unit }" required></td>
					</tr>

					<tr>
						<td>단가</td>
						<td><input type="number" name="item_price" value="${vo.item_price}" required></td>
					</tr>
				</tbody>
			</table>
			<!--     <hr width="100%" style="border: 2px solid black"> -->


			<!-- 작업지시등록, 취소 버튼 -->
			<div style="text-align: center; margin-top: 50px">
				<button type="button" class="btn btn-outline-primary"
					onclick="onUpdate('${vo.item_code }');">
					<i class='bx bx-edit'></i> 등록
				</button>
				<button class="btn btn-danger" onclick="window.close()">X 취소</button>
			</div>

		</form>

		<br>
	</div>
</body>
</html>
