<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="../../resources/css/css.css">
<link rel="stylesheet" type="text/css"
	href="../../resources/css/product.css">

<jsp:include page="../common/header.jsp" />
<meta charset="UTF-8">
<title>Insert title here</title>


<script>
	
</script>

</head>
<body id="body-pd" style="font-family: 'TheJamsil5';">


	<div class="height-100">
		<div class="container mt-3">

			<h4 style="margin-top: 150px;">
				<i class="bx bx-book"></i> 품질관리
				<button style="margin-left: 20px" type="button"
					class="btn btn-primary btn-sm"
					onclick="location.href='/qc/errorRate'">폐기현황</button>
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
					</div>
					<table class="product-box" style="margin-top: 20px; width: 100%;"
						border="1">
						<tbody>
							<tr>
								<td>작업지시번호</td>
								<td><label> <input type="text" id="wo_code"
										name="wo_code" placeholder="작업지시번호" width="100%">
								</label></td>
								<td>라인명</td>
								<td><label> <input type="text" id="line_name"
										name="line_name" placeholder="라인명" width="100%">
								</label></td>
								<td>품명</td>
								<td><label> <input type="text" id="item_name"
										name="item_name" placeholder="품명" width="100%">
								</label></td>
							</tr>
							<tr>
								<td>검수자</td>
								<td><label> <input type="text" id="employee_id"
										name="employee_id" placeholder="검수자" width="100%">
								</label></td>
							</tr>
						</tbody>
					</table>
				</form>
				<!-- 품질현황 리스트 -->

				<h4 style="margin-top: 100px;">
					<i class='bx bx-list-ol icon'></i> 작업현황
				</h4>
				<table class="product-table" style="margin-top: 20px; width: 100%;">
					<thead>
						<tr>
							<th>작업지시번호</th>
							<th>라인명</th>
							<th>라인코드</th>
							<th>품명</th>
							<th>품번</th>
							<th>검수자</th>
							<th>수주량</th>
							<th>생산량</th>
							<th>불량</th>
						</tr>
					</thead>
					<tbody>

						<c:forEach var="vo" items="${qualityList }">
							<tr>
								<td>${vo.wo_code }</td>
								<td>${vo.line_name }</td>
								<td>${vo.line_code }</td>
								<td>${vo.item_name }</td>
								<td>${vo.item_code }</td>
								<td>${vo.employee_id }</td>
								<td>${vo.sQTY }</td>
								<td>${vo.pQTY }</td>
								<td>${vo.total_error_QTY }</td>
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
								href="/qc/qualityList?wo_code=${Search.wo_code }&line_name=${Search.line_name }&item_name=${Search.item_name }&employee_id=${Search.employee_id }&pageNum=${pageVO.startPage - pageVO.pageBlock}"><sapn>
									< </sapn></a></li>
						</c:if>
						<c:forEach var="i" begin="${pageVO.startPage}"
							end="${pageVO.endPage}" step="1">
							<li class="page-item"><a class="page-link"
								href="/qc/qualityList?wo_code=${Search.wo_code }&line_name=${Search.line_name }&item_name=${Search.item_name }&employee_id=${Search.employee_id }&pageNum=${i}"><span>${i}</span></a></li>
						</c:forEach>
						<c:if test="${pageVO.endPage < pageVO.pageCount}">
							<li class="page-item"><a class="page-link"
								href="/qc/qualityList?wo_code=${Search.wo_code }&line_name=${Search.line_name }&item_name=${Search.item_name }&employee_id=${Search.employee_id }&pageNum=${pageVO.startPage + pageVO.pageBlock}"><span>
										> </span></a></li>
						</c:if>
					</ul>
				</div>

			</div>
		</div>
</body>
</html>