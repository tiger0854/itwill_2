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

<script>
$(document).ready(function(){
	var data = "${result}";
	
	if(data == "LOGOUT" ){
		alert('로그아웃 성공!');
		hold();
	}// if end
	if(data == "LOGFAIL" ){
		alert('로그인 실패!');
	}// if end

	function hold(){
		// 스택 추가
		history.pushState(null, null, location.href); 
		// 뒤로가기 이벤트감지 -> 현재페이지로 이동
		window.onpopstate = function() { 
			history.go(1); 
		}// 뒤로가기막기
	}
});// jQ end
</script>
</html>