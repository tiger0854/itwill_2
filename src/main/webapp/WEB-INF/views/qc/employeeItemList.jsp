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

<script>

</script>


</head>
<body>
<div class="black-bar"> <h4 style="text-align: center; color: white; padding-top: 8px">  <i class='bx bx-edit'></i> 상품검색 </h4></div>
<!-- 작업지시등록 폼 -->
		<div style="display: flex; justify-content: center; margin-bottom: 27px" >
<!-- 		  <img src="../../resources/css/logo.png"> -->
		</div>
<div class="container mt-3">
<!--  		<hr width="100%" style="border: 2px solid black"> -->
       
<!--         <hr width="100%" style="border: 2px solid black"> -->
<table class="table" style="width: 100%">
    <form>
        <tr>
   <td><div class="input-group">
	    <input type="text" style="width: 40%" placeholder="사원번호" class="form-control" name="employee_id">
	    <input type="text" style="width: 40%" placeholder="사원이름" class="form-control" name="employee_name">
	    <button type="submit" class="btn btn-primary">검색</button>
	</div></td>
        </tr>
    </form>
</table>

<table class="table table-hover" style="text-align: center;">
    <%-- ${itemList } --%>
    <tr>
        <th>사원번호</th>
        <th>사원이름</th>
    </tr>
    <c:forEach var="vo" items="${itemList }">
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
	
    </c:forEach>
</table>
<br>
<%-- ${Search } --%>
<!-- model.addAttribute("Search", instrSearch); -->
	<div class="container" style="margin-top: 30px; margin-bottom: 30px">
	  <ul class="pagination justify-content-center" id="pagination" style="margin-top: 20px;">
	    <c:if test="${pageVO.startPage > pageVO.pageBlock}"> 
	      <li class="page-item"><a class="page-link" href="/qc/employeeItemList?employee_id=${Search.employee_id }&employee_name=${Search.employee_name }&pageNum=${pageVO.startPage - pageVO.pageBlock}"><sapn> < </sapn></a></li>
	    </c:if>
	    <c:forEach var="i" begin="${pageVO.startPage}" end="${pageVO.endPage}" step="1">
	      <li class="page-item"><a class="page-link" href="/qc/employeeItemList?employee_id=${Search.employee_id }&employee_name=${Search.employee_name }&pageNum=${i}"><span>${i}</span></a></li>
	    </c:forEach>
	    <c:if test="${pageVO.endPage < pageVO.pageCount}">
	      <li class="page-item"><a class="page-link" href="/qc/employeeItemList?employee_id=${Search.employee_id }&employee_name=${Search.employee_name }&pageNum=${pageVO.startPage + pageVO.pageBlock}"><span> > </span></a></li>
	    </c:if>
	  </ul>
	</div>



<br>
</div>
</body>
</html>
