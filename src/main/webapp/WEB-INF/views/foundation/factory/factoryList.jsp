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
function factoryUpload() {
	// 새 창을 열기 위한 URL
	var popupUrl = '/foundation/factory/factoryUpload';
	// 새 창 열기
	window.open(popupUrl, '_blank', 'width=500,height=600,resizable=yes');
}

function factoryUpdate(factory_code) {
	// 새 창을 열기 위한 URL
	var popupUrl = '/foundation/factory/factoryUpdate?factory_code='
			+ factory_code;
	// 새 창 열기
	window.open(popupUrl, '_blank', 'width=500,height=600,resizable=yes');
}

function factoryDelete(factory_code, factory_name) {
	  Swal.fire({
	    title: "경고",
	    text: "창고 명 : " + factory_name + "를/을 정말로 삭제하시겠습니까?",
	    icon: "error",
	    showCancelButton:true,
	    confirmButtonText: '확인',
	    cancelButtonText: '취소'
	  })
	  .then(result => {
	    if (result.isConfirmed) { // 만약 모달창에서 확인 버튼을 눌렀다면
	      location.href = '/foundation/factory/factoryDelete?factory_code=' + factory_code;
	    } 
	  });
	}


//공장명 검색 팝업창
function openItem() {
	window.open("/foundation/factory/factoryItemList", "popup",
			"width=500, height=600,left=100, top=100");
}
</script>



</head>

<body id="body-pd" style="font-family: 'TheJamsil5';">
		<div class="height-100">
			<div class="container mt-3">
	<form id="instr">

				<h4 style="margin-top: 150px;">
					<i class='bx bxs-factory'></i> 공장관리
				</h4>
				<div style="margin-top: 10px;">
					<hr width="100%" style="border: 2px solid black">
					<!-- 창고목록 검색, 등록버튼 -->
					<div class=btn-container>
						<input class="btn btn-primary" type="submit" value="공장 조회">
						<!-- <button class=btn-add onclick="location.href='warehouseWrite'"><i class='bx bx-plus-medical'></i> 창고 추가</button> -->
						<input type="button" class="btn btn-outline-primary" onclick="factoryUpload()" value="공장 추가">
					</div>

					<!-- 창고목록 검색박스 -->
					<table class="product-box3" style="margin-top: 20px; width: 100%;"
						border="1">

						<tr>
							<td><input type="button" value="상세 검색" onclick="openItem();" class="btn btn-primary"></td>
							<th>공장 코드</th>
							<td><input type="text" id="factory_code" name="factory_code"
								placeholder="공장코드"></td>
							<th>공장명</th>
							<td><input type="text" id="factory_name" name="factory_name"
								placeholder="공장명"></td>
						</tr>
					</table>
				</div>
	</form>
	<!-- 창고 리스트 -->
	<!-- 	창고명, 창고코드, 관리자명, 사용여부, 구분 ,수정/삭제 표시 -->
	<h4 style="margin-top: 100px;">
		<i class='bx bx-list-ol icon'></i> 공장 목록
	</h4>
	<table class="product-table" style="margin-top: 20px; width: 100%;">
		<thead>
			<tr>
				<th>공장코드</th>
				<th>공장명</th>
				<th>수정</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="vo" items="${factoryList }">
				<tr>
					<td>${vo.factory_code }</td>
					<td>${vo.factory_name }</td>
					<td><button type="button" class=btn-edit
							onclick="factoryUpdate('${vo.factory_code}')">
							<i class='bx bx-edit'></i>
						</button></td>
					<td><button class=btn-delete
							onclick="factoryDelete('${vo.factory_code}', '${vo.factory_name}')">
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
					href="/foundation/factory/factoryList?factory_code=${Search.factory_code }&factory_name=${Search.factory_name }&pageNum=${pageVO.startPage - pageVO.pageBlock}">
						</a></li>
			</c:if>
			<c:forEach var="i" begin="${pageVO.startPage}"
				end="${pageVO.endPage}" step="1">
				<li class="page-item"><a class="page-link"
					href="/foundation/factory/factoryList?factory_code=${Search.factory_code }&factory_name=${Search.factory_name }&pageNum=${i}"><span>${i}</span></a></li>
			</c:forEach>
			<c:if test="${pageVO.endPage < pageVO.pageCount}">	
				<li class="page-item"><a class="page-link"
					href="/foundation/factory/factoryList?factory_code=${Search.factory_code }&factory_name=${Search.factory_name }&pageNum=${pageVO.startPage + pageVO.pageBlock}">
							</a></li>
			</c:if>
		</ul>
	</div>

	</div>
	</div>



</body>
</html>