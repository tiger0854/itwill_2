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
<link rel="stylesheet" type="text/css" href="../../resources/css/product.css">
<!-- <link rel="stylesheet" type="text/css" href="../css/css.css"> -->
<link rel="stylesheet" type="text/css" href="../../resources/css/product.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<script>
	var checkedValues = opener.materialArray;
	console.log(checkedValues);
	console.log(checkedValues.length);
	
	// 체크된 값들을 JSON 배열로 전달
	function postParam() {
	  // JSON 배열 생성
	  var jsonValues = JSON.stringify(checkedValues);

	  // 부모 창으로 JSON 배열 전달
	  window.opener.receiveCheckboxValues(jsonValues);

	  // 창 닫기
	  window.close();
	}

	// 체크박스 온오프 시 배열에 담고 출력
		$(function() {
			 for (var i = 0; i < checkedValues.length; i++) {
				    var materialCode = checkedValues[i].material_code;
				    $("#" + materialCode).prop("checked", true);
				  }
			
			$("input[type='checkbox']").change(function() {
				if ($(this).is(":checked")) {
					// 	var checkboxName = $(this).attr("name");
					var checkboxValue = $(this).val();
					var checkboxName = $(this).siblings("#material_name").val();
					var checkboxUnit = $(this).siblings("#material_unit").val();
					var isDuplicate = checkedValues.some(function(item) {
						return item.material_code === checkboxValue;
					});
					if (isDuplicate != true) {
						checkedValues.push({
							"material_code" : checkboxValue,
							"material_con" : "",// material_con을 공백으로 설정
							"material_name" : checkboxName,
							"material_unit" : checkboxUnit
						});
					} else {
						alert("자재 번호 : "+checkboxValue+"은 이미 선택된 자재입니다.");
						$(this).prop("checked", false);
					}

					// $("#checkParameter").append(
					// 		"<tr id='" + checkboxValue + "'><td> 선택된 자재코드 : "
					// 		+ checkboxValue + " </td></tr>");
				} else {
					// 	var checkboxName = $(this).attr("name");
					var checkboxValue = $(this).val();
					var removeIdx = checkedValues.findIndex(function(item) {
						// 	return item.name === checkboxName &&
						return item.material_code === checkboxValue;
					});

					if (removeIdx !== -1) {
						checkedValues.splice(removeIdx, 1);
					}
					// 	$("#" + checkboxValue).remove();
				}
				updateTable();
			});
			updateTable();
		});

		// 체크된 값들을 테이블에 출력
		function updateTable() {
		  var table = $("#checkParameter");

		  // 기존 내용 초기화
		  table.empty();

		  // 체크된 값들을 테이블에 추가
		  for (var i = 0; i < checkedValues.length; i++) {

		    var row = "<tr id='" + checkedValues[i].material_code + "'>" + "<td>자재 코드: "
		              + checkedValues[i].material_code + "/ 자재 명 : "+checkedValues[i].material_name+"/ 자재 단위 : "+checkedValues[i].material_unit+"</td><td><input type='button' value='제거' class='btn btn-danger' onclick='deleteMaterial(\"" + checkedValues[i].material_code + "\", \"" + checkedValues[i].material_name + "\");'></td>" + "</tr>";

		    table.append(row);
		  }
		}

		// 자재 직접 삭제
		

		function deleteMaterial(material_code, material_name) {

			if (confirm("자재 번호: " + material_code + ", 자재 명: " + material_name
					+ "을(를) 레시피에서 제거하시겠습니까?")) {
				var removeIdx = checkedValues.findIndex(function(item) {
					return item.material_code === material_code;
				});

				if (removeIdx !== -1) {
					checkedValues.splice(removeIdx, 1);
				}//배열에서 제거
				
				$("#"+material_code).prop("checked", false); //체크박스 해제

				updateTable();
			}
		}
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
		<table class="table table-hover" style="text-align: center;">
			<tr>
				<th>#</th>
				<th>자재코드</th>
				<th>자재명</th>
				<th>자재단위</th>
				<th>자재유형</th>
			</tr>
			<c:forEach var="vo" items="${resultList }">
				<tr>
					<td><input type="checkbox" id="${vo.material_code }" value="${vo.material_code }">
						<input id="material_name" type="hidden" value="${vo.material_name }">
						<input id="material_unit" type="hidden" value="${vo.material_unit}">
					</td>
					<td>${vo.material_code}</td>
					<td>${vo.material_name}</td>
					<td>${vo.material_unit}</td>
					<td>${vo.material_type}</td>
				</tr>
			</c:forEach>
		</table>
	
	<!-- 페이징처리 -->
	<%--   		${Search} --%>
	<div class="container" style="margin-top: 30px; margin-bottom: 30px">
		<ul class="pagination justify-content-center" id="pagination"
			style="margin-top: 20px;">
			<c:if test="${search.startPage > search.pageBlock}">
				<li class="page-item"><a class="page-link"
					href="/foundation/itemrecipe/materialSearch?material_code=${search.material_code }&material_name${search.material_name }&material_type=${search.material_type}&pageNum=${search.startPage - search.pageBlock}">
				</a></li>
			</c:if>
			<c:forEach var="i" begin="${search.startPage}"
				end="${search.endPage}" step="1">
				<li class="page-item"><a class="page-link"
					href="/foundation/itemrecipe/materialSearch?material_code=${search.material_code }&material_name=${search.material_name }&material_type=${search.material_type}&pageNum=${i}"><span>${i}</span></a></li>
			</c:forEach>
			<c:if test="${search.endPage < search.pageCount}">
				<li class="page-item"><a class="page-link"
					href="/foundation/itemrecipe/materialSearch?material_code=${search.material_code }&material_name=${search.material_name }&material_type=${search.material_type}&pageNum=${search.startPage + search.pageBlock}"><span>
							> </span></a></li>
			</c:if>
		</ul>
	</div>
		<br> <hr>
		<form action="">
		<table id="checkParameter">
			
		</table>
		<input type="button" value="등록" class="btn btn-outline-primary" onclick="postParam();">
		</form>
	</div>
</body>
</html>