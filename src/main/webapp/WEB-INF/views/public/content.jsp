<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 조회</title>
<link rel="stylesheet" type="text/css" href="../../resources/css/css.css">
</head>
<body id="body-pd" style="font-family: 'TheJamsil5';">
<jsp:include page="../common/header.jsp"/>
<h1>글 조회</h1>

<table>
		<tr>
			<td>제목</td>
			<td>작성자</td>
		</tr>
		<tr>
			<td>${boardContent.title }</td>
			<td>${boardContent.position} ${boardContent.employee_name }</td>
		</tr>
		<tr>
			<td>조회수</td>
			<td>작성일시</td>
		</tr>
		<tr>
			<td>${boardContent.read_count }</td>
			<td>${boardContent.regdate }</td>
		</tr>
</table>

<table>
		<tr>
			<td><textarea cols="10" rows="5" readonly>${boardContent.content }</textarea></td>
		</tr>
</table>



</body>
</html>