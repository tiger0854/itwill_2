<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../../common/header.jsp" />
<link rel="stylesheet" type="text/css" href="../../resources/css/product.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function warehouseUpload() {
  // 새 창을 열기 위한 URL
  var popupUrl = '/foundation/warehouse/warehouseUpload';
  // 새 창 열기
  window.open(popupUrl, '_blank', 'width=500,height=600,resizable=yes');
}

function warehouseUpdate(wh_code) {
	  // 새 창을 열기 위한 URL
	  var popupUrl = '/foundation/warehouse/warehouseUpdate?wh_code=' + wh_code;
	  // 새 창 열기
	  window.open(popupUrl, '_blank', 'width=500,height=600,resizable=yes');
	}
function warehouseDelete(warehouse_code, warehouse_name) {
	  if (confirm("창고 코드 : "+warehouse_code+"공장명 : " + warehouse_name + "를/을 정말로 삭제하시겠습니까?")) {
	    location.href = 'warehouseDelete?wh_code=' + warehouse_code;
	    alert("삭제완료");
	  }
	}
	
//창고명 검색 팝업창
function openItem() {
	window.open("/foundation/warehouse/warehouseItemList", "popup",
			"width=500, height=600,left=100, top=100");
}


</script>



</head>

<body id="body-pd" style="font-family: 'TheJamsil5';">
	<div class="height-100">
		<div class="container mt-3">
			<form id="instr">

				<h4 style="margin-top: 150px;">
					<i class='bx bx-package'></i> 창고관리
				</h4>
				<div style="margin-top: 10px;">
					<hr width="100%" style="border: 2px solid black">
					<!-- 창고목록 검색, 등록버튼 -->
					<div class=btn-container>
						<button class="btn btn-primary" type="submit">
							<i class='bx bx-search-alt-2'></i> 창고 조회
						</button>
						<!-- <button class=btn-add onclick="location.href='warehouseWrite'"><i class='bx bx-plus-medical'></i> 창고 추가</button> -->
						<button class="btn btn-outline-primary" onclick=warehouseUpload()>
							<i class='bx bx-plus-medical'></i> 창고 추가
						</button>
					</div>

					<!-- 창고목록 검색박스 -->
					<table class="product-box3" style="margin-top: 20px; width: 100%;"
						border="1">

						<tr>
							<th>창고 코드</th>
							<td><input type="text" id="wh_code" name="wh_code"
								placeholder="창고코드"></td>
							<th>창고명</th>
							<td><input type="text" id="wh_name" name="wh_name"
								placeholder="창고명"></td>
							<td colspan="2"><input type="button" value="상세검색" onclick="openItem();" class="btn btn-primary"></td>
						</tr>
						<tr>	
							<th>재고/자재</th>
							<td><select id="retail_code" name="retail_code">
									<option></option>
									<option value="자재">자재</option>
									<option value="재고">재고</option>
							</select></td>
							<th>냉장/냉동/상온</th>
							<td><select id="wh_type" name="wh_type">
									<option></option>
									<option value="냉장">냉장</option>
									<option value="냉동">냉동</option>
									<option value="상온">상온</option>
							</select></td>
							<th>창고 용량</th>
							<td>
							<input type="number" name="minsize" width="200" placeholder="최소용량" min="0" max="999999">~
							<input type="number" name="maxsize" placeholder="최대용량" min="0" max="999999">
							</td>
						</tr>
					</table>
				</div>
			</form>
			<!-- 창고 리스트 -->
			<!-- 	창고명, 창고코드, 자재/재고, 냉장/냉동/상온, 수정/삭제 표시 -->
			<h4 style="margin-top: 100px;">
				<i class='bx bx-list-ol icon'></i> 창고 목록
			</h4>
			<table class="product-table" style="margin-top: 20px; width: 100%;">
				<thead>
					<tr>
						<th>창고코드</th>
						<th>창고명</th>
						<th>재고/자재</th>
						<th>냉장/냉동/상온</th>
						<th>최대 용량</th>
						<th>수정</th>
						<th>삭제</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="vo" items="${whList }">
						<tr>
							<td>${vo.wh_code }</td>
							<td>${vo.wh_name }</td>
							<td>${vo.retail_code }</td>
							<td>${vo.wh_type }</td>
							<td>${vo.wh_size }</td>
							<td><button class=btn-edit type="button"
									onclick="warehouseUpdate('${vo.wh_code}');">
									<i class='bx bx-edit'></i>
								</button></td>
							<td><button class=btn-delete
									onclick="warehouseDelete('${vo.wh_code}','${vo.wh_name }');">
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
							href="/foundation/warehouse/warehouseList?wh_code=${Search.wh_code }&wh_name=${Search.wh_name }&wh_type=${Search.wh_type }&retail_code=${Search.retail_code }&minsize=${Search.minsize }&maxsize=${Search.maxsize }&pageNum=${pageVO.startPage - pageVO.pageBlock}">
								</a></li>
					</c:if>
					<c:forEach var="i" begin="${pageVO.startPage}"
						end="${pageVO.endPage}" step="1">
						<li class="page-item"><a class="page-link"
							href="/foundation/warehouse/warehouseList?wh_code=${Search.wh_code }&wh_name=${Search.wh_name }&wh_type=${Search.wh_type }&retail_code=${Search.retail_code }&minsize=${Search.minsize }&maxsize=${Search.maxsize }&pageNum=${i}"><span>${i}</span></a></li>
					</c:forEach>
					<c:if test="${pageVO.endPage < pageVO.pageCount}">
						<li class="page-item"><a class="page-link"
							href="/foundation/warehouse/warehouseList?wh_code=${Search.wh_code }&wh_name=${Search.wh_name }&wh_type=${Search.wh_type }&retail_code=${Search.retail_code }&minsize=${Search.minsize }&maxsize=${Search.maxsize }&pageNum=${pageVO.startPage + pageVO.pageBlock}">
								</a></li>
					</c:if>
				</ul>
			</div>


		</div>
	</div>
</body>
</html>