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

<div id="login">
<h1 class="h1_div">퇴 근</h1>
	<form action="" method="post">
		사원번호<input type="text" name="employee_id" placeholder="사원번호를 입력해주세요."  class="form-control" style="height: 70px;"><br>
		비밀번호<input type="password" name="employee_pw" placeholder="비밀번호를 입력해주세요."  class="form-control" style="font-family: 'GmarketSansMedium';height: 70px;" ><br>
		<input type="hidden" name="emp_out" value="퇴근">
		<input type="submit" value="퇴근하기" class="btn btn-dark" style="width: 100%;">
	</form>
</div>
</body>
</html>