<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="../../resources/logo_favicon.png" type="image/x-icon">
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" type="text/css" href="../../resources/css/css.css">
</head>
<jsp:include page="../common/header.jsp"/>
<script type="text/javascript">
$(document).ready(function(){

	// 	CheckSession();
	var data = "${result}";
	var idData = "${login_id}";
	console.log("id: "+idData);
	if(idData == ""){
// 		hold()
	};// if end
	if(data == "LOGOUT" ){
		Swal.fire({
			title: "로그아웃 되었습니다.",
			icon: "success",
				  confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
				  confirmButtonText: '확인', // confirm 버튼 텍스트 지정
			}) // swal end
// 		hold()
	}// if end
	if(data == "LOGFAIL" ){
		Swal.fire({
			title: "로그인에 실패하였습니다!",
			icon: "error",
				  confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
				  confirmButtonText: '확인', // confirm 버튼 텍스트 지정
			}) // swal end
// 		hold()
	}// if end
	if(data == "OUTFAIL" ){
		Swal.fire({
			title: "퇴근 확인에 실패하였습니다.",
			icon: "error",
				  confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
				  confirmButtonText: '확인', // confirm 버튼 텍스트 지정
			}) // swal end
// 		hold()
	}// if end
	if(data == "EMPOUT" ){
		Swal.fire({
			title: "퇴근 확인 되었습니다.",
			icon: "success",
				  confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
				  confirmButtonText: '확인', // confirm 버튼 텍스트 지정
			}) // swal end
// 		hold()
	}// if end
	if(data == "INSUCC" ){
		Swal.fire({
			title: "출근 확인 되었습니다.",
			icon: "success",
				  confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
				  confirmButtonText: '확인', // confirm 버튼 텍스트 지정
			}) // swal end
// 		hold()
	}// if end
	if(data == "INFAIL" ){
		Swal.fire({
			title: "출근 확인에 실패하였습니다.",
			icon: "error",
				  confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
				  confirmButtonText: '확인', // confirm 버튼 텍스트 지정
			}) // swal end
// 		hold()
	}// if end
	
});// jQ end

</script>

<body id="body-pd" style="font-family: 'TheJamsil5';">

<div id="login">
<h1 class="h1_div"><img src="../../resources/css/logo.png" ></h1><br>

<form action="" method="post">
	사원번호<input type="text" name="employee_id" placeholder="사원번호를 입력해주세요." class="form-control" style="height: 70px;"><br>
	비밀번호<input type="password" name="employee_pw" placeholder="비밀번호를 입력해주세요."  class="form-control" style="height: 70px;font-family: 'GmarketSansMedium';"><br>
	<input type="submit" value="로그인"  class="btn btn-primary" style="width: 100%;">
</form>
</div>


</body>

</html>