<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>거래처 수정</title>

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
		if (data == "UPDATEOK") {
		
			Swal.fire({
	            title: "수정이 완료되었습니다.",
	            text: "",
	            icon: "success"
	          }).then(function() {
	            opener.location.reload();
	            window.close();
	          });
		}
	
	
	}); //거래처 등록 완료시 alert띄우고 창닫기

</script>

<style type="text/css">
th{background-color: #E8E8E8 !important;}
tr{border-bottom: 1px solid;}
</style>


</head>
<body style="margin: 0; padding-left: 0; margin-top: 20px;">
	
	<h2 style="text-align: center;">거래처 수정</h2>
	
	<form action="" method="post">
	
		<input type="hidden" name="cus_id" value="${cus.cus_id}">
		<div class="container" >
		
		
		<table class="table">
		<tr></tr>
		  <tr>
		    <th>거래처코드</th>
		    <td>${cus.cus_code}</td>
		    <th>거래처명</th>
		    <td><input type="text" value="${cus.cus_name}" class="form-control" name="cus_name"></td>
		  </tr>
		  <tr>
		   <th>거래처분류</th>
		    <td>	
				<select name="cus_stat" class="form-control">
				<c:if test="${cus.cus_stat == '납입'}">
					<option value="1" selected="selected">납입처</option>
					<option value="2">납품처</option>
				</c:if>
				<c:if test="${cus.cus_stat == '납품'}">
					<option value="1">납입처</option>
					<option value="2" selected="selected">납품처</option>
				</c:if>
				</select>
			</td>
		    <th>사업자번호</th>
		    <td><input type="text" value="${cus.cus_number}" class="form-control" name="cus_number"></td>
		  </tr>
		  <tr>
		      <th>대표자</th>
		   <td><input type="text" value="${cus.cus_rep}" class="form-control" name="cus_rep"></td>
		    <th>담당자명</th>
		   <td><input type="text" value="${cus.cus_resp}" class="form-control" name="cus_resp"></td>
		  </tr>
		  <tr>
		  <th>대표번호</th>
		   <td><input type="text" value="${cus.cus_call}" class="form-control" name="cus_call"></td>
		    <th>담당자번호</th>
		 <td><input type="text" value="${cus.cus_phone}" class="form-control" name="cus_phone"></td>
		  </tr>
		  <tr>
		    <th>팩스</th>
		    <td><input type="text" value="${cus.cus_fax}" class="form-control" name="cus_fax"></td>
		    <th>주소</th>
		    <td><input type="text" value="${cus.cus_address}" class="form-control" name="cus_address"></td>
		  </tr>
		  <tr>
		    <th>업태</th>
		   <td><input type="text" value="${cus.cus_business}" class="form-control" name="cus_business"></td>
		    <th>종목</th>
		   <td><input type="text" value="${cus.cus_event}" class="form-control" name="cus_event"></td>
		  </tr>
		</table>
		
		적요
		<textarea rows="" cols="" class="form-control" name="cus_memo" >${cus.cus_memo }</textarea>
		
		
		<!-- 버튼 -->
		<div style="margin-top: 10px;float: right;">
		<input type="submit" value="수정" class="btn btn-primary">
		<input type="button" value="닫기" onclick="window.close();"class="btn btn-danger">
		</div>
		<!-- 버튼 -->
		
		</div>
	</form>
	

	
</body>
</html>