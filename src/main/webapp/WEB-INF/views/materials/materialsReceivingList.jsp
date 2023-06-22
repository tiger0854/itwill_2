<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="../../resources/css/css.css">
<jsp:include page="../common/header.jsp" />
<meta charset="UTF-8">
<title>Insert title here</title>


<script>
	function materialsWrite() {
		// 새 창을 열기 위한 URL
		var popupUrl = '/materials/materialsReceivingWrite';
		// 새 창 열기
		window.open(popupUrl, '_blank',
				'width=500,height=600,left=100, top=100');
	}

	function edit(code) {
		var popupUrl = '/materials/materialsReceivingEdit?material_code=' + code;
		window.open(popupUrl, '_blank',
				'width=500,height=600,left=100, top=100');
	}

	//품명 검색 팝업창
	function openItem(title, code, name, item_code, item_name) {
		window.open("/materials/matItelList?title="+title+"&code="+code+"&name="+name+"&item_code="+item_code+"&item_name="+item_name, "popup",
				"width=500, height=600,left=100, top=100");
	}

	function remove(code) {
		if (confirm("정말로 삭제하시겠습니까?")) {
			location.href = '/materials/materialsReceivingRemove?material_code=' + code;
			alert("삭제완료!");
		}
	}
</script>

</head>
<body id="body-pd" style="font-family: 'TheJamsil5';">


	<div class="height-100">
		<div class="container mt-3">

			<h4 style="margin-top: 150px;">
				<i class="bx bx-book"></i> 자재입고관리
			</h4>
			<div style="margin-top: 10px;">
				<hr width="100%" style="border: 2px solid black">


				<!-- 작업지시목록 검색박스 -->

				<form id="instr">

					<!-- 작업지시목록 검색, 등록버튼 -->
					<div class=btn-container>
						<button type="submit" class=btn-search>
							<i class='bx bx-search-alt-2'></i> 조회
						</button>
						<button class=btn-add onclick="materialsWrite()">
							<i class='bx bx-plus-medical'></i> 추가
						</button>
					</div>
					<table class="product-box" style="margin-top: 20px; width: 100%;"
						border="1">
						<tr>
							<td>라인</td>
							<td><select name="line_code" class="line_code">
									<option value="" selected>전체</option>
									<c:forEach var="line" items="${lineList}">
										<option value="${line.line_code}">${line.line_name}</option>
									</c:forEach>
							</select></td>
							<td>입고일자</td>
							<!-- 시작시 기본 날짜 설정은 value를 이용 -->
							<td><input type="date" id="wo_date" class="form-control"
								name="wo_date" placeholder="날짜를 선택해주세요" />
						</tr>
						<tr>
							<td>품번</td>
							<td><input type="hidden" id="pid" name="pid"> <label>
									<input type="text" id="item_code" name="item_code"
									placeholder="품번" onclick="openItem('품번조회', '품번코드', '품번명')" width="100%" readonly>
									<i class='bx bx-search-alt-2'></i> <input type="text"
									id="item_name" placeholder="품명" style="border: 1px solid"
									readonly></td>

							</label>
							<td>업체</td>
							<td><input type="hidden" id="pid" name="pid"> <label>
									<input type="text" id="item_code" name="item_code"
									placeholder="업체명" onclick="openItem('업체조회', '업체코드', '업체명')" width="100%" readonly>
									<i class='bx bx-search-alt-2'></i> <input type="text"
									id="item_name" placeholder="업체코드" style="border: 1px solid"
									readonly></td>

							</label>
						</tr>
					</table>
			</div>
			</form>
			<!-- 자재입고목록 리스트 -->
			<%-- ${oderList} --%>
			<h4 style="margin-top: 100px;">
				<i class='bx bx-list-ol icon'></i> 자재입고 목록
			</h4>
			<table class="product-table" style="margin-top: 20px; width: 100%;">
				<thead>
					<tr>
						<th>입고번호</th>
						<th>품번</th>
						<th>품명</th>
						<th>단위</th>
						<th>입고창고</th>
						<th>현재고</th>
						<th>입고수량</th>
						<th>업체코드</th>
						<th>업체명</th>
						<th>입고LOT</th>
						<th>비고</th>
						<th>입고일자</th>
						<th>수정</th>
						<th>삭제</th>
					</tr>
				</thead>
				<tbody>

					<c:forEach var="vo" items="${list }">
						<tr>

							<td></td>
							<td>${vo.material_code }</td>
							<td>${vo.material_name }</td>
							<td></td>
							<td>${vo.wh_code }</td>
							<td></td>
							<td>${vo.rvQTY }</td>
							<td>${vo.cus_code }</td>
							<td>${vo.cus_name }</td>
							<td>${vo.rvBOX }</td>
							<td>${vo.remark }</td>
							<td>${vo.rvDate }</td>
							<td><button class="btn-edit"
									onclick="edit('${vo.material_code }');">
									<i class="bx bx-edit"></i>
								</button></td>
							<td><button class="btn-delete"
									onclick="remove('${vo.material_code }');">
									<i class="bx bxs-trash"></i>
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