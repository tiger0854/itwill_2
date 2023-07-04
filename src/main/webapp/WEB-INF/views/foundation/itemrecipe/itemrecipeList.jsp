<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../../common/header.jsp" />
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function itemrecipeUpload() {
		// 새 창을 열기 위한 URL
		var popupUrl = '/foundation/itemrecipe/itemrecipeUpload';
		// 새 창 열기
		window.open(popupUrl, '_blank', 'width=500,height=600,resizable=yes');
	}

	function recipeDelete(item_code, item_name) {
		if (confirm("품명 : " + item_name + " 레시피 전체를 정말로 삭제하시겠습니까?")) {
			location.href = 'deleteItemRecipe?item_code=' + item_code;
		}
	}
	function recipeDeleteMaterial(item_code, item_name, material_code,
			material_name) {
		if (confirm("품명 : " + item_name + " 레시피 요소인 " + material_name
				+ "를/을 삭제하시겠습니까?")) {
			location.href = 'deleteItemRecipeMaterial?item_code=' + item_code
					+ "&material_code=" + material_code;
		}
	}

	//레시피 검색 팝업창
	function openItem() {
		window.open("/foundation/itemrecipe/itemrecipeItemList", "popup",
				"width=500, height=600,left=100, top=100");
	}
</script>



</head>

<body id="body-pd" style="font-family: 'TheJamsil5';">

	<div class="height-100">
		<div class="container mt-3">
			<form id="instr">

				<h4 style="margin-top: 150px;">
					<i class="bx bx-book"></i> 레시피 관리
				</h4>
				<div style="margin-top: 10px;">
					<hr width="100%" style="border: 2px solid black">
					<!-- 상품목록 검색, 등록버튼 -->
					<div class=btn-container>
						<button class=btn-search type="submit">
							<i class='bx bx-search-alt-2'></i> 조회
						</button>
						<button class=btn-add onclick="itemrecipeUpload();">
							<i class='bx bx-plus-medical'></i> 추가 및 수정
						</button>
					</div>

					<!-- 품목 검색박스 -->
					<table class="product-box3" style="margin-top: 20px; width: 100%;"
						border="1">
						<!--  품번, 품명, 자재유형(완제품,부자재), 재고단위, 사용여부,단가 등록	 -->
						<tr>
							<th>품번</th>
							<td><input type="text" name="item_code" id="item_code"
								placeholder="품번" readonly></td>
							<th>품명</th>
							<td><input type="text" name="item_name" id="item_name"
								placeholder="품명" onclick="openItem();">
							<td>
						</tr>
					</table>
				</div>
			</form>

			<!-- 품목 리스트 -->
			<!--  품번, 품명, 자재유형(완제품,부자재), 재고단위, 사용여부,단가 등록	 -->
			<h4 style="margin-top: 50px;">
				<i class='bx bx-list-ol icon'></i> 레시피 목록
			</h4>
			<table class="product-table" style="margin-top: 20px; width: 100%;">
				<thead>
					<tr>
						<th>품번</th>
						<th>품명</th>
						<th>자재코드</th>
						<th>자재명</th>
						<th>소모량</th>
						<th>자재 개별 삭제</th>
						<th>레시피 전체 삭제</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="vo" items="${resultlist}">
						<tr>
							<td>${vo.item_code}</td>
							<td>${vo.item_name}</td>
							<td>${vo.material_code}</td>
							<td>${vo.material_name}</td>
							<td>${vo.material_con }</td>
							<td><button class=btn-delete type="button"
									onclick="recipeDeleteMaterial('${vo.item_code}','${vo.item_name }','${vo.material_code }','${vo.material_name }');">
									<i class='bx bxs-trash'></i>
								</button></td>
							<td><button class=btn-delete type="button"
									onclick="recipeDelete('${vo.item_code}','${vo.item_name }');">
									<i class='bx bxs-trash'></i>
								</button></td>
						</tr>
					</c:forEach>


				</tbody>
			</table>


			<!-- 페이징처리 -->
			<%--   		${Search} --%>
			<div class="container" style="margin-top: 30px; margin-bottom: 30px">
				<ul class="pagination justify-content-center" id="pagination"
					style="margin-top: 20px;">
					<c:if test="${pageVO.startPage > pageVO.pageBlock}">
						<li class="page-item"><a class="page-link"
							href="/foundation/itemrecipe/itemrecipeList?item_code=${Search.item_code }&item_name=${Search.item_name }&pageNum=${pageVO.startPage - pageVO.pageBlock}">
								</a></li>
					</c:if>
					<c:forEach var="i" begin="${pageVO.startPage}"
						end="${pageVO.endPage}" step="1">
						<li class="page-item"><a class="page-link"
							href="/foundation/itemrecipe/itemrecipeList?item_code=${Search.item_code }&item_name=${Search.item_name }&pageNum=${i}"><span>${i}</span></a></li>
					</c:forEach>
					<c:if test="${pageVO.endPage < pageVO.pageCount}">
						<li class="page-item"><a class="page-link"
							href="/foundation/itemrecipe/itemrecipeList?item_code=${Search.item_code }&item_name=${Search.item_name }&pageNum=${pageVO.startPage + pageVO.pageBlock}">
								</a></li>
					</c:if>
				</ul>
			</div>



		</div>
	</div>
</body>
</html>