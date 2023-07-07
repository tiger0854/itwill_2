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
			<i class='bx bx-edit'></i> 상품검색
		</h4>
	</div>

	<div class="container mt-3">
		<!--  		<hr width="100%" style="border: 2px solid black"> -->

		<!--         <hr width="100%" style="border: 2px solid black"> -->

		<form>
			<table class="table" style="width: 100%">
				<tr>
					<td><div class="input-group">
							<input type="text" style="width: 40%" placeholder="공장 코드"
								class="form-control" name="factory_code"> <input
								type="text" style="width: 40%" placeholder="공장 이름"
								class="form-control" name="factory_name">
							<button type="submit" class="btn btn-primary">검색</button>
						</div></td>
				</tr>
			</table>
		</form>
		<table class="table table-hover" style="text-align: center;">
			<%-- ${itemList } --%>
			<tr>
				<th>공장코드</th>
				<th>공장명</th>
			</tr>
			<c:forEach var="vo" items="${factoryList }">
				<tr onclick="selectItem('${vo.factory_code}', '${vo.factory_name}')">
					<td id="con">${vo.factory_code}</td>
					<td id="con">${vo.factory_name}</td>
				</tr>
				<script>
					function selectItem(a, b) {
						// 부모 창으로 값 전달하기
						opener.document.getElementById("factory_code").value = a;
						opener.document.getElementById("factory_name").value = b;
						window.close();
					}
				</script>

			</c:forEach>
		</table>
		<br> <br>
	</div>
</body>
</html>
