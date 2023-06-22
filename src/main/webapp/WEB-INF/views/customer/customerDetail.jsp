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
	
	<h2 style="text-align: center;">거래처 상세</h2>
	
	<form action="" method="post">
	
		<div class="container" >
		
		
		<table>
		  <tr>
		    <th>거래처코드</th>
		    <td>${cus.cus_code}</td>
		    <th>거래처명</th>
		    <td>${cus.cus_name}</td>
		  </tr>
		  <tr>
		   <th>거래처분류</th>
		    <td>${cus.cus_stat}</td>
		    <th>사업자번호</th>
		    <td>${cus.cus_number}</td>
		  </tr>
		  <tr>
		      <th>대표자</th>
		   <td>${cus.cus_rep}</td>
		    <th>담당자명</th>
		   <td>${cus.cus_resp}</td>
		  </tr>
		  <tr>
		  <th>대표번호</th>
		   <td>${cus.cus_call}</td>
		    <th>담당자번호</th>
		 <td>${cus.cus_phone}</td>
		  </tr>
		  <tr>
		    <th>팩스</th>
		    <td>${cus.cus_fax}</td>
		    <th>주소</th>
		    <td>${cus.cus_address}</td>
		  </tr>
		  <tr>
		    <th>행 6, 열 1</th>
		   <td>${cus.cus_business}</td>
		    <th>행 6, 열 3</th>
		   <td>${cus.cus_event}</td>
		  </tr>
		</table>
		
		
		
		
		
		
		<input type="submit" value="등록" class="btn btn-primary">
		<input type="button" value="닫기" onclick="window.close();"class="btn btn-danger">
		<input type="reset" value="초기화" class="btn btn-secondary">
		</div>
	</form>
	

	
</body>
</html>