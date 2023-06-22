<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<meta charset="UTF-8"> 
<head>
  <title>출고 예정 등록</title>
  <link rel="stylesheet" type="text/css" href="../../resources/css/css.css">
  <script src="https://code.jquery.com/jquery-3.6.4.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script type="text/javascript">

  $(document).ready(function() {
	  // 가격과 수량이 입력될 때 호출될 함수
	  function calculateTotal() {
	    var sumQty = 0;
	    var sumPrice = 0;
	    
	    // 모든 행을 순회하면서 각 행의 가격과 수량 값을 가져와 합계 계산
	    $("tr[name=trProduct]").each(function() {
	      var qty = parseInt($(this).find("input[name=out_qty]").val()) || 0;
	      var price = parseFloat($(this).find("input[name=price]").val()) || 0;
	      
	      sumQty += qty;
	      sumPrice += qty * price;
	    });
	    
	    // 합계를 "총수량"과 "합계" 입력 필드에 업데이트
	    $("input[name=sum_out_qty]").val(sumQty);
	    $("input[name=sum_price]").val(sumPrice);
	  }
	  
	  // 가격과 수량 입력 필드에 이벤트 리스너 등록
	  $(document).on("input", "input[name=out_qty], input[name=price]", calculateTotal);

 	  // 품목 행 추가 
//  	  function addProductRow(){
 	  $(document).ready(function(){
	  $(document).on("click","input[name=addProduct]", function(){
		  var addProduct = ' <tr name="trProduct">'+
			'  <td><input type="text" id="item_code" name="item_code" placeholder="품목코드" onclick="openChildWindow4();"></td>' +
			'  <td><input type="text" id="item_name" name="item_name" placeholder="품목명" onclick="openChildWindow4();"> </td>' +
			'  <td><input type="text" id="standard" name="standard" placeholder="규격" onclick="openChildWindow4();"> </td>' +
			'  <td><input type="text" name="out_qty" placeholder="수량"></td>' +
			'  <td><input type="text" id="price" name="price" placeholder="단가" onclick="openChildWindow4();"></td>' +
			'  <td><input type="date" name="date" placeholder="년-월-일"></td>' +
			'  <td><input type="text" name="out_notes" placeholder="적요"></td>' +
			'  <td><input type="button" value="del" id="delProduct"></td>' +
			' </tr>';
		  var trHtml = $( "tr[name=trProduct]:last" );
		  trHtml.after(addProduct);
		  
		// 추가된 행의 가격과 수량 입력 필드에 이벤트 리스너 등록
		    trHtml.next().find("input[name=out_qty], input[name=price]").on("input", calculateTotal);
	  
  			});
  		});
//  	  } // 품목 행 추가 
 	  

		// 품목 행 삭제 버튼
		$(document).on("click", "#delProduct", function() {
		  var trHtml = $(this).closest("tr");
		
		  // 첫 번째 행 또는 두 번째 행인 경우 삭제하지 않고 종료
		  if (trHtml.is(':first-child')) {
		    return;
		  }
		
		  trHtml.remove();
			});
		});

		// 팝업창 오픈
		var popupWidth = 500;
		var popupHeight = 400;
		var popupX = Math.ceil(( window.screen.width - popupWidth )/2);
		var popupY = Math.ceil(( window.screen.height - popupHeight )/2);
  		
	  function openChildWindow1() {	
	    var childWindow = window.open("/outbound/customer", "customer", 'width=' + popupWidth + ',height=' + popupHeight + ',left='+ popupX + ', top='+ popupY);	   
		  }
 
	  function openChildWindow2() {	
		    var childWindow = window.open("/outbound/outEmployee", "outEmployee", 'width=' + popupWidth + ',height=' + popupHeight + ',left='+ popupX + ', top='+ popupY);		
		  }
	  
	  function openChildWindow3() {			
		    var childWindow = window.open("/outbound/outWarehouse", "outWarehouse", 'width=' + popupWidth + ',height=' + popupHeight + ',left='+ popupX + ', top='+ popupY);		
		  }	  
	  
	  function openChildWindow4() {		
		    var childWindow = window.open("/outbound/productSearch", "productSearch", 'width=' + popupWidth + ',height=' + popupHeight + ',left='+ popupX + ', top='+ popupY);
		    childWindow.opener = window;
		  }
		// 팝업창 오픈

	  	  </script>
	  </head>
	  
	<body id="body-pd" style="font-family: 'TheJamsil5';">
	<jsp:include page="../common/header.jsp"/>
   


  <h1>outbound.jsp</h1>
 
  <form action="" method ="post">
   거래처: <input type="text" id="customer_code" name ="customer_code" onclick="openChildWindow1();"><br> 
   담당자: <input type="text" id="employee_id" name ="employee_id" onclick="openChildWindow2();"><br> 
   출하창고: <input type="text" id="factory_code" name ="factory_code" onclick="openChildWindow3();" > <br> 
  
  <hr>
  <table id="tbl" border="1" class="table table-bordered">
   <thead>
    <tr>
	  <td>품목코드</td>
	  <td>품목명</td>
	  <td>규격</td>
	  <td>수량</td>
      <td>단가</td>
	  <td>납기일자</td>  
	  <td>적요</td>
    </tr>
   </thead>
   <tbody>
   <tr name="trProduct" id="trProduct">
	  <td><input type="text" id="item_code" name="item_code" placeholder="품목코드" 
	  		onclick="openChildWindow4();" ></td>
	  <td><input type="text" id="item_name" name="item_name" placeholder="품목명" 
	  		onclick="openChildWindow4();" > </td>
	  <td><input type="text" id="standard" name="standard" placeholder="규격" 
	  		onclick="openChildWindow4();"> </td>
	  <td><input type="text" name="out_qty" placeholder="수량"></td>
	  <td><input type="text" id="price" name="price" placeholder="단가" 
	  		onclick="openChildWindow4();"></td>
	  <td><input type="date" name="due_date" placeholder="년-월-일"></td>
	  <td><input type="text" name="out_notes" placeholder="적요"></td>
	  <td colspan="8"><input type="button" value="del" id="delProduct"></td>   	
    </tr>
   </tbody>
   
    <tr>
	  <td></td>
	  <td></td>
	  <td></td>
	  <td><input type="text" name="sum_out_qty" id="sum_out_qty" placeholder="총수량"></td>
	  <td><input type="text" name="sum_price" id="sum_price" placeholder="합계"></td>
	  <td></td>
    </tr>  
  </table>
  
	    <input type="button" value="add" name="addProduct">
  <hr>
  	<input type="submit" class="submitBtn" id="submitBtn" value="출고 등록">
  </form>
</body>
</html>