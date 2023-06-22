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
	href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../css/product.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.7.0/dist/jquery.min.js"></script>
</head>
<body>
	<script>
		//상품 검색 
		function itemSearch() {
			window.open("/pro/itemList", "popup",
					"width=500, height=600,left=100, top=100");
		}

		//자재 검색
		function materialSearch() {
			window.open("/foundation/itemrecipe/materialSearch", "popup",
					"width=500, height=600,left=100, top=100");
		}

		//자재 추가
		$(function() {
			$("#Madd").on("click",function() {
				$("#material").append("<td><input type='text' name='material_code' readonly='readonly'></td>");
			});
		});

		//자재 배열
		var materialArray = [];
		//자재 파라미터로 받아옴
		function receiveCheckboxValues(checkedValues) {
			// 전달받은 데이터 처리 로직
			console.log(checkedValues);
			materialArray = checkedValues;
			changeArraySize(materialArray.length);
		}

		//자재 배열만큼 .append 시키는 함수
		function appendParamater() {
			for (i = 0; i < materialArray.length; i++) {
				$("#material").append(
				"<td><input type='text' name='ItemRecipeUploadList"+i+".material_code' value='"+materialArray[i]+"' readonly='readonly'></td>");
				$("#materialCon").append(
				"<td><input type='text' name='ItemRecipeUploadList"+i+".material_con'></td>");
		}
		function changeArraySize(newSize) {
			materialArray.length = newSize;
			appendParamater(); // .append 실행
		}
	</script>

	<div class="black-bar">
		<h4 style="text-align: center; color: white; padding-top: 8px">
			<i class='bx bx-edit'></i>상품등록
		</h4>
	</div>

	<div
		style="display: flex; justify-content: center; margin-bottom: 15px">
		<img src="../../../resources/css/logo.png">
	</div>

	<div class="container mt-3">
		<form action="" method="post">
			<table class="box" style="margin-top: 30px; width: 100%">
				<tbody>
					<tr>
						<td>품번</td>
						<td>
							<input type="button" value="상품 검색" onclick="itemSearch()">
						</td>
					</tr>
					<tr>
						<td></td>
						<td>
							<input type="text" name="item_code" id="item_code" readonly="readonly"> 
						</td>
					</tr>
					<tr>
						<td>자재 코드</td>
						<td><input type="button" value="자재 검색" onclick="materialSearch()"></td>
					</tr>
					<tr id="material">
						<td></td>
					</tr>
					<tr>
						<td>자재 소모량</td>
					</tr>
					<tr id="materialCon">
						<td></td>
					</tr>
				</tbody>
			</table>

			<div style="text-align: center; margin-top: 50px">
				<button type="submit" class="btn-add">
					<i class='bx bx-edit'></i> 등록
				</button>
				<button class="btn-search" onclick="window.close()">X 취소</button>
			</div>
		</form>

		<br>
	</div>
</body>
</html>
