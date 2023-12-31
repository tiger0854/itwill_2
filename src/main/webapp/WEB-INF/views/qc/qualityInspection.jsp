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
</head>
<script type="text/javascript">
	function orderwrite() {
		// 새 창을 열기 위한 URL
		var popupUrl = '/qc/qualityInspectionWrite';
		// 새 창 열기
		window.open(popupUrl, '_blank',
				'width=500,height=600,left=100, top=100');
	}
</script>
<body>
	<div class="height-100">
		<div class="container mt-3">

			<h4 style="margin-top: 150px;">
				<i class="bx bx-book"></i> 품질관리
			</h4>
			<div style="margin-top: 10px;">
				<hr width="100%" style="border: 2px solid black">


				<!-- 품질현황목록 검색박스 -->
				<form id="instr">
					<!-- 작업지시목록 검색, 등록버튼 -->
					<div class="btn-container">
						<button type="submit" class="btn-search">
							<i class='bx bx-search-alt-2'></i> 조회
						</button>
						<button class=btn-add onclick="orderwrite()">
							<i class='bx bx-plus-medical'></i> 추가
						</button>
					</div>
					<table class="product-box" style="margin-top: 20px; width: 100%;"
						border="1">
						<tbody>
							<tr>
								<td>품명</td>
								<td><label> <input type="text" id="item_name"
										name="item_name" placeholder="품명" width="100%">
								</label></td>
								<td>검사일</td>
								<td><label> <input type="date" id="inspection_date"
										name="inspection_date" placeholder="검사일" width="100%">
								</label></td>
								<td>검사상태</td>
								<td><select id="inspection_result" name="inspection_result">
										<option value=""></option>
										<option value="합격">합격</option>
										<option value="불합격">불합격</option>
								</select></td>
							</tr>

						</tbody>
					</table>
				</form>
				<!-- 품질현황 리스트 -->

				<h4 style="margin-top: 100px;">
					<i class='bx bx-list-ol icon'></i> 품질 검사
				</h4>
				<table class="product-table" style="margin-top: 20px; width: 100%;">
					<thead>
						<tr>
							<th>검사번호</th>
							<th>검사일</th>
							<th>품명</th>
							<th>검수량</th>
							<th>검사상태</th>
							<th>검사 세부 내용</th>
						</tr>
					</thead>
					<tbody>

						<c:forEach var="vo" items="${qualityInspection }">
							<tr>
								<td>${vo.inspection_number }</td>
								<td>${vo.inspection_date }</td>
								<td>${vo.item_name }</td>
								<td>${vo.iQTY }</td>
								<td>${vo.inspection_result }</td>
								<td>${vo.inspection_comment }</td>
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
								href="/qc/qualityInspection?inspection_date=${Search.inspection_date }&item_name=${Search.item_name }&inspection_result=${Search.inspection_result }&pageNum=${pageVO.startPage - pageVO.pageBlock}"><sapn>
									< </sapn></a></li>
						</c:if>
						<c:forEach var="i" begin="${pageVO.startPage}"
							end="${pageVO.endPage}" step="1">
							<li class="page-item"><a class="page-link"
								href="/qc/qualityInspection?inspection_date=${Search.inspection_date }&item_name=${Search.item_name }&inspection_result=${Search.inspection_result }&pageNum=${i}"><span>${i}</span></a></li>
						</c:forEach>
						<c:if test="${pageVO.endPage < pageVO.pageCount}">
							<li class="page-item"><a class="page-link"
								href="/qc/qualityInspection?inspection_date=${Search.inspection_date }&item_name=${Search.item_name }&inspection_result=${Search.inspection_result }&pageNum=${pageVO.startPage + pageVO.pageBlock}"><span>
										> </span></a></li>
						</c:if>
					</ul>
				</div>

			</div>
		</div>
</body>
</html>