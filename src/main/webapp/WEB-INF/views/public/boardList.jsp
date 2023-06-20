<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사내 게시판</title>
<link rel="stylesheet" type="text/css" href="../../resources/css/css.css">
</head>
<body id="body-pd" style="font-family: 'TheJamsil5';">
<jsp:include page="../common/header.jsp"/>
<h1>사내 게시판</h1>

<table>
	<thead>
		<tr>
			<td>작성일시</td>
			<td>제목</td>
			<td>작성자</td>
			<td>조회수</td>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="vo" items="${boardList }">
			<tr>
				<td>${vo.regdate }</td>
				<td><a href="/public/content?emp_bno=${vo.emp_bno}">${vo.title }</a></td>
				<td>${vo.position} ${vo.employee_name }</td>
				<td>${vo.read_count }</td>
			</tr>
		</c:forEach>
	</tbody>
</table>



</body>
</html>