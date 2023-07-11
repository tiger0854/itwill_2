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
	    window.opener.document.getElementById("item_code").value = data[0];
	    window.opener.document.getElementById("item_name").value = data[1];
	    var errorElement2 = window.opener.document.getElementById('item_error');
	    errorElement2.textContent = '';   // 부모창 경고 메시지 초기화
	    window.close();
	  }  

  </script>

</head>

<body>
	  <form action="" >		
<!--   		<select id="kind" name="kind" > -->
<!--   			<option value="code">품목코드</option> -->
<!--   			<option value="name">품목명</option> -->
<!--   		</select> -->
	<h3>품목</h3>  		
	<div class="input-group">
	  	<input type="hidden" name="item_code" id="item_code" >
    	<input type="text" class="form-control" name="item_name" id="item_name" placeholder="품목명">
<!--   	품목명	<input type="text" name="item_name" id="item_name"> -->
<%--   		<input type="text" name="search" value="${pageVO.search }"> --%>
  		<button type="submit" class="btn btn-primary">검색</button>
  		</div>
  		<input type="hidden" name="pop" value="rec">
  	</form>
  <br>
  <table border="1" class="table table-hover">
  <tr>
  <td>품목코드</td> <!-- 클릭하면 팝업창 꺼지면서 폼에 입력 -->
  <td>품목명</td> <!-- 클릭하면 팝업창 꺼지면서 폼에 입력 -->
  </tr>
  
   <c:forEach var="vo" items="${itemList }">
  <tr onclick="sendInfo(this);">
  <td>${vo.item_code }</td>
  <td>${vo.item_name }</td>
  </tr>
  </c:forEach>
  </table>
  <!-- -------------------------------------------------------------------------------페이징 구현부-------------------------------------------------------------------------------------------------------- -->
<!-- 	 		<ul class="pagination" id="pagination"> -->
<%-- 		<c:choose> --%>
<%-- 			<c:when test="${pageVO.startPage > pageVO.pageBlock}"> --%>
<!-- 				<li class="page-item"><a -->
<%-- 					href="/foundation/itemdetail/itemdetailList?pop=rec&pageNum=${pageVO.startPage - pageVO.pageBlock}" --%>
<!-- 					class="page-link">이전</a></li> -->
<%-- 			</c:when> --%>
<%-- 			<c:otherwise> --%>
<%-- 			</c:otherwise> --%>
<%-- 		</c:choose> --%>

<%-- 			<c:if test="${pageVO.startPage > pageVO.pageBlock}"> --%>
<!-- 				<li class="page-item"><a class="page-link" -->
<%-- 					href="/foundation/itemdetail/itemdetailList?pop=rec&item_code=${Search.item_code}&pageNum=${pageVO.startPage - pageVO.pageBlock}"> --%>
<!-- 						</a></li> -->
<%-- 			</c:if> --%>
<%-- 			<c:forEach var="i" begin="${pageVO.startPage}" --%>
<%-- 				end="${pageVO.endPage}" step="1"> --%>
<!-- 				<li class="page-item"><a class="page-link" -->
<%-- 					href="/foundation/itemdetail/itemdetailList?pop=rec&item_code=${Search.item_code}&pageNum=${i}">${i}</a></li> --%>
<%-- 			</c:forEach> --%>
<%-- 			<c:if test="${pageVO.endPage < pageVO.pageCount}"> --%>
<!-- 				<li class="page-item"><a class="page-link" -->
<%-- 					href="/foundation/itemdetail/itemdetailList?pop=rec&item_code=${Search.item_code}&pageNum=${pageVO.startPage + pageVO.pageBlock}"> --%>
<!-- 							다음</a></li> -->
<%-- 			</c:if> --%>
<!-- 		</ul> -->
 <!-- -------------------------------------------------------------------------------페이징 구현부-------------------------------------------------------------------------------------------------------- -->
<%--   		${Search} --%>
			<div class="container" style="margin-top: 30px; margin-bottom: 30px">
				<ul class="pagination" style= "justify-content: center;" id="pagination"
					style="margin-top: 20px;">
					<c:if test="${pageVO.startPage > pageVO.pageBlock}">
						<li class="page-item"><a class="page-link"
							href="/foundation/itemdetail/itemdetailList?pop=rec&item_code=${Search.item_code}&item_name=${Search.item_name}&pageNum=${pageVO.startPage - pageVO.pageBlock}">
								</a></li>
					</c:if>
					<c:forEach var="i" begin="${pageVO.startPage}"
						end="${pageVO.endPage}" step="1">
						<li class="page-item"><a class="page-link"
							href="/foundation/itemdetail/itemdetailList?pop=rec&item_code=${Search.item_code}&item_name=${Search.item_name}&pageNum=${i}"><span>${i}</span></a></li>
					</c:forEach>
					<c:if test="${pageVO.endPage < pageVO.pageCount}">
						<li class="page-item"><a class="page-link"
							href="/foundation/itemdetail/itemdetailList?pop=rec&item_code=${Search.item_code}&item_name=${Search.item_name}&pageNum=${pageVO.startPage + pageVO.pageBlock}">
								</a></li>
					</c:if>
				</ul>
			</div>

</body>
</html>