<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" rel="stylesheet">
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../../resources/css/css.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<script type="text/javascript">

	$(document).ready(function() {
		
		var data = "${result}";
		if (data == "INSERTOK") {
		
			Swal.fire({
	            title: "등록이 완료되었습니다.",
	            text: "",
	            icon: "success"
	          }).then(function() {
	            opener.location.reload();
	            window.close();
	          });
		}
	
	
	}); //거래처 등록 완료시 alert띄우고 창닫기

</script>




</head>
<body>
	
	<h2 style="text-align: center;">거래처 등록</h2>
	
	<form action="" method="post">
	
		<div class="container" >
		
		거래처명<input type="text" name="cus_name" class="form-control"><br>
		
		거래처분류
		<select name="cus_stat">
		<option value="1">납입처</option>
		<option value="2">납품처</option>
		</select><br>
		
		사업자번호
		<input type="text" name="cus_number" class="form-control"><br>
		
	 	대표명
		<input type="text" name="cus_rep" class="form-control"><br>
		
		담당자명
		<input type="text" name="cus_resp" class="form-control"><br>
		
		담당자 연락처
		<input type="text" name="cus_phone" class="form-control"><br>
		
		대표번호
		<input type="text" name="cus_call"class="form-control"><br>
		
		팩스번호
		<input type="text" name="cus_fax" class="form-control"><br>
		
		주소
		<input type="text" name="cus_address" class="form-control"><br>
		
		업태
		<input type="text" name="cus_business" class="form-control"><br>
		
		종목
		<input type="text" name="cus_event" class="form-control"><br>
		
		적요
		<textarea rows="" cols="" name="cus_memo" class="form-control"></textarea><br>
		
		<input type="submit" value="등록" class="btn btn-primary">
		<input type="button" value="닫기" onclick="window.close();"class="btn btn-danger">
		<input type="reset" value="초기화" class="btn btn-secondary">
		</div>
	</form>
	

	
</body>
</html>