<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="../../resources/logo_favicon.png" type="image/x-icon">
<meta charset="UTF-8">
<title>퇴근자 명단</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="../../resources/css/css.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>

</head>
<body id="body-pd" style="font-family: 'TheJamsil5';">
	<h1>퇴근자 명단</h1>
	<table class="table table-striped" style="margin-top: 10px;">
		<thead>
			<tr>
				<td>퇴근 일시</td>
				<td>사번</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="out" items="${outList }">
				<tr>
					<td><fmt:formatDate value="${out.date_time }"
							pattern="yyyy년MM월 dd일 HH시 mm분" /></td>
					<td><a href="#" id="emp_infoLink"
						onclick="window.open('/emp/info?employee_id=${out.employee_id}', 'employee_info');">
							${out.employee_id }</a></td>
				</tr>
			</c:forEach>
			<c:if test="${empty outList}">
				<tr>
					<td colspan="2">퇴근 내역이 없습니다.</td>
				</tr>
			</c:if>
		</tbody>
	</table>
	<!-- -------------------------------------------------------------------------------페이징 구현부------------------------------------------------------------------------ -->
	<ul class="pagination" id="pagination">
		<c:choose>
			<c:when test="${pageVO.startPage > pageVO.pageBlock}">
				<li class="page-item"><a
					href="/emp/outEmp_list?pageNum=${pageVO.startPage - pageVO.pageBlock}"
					class="page-link">이전</a></li>
			</c:when>
			<c:otherwise>
			</c:otherwise>
		</c:choose>

		<c:forEach var="i" begin="${pageVO.startPage}" end="${pageVO.endPage}"
			step="1">
			<li
				class="page-item<c:if test="${pageVO.pageNum eq i}"> active</c:if>">
				<a href="/emp/outEmp_list?pageNum=${i}" class="page-link">${i}</a>
			</li>
		</c:forEach>

		<c:choose>
			<c:when test="${pageVO.endPage < pageVO.pageCount}">
				<li class="page-item"><a
					href="/emp/outEmp_list?pageNum=${pageVO.startPage + pageVO.pageBlock}"
					class="page-link">다음</a></li>
			</c:when>
			<c:otherwise>
			</c:otherwise>
		</c:choose>
	</ul>
	<!-- -------------------------------------------------------------------------------페이징 구현부--------------------------------------------------------------------------- -->
</body>
</html>