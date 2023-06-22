<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<meta charset="UTF-8"> 
<head>
<title>출고 상품 리스트</title>
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


<h1>outProductList.jsp</h1>

	<table border="1" class="table table-bordered">
	  <tr>
	    <td>품목코드</td>
	    <td>품목명</td>
	    <td>규격</td>
	    <td>수량</td>
	    <td>납기일자</td>
	    <td>비고</td>
	  </tr>
	  <c:forEach var="vo" items="${outList }">
	   <tr>
	    <td>${vo.item_code }</td>
	    <td>${vo.item_name }</td>
	    <td>${vo.standard }</td>
	    <td>${vo.out_qty }</td>
	    <td>${vo.due_date }</td>
	    <td>${vo.out_notes }</td>
	  </tr>
	  </c:forEach>

	</table>

</body>
</html>