<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<meta charset="UTF-8"> 
<head>
<title>수주 리스트</title>
<link rel="stylesheet" type="text/css" href="../../resources/css/css.css">
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.7/dist/sweetalert2.min.css">
 <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.7/dist/sweetalert2.all.min.js"></script>
<script type="text/javascript">


</script>
</head>
<body id="body-pd" style="font-family: 'TheJamsil5';">
<jsp:include page="../common/header.jsp"/>

  <h1>receiveList</h1>
  <h1>수주 목록</h1>
 <!-- select box 검색 품목명, 수주업체 -->
  <input type="text"> 
  <button>Search</button>
  
  <table border="1" class="table table-bordered">
  <tr>
  <th>수주번호</th>
  <th>상품명</th>
  <th>수주업체</th>
  <th>수주일자</th>
  <th>담당자</th>
  <th>수주수량</th>
  </tr>
  
  <c:forEach var="vo" items="${receiveList }">
  <tr>
  <td><a href="/receive/receiveDetail?re_code=${vo.re_code}">${vo.re_code }</td> <!-- join 하면 concat item_code 되는지 확인 -->
  <td>${vo.item_code }</td> <!-- join 해서 이름으로 가져오기  -->
  <td>${vo.customer_code }</td> <!-- join 해서 이름으로 가져오기  -->
  <td>${vo.re_date }</td>
  <td>${vo.employee_id }</td> <!-- join 해서 이름으로 가져오기  -->
  <td>${vo.re_qty }</td> 
  </tr>
  </c:forEach>
  </table>
  
  <!-- -------------------------------------------------------------------------------페이징 구현부-------------------------------------------------------------------------------------------------------- -->
	 		<ul class="pagination" id="pagination">
		<c:choose>
			<c:when test="${pageVO.startPage > pageVO.pageBlock}">
				<li class="page-item"><a
					href="/receive/receiveList?pageNum=${pageVO.startPage - pageVO.pageBlock}"
					class="page-link">이전</a></li>
			</c:when>
			<c:otherwise>
			</c:otherwise>
		</c:choose>

		<c:forEach var="i" begin="${pageVO.startPage}" end="${pageVO.endPage}"
			step="1">
			<li
				class="page-item<c:if test="${pageVO.pageNum eq i}"> active</c:if>">
				<a href="/receive/receiveList?pageNum=${i}" class="page-link">${i}</a>
			</li>
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
  
  <button onclick="location.href='./receiveInsert';">등록</button>

</body>
</html>