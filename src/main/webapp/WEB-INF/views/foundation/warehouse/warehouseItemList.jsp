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
							<input type="text" style="width: 40%" placeholder="창고 코드"
								class="form-control" name="wh_code"> <input type="text"
								style="width: 40%" placeholder="창고 이름" class="form-control"
								name="wh_name">
							<button type="submit" class="btn btn-primary">검색</button>
						</div></td>
				</tr>
			</table>
		</form>
		<table class="table table-hover" style="text-align: center;">
			<%-- ${itemList } --%>
			<tr>
				<th>창고코드</th>
				<th>창고명</th>
				<th>재고/자재</th>
				<th>냉장/냉동/상온</th>
			</tr>
			<c:forEach var="vo" items="${warehouseList }">
				<tr
					onclick="selectItem('${vo.wh_code}', '${vo.wh_name}', '${vo.retail_code}', '${vo.wh_type}')">
					<td id="con">${vo.wh_code}</td>
					<td id="con">${vo.wh_name}</td>
					<td id="con">${vo.retail_code}</td>
					<td id="con">${vo.wh_type}</td>
				</tr>
				<script>
					function selectItem(a, b, c, d) {
						// 부모 창으로 값 전달하기
						opener.document.getElementById("wh_code").value = a;
						opener.document.getElementById("wh_name").value = b;
						opener.document.getElementById("retail_code").value = c;
						opener.document.getElementById("wh_type").value = d;
						window.close();
					}
				</script>

			</c:forEach>
		</table>
		<br> <br>
	</div>
</body>
</html>
