<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<meta charset="UTF-8"> 
<head>
<link rel="icon" href="../../resources/logo_favicon.png" type="image/x-icon">
<title>수주 상세</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../../resources/css/css.css">
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.7/dist/sweetalert2.min.css">
 <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.7/dist/sweetalert2.all.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		var frObj = $("form[role='form']");
		
		// 목록으로
		$("#list").click(function(){
			location.href='/receive/receiveList';
		});
		
		// 수정
		$("#update").click(function(){
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
<body id="body-pd">
<jsp:include page="../common/header.jsp"/>

<div class="container" style="margin-top: 120px;max-width: 100% !important;">
<h4 style="font-weight: bold;" ><i class="bx bx-book"></i>수주상세</h4>
<hr style="border: 2px solid black;">

<div class="tab-content" style="margin-top: 20px; " >

  

  
  <!-- 수정(get-post)/삭제(post)시 정보 전달용 form -->
	<form role="form" id="fr"> 
		<input type="hidden" name="re_code" value="${vo.re_code }">
	</form>
  
  <table class="table table-bordered" style="width: 100%;">
  <thead style="border-top:3px solid #E9E9E9; background-color: #F9F9F9;text-align: center;">
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
 </thead>
 <tbody style="border-bottom:3px solid #E9E9E9; ">
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

  </tbody>
  </table>
  </div>
  
  <c:choose>
	  <c:when test="${vo.re_state == 1}">
<!-- 	     <button class="btn-update">수정</button> -->
	     <button type="button" id="update" class="btn btn-primary"style="float: right;margin-top: 20px;margin-right: 30px;">수정</button>
	  </c:when>
	  <c:otherwise>
	     <font style="color: red; font-size: small;">*출고 완료된 수주는 수정이 불가합니다.</font><br>
	  </c:otherwise>
  </c:choose>
  	  <button type="button" id="list" class="btn btn-primary"style="float: right;margin-top: 20px;margin-right: 30px;" >목록</button>
<!-- 	  <button class="btn-del">삭제</button> -->
<!-- 		  <button class="btn-list">목록</button> -->

</div>
</body>
</html>