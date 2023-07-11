<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css" rel="stylesheet">
<!-- <link rel="stylesheet" type="text/css" href="../css/css.css"> -->
<link rel="stylesheet" type="text/css" href="../../resources/css/product.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="icon" href="../../resources/logo_favicon.png" type="image/x-icon">
<script>

</script>


</head>
<body>
<div class="black-bar"> <h4 style="text-align: center; color: white; padding-top: 8px">  <i class='bx bx-edit'></i> 담당자 검색 </h4></div>
<!-- 작업지시등록 폼 -->
		<div style="display: flex; justify-content: center; margin-bottom: 27px" >
<!-- 		  <img src="../../resources/css/logo.png"> -->
		</div>
<div class="container mt-3">
<!--  		<hr width="100%" style="border: 2px solid black"> -->
       
<!--         <hr width="100%" style="border: 2px solid black"> -->


 	
  <table border="1" class="table table-bordered">
  <tr>
  <td>담당자코드</td> <!-- 클릭하면 팝업창 꺼지면서 폼에 입력 -->
  <td>담당자명</td> <!-- 클릭하면 팝업창 꺼지면서 폼에 입력 -->
  </tr>
   
    <c:forEach var="vo" items="${empList }">
    <c:if test="${vo.department_name == '생산과'}">
        <tr onclick="selectItem('${vo.employee_id}', '${vo.employee_name}')">
            <td id="con">${vo.employee_id}</td>
            <td id="con">${vo.employee_name}</td>
        </tr>
        
    <script>
	    function selectItem(a, b) {
	        // 부모 창으로 값 전달하기
	        opener.document.getElementById("employee_id").value = a;
	        opener.document.getElementById("employee_name").value = b;
	        window.close();
	    }
	</script>
	</c:if> 
    </c:forEach>
   
</table>
<br>
  <!-- -------------------------------------------------------------------------------페이징 구현부-------------------------------------------------------------------------------------------------------- -->



<br>
</div>
</body>
</html>
