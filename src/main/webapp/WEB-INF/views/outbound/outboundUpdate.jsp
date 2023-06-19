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

  $(document).on("click","input[name=addProduct]", function(){
	  var addProduct = ' <tr name="trProduct">'+
		'  <td><input type="text" name="code" placeholder="품목코드" readonly onclick=""></td>' +
		'  <td><input type="text" name="name" placeholder="품목명" readonly> </td>' +
		'  <td><input type="text" name="standard" placeholder="규격"> </td>' +
		'  <td><input type="text" name="count" placeholder="수량"></td>' +
		'  <td><input type="text" name="price" placeholder="단가"></td>' +
		'  <td><input type="text" name="date" placeholder="년-월-일"></td>' +
		'  <td><input type="text" name="notes" placeholder="적요"></td>' +
		'  <td><input type="button" value="del" id="delProduct"></td>' +
		' </tr>';
	  var trHtml = $( "tr[name=trProduct]:last" );
	  trHtml.after(addProduct);
	 
  });//on
  
  
 	 //삭제 버튼
	  $(document).on("click", "#delProduct", function() {
	  var trHtml = $(this).closest("tr");
	  trHtml.remove();
	});
	      
	  </script>
	  </head>
	  <body id="body-pd" style="font-family: 'TheJamsil5';">
	  <jsp:include page="../common/header.jsp"/>

   


  <h1>outboundUpdate.jsp</h1>
 
  <hr>
  <table border="1" >
   <tbody>
    <tr>
	  <td>품목코드</td>
	  <td>품목명</td>
	  <td>규격</td>
	  <td>수량</td>
	  <td>단가</td>
	  <td>납기일자</td>  
 	  <td>적요</td>
    </tr>

   <tr name="trProduct">
	  <td><input type="text" name="code" placeholder="품목코드" 
	  		onclick="location.href='productSearch.jsp'" readonly ></td>
	  <td><input type="text" name="name" placeholder="품목명" 
	  		onclick="location.href='productSearch.jsp'" readonly> </td>
	  <td><input type="text" name="standard" placeholder="규격"> </td>
	  <td><input type="text" name="count" placeholder="수량"></td>
	  <td><input type="text" name="price" placeholder="단가"></td>
	  <td><input type="text" name="date" placeholder="년-월-일"></td>
	  <td><input type="text" name="notes" placeholder="적요"></td>
	  <td colspan="8"><input type="button" value="del" id="delProduct"></td>   	
    </tr>
   </tbody>
   
    <tr>
	  <td></td>
	  <td></td>
	  <td></td>
	  <td><input type="text" name="sumCount" placeholder="총수량"></td>
	  <td><input type="text" name="sumPrice" placeholder="합계"></td>
	  <td></td>
    </tr>
   
  </table>
	    <input type="button" value="add" name="addProduct">
<!-- 		<input type="button" value="del" id="delProduct">  -->
	
	  
  <hr>

  	<input type="submit" value="출고예정수정">
  </form>
</body>
</html>