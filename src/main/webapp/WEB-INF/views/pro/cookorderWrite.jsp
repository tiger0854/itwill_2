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
				url : "/pro/cookorderWrite", // 요청을 보낼 서버의 URL
				type : "POST", // HTTP 요청 방식 (POST)
				data : formData, // 전송할 데이터 (직렬화된 폼 데이터)
				success : function(response) {
					alert("작성 성공!");
					opener.location.reload();
					window.close(); // 윈도우 창을 닫습니다.
				},
				error : function(xhr, status, error) {
					alert("작성 실패!");
					console.error("에러 발생:", error);
				}
			});
		});
	});

	//품명 검색 팝업창
	function openItem() {
		window.open("/pro/itemList", "popup",
				"width=500, height=600,left=100, top=100");
	}
</script>


</head>
<body>
	<div class="black-bar">
		<h4 style="text-align: center; color: white; padding-top: 8px">
			<i class='bx bx-edit'></i> 조리지시 등록
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
					<td><input type="hidden" name="pQTY" value=0></td>

					<tr>
						<td>조리지시자</td>
						<td><input type="text" name="employee_id"></td>
					</tr>
					<tr>
						<td>라인명</td>
						<td><select name="line_code" class="line_code">
								<c:forEach var="line" items="${lineList}">
									<option value="${line.line_code}">${line.line_name}</option>
								</c:forEach>
						</select></td>
					</tr>
					<tr>
						<td>품목코드</td>
						<td><input type="text" id="item_code" name="item_code"
							placeholder="품번검색" onclick="openItem()" width="50%" readonly>
						</td>
					</tr>
					<tr>
						<td>품명</td>
						<td><input type="text" id="item_name" name="item_name"
							placeholder="품명" style="border: 1px solid" width="50%" readonly></td>
						</td>
					</tr>

					<tr>
						<td>자재코드</td>
						<td><input type="text" id="item_code" name="material_code"
							placeholder="자재검색" width="50%">
						</td>
					</tr>
					<tr>
						<td>자재이름</td>
						<td><input type="text" id="item_name" name="material_name"
							placeholder="자재이름" style="border: 1px solid" width="50%"></td>
						</td>
					</tr>
					<tr>
						<td>지시수량</td>
						<td><input type="number" name="coQTY"></td>
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