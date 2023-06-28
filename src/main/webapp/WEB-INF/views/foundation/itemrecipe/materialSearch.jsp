<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css" rel="stylesheet">
<!-- <link rel="stylesheet" type="text/css" href="../css/css.css"> -->
<link rel="stylesheet" type="text/css" href="../../resources/css/product.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<script>
	 var checkedValues = [];
		
	 	//부모창으로 배열을 전달함
		function postParam(){
			// 부모 창으로 체크된 값 전달
			window.opener.receiveCheckboxValues(checkedValues);
			
// 			alert(checkedValues);

			// 창 닫기
			window.close();
		}
		
		//체크박스 온오프 시 배열에 담고 출력
		$(function() {

			$("input[type='checkbox']").change(
					function() {
						if ($(this).is(":checked")) {
							var checkboxName = $(this).attr("name");
							var checkboxValue = $(this).val();
							checkedValues.push(checkboxValue);
							
							$("#checkParameter").append(
									"<tr id='" + checkboxName + "'><td>"
											+ checkboxName + "번 자재 </td><td>"
											+ checkboxValue + "</td></tr>");
							
						} else {
							var checkboxName = $(this).attr("name");
							var checkboxValue = $(this).val();
							var removeIdx = checkedValues.findIndex(checkboxValue);
						
							if (removeIdx !== -1) {
								checkedValues.splice(removeIdx, 1);
							}
							$("#" + checkboxName).remove();
						}
					});
		
		});
	</script>
	<div class="black-bar">
		<h4 style="text-align: center; color: white; padding-top: 8px">
			<i class='bx bx-edit'></i> 상품검색
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

		<form>
			<table class="table" style="width: 100%">
				<tr>
					<td>자재코드</td>
					<td><input type="text" name="material_code"
						style="width: 70%;"></td>
					<td>자재명</td>
					<td><input type="text" name="material_name"
						style="width: 70%;"></td>
					<td>구분</td>
					<td>
        				<select name="material_type">
        					<option></option>
        					<option value="원자재">원자재</option>
        					<option value="부자재">부자재</option>
        				</select>
        			<td>
					<td><button type="submit" class="btn-add">조회</button></td>
				</tr>
			</table>
		</form>
		<form id="checkform">
		<table class="table table-hover" style="text-align: center;">
			<tr>
				<th>#</th>
				<th>자재코드</th>
				<th>자재명</th>
			</tr>
			<c:forEach var="vo" items="${resultList }" varStatus="status">
				<tr>
					<td><input type="checkbox" name="${status.count }" value="${vo.material_code }"></td>
					<td>${vo.material_code}</td>
					<td>${vo.material_name}</td>
					<td>${vo.material_type}</td>
				</tr>
			</c:forEach>
		</table>
		</form>
		<br> <hr>
		<form action="">
		<table id="checkParameter">
		
		</table>
		<input type="button" value="등록" onclick="postParam();">
		</form>
	</div>
</body>
</html>