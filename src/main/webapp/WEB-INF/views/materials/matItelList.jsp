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
	
</script>


</head>
<body>
	<div class="black-bar">
		<h4 style="text-align: center; color: white; padding-top: 8px">
			<i class='bx bx-edit'></i> ${title }
		</h4>
	</div>
	<!-- 작업지시등록 폼 -->
	<div
		style="display: flex; justify-content: center; margin-bottom: 27px">
		<img src="../../resources/css/logo.png">
	</div>
	<div class="container mt-3">
		<!--  		<hr width="100%" style="border: 2px solid black"> -->

		<!--         <hr width="100%" style="border: 2px solid black"> -->

		<table class="table" style="width: 100%">
			<form>
				<tr>
					<td>${code }</td>
					<td><input type="text" name="item_code" style="width: 70%;"></td>
					<td>${name }</td>
					<td><input type="text" name="item_name" style="width: 70%;"></td>
					<td><button type="submit" class="btn-add">조회</button></td>
				</tr>
			</form>
		</table>
		<table class="table table-hover" style="text-align: center;">
			<%-- ${itemList } --%>
			<tr>
				<th>${code }</th>
				<th>${name }</th>
			</tr>
			<c:forEach var="vo" items="${itemList }">
				<c:choose>
					<c:when test="${not empty vo.material_code}">
						<tr>
							<td id="con">${vo.material_code}</td>
							<td id="con">${vo.material_name}</td>
						</tr>
					</c:when>
					<c:when test="${not empty vo.wh_code}">
						<tr>
							<td id="con">${vo.wh_code}</td>
							<td id="con">${vo.wh_name}</td>
						</tr>
					</c:when>
					<c:otherwise>
						<tr>
							<td id="con">${vo.cus_code}</td>
							<td id="con">${vo.cus_name}</td>
						</tr>
					</c:otherwise>
				</c:choose>

			</c:forEach>
		</table>
		<br> <br>
	</div>
	<script>
		// 						    function selectItem(a, b) {
		// 						        // 부모 창으로 값 전달하기
		// 						        opener.document.getElementById("item_code").value = a;
		// 						        opener.document.getElementById("item_name").value = b;
		// 						        window.close();
		// 						    }
	</script>
</body>
</html>
