<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="../../resources/logo_favicon.png" type="image/x-icon">
<meta charset="UTF-8">
<title>사원 퇴근</title>
<link rel="stylesheet" type="text/css" href="../../resources/css/css.css">
<style type="text/css">
.employee_id{margin-left: 30%; margin-top:2%; height: 100px; font-size: 2em;} 
.employee_pw{margin-left: 30%; margin-top:2%; height: 100px; width: 430px; font-size: 2em;}
.submit{height: 92px;} 
.h1_div{margin-left: 30%; margin-top: 15%;}
</style>
</head>
<body id="body-pd" style="font-family: 'TheJamsil5';">
<jsp:include page="../common/header.jsp"/>

<h1 class="h1_div">퇴 근</h1>
	<form action="" method="post">
		<input type="text" name="employee_id" placeholder="사원번호를 입력해주세요." class="employee_id"><br>
		<input type="password" name="employee_pw" placeholder="비밀번호를 입력해주세요." class="employee_pw" style="font-family: 'GmarketSansMedium';" >
		<input type="hidden" name="emp_out" value="퇴근">
		<input type="submit" value="퇴근하기"  class="submit">
	</form>
</body>
</html>