<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" type="text/css" href="../../resources/css/css.css">
</head>
<body id="body-pd" style="font-family: 'TheJamsil5';">
<jsp:include page="../common/header.jsp"/>
<h1>로그인</h1>

<form action="" method="post">
	<input type="text" name="employee_id">
	<input type="password" name="employee_pw" placeholder="password">
	<input type="submit" value="로그인">
</form>



</body>
</html>