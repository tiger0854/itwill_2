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
   <td>
    <div class="input-group">
    <select name="kind" id="kind">
  		<option value="itemName">품목명</option>
  		<option value="customerName">수주업체명</option>
  	</select>   

	    <input type="text" style="width: 40%" placeholder="상품코드를 입력하세요" class="form-control" name="search" value="${pageVO.search }">
	    <button type="submit" class="btn btn-primary">검색</button>
	</div></td>
        </tr>
    </form>
</table>

<table class="table table-hover" style="text-align: center;">
    <%-- ${itemList } --%>
    <tr>
        <th>수주번호</th>
        <th>수주수량</th>
        <th>상품코드</th>
        <th>상품이름</th>
    </tr>
    <c:forEach var="vo" items="${receiveList }">
        <tr onclick="selectItem('${vo.re_code}', '${vo.re_qty}','${vo.item_code}','${vo.item_name}','${vo.re_qty}')">
            <td id="con">${vo.re_code}</td>
            <td id="con">${vo.re_qty}</td>
            <td id="con">${vo.item_code}</td>
            <td id="con">${vo.item_name}</td>
        </tr>
    <script>
	    function selectItem(a, b, c, d, e) {
	        // 부모 창으로 값 전달하기
	        opener.document.getElementById("re_code").value = a;
	        opener.document.getElementById("re_qty").value = b;
	        opener.document.getElementById("item_code").value = c;
	        opener.document.getElementById("item_name").value = d;
	        opener.document.getElementById("re_qty2").value = e;
	        window.close();
	    }
	</script>
	
    </c:forEach>
</table>
<br>
  <!-- -------------------------------------------------------------------------------페이징 구현부-------------------------------------------------------------------------------------------------------- -->
	 		<ul class="pagination" id="pagination">
		<c:choose>
			<c:when test="${pageVO.startPage > pageVO.pageBlock}">
				<li class="page-item"><a
					href="/pro/suList?pageNum=${pageVO.startPage - pageVO.pageBlock}"
					class="page-link">이전</a></li>
			</c:when>
			<c:otherwise>
			</c:otherwise>
		</c:choose>

	<c:forEach var="i" begin="${pageVO.startPage}" end="${pageVO.endPage}" step="1">
				<c:choose>
					<c:when test="${pageVO.kind != null }">
					<li class="page-item ${pageVO.pageNum eq i ? 'active' : ''}"><a href="/pro/suList?pageNum=${i}&kind=${pageVO.kind}&search=${pageVO.search}" style="margin: 0.5em;border-radius: 2px;"  class="page-link">${i}</a></li>
					</c:when>
					<c:otherwise>
					<li class="page-item ${pageVO.pageNum eq i ? 'active' : ''}"><a href="/pro/suList?pageNum=${i}" style="margin: 0.5em;border-radius: 2px;"  class="page-link">${i}</a></li>
					</c:otherwise>
				</c:choose>
		</c:forEach>

		<c:choose>
			<c:when test="${pageVO.endPage < pageVO.pageCount}">
				<li class="page-item"><a
					href="/pro/suList?pageNum=${pageVO.startPage + pageVO.pageBlock}"
					class="page-link">다음</a></li>
			</c:when>
			<c:otherwise>
			</c:otherwise>
		</c:choose>
	</ul>



<br>
</div>
</body>
</html>
