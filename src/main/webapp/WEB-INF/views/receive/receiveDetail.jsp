<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<meta charset="UTF-8"> 
<head>
<title>수주 상세</title>
<link rel="stylesheet" type="text/css" href="../../resources/css/css.css">
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.7/dist/sweetalert2.min.css">
 <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.7/dist/sweetalert2.all.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		var frObj = $("form[role='form']");
		
		// 목록으로
		$(".btn-list").click(function(){
			location.href='/receive/receiveList';
		});
		
		// 수정
		$(".btn-update").click(function(){
			frObj.attr("action","/receive/receiveUpdate"); 
			frObj.submit();
		});	
		
		// 삭제
// 		$(".btn-del").click(function(){
// 			frObj.attr("action","/receive/receiveRemove");
// 			frObj.attr("method", "post");
// 			frObj.submit();
// 		});

	});



</script>
</head>
<body id="body-pd" style="font-family: 'TheJamsil5';">
<jsp:include page="../common/header.jsp"/>

<h1>receiveDetail.jsp</h1>
  <h1>수주상세</h1>
  
  <!-- 수정(get-post)/삭제(post)시 정보 전달용 form -->
	<form role="form" id="fr"> 
		<input type="hidden" name="re_code" value="${vo.re_code }">
	</form>
  
  <table border="1" class="table table-bordered">
  <tr>
  <th>수주번호</th>
  <th>수주업체명</th>
  <th>상품코드</th>
  <th>상품명</th>
  <th>수주일자</th>
  <th>담당자코드</th>
  <th>담당자명</th>
  <th>수주수량</th>
  </tr>

	   <tr>
	    <td>${vo.re_code }</td>
	    <td>${vo.re_customerNm }</td>
	    <td>${vo.item_code }</td>
	    <td>${vo.item_name }</td>
	    <td>${vo.re_date }</td>
	    <td>${vo.re_empCd }</td>
	    <td>${vo.re_empNm }</td>
	    <td>${vo.re_qty }</td>
	  </tr>

  
  </table>
  
	  <button class="btn-update">수정</button>
<!-- 	  <button class="btn-del">삭제</button> -->
	  <button class="btn-list">목록</button>


</body>
</html>