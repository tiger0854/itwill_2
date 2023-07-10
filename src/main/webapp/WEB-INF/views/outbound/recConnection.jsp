<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="../../resources/logo_favicon.png" type="image/x-icon">
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
    // 정보를 부모 창으로 전달
     var newRow = window.opener.$("tr[name=trProduct]:last"); 
     newRow.find("input[id=re_code]").val(data[0]);
//      window.opener.document.getElementById("out_customerNm").value = data[1];
     newRow.find("input[id=item_code]").val(data[1]);
     newRow.find("input[id=item_name]").val(data[2]);
     newRow.find("input[id=out_customerNm]").val(data[3]);
     newRow.find("input[id=out_qty]").val(data[4]);
   
     var errorElement = window.opener.document.getElementById('check_error');
     errorElement.textContent = '';   // 부모창 경고 메시지 초기화
     window.close();
  }  



</script>
</head>

	<body id="body-pd" style="font-family: 'TheJamsil5';">
	<jsp:include page="../common/header.jsp"/>

<body>
 	 수주 검색
<!--     <input type="text" placeholder="담당자"> -->
<!--     <button>Search</button> -->
 	 <form action="" >		
  		<select id="kind" name="kind" >
  			<option value="reCd">수주번호</option>
  			<option value="customerName">거래처명</option>
  		</select>
  		
  		<input type="text" name="search" value="${pageVO.search }">
  		<button type="submit">Search</button>
  		<input type="hidden" name="pop" value="out">
  	</form>

  <table border="1" class="table table-bordered">
	  <tr>
	 	 <th>수주번호</th> <!-- 클릭하면 팝업창 꺼지면서 폼에 입력 -->
	 	 <th>상품코드</th>
	 	 <th>상품명</th>
	 	 <th>수주업체</th>
	 	 <th>수주수량</th>
	  </tr>
	
	  <c:forEach var="vo" items="${receiveList }">
	 		<c:if test="${vo.re_state == 1 }">
	 		 <tr onclick="sendInfo(this);">
				  <td>${vo.re_code }</td>
				  <td>${vo.item_code }</td>
				  <td>${vo.item_name }</td>
				  <td>${vo.re_customerNm }</td>
				  <td>${vo.re_qty }</td>
			 </tr>
			 </c:if>
	  </c:forEach>
  </table>
	
 <!-- -------------------------------------------------------------------------------페이징 구현부-------------------------------------------------------------------------------------------------------- -->
	 		<ul class="pagination" id="pagination">
		<c:choose>
			<c:when test="${pageVO.startPage > pageVO.pageBlock}">
				<li class="page-item"><a
					href="/receive/receiveList?pop=out&pageNum=${pageVO.startPage - pageVO.pageBlock}"
					class="page-link">이전</a></li>
			</c:when>
			<c:otherwise>
			</c:otherwise>
		</c:choose>

	<c:forEach var="i" begin="${pageVO.startPage}" end="${pageVO.endPage}" step="1">
				<c:choose>
					<c:when test="${pageVO.kind != null }">
					<li class="page-item ${pageVO.pageNum eq i ? 'active' : ''}"><a href="/receive/receiveList?pop=out&pageNum=${i}&kind=${pageVO.kind}&search=${pageVO.search}" style="margin: 0.5em;border-radius: 2px;"  class="page-link">${i}</a></li>
					</c:when>
					<c:otherwise>
					<li class="page-item ${pageVO.pageNum eq i ? 'active' : ''}"><a href="/receive/receiveList?pop=out&pageNum=${i}" style="margin: 0.5em;border-radius: 2px;"  class="page-link">${i}</a></li>
					</c:otherwise>
				</c:choose>
		</c:forEach>

		<c:choose>
			<c:when test="${pageVO.endPage < pageVO.pageCount}">
				<li class="page-item"><a
					href="/receive/receiveList?pageNum=${pageVO.startPage + pageVO.pageBlock}"
					class="page-link">다음</a></li>
			</c:when>
			<c:otherwise>
			</c:otherwise>
		</c:choose>
	</ul>
<!-- -------------------------------------------------------------------------------페이징 구현부-------------------------------------------------------------------------------------------------------- -->	

</body>
</html>