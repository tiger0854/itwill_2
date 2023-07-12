<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>거래처 상세</title>

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

<style type="text/css">
th{background-color: #E8E8E8 !important;}
tr{border-bottom: 1px solid;}
</style>


</head>
<body style="margin: 0; padding-left: 0; margin-top: 20px;">
	
	<h2 style="text-align: center;">거래처 상세</h2>
	
	<form action="" method="post">
	
		<div class="container" >
		
		
		<table class="table">
		<tr></tr>
		  <tr>
		    <th>거래처코드</th>
		    <td>${cus.cus_code}</td>
		    <th>거래처명</th>
		    <td>${cus.cus_name}</td>
		  </tr>
		  <tr>
		   <th>거래처분류</th>
	
			<c:choose>
       		<c:when test="${cus.cus_stat == '납입'}">
       		  <td>납입처</td>
       		</c:when>
       		<c:otherwise>
  			 <td>납품처</td>	
    		 </c:otherwise>
            </c:choose>
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
		    <th>업태</th>
		   <td>${cus.cus_business}</td>
		    <th>종목</th>
		   <td>${cus.cus_event}</td>
		  </tr>
		</table>
		적요
		<textarea rows="" cols="" class="form-control" readonly="readonly">${cus.cus_memo }</textarea>
		
		
		<!-- 버튼 -->
		<div style="margin-top: 10px;float: right;">
		<input type="button" value="수정" class="btn btn-primary" onclick="location.href='/customer/customerModify?cus_id=${cus.cus_id}'">
		<input type="button" value="닫기" onclick="window.close();"class="btn btn-danger">
		</div>
		<!-- 버튼 -->
		
		</div>
	</form>
	

	
</body>
</html>