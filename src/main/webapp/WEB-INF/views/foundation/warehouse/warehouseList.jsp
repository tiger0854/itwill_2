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

<body>
	<form id="instr">
		<div class="height-100">
			<div class="container mt-3">

				<h4 style="margin-top: 150px;">
					<i class="bx bx-book"></i> 창고관리
				</h4>
				<div style="margin-top: 10px;">
					<hr width="100%" style="border: 2px solid black">
					<!-- 창고목록 검색, 등록버튼 -->
					<div class=btn-container>
						<button class=btn-search type="submit">
							<i class='bx bx-search-alt-2'></i> 창고 조회
						</button>
						<!-- <button class=btn-add onclick="location.href='warehouseWrite'"><i class='bx bx-plus-medical'></i> 창고 추가</button> -->
						<button class=btn-add onclick=warehouseUpload()>
							<i class='bx bx-plus-medical'></i> 창고 추가
						</button>
					</div>

					<!-- 창고목록 검색박스 -->
					<table class="product-box3" style="margin-top: 20px; width: 100%;"
						border="1">

						<tr>
							<th>창고명</th>
							<td><input type="text" id="wh_name" name="wh_name"
								placeholder="창고명" onclick="openItem();"></td>
							<th>창고 코드</th>
							<td><input type="text" id="wh_code" name="wh_code"
								placeholder="창고코드" readonly></td>
							<th>재고/자재</th>
							<td><select id="retail_code" name="retail_code" disabled>
									<option value="전체">전체</option>
									<option value="자재">자재</option>
									<option value="재고">재고</option>
							</select></td>
							<th>냉장/냉동/상온</th>
							<td><select id="wh_type" name="wh_type" disabled>
									<option value=""></option>
									<option value="냉장">냉장</option>
									<option value="냉동">냉동</option>
									<option value="상온">상온</option>
							</select></td>
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
					<td><button class=btn-edit
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

	<!--   		  	<div class="container" style="margin-top: 30px; margin-bottom: 30px"> -->
	<!-- 			  <ul class="pagination justify-content-center" id="pagination" style="margin-top: 20px;"> -->
	<%-- 		  <c:if test="${startPage > pageBlock }">  --%>
	<%-- 			<li class="page-item"><a class="page-link" href="./AdminQNAList.qn?pageNum=${startPage-pageBlock} "><sapn> < </sapn></a></li> --%>
	<%-- 			</c:if> --%>
	<%-- 		    <c:forEach var="i" begin="1" end="5" step="1"> --%>
	<%-- 			<li class="page-item"><a class="page-link" href="./AdminQNAList.qn?pageNum=${i }"><span>${i }</span></a></li> --%>
	<%-- 			</c:forEach> --%>
	<%-- 		    <c:if test="${endPage<pageCount }"> --%>
	<%-- 			<li class="page-item"><a class="page-link" href="./AdminQNAList.qn?pageNum=${startPage+pageBlock} "><span> > </span></a></li> --%>
	<%-- 			</c:if> --%>
	<!-- 		  </ul> -->
	<!--   		</div> -->


	<!-- 임시 페이징처리 출력용 -->
	<div class="container" style="margin-top: 40px; margin-bottom: 30px">
		<ul class="pagination justify-content-center" id="pagination"
			style="margin-top: 20px;">
			<li class="page-item"><a class="page-link" href="#"><sapn>
					< </sapn></a></li>
			<c:forEach var="i" begin="1" end="5" step="1">
				<li class="page-item"><a class="page-link" href="#"><span>${i }</span></a></li>
			</c:forEach>
			<li class="page-item"><a class="page-link" href="#"><span>
						> </span></a></li>
		</ul>
	</div>

	<br>
	</div>
	</div>
</body>
</html>