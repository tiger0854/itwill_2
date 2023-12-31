<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레시피 등록 및 수정</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../../resources/css/product.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.0/dist/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<link rel="icon" href="../../resources/logo_favicon.png" type="image/x-icon">
</head>
<body>
	<script>

		function onInsert() {
			if ($('#item_code').val() == "") {
				Swal.fire("상품 검색을 해주세요!");
				return;
			}

			var frObj = $("#fr");
			var formData = frObj.serialize(); // 폼 데이터를 직렬화합니다.
			
			
				if (frObj[0].checkValidity()) {
				    Swal.fire({
				      title: "작성 성공!",
				      text: "작성이 성공하였습니다.",
				      icon: "success",
				      showCancelButton: false,
				      confirmButtonText: "확인"
				    }).then(function() {
				      $.ajax({
				        url: "/foundation/itemrecipe/itemrecipeUpload",
				        type: "POST",
				        data: formData,
				        success: function(response) {
				          opener.location.reload();
				          window.close();
				        },
				        error: function(xhr, status, error) {
				          Swal.fire("오류 발생!", "error");

				        }
				      });
				    });
				  } else {
				    Swal.fire("입력란을 채워주세요!");
				  }
				
		}
		
		// 상품 검색 후 자재 가져오기
		function getRelatedMaterials() {
			var itemCode = document.getElementById("item_code").value;
			
			$.ajax({
				url : "/foundation/itemrecipe/materials/"+itemCode,
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
						Swal("해당 상품에 관련된 자재가 없습니다.","success");
					}
				},
				error : function(xhr, status, error) {
					Swal("자재 가져오기 실패: " + error,"error");
				}
			});

		}

		//상품 검색
		function itemSearch() {
			var childWindow = window.open("/pro/itemList", "popup",
					"width=500, height=600,left=100, top=100");
			childWindow.onbeforeunload =getRelatedMaterials;
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
				Swal.fire("상품 코드부터 검색해주세요.");
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
			
			// 배열에 든 값들을 테이블에 추가
			for (var i = 0; i < materialArray.length; i++) {
				var vo = materialArray[i];
				var row = $("<tr>");
// 				row.append("<td></td>");
				row.append("<td><input type='hidden' name='itemRecipeUploadvo[" + i + "].material_code' value='" + vo.material_code + "'>");
				row.append("<input type='text' value='" + vo.material_name + "' readonly='readonly'></td>");
				row.append("<td><input type='text' name='itemRecipeUploadvo[" + i + "].material_con' value='" + vo.material_con + "' placeholder='" + vo.material_code + "의 소모량' required></td>");
				row.append("<td><input type='text' name='itemRecipeUploadvo[" + i + "].material_unit' value='" + vo.material_unit + "' readonly ></td>");
				tbody.append(row);

			}

			//materialHeader가 없고 자재가 있을 경우 작동 자재 코드 자재 소모량 칸도 append
			if (materialHeader.children().length == 0) {
				if (tbody.children().length > 0) {
					materialHeader.append("<td></td>");
					materialHeader.append("<td>자재 명</td>");
					materialHeader.append("<td>자재소모량</td>");
					materialHeader.append("<td>자재단위</td>");
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
							<input type="button" class="btn btn-primary" value="상품 검색" onclick="itemSearch();">
						</td>
					</tr>
					<tr>
						<td></td>
						<td>
							<input type="hidden" name="item_code" id="item_code"> 
							<input type="text" id="item_name" required readonly="readonly" onclick="itemSearch();"> 
						</td>
					</tr>
					<tr>
						<td>자재 명</td>
						<td><input type="button" class="btn btn-primary" value="자재 검색" onclick="materialSearch()"></td>
					</tr>
					<tr id="materialHeader">
					</tr>
				<tbody id="tbody">
				</tbody>
			</table>

			<div style="text-align: center; margin-top: 50px">
				<button type="button" class="btn btn-outline-primary" onclick="onInsert();">
					<i class='bx bx-edit'></i> 등록
				</button>
				<button class="btn btn-danger" onclick="window.close()">X 취소</button>
			</div>
		</form>

		<br>
	</div>
</body>
</html>
