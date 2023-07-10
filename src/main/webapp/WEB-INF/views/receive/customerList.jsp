<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
    window.opener.document.getElementById("re_customerCd").value = data[0];
    window.opener.document.getElementById("re_customerNm").value = data[1];
    var errorElement1 = window.opener.document.getElementById('cus_error');
    errorElement1.textContent = '';   // 부모창 경고 메시지 초기화
    window.close();
  }  



</script>
</head>

	<body id="body-pd" style="font-family: 'TheJamsil5';">
	<jsp:include page="../common/header.jsp"/>

<body>
 	 거래처 검색
<!--     <input type="text" placeholder="담당자"> -->
<!--     <button>Search</button> -->
 	 <form action="" >		
	<input type="hidden" name="state" value="output">
  		<select id="kind" name="kind" >
  			<option value="code">거래처코드</option>
  			<option value="name">거래처명</option>
  		</select>
  		
  		<input type="text" name="search" value="${pageVO.search }">
  		<button type="submit">Search</button>
  		<input type="hidden" name="pop" value="rec">
  	</form>

  <table border="1" class="table table-bordered">
  <tr>
  <td>거래처코드</td> <!-- 클릭하면 팝업창 꺼지면서 폼에 입력 -->
  <td>거래처명</td> <!-- 클릭하면 팝업창 꺼지면서 폼에 입력 -->
  </tr>

  <c:forEach var="vo" items="${customerList }">
  <c:if test="${vo.cus_stat == 2 }">
  <tr onclick="sendInfo(this);">
  <td>${vo.cus_code }</td>
  <td>${vo.cus_name }</td>
  </tr>
  </c:if>
  </c:forEach>
  </table>
 <!-- -------------------------------------------------------------------------------페이징 구현부-------------------------------------------------------------------------------------------------------- -->
<!-- 	 		<ul class="pagination" id="pagination"> -->
<%-- 		<c:choose> --%>
<%-- 			<c:when test="${pageVO.startPage > pageVO.pageBlock}"> --%>
<!-- 				<li class="page-item"><a -->
<%-- 					href="/customer/customerList?pop=rec&pageNum=${pageVO.startPage - pageVO.pageBlock}" --%>
<!-- 					class="page-link">이전</a></li> -->
<%-- 			</c:when> --%>
<%-- 			<c:otherwise> --%>
<%-- 			</c:otherwise> --%>
<%-- 		</c:choose> --%>

<%-- 	<c:forEach var="i" begin="${pageVO.startPage}" end="${pageVO.endPage}" step="1"> --%>
<%-- 				<c:choose> --%>
<%-- 					<c:when test="${pageVO.kind != null }"> --%>
<%-- 					<li class="page-item ${pageVO.pageNum eq i ? 'active' : ''}"><a href="/customer/customerList?pop=rec&pageNum=${i}&kind=${pageVO.kind}&search=${pageVO.search}" style="margin: 0.5em;border-radius: 2px;"  class="page-link">${i}</a></li> --%>
<%-- 					</c:when> --%>
<%-- 					<c:otherwise> --%>
<%-- 					<li class="page-item ${pageVO.pageNum eq i ? 'active' : ''}"><a href="/customer/customerList?pop=rec&pageNum=${i}" style="margin: 0.5em;border-radius: 2px;"  class="page-link">${i}</a></li> --%>
<%-- 					</c:otherwise> --%>
<%-- 				</c:choose> --%>
<%-- 		</c:forEach> --%>

<%-- 		<c:choose> --%>
<%-- 			<c:when test="${pageVO.endPage < pageVO.pageCount}"> --%>
<!-- 				<li class="page-item"><a -->
<%-- 					href="/customer/customerList?pageNum=${pageVO.startPage + pageVO.pageBlock}" --%>
<!-- 					class="page-link">다음</a></li> -->
<%-- 			</c:when> --%>
<%-- 			<c:otherwise> --%>
<%-- 			</c:otherwise> --%>
<%-- 		</c:choose> --%>
<!-- 	</ul> -->
<!-- -------------------------------------------------------------------------------페이징 구현부-------------------------------------------------------------------------------------------------------- -->	

</body>
</html>