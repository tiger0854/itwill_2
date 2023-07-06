<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<meta charset="UTF-8"> 
<head>
<title>수주 등록</title>
<link rel="stylesheet" type="text/css" href="../../resources/css/css.css">
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.7/dist/sweetalert2.min.css">
 <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.7/dist/sweetalert2.all.min.js"></script>

</head>
<body id="body-pd" style="font-family: 'TheJamsil5';">
<jsp:include page="../common/header.jsp"/>

<h1>receiveInsert.jsp</h1>
  <h1>수주등록</h1>
  
  <form action="" method="post">
  <table border="1" class="table table-bordered">
  <tr>
  <th>수주업체코드</th>
  <td><input type="text" id="re_customerCd" name="re_customerCd" placeholder="수주업체코드" 
	  		onclick="openChildWindow1();" ></td>
  <th>수주업체명</th>
  <td><input type="text" id="re_customerNm" name="re_customerNm" placeholder="수주업체명" 
	  		onclick="openChildWindow1();" > </td>
  </tr>
  <tr>
  <th>품목코드</th>
  <td><input type="text" id="item_code" name="item_code" placeholder="품목코드" 
	  		onclick="openChildWindow3();" > </td>
  <th>품목명</th>
  <td><input type="text" id="item_name" name="item_name" placeholder="품목명" 
	   		onclick="openChildWindow3();"> </td>
  </tr>
  <tr>
  <th>담당자코드</th>
  <td><input type="text" id="re_empCd" name="re_empCd" placeholder="담당자코드" 
	  		onclick="openChildWindow2();"></td>
  <th>담당자명</th>
  <td><input type="text" id="re_empNm" name="re_empNm" placeholder="담당자명" 
	  		onclick="openChildWindow2();"></td>
  </tr>
  <tr>
  <th>수주수량</th>
	  <td><input type="text" name="re_qty" placeholder="수주수량"></td>
  <th>수주일자</th>
  <td><input type="date" name="re_date" placeholder="년-월-일"></td>
  </tr>
  </table>
    <button type="submit">수주등록</button>
  </form>

</body>

  <script type="text/javascript">

	//팝업창 오픈
	var popupWidth = 500;
	var popupHeight = 400;
	var popupX = Math.ceil(( window.screen.width - popupWidth )/2);
	var popupY = Math.ceil(( window.screen.height - popupHeight )/2);
		
	function openChildWindow1() {	
	var childWindow = window.open("/customer/customerList?pop=rec", "customerList", 'width=' + popupWidth + ',height=' + popupHeight + ',left='+ popupX + ', top='+ popupY);	   
	  }
	
	function openChildWindow2() {	
	    var childWindow = window.open("/emp/list?pop=rec", "empList", 'width=' + popupWidth + ',height=' + popupHeight + ',left='+ popupX + ', top='+ popupY);		
	  }
	
	function openChildWindow3() {		
	    var childWindow = window.open("/foundation/itemdetail/itemdetailList?pop=rec", "productList", 'width=' + popupWidth + ',height=' + popupHeight + ',left='+ popupX + ', top='+ popupY);
	    childWindow.opener = window;
	  }
	// 팝업창 오픈


  </script>

</html>