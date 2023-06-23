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

<body>

	<form id="instr">
		<div class="height-100">
			<div class="container mt-3">

				<h4 style="margin-top: 150px;">
					<i class="bx bx-book"></i>자재 등록
				</h4>
				<div style="margin-top: 10px;">
					<hr width="100%" style="border: 2px solid black">
					<!-- 자재목록 검색, 등록버튼 -->
					<div class=btn-container>
						<button class=btn-search type="submit">
							<i class='bx bx-search-alt-2'></i> 조회
						</button>
						<!-- <button class=btn-add onclick="orderwrite()"><i class='bx bx-plus-medical'></i> 추가</button> -->
						<button class=btn-add
							onclick="materialUpload();">
							<i class='bx bx-plus-medical'></i> 추가
						</button>
					</div>


					<!-- 자재목록 검색박스 -->
					<table class="product-box2" style="margin-top: 20px; width: 100%;"
						border="1">

						<tr>
							<th>자재이름</th>
							<td><input type="text" id="material_name"
								name="material_name" placeholder="자재명" onclick="openItem();"></td>
							<th>자재코드</th>
							<td><input type="text" id="material_code"
								name="material_code" placeholder="자재코드" readonly></td>
							<th>자재속성</th>
							<td><select id="material_type" name="material_type" disabled>
									<option value=""></option>
									<option value="원자재">원자재</option>
									<option value="부자재">부자재</option>
							</select>
							<td></td>
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
					<td>${vo.material_type }</td>
					<td><button class=btn-edit
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