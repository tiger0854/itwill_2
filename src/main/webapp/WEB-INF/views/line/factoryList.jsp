<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공장목록</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css" rel="stylesheet">
<!-- <link rel="stylesheet" type="text/css" href="../../resources/css/css.css"> -->
<link rel="stylesheet" type="text/css" href="../../resources/css/product.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="icon" href="../../resources/logo_favicon.png" type="image/x-icon">
<script>

</script>
</head>
<body>
<div class="black-bar"> <h4 style="text-align: center; color: white; padding-top: 8px">  <i class='bx bx-edit'></i> 공장검색 </h4></div>
<!-- 작업지시등록 폼 -->
<!-- 		<div style="display: flex; justify-content: center; margin-bottom: 27px" > -->
<!-- 		  <img src="../../resources/css/logo.png"> -->
<!-- 		</div> -->
<div class="container mt-3">
<!--  		<hr width="100%" style="border: 2px solid black"> -->
       
<!--         <hr width="100%" style="border: 2px solid black"> -->

    <form>
    <div class="input-group" style="margin-bottom: 10px; margin-top: 50px"> 
    <table>
	 <td><div class="input-group">
	    <input type="text" style="width: 40%" placeholder="공장 코드" class="form-control" name="factory_code" id="factory_code">
	    <input type="text" style="width: 40%" placeholder="공장 이름" class="form-control" name="factory_name" id="factory_name">
	    <button type="submit" class="btn btn-primary">검색</button>
	</div></td>
    </table>
    </form>
	 </div>
<table class="table table-hover" style="text-align: center;">
    <%-- ${itemList } --%>
    <tr>
        <th>공장코드</th>
        <th>공장이름</th>
    </tr>
    <c:forEach var="vo" items="${factoryList }">
        <tr onclick="selectItem('${vo.factory_code}', '${vo.factory_name}')">
            <td id="con">${vo.factory_code}</td>
            <td id="con">${vo.factory_name}</td>
        </tr>
    <script>
	    function selectItem(a, b) {
	        // 부모 창으로 값 전달하기
	        opener.document.getElementById("factory_code").value = a;
	        opener.document.getElementById("factory_name").value = b;
	        window.close();
	    }
	</script>   
        
    </c:forEach>
</table>
<br>
<%-- ${Search } --%>
<!-- model.addAttribute("Search", instrSearch); -->
	<div class="container" style="margin-top: 30px; margin-bottom: 30px">
		<ul class="pagination justify-content-center" id="pagination"
			style="margin-top: 20px;">
			<c:if test="${pageVO.startPage > pageVO.pageBlock}">
				<li class="page-item"><a class="page-link"
					href="/line/factoryList?factory_code=${Search.factory_code }&factory_name=${Search.factory_name }&pageNum=${pageVO.startPage - pageVO.pageBlock}"><sapn>
						< </sapn></a></li>
			</c:if>
			<c:forEach var="i" begin="${pageVO.startPage}"
				end="${pageVO.endPage}" step="1">
				<li class="page-item"><a class="page-link"
					href="/line/factoryList?factory_code=${Search.factory_code }&factory_name=${Search.factory_name }&pageNum=${i}"><span>${i}</span></a></li>
			</c:forEach>
			<c:if test="${pageVO.endPage < pageVO.pageCount}">	
				<li class="page-item"><a class="page-link"
					href="/line/factoryList?factory_code=${Search.factory_code }&factory_name=${Search.factory_name }&pageNum=${pageVO.startPage + pageVO.pageBlock}"><span>
							> </span></a></li>
			</c:if>
		</ul>
	</div>


<br>
</div>
</body>
</html>
