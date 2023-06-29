<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<meta charset="UTF-8"> 
<head>
<title>출고 수정</title>
<link rel="stylesheet" type="text/css" href="../../resources/css/css.css">
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">

	//정보 전달
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

   


  <h1>출고 수정</h1>
 
  <form role="form" id="fr">
  <input type="text" name="out_num" value="${vo.out_num }" readonly>
  <hr>
  <table border="1" class="table table-bordered" >
   <tbody>
    <tr>
	  <td>품목코드</td>
	  <td>품목명</td>
	  <td>담당자</td>
	  <td>수량</td>
	  <td>납기일자</td>  
 	  <td>적요</td>
    </tr>
    <tr>
	  <td><input type="text" name="item_code" value="${vo.item_code }" readonly></td>
	  <td><input type="text" name="item_name" value="품목명" readonly></td>
	  <td><input type="text" name="employee_name" value="담당자" readonly></td>
	  <td><input type="text" name="out_qty" value="${vo.out_qty }"></td>
	  <td><input type="date" name="due_date" value="${vo.due_date }"></td>
	  <td><input type="text" name="out_notes" value="${vo.out_notes }"></td>
    </tr>
  </table>
  <hr>
  	<button type="submit" class="btn-update">수정</button>
  </form>
</body>
</html>