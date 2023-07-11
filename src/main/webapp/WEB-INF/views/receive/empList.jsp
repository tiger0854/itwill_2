<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="../../resources/logo_favicon.png" type="image/x-icon">
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../../resources/css/css.css">
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">


	function sendInfo(row) {
	    var data = [];
	    var cells = row.getElementsByTagName("td");
	    for (var i = 0; i < cells.length; i++) {
	      data.push(cells[i].innerText);
	    }
	    // 정보를 부모 창으로 전달합니다.
	    window.opener.document.getElementById("re_empCd").value = data[0];
	    window.opener.document.getElementById("re_empNm").value = data[1];
	    var errorElement3 = window.opener.document.getElementById('emp_error');
	    errorElement3.textContent = '';   // 부모창 경고 메시지 초기화
	    window.close();
	  }  
</script>

</head>
<body>
<!-- <body id="body-pd" style="font-family: 'TheJamsil5';"> -->
<%-- <jsp:include page="../common/header.jsp"/> --%>

<!--   <h1>user.jsp</h1> -->
<!--   담당자 검색 -->
<!--   	 <form action="" >		 -->
<!--   		<select id="kind" name="kind" > -->
<!--   			<option value="code">담당자코드</option> -->
<!--   			<option value="name">담당자명</option> -->
<!--   		</select> -->
  		
<%--   		<input type="text" name="search" value="${pageVO.search }"> --%>
<!--   		<button type="submit">Search</button> -->
<!--   		<input type="hidden" name="pop" value="rec"> -->
<!--   	</form> -->
  
  <h3>담당자</h3>
  <table border="1" class="table table-hover">
  <tr>
  <td>담당자코드</td> <!-- 클릭하면 팝업창 꺼지면서 폼에 입력 -->
  <td>담당자명</td> <!-- 클릭하면 팝업창 꺼지면서 폼에 입력 -->
  </tr>
  
 <c:forEach var="vo" items="${empList }">
 <c:if test="${vo.department_name == '유통과'}">
  <tr onclick="sendInfo(this);">
  <td>${vo.employee_id }</td>
  <td>${vo.employee_name }</td>
  </tr>
  </c:if>
  </c:forEach>
  </table>
  <div style="color: red; margin-bottom: 10px; font-size: small;">*유통과 사원만 노출됩니다.</div>	
 <!-- -------------------------------------------------------------------------------페이징 구현부-------------------------------------------------------------------------------------------------------- -->
<!-- 	 		<ul class="pagination" id="pagination"> -->
<%-- 		<c:choose> --%>
<%-- 			<c:when test="${pageVO.startPage > pageVO.pageBlock}"> --%>
<!-- 				<li class="page-item"><a -->
<%-- 					href="/emp/list?pop=rec&pageNum=${pageVO.startPage - pageVO.pageBlock}" --%>
<!-- 					class="page-link">이전</a></li> -->
<%-- 			</c:when> --%>
<%-- 			<c:otherwise> --%>
<%-- 			</c:otherwise> --%>
<%-- 		</c:choose> --%>

<%-- 	<c:forEach var="i" begin="${pageVO.startPage}" end="${pageVO.endPage}" step="1"> --%>
<%-- 				<c:choose> --%>
<%-- 					<c:when test="${pageVO.kind != null }"> --%>
<%-- 					<li class="page-item ${pageVO.pageNum eq i ? 'active' : ''}"><a href="/emp/list?pop=rec&pageNum=${i}&kind=${pageVO.kind}&search=${pageVO.search}" style="margin: 0.5em;border-radius: 2px;"  class="page-link">${i}</a></li> --%>
<%-- 					</c:when> --%>
<%-- 					<c:otherwise> --%>
<%-- 					<li class="page-item ${pageVO.pageNum eq i ? 'active' : ''}"><a href="/emp/list?pop=rec&pageNum=${i}" style="margin: 0.5em;border-radius: 2px;"  class="page-link">${i}</a></li> --%>
<%-- 					</c:otherwise> --%>
<%-- 				</c:choose> --%>
<%-- 		</c:forEach> --%>

<%-- 		<c:choose> --%>
<%-- 			<c:when test="${pageVO.endPage < pageVO.pageCount}"> --%>
<!-- 				<li class="page-item"><a -->
<%-- 					href="/emp/list?pageNum=${pageVO.startPage + pageVO.pageBlock}" --%>
<!-- 					class="page-link">다음</a></li> -->
<%-- 			</c:when> --%>
<%-- 			<c:otherwise> --%>
<%-- 			</c:otherwise> --%>
<%-- 		</c:choose> --%>
<!-- 	</ul> -->
<!---------------------------------------------------------------------------------페이징 구현부-------------------------------------------------------------------------------------------------------- -->	

</body>
</html>