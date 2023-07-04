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
	href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../css/product.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.7.0/dist/jquery.min.js"></script>
</head>
<body>
	<script>
		$(document).ready(function() {
			$('#material_item').hide();
			$('#item_code').click(function() {
				if ($('#item_code').val() != '') {
					$('#material_item').show()

				}
			});

		});

		function onInsert() {
			if ($('#item_code').val() == "") {
				alert("상품 검색을 해주세요!");
				return;
			}

			var frObj = $("#fr");
			var formData = frObj.serialize(); // 폼 데이터를 직렬화합니다.
			$.ajax({
				url : "/foundation/itemrecipe/itemrecipeUpload", // 요청을 보낼 서버의 URL
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
		}

		// 상품 검색 후 자재 가져오기
		function getRelatedMaterials() {
			var itemCode = document.getElementById("item_code").value;
			if (!itemCode) {
				alert("상품 검색을 해주세요!");
				return;
			}
			$.ajax({
				url : "/foundation/itemrecipe/getMaterials",
				method : "GET",
				data : {
					item_code : itemCode
				},
				success : function(response) {
					console.log(response);
					var materials = response;
					if (materials.length > 0) {
						receiveCheckboxValues(materials); // 자재 배열 업데이트
					} else {
						alert("해당 상품에 관련된 자재가 없습니다.");
					}
				},
				error : function(xhr, status, error) {
					alert("자재 가져오기 실패: " + error);
				}
			});

		}

		//상품 검색
		function itemSearch() {
			window.open("/pro/itemList", "popup",
					"width=500, height=600,left=100, top=100");
		}

		//자재 검색
		function materialSearch() {
			var itemCode = $("#item_code").val();
			if (itemCode !== null && itemCode !== "") {
				var popup = window.open(
						"/foundation/itemrecipe/materialSearch", "popup",
						"width=500, height=600,left=100, top=100");
				popup.materialArray = materialArray;
			} else {
				alert("상품 코드부터 검색해주세요.");
				return false;
			}
		}

		//자재 배열
		var materialArray = []; // 자재 배열 초기화

		//자재 파라미터로 받아옴
		function receiveCheckboxValues(checkedValues) {
			// 전달받은 데이터 처리 로직
			console.log(checkedValues);
			materialArray = JSON.parse(checkedValues);
			changeArraySize(materialArray.length);
		}

// 		var appendedMaterialCodes = []; // 이미 .append된 material_code 저장 배열

// 		function appendParameter() {
// 			var existingElements = $("tbody").children().length; // 이미 .append된 요소의 개수
			
// 			for (var i = existingElements; i < materialArray.length
// 					+ existingElements; i++) {
// 				console.log(existingElements);
// 				var currentMaterial = materialArray[i - existingElements]; // 현재 처리 중인 자재
// 				console.log(currentMaterial);
// 				if (appendedMaterialCodes
// 						.includes(currentMaterial.material_code)) {
// 					continue; // 이미 .append된 material_code인 경우 건너뛰기
// 				}

// 				// 중복되지 않은 경우 HTML 요소 생성
// 				var row = $("<tr>");
// 				row.append("<td></td>");
// 				row.append("<td><input type='text' name='itemRecipeUploadvo[" + i + "].material_code' value='" + currentMaterial.material_code + "' readonly='readonly'></td>");
// 				row.append("<td><input type='text' name='itemRecipeUploadvo[" + i + "].material_con' value='" + currentMaterial.material_con + "' placeholder='" + currentMaterial.material_code + "의 소모량'></td>");

// 				$("tbody").append(row);
				
// 				appendedMaterialCodes.push(currentMaterial.material_code); // .append된 material_code 추가
// 			}
// 		}


		function tbodyBuilder() {
			var tbody = $("#tbody");
			var materialHeader = $("#materialHeader");

			// 기존 내용 초기화
			tbody.empty();
			materialHeader.empty();
			
			// 체크된 값들을 테이블에 추가
			for (var i = 0; i < materialArray.length; i++) {
				var vo = materialArray[i];
				var row = $("<tr>");
// 				row.append("<td></td>");
				row.append("<td><input type='hidden' name='itemRecipeUploadvo[" + i + "].material_code' value='" + vo.material_code + "'>");
				row.append("<input type='text' value='" + vo.material_name + "' readonly='readonly'></td>");
				row.append("<td><input type='text' name='itemRecipeUploadvo[" + i + "].material_con' value='" + vo.material_con + "' placeholder='" + vo.material_code + "의 소모량' required></td>");
				tbody.append(row);

			}

			//materialHeader가 없고 자재가 있을 경우 작동 자재 코드 자재 소모량 칸도 append
			if (materialHeader.children().length == 0) {
				if (tbody.children().length > 0) {
					materialHeader.append("<td></td>");
					materialHeader.append("<td>자재 명</td>");
					materialHeader.append("<td>자재소모량</td>");
				}
			}
		}
		
		
		// 배열 사이즈를 받아와서 배열 크기 업데이트
		function changeArraySize(newSize) {
			materialArray = materialArray.slice(0, newSize);
			console.log(materialArray.length);
			tbodyBuilder(); //tbody 만들기 실행
		}
	</script>

	<div class="black-bar">
		<h4 style="text-align: center; color: white; padding-top: 8px">
			<i class='bx bx-edit'></i>레시피등록
		</h4>
	</div>

	<div
		style="display: flex; justify-content: center; margin-bottom: 15px">
		<img src="../../../resources/css/logo.png">
	</div>

	<div class="container mt-3">
		<form id="fr" action="" method="post">
			<table class="box" style="margin-top: 30px; width: 100%">
					<tr>
						<td>상품 명</td>
						<td>
							<input type="button" value="상품 검색" onclick="itemSearch();">
						</td>
					</tr>
					<tr>
						<td></td>
						<td>
							<input type="hidden" name="item_code" id="item_code"> 
							<input type="text" id="item_name" onclick="getRelatedMaterials();" required readonly="readonly" placeholder="검색 후 클릭"> 
						</td>
					</tr>
					<tr>
						<td>자재 명</td>
						<td><input type="button" value="자재 검색" onclick="materialSearch()"></td>
					</tr>
					<tr id="materialHeader">
					</tr>
				<tbody id="tbody">
				</tbody>
			</table>

			<div style="text-align: center; margin-top: 50px">
				<button type="button" class="btn-add" onclick="onInsert();">
					<i class='bx bx-edit'></i> 등록
				</button>
				<button class="btn-search" onclick="window.close()">X 취소</button>
			</div>
		</form>

		<br>
	</div>
</body>
</html>
