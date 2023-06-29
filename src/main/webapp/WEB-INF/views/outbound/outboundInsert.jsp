
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
 
</head>
	  
	<body id="body-pd" style="font-family: 'TheJamsil5';">
	<jsp:include page="../common/header.jsp"/>
   


  <h1>outbound.jsp용dyd</h1>
 
  <form action="" method="post">
   거래처: <input type="text" id="customer_code" name ="outboundList[0].customer_code" onclick="openChildWindow1();"><br> 
   담당자: <input type="text" id="employee_id" name ="outboundList[0].employee_id" onclick="openChildWindow2();"><br> 
  <hr>
  <table id="tbl" border="1" class="table table-bordered">
   <thead>
    <tr>
	  <td>품목코드</td>
	  <td>품목명</td>
	  <td>수량</td>
      <td>단가</td>
	  <td>납기일자</td>  
	  <td>창고</td>  
	  <td>적요</td>
    </tr>
   </thead>
   <tbody>
   <tr name="trProduct" id="trProduct">
	  <td><input type="text" id="item_code" name="outboundList[0].item_code"  
	  		onclick="openChildWindow4();" ></td>
	  <td><input type="text" id="item_name" name="outboundList[0].item_name"  
	  		onclick="openChildWindow4();" > </td>
	  <td><input type="text" class="out_qty" name="outboundList[0].out_qty" placeholder="수량"></td>
	  <td><input type="text" class="price" name="outboundList[0].price" placeholder="단가" 
	  		onclick="openChildWindow4();"></td>
	  <td><input type="date" name="outboundList[0].due_date" placeholder="년-월-일"></td>
	  <td><input type="text" id="factory_code" name ="outboundList[0].factory_code" 
	  		onclick="openChildWindow3();" ></td>
	  <td><input type="text" name="outboundList[0].out_notes" placeholder="적요"></td>
	  <td colspan="8"><input type="button" value="del" id="delProduct"></td>   	
    </tr>
   </tbody>
   
    <tr>
	  <td></td>
	  <td></td>
	  <td><input type="text" name="sum_out_qty" id="sum_out_qty" placeholder="총수량"></td>
	  <td><input type="text" name="sum_price" id="sum_price" placeholder="합계"></td>
	  <td></td>
	  <td></td>
	  <td></td>
    </tr>  
  </table>
  		<input type= "hidden" name="create_date">
	    <input type="button" value="add" name="addProduct">
  <hr>
  	<input type="submit" class="submitBtn" id="submitBtn" value="출고 등록">
  </form>
</body>
 <script type="text/javascript">

  $(document).ready(function() {
	  // 합계 함수
	  function calculateTotal() {
	    var sumQty = 0;
	    var sumPrice = 0;
	    
	    // 모든 행을 돌면서 각 행의 가격과 수량 값을 가져와 합계 계산
	    $("tr[name=trProduct]").each(function() {
	      var qty = parseInt($(this).find("input.out_qty").val()) || 0;
	      var price = parseFloat($(this).find("input.price").val()) || 0;     
	      sumQty += qty;
	      sumPrice += qty * price;
	    });    
	    // 합계를 "총수량"과 "합계"에 입력
	    $("input[name=sum_out_qty]").val(sumQty);
	    $("input[name=sum_price]").val(sumPrice);
	  }
	  
	  // 가격과 수량 입력 필드에 이벤트 리스너 등록
	  $(document).on("input", "input.out_qty, input.price", calculateTotal);

 	  // 품목 행 추가 
 	  $(document).ready(function(){
 		  var idx=1;
	  $(document).on("click","input[name=addProduct]", function(){
		  var trade=document.getElementById("customer_code").value;
		  var employee=document.getElementById("employee_id").value;
		  var addProduct = ' <tr name="trProduct">'+
		 	' <input type="hidden" id="customer_code" name ="outboundList['+(idx)+'].customer_code" value='+trade+'>'+
		    ' <input type="hidden" id="employee_id" name ="outboundList['+(idx)+'].employee_id" value='+employee+'>'+
			'  <td><input type="text" id="item_code" name="outboundList['+(idx)+'].item_code" onclick="openChildWindow4();"></td>' +
			'  <td><input type="text" id="item_name" name="outboundList['+(idx)+'].item_name" onclick="openChildWindow4();"> </td>' +
			'  <td><input type="text" class="out_qty" name="outboundList['+(idx)+'].out_qty" placeholder="수량"></td>' +
			'  <td><input type="text" class="price" name="outboundList['+(idx)+'].price" placeholder="단가" onclick="openChildWindow4();"></td>' +
			'  <td><input type="date" name="outboundList['+(idx)+'].due_date" placeholder="년-월-일"></td>' +
			'  <td><input type="text" id="factory_code" name ="outboundList['+(idx)+'].factory_code" onclick="openChildWindow3();" ></td>' +
			'  <td><input type="text" name="outboundList['+(idx)+'].out_notes" placeholder="적요"></td>' +
			'  <td><input type="button" value="del" id="delProduct"></td>' +
			' </tr>';
		  var trHtml = $( "tr[name=trProduct]:last" );
		  trHtml.after(addProduct);
		  idx++
		  
		// 추가된 행의 가격과 수량 입력 
		    trHtml.next().find("input.out_qty, input.price").on("input", calculateTotal);
  			});
  		}); // 품목 행 추가 

		// 품목 행 삭제 버튼
		$(document).on("click", "#delProduct", function() {
		  var trHtml = $(this).closest("tr");
		
		  // 첫 번째 행은 delete x
		  if (trHtml.is(':first-child')) {
		    return;
		  }
		  trHtml.remove();
			});
		});

  
  
		// 팝업창
		var popupWidth = 500;
		var popupHeight = 400;
		var popupX = Math.ceil(( window.screen.width - popupWidth )/2);
		var popupY = Math.ceil(( window.screen.height - popupHeight )/2);
  		
	  function openChildWindow1() {	
	    var childWindow = window.open("/outbound/customerList", "customerList", 'width=' + popupWidth + ',height=' + popupHeight + ',left='+ popupX + ', top='+ popupY);	   
		  }
 
	  function openChildWindow2() {	
		    var childWindow = window.open("/outbound/empList", "empList", 'width=' + popupWidth + ',height=' + popupHeight + ',left='+ popupX + ', top='+ popupY);		
		  }
	  
	  function openChildWindow3() {			
		    var childWindow = window.open("/outbound/factoryList", "factoryList", 'width=' + popupWidth + ',height=' + popupHeight + ',left='+ popupX + ', top='+ popupY);		
		  }	  
	  
	  function openChildWindow4() {		
		    var childWindow = window.open("/outbound/itemList", "itemList", 'width=' + popupWidth + ',height=' + popupHeight + ',left='+ popupX + ', top='+ popupY);
		  }
		// 팝업창

	  	  </script>

</html>