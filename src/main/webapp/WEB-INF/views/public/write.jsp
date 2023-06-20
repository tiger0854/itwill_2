<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사내 게시판 글쓰기</title>
<link rel="stylesheet" type="text/css" href="../../resources/css/css.css">
</head>
<body id="body-pd" style="font-family: 'TheJamsil5';">
<jsp:include page="../common/header.jsp"/>
<h1>게시판 글쓰기</h1>

<form action="" method="post">
	<input type="text" name="title" placeholder="제목"><br>
	<textarea rows="5" cols="10"></textarea>
	<input type="submit" value="등록">
</form>



</body>
</html>