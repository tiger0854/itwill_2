<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="../../resources/logo_favicon.png" type="image/x-icon">
<meta charset="UTF-8">
<title>사내 게시판 글쓰기</title>
<link rel="stylesheet" type="text/css" href="../../resources/css/css.css">
</head>
<body id="body-pd" style="font-family: 'TheJamsil5';">
<jsp:include page="../common/header.jsp"/>
<h1>게시판 글쓰기</h1>

<form action="" method="post">
	<table class="table table-striped" style="margin-top: 10px;" >
		<tr>
			<td>제목</td>
			<td><input type="text" name="title" size="40"  placeholder="제목"></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><textarea name="content" cols="180" rows="20"></textarea></td>
		</tr>
		<tr>
			<td></td>
			<td><input type="submit" value="등록"> <input type="button" value="목록으로" onclick='location.href="/public/boardList"'></td>
		</tr>
	</table>
</form>



</body>
</html>