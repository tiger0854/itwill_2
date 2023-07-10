<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="../../resources/logo_favicon.png" type="image/x-icon">
<meta charset="UTF-8">
<title>사원 퇴근</title>
<link rel="stylesheet" type="text/css" href="../../resources/css/css.css">
</head>
<body id="body-pd" style="font-family: 'TheJamsil5';">
<jsp:include page="../common/header.jsp"/>
<!-- <img src="https://chart.apis.google.com/chart?cht=qr&chs=250x250&chl=https://naver.com/" alt="qr"> -->
<h1>사원 퇴근</h1>
<form action="" method="post">
	<input type="text" name="employee_id" placeholder="사원번호를 입력해주세요." class="form-control">
	<input type="password" name="employee_pw" placeholder="비밀번호를 입력해주세요." class="form-control" >
	<input type="hidden" name="emp_out" value="퇴근">
	<input type="submit" value="퇴근하기">
</form>
</body>
</html>