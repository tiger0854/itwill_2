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
	function materialUpload() {
		// 새 창을 열기 위한 URL
		var popupUrl = '/foundation/materialdetail/materialdetailUpload';
		// 새 창 열기
		window.open(popupUrl, '_blank', 'width=500,height=600,resizable=yes');
	}

	function materialUpdate(material_code) {
		// 새 창을 열기 위한 URL
		var popupUrl = '/foundation/materialdetail/materialdetailUpdate?material_code='
				+ material_code;
		// 새 창 열기
		window.open(popupUrl, '_blank', 'width=500,height=600,resizable=yes');
	}

	function materialDelete(material_code, material_name) {
		if (confirm("품명 : " + material_name + "를/을 정말로 삭제하시겠습니까?")) {
			location.href = '/foundation/materialdetail/materialdetailDelete?material_code='
					+ material_code;
			alert("삭제완료");
		}
	}

	//자재명 검색 팝업창
	function openItem() {
		window.open("/foundation/materialdetail/materialItemList", "popup",
				"width=500, height=600,left=100, top=100");
	}
</script>


</head>

<body id="body-pd" style="font-family: 'TheJamsil5';">

	<div class="height-100">
		<div class="container mt-3">
			<form id="instr">

				<h4 style="margin-top: 150px;">
					<i class="bx bx-book"></i>자재 등록
				</h4>
				<div style="margin-top: 10px;">
					<hr width="100%" style="border: 2px solid black">
					<!-- 자재목록 검색, 등록버튼 -->
					<div class=btn-container>
						<button class="btn btn-primary" type="submit">
							<i class='bx bx-search-alt-2'></i> 조회
						</button>
						<!-- <button class=btn-add onclick="orderwrite()"><i class='bx bx-plus-medical'></i> 추가</button> -->
						<button class="btn btn-outline-primary" onclick="materialUpload();" >

							<i class='bx bx-plus-medical'></i> 추가
						</button>
					</div>


					<!-- 자재목록 검색박스 -->
					<table class="product-box2" style="margin-top: 20px; width: 100%;"
						border="1">

						<tr>
							<td><input type="button" value="상세검색" onclick="openItem();" class="btn btn-primary"></td>
							<th>자재코드</th>
							<td><input type="text" id="material_code"
								name="material_code" placeholder="자재코드"></td>
							<th>자재이름</th>
							<td><input type="text" id="material_name"
								name="material_name" placeholder="자재명"></td>
							
							<th>자재속성</th>
							<td><select id="material_type" name="material_type">
									<option value=""></option>
									<option value="원자재">원자재</option>
									<option value="부자재">부자재</option>
							</select>
						</tr>
					</table>
				</div>
			</form>
			<!-- 작업지시목록 리스트 -->
			<!-- 품목코드 , 식자재이름, 수량, 창고코드(냉장,냉동,상온) (페이징처리,검색기능)  -->
			<h4 style="margin-top: 100px;">
				<i class='bx bx-list-ol icon'></i> 자재 목록
			</h4>
			<table class="product-table" style="margin-top: 20px; width: 100%;">
				<thead>
					<tr>
						<th>자재코드</th>
						<th>자재이름</th>
						<th>자재단위</th>
						<th>자재속성</th>
						<th>수정</th>
						<th>삭제</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="vo" items="${resultlist }">
						<tr>
							<td>${vo.material_code }</td>
							<td>${vo.material_name }</td>
							<td>${vo.material_unit }</td>
							<td>${vo.material_type }</td>
							<td><button class=btn-edit type="button"
									onclick="materialUpdate('${vo.material_code}');">
									<i class='bx bx-edit'></i>
								</button></td>
							<!--         <td><button class=btn-edit onclick="orderedit()"><i class='bx bx-edit'></i></button></td> -->
							<td><button class=btn-delete
									onclick="materialDelete('${vo.material_code}','${vo.material_name }');">
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
							href="/foundation/materialdetail/materialdetailList?material_code=${Search.material_code }&material_name=${Search.material_name }&material_type=${Search.material_type }&pageNum=${pageVO.startPage - pageVO.pageBlock}">
								</a></li>
					</c:if>
					<c:forEach var="i" begin="${pageVO.startPage}"
						end="${pageVO.endPage}" step="1">
						<li class="page-item"><a class="page-link"
							href="/foundation/materialdetail/materialdetailList?material_code=${Search.material_code }&material_name=${Search.material_name }&material_type=${Search.material_type }&pageNum=${i}"><span>${i}</span></a></li>
					</c:forEach>
					<c:if test="${pageVO.endPage < pageVO.pageCount}">
						<li class="page-item"><a class="page-link"
							href="/foundation/materialdetail/materialdetailList?material_code=${Search.material_code }&material_name=${Search.material_name }&material_type=${Search.material_type }&pageNum=${pageVO.startPage + pageVO.pageBlock}">
									</a></li>
					</c:if>
				</ul>
			</div>

		</div>
	</div>



</body>
</html>