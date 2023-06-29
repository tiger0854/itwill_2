<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<meta charset="UTF-8"> 
<head>
<title>수주 수정</title>
<link rel="stylesheet" type="text/css" href="../../resources/css/css.css">
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.7/dist/sweetalert2.min.css">
 <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.7/dist/sweetalert2.all.min.js"></script>
<script type="text/javascript">

	//팝업창 오픈
	var popupWidth = 500;
	var popupHeight = 400;
	var popupX = Math.ceil(( window.screen.width - popupWidth )/2);
	var popupY = Math.ceil(( window.screen.height - popupHeight )/2);
	
	function openChildWindow1() {	
	    var childWindow = window.open("/receive/empList", "empList", 'width=' + popupWidth + ',height=' + popupHeight + ',left='+ popupX + ', top='+ popupY);		
	  }
	
	// 팝업창 오픈
	
	// 정보 전달
	$(document).ready(function(){
		var formObj = $("#fr");
		
		$(".btn-update").click(function(){
			formObj.attr("method", "post");
			formObj.submit();
		});
		
	});


</script>
</head>
<body id="body-pd" style="font-family: 'TheJamsil5';">
<jsp:include page="../common/header.jsp"/>

<h1>receiveUpdate.jsp</h1>
  <h1>수주수정</h1>
  
  <form role="form" id="fr">
  <table border="1" class="table table-bordered">
  <tr>
  <th>업체 코드</th>
  <th>거래처명(수주업체명)</th>
  <th>품목코드</th>
  <th>품목명</th>
  <th>수주일자</th>
  <th>담당자</th>
  <th>수주수량</th>
  </tr>
  <tr>
    <td><input type="text" name="customer_code" readonly value="${vo.customer_code }"></td>
	  <td><input type="text" name="customer_name" readonly value="거래처명" > </td>
	  <td><input type="text" name="item_code" readonly value="${vo.item_code }" > </td>
	  <td><input type="text" name="item_name" readonly value="품목명" > </td>
	  <td><input type="date" name="re_date" value="${vo.re_date }"></td>
	  <td><input type="text" id="employee_id" name="employee_id" placeholder="담당자" 
	  		onclick="openChildWindow1();"></td>
	  <td><input type="text" name="re_qty" value="${vo.re_qty }"></td>
  </tr>
  </table>
    <button type="submit" class="btn-update">수정</button>
  </form>
</body>
</html>