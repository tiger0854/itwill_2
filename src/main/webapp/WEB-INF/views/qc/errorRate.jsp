<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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


</head>
<body id="body-pd" style="font-family: 'TheJamsil5';">

	<div class="height-100">
		<div class="container mt-3">

			<h4 style="margin-top: 150px;">
				<i class="bx bx-book"></i> 폐기관리
				<button style="margin-left: 20px" type="button"
					class="btn btn-primary btn-sm"
					onclick="location.href='/qc/qualityList'">품질현황</button>
			</h4>
			<div style="margin-top: 10px;">
				<hr width="100%" style="border: 2px solid black">


				<!-- 품질현황목록 검색박스 -->
				<form id="instr">
					<input type="hidden" name="wo_code" value="${param.wo_code }">
					<!-- 작업지시목록 검색, 등록버튼 -->
					<div class="btn-container">
						<input type="submit" class="btn btn-primary" value="조회">
					</div>
					<table class="product-box" style="margin-top: 20px; width: 100%;"
						border="1">
						<tbody>
							<tr>
								<td>품번코드</td>
								<td><label> <input type="text" id="item_code"
										name="item_code" placeholder="품번코드" width="100%">
								</label></td>
								<td>처리상태</td>
								<td><select name="error_status">
										<option value=""></option>
										<option value="재고초과">재고초과</option>
										<option value="불량">불량</option>
								</select></td>
							</tr>
						</tbody>
					</table>
				</form>
				<!-- 품질현황 리스트 -->

				<h4 style="margin-top: 100px;">
					<i class='bx bx-list-ol icon'></i> 불량현황
				</h4>
				<table class="product-table" style="margin-top: 20px; width: 100%;">
					<thead>
						<tr>
							<th>품번코드</th>
							<th>총 생산량</th>
							<th>불량개수</th>
							<th>불량률</th>
							<th>처리상태</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="vo" items="${errorList }">
							<c:set var="errorRate"
								value="${(((vo.total_QTY - vo.total_error_QTY) / vo.total_QTY * 100) - 100) * (-1)}" />
							<tr>
								<td>${vo.item_code }</td>
								<td>${vo.total_QTY }</td>
								<td>${vo.total_error_QTY }</td>
								<c:if test="${(((vo.total_QTY - vo.total_error_QTY) / vo.total_QTY * 100) - 100) * (-1) <= 0 }">
									<td>0%</td>
								</c:if>
								<c:if test="${(((vo.total_QTY - vo.total_error_QTY) / vo.total_QTY * 100) - 100) * (-1) > 0 }">
									<td><fmt:formatNumber value="${errorRate}"
											minFractionDigits="0" maxFractionDigits="0" />%</td>
								</c:if>
								<form action="/qc/errorStatus" method="post">
									<c:if test="${vo.error_status != null }">
										<td>${vo.error_status }</td>
									</c:if>
									<c:if test="${vo.item_code != null && vo.error_status == null }">
										<td><input type="hidden" name="wo_code"
											value="${vo.wo_code }"> <input type="hidden"
											name="item_code" value="${vo.item_code }"> <select
											id="error_status" name="error_status">
												<option value=""></option>
												<option value="재고초과">재고초과</option>
												<option value="불량">불량</option>
										</select>
											<button type="submit" class="btn-search">등록</button></td>
									</c:if>
								</form>
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
								href="/qc/errorRate?wo_code=${Search.wo_code }&item_code=${Search.item_code }&error_status=${Search.error_status }&pageNum=${pageVO.startPage - pageVO.pageBlock}">
									< </sapn>
							</a></li>
						</c:if>
						<c:forEach var="i" begin="${pageVO.startPage}"
							end="${pageVO.endPage}" step="1">
							<li class="page-item"><a class="page-link"
								href="/qc/errorRate?wo_code=${Search.wo_code }&item_code=${Search.item_code }&error_status=${Search.error_status }&pageNum=${i}"><span>${i}</span></a></li>
						</c:forEach>
						<c:if test="${pageVO.endPage < pageVO.pageCount}">
							<li class="page-item"><a class="page-link"
								href="/qc/errorRate?wo_code=${Search.wo_code }&item_code=${Search.item_code }&error_status=${Search.error_status }pageNum=${pageVO.startPage + pageVO.pageBlock}"><span>
										> </span></a></li>
						</c:if>
					</ul>
				</div>
			</div>
		</div>
</body>
</html>