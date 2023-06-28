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
<link rel="stylesheet" type="text/css" href="../../resources/css/css.css">

</head>
<body>
	<h3>거래처검색</h3>
	
  <form action="">
   <div class="input-group mb-3"style="width: 100%;justify-content: flex-start;align-items: center; justify-content: space-between;">
   	  <select class="form-select" aria-label="Default select example" style="max-width: 120px;" name="kind" id="kind">
  <option value="name">거래처명</option>
  <option value="code">거래처코드</option>
	</select>
	<input type="text" class="form-control" placeholder="검색어를 입력하세요" name="search" value="${pageVO.search }">
	 <button type="submit" class="btn btn-primary">검색</button>
	  <input type="hidden" name="pop" value="ok">
	</div>
   </form>

  <table border="1" class="table table-hover">
  <tr>
  <th>자재 거래처코드</th> 
  <th>거래처 이름</th>

  </tr>
   
   <c:forEach var="vo" items="${customerList}">
  	<c:if test="${vo.cus_stat == 1 }">
  <tr onclick="sendInfo(this);">
  <td>${vo.cus_code }</td>
  <td>${vo.cus_name }</td>
		
  </tr>
  </c:if>
  </c:forEach>

  
  </table>
  <div style="color: red; margin-bottom: 10px;">*거래처는 입고처만 표시됩니다.</div>
	 <!-- -------------------------------------------------------------------------------페이징 구현부-------------------------------------------------------------------------------------------------------- -->
	<div class="container">
	 	<ul class="pagination"style="justify-content: center;">			
			<c:choose>
				<c:when test="${pageVO.startPage > pageVO.pageBlock}">
					<li class="page-item"><a class="page-link" href="/customer/customerList?pop=ok&pageNum=${pageVO.startPage - pageVO.pageBlock}" style="margin: 0.5em;">◀</a></li>
				</c:when>
				<c:otherwise>
				</c:otherwise>
			</c:choose>
			
			<c:forEach var="i" begin="${pageVO.startPage}" end="${pageVO.endPage}" step="1">
				<c:choose>
					<c:when test="${pageVO.kind != null }">
					<li class="page-item ${pageVO.pageNum eq i ? 'active' : ''}"><a href="/customer/customerList?pop=ok&pageNum=${i}&kind=${pageVO.kind}&search=${pageVO.search}" style="margin: 0.5em;border-radius: 2px;"  class="page-link">${i}</a></li>
					</c:when>
					<c:otherwise>
					<li class="page-item ${pageVO.pageNum eq i ? 'active' : ''}"><a href="/customer/customerList?pop=ok&pageNum=${i}" style="margin: 0.5em;border-radius: 2px;"  class="page-link">${i}</a></li>
					</c:otherwise>
				</c:choose>
				
			</c:forEach>
			
			<c:choose>
				<c:when test="${pageVO.endPage < pageVO.pageCount}">
					<li class="page-item"><a class="page-link" href="/customer/customerList?pageNum=${pageVO.startPage + pageVO.pageBlock}" style="margin: 0.5em;">▶</a></li>
				</c:when>
				<c:otherwise>
				</c:otherwise>
			</c:choose>
		</ul>
		</div>
		
<!-- -------------------------------------------------------------------------------페이징 구현부-------------------------------------------------------------------------------------------------------- -->
	
<script>
    function sendInfo(row) {
      var data3 = [];
      var cells = row.getElementsByTagName("td");
      for (var i = 0; i < cells.length; i++) {
        data3.push(cells[i].innerText);
      }
      // 정보를 부모 창으로 전달합니다.
      window.opener.document.getElementById("order_trade").value = data3[1];
   
      window.close();
    }
  </script>

</body>
</html>