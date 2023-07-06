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
  
//   window.opener.openChildWindow4();

  var newRow = window.opener.$("tr[name=trProduct]:last");
//   newRow.find("input[id=item_code]").val(data[0]);
//   newRow.find("input[id=item_name]").val(data[1]);
  newRow.find("input.price").val(data[2]);

  window.close();
  
}
 
 
  

  </script>

</head>

<body id="body-pd" style="font-family: 'TheJamsil5';">
<jsp:include page="../common/header.jsp"/>
	<h1>productSearch.jsp</h1>
	
	 품목 검색
	  <form action="" >		
<!--   		<select id="kind" name="kind" > -->
<!--   			<option value="code">품목코드</option> -->
<!--   			<option value="name">품목명</option> -->
<!--   		</select> -->
		
  		
	품목코드  	<input type="text" name="item_code" id="item_code"><br>
<!--   	품목명	<input type="text" name="item_name" id="item_name"> -->
<%--   		<input type="text" name="search" value="${pageVO.search }"> --%>
  		<button type="submit">Search</button>
  		<input type="hidden" name="pop" value="out">
  	</form>
  
  <table border="1" class="table table-bordered">
  <tr>
  <td>품목코드</td> <!-- 클릭하면 팝업창 꺼지면서 폼에 입력 -->
  <td>품목명</td> <!-- 클릭하면 팝업창 꺼지면서 폼에 입력 -->
  <td>단가</td>
  </tr>
  
   <c:forEach var="vo" items="${itemList }">
  <tr onclick="sendInfo(this);">
  <td>${vo.item_code }</td>
  <td>${vo.item_name }</td>
  <td>${vo.item_price }</td>
  </tr>
  </c:forEach>
  </table>
  <!-- -------------------------------------------------------------------------------페이징 구현부-------------------------------------------------------------------------------------------------------- -->
	 		<ul class="pagination" id="pagination">
		<c:choose>
			<c:when test="${pageVO.startPage > pageVO.pageBlock}">
				<li class="page-item"><a
					href="/foundation/itemdetail/itemdetailList?pop=out&pageNum=${pageVO.startPage - pageVO.pageBlock}"
					class="page-link">이전</a></li>
			</c:when>
			<c:otherwise>
			</c:otherwise>
		</c:choose>

			<c:if test="${pageVO.startPage > pageVO.pageBlock}">
				<li class="page-item"><a class="page-link"
					href="/foundation/itemdetail/itemdetailList?pop=out&item_code=${Search.item_code}&pageNum=${pageVO.startPage - pageVO.pageBlock}">
						</a></li>
			</c:if>
			<c:forEach var="i" begin="${pageVO.startPage}"
				end="${pageVO.endPage}" step="1">
				<li class="page-item"><a class="page-link"
					href="/foundation/itemdetail/itemdetailList?pop=out&item_code=${Search.item_code}&pageNum=${i}">${i}</a></li>
			</c:forEach>
			<c:if test="${pageVO.endPage < pageVO.pageCount}">
				<li class="page-item"><a class="page-link"
					href="/foundation/itemdetail/itemdetailList?item_code=${Search.item_code}&pageNum=${pageVO.startPage + pageVO.pageBlock}">
							다음</a></li>
			</c:if>
		</ul>
 <!-- -------------------------------------------------------------------------------페이징 구현부-------------------------------------------------------------------------------------------------------- -->
</body>
</html>