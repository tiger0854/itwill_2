<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${item_name }의 레시피</title>
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
<link rel="stylesheet" type="text/css"
	href="../../resources/css/product.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="icon" href="../../resources/logo_favicon.png" type="image/x-icon">
</head>
<body>
	<div class="black-bar">
		<h4 style="text-align: center; color: white; padding-top: 8px">
			<i class="bx bx-book"></i> 레시피
		</h4>
	</div>
	<div class="container mt-3">
		<!--  		<hr width="100%" style="border: 2px solid black"> -->

		<!--         <hr width="100%" style="border: 2px solid black"> -->


		<table class="table" style="width: 100%; text-align: center;">
				<tr>
					<th colspan="2">${item_name }</th>
				</tr>
		</table>
		<table class="table table-hover" style="text-align: center;">
			<tr>
				<th>자재명</th>
				<th>자재 소모량</th>
			</tr>
			<tbody>
			<c:forEach var="vo" items="${materialList }">
				<tr>
					<td>${vo.material_name}</td>
					<td>${vo.material_con}${vo.material_unit }</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
		<br>
		<div style="text-align: center; margin-top: 50px">
		<input type="button" onclick="window.close();" class="btn btn-primary" value="닫기" >
		</div>
		<br>
	</div>
</body>
</html>
