<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원 출근</title>
<link rel="stylesheet" type="text/css"
	href="../../resources/css/css.css">
</head>
<body id="body-pd" style="font-family: 'TheJamsil5';">
	<jsp:include page="../common/header.jsp" />
	<!-- <img src="https://chart.apis.google.com/chart?cht=qr&chs=250x250&chl=https://naver.com/" alt="qr"> -->
	<!-- 배포하면 QR이용한 출근창 출력 할거임 -->
	<h1>사원 출근</h1>
	<form action="" method="post">
		<input type="text" name="employee_id" placeholder="사원번호를 입력해주세요.">
		<input type="hidden" name="emp_in" value="출근"> <input
			type="submit" value="출근하기">
	</form>
</body>
</html>