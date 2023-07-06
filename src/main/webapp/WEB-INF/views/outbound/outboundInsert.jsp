
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
   


  <h1>출고 list</h1>
 
  <form action="" method="post">
<!--    수주번호: <input type="text" id="re_code" name= "outboundList[0].re_code" onclick="openChildWindow();" readonly><br> -->
   거래처명: <input type="text" id="out_customerNm" name="outboundList[0].out_customerNm" onclick="openChildWindow();" readonly><br> 
  <hr>
   담당자코드: <input type="text" id="out_empCd" name="outboundList[0].out_empCd" onclick="openChildWindow2();" readonly><br> 
   담당자명: <input type="text" id="out_empNm" name="outboundList[0].out_empNm" onclick="openChildWindow2();" readonly><br>    
  <hr>
  <font color="red" size="small">* 행 추가시, 동일 거래처 수주 번호만 등록 가능합니다.</font>
  
  <table id="tbl" border="1" class="table table-bordered">
   <thead>
    <tr>
	  <td>수주번호</td>
	  <td>품목코드</td>
	  <td>품목명</td>
	  <td>수량</td>
      <td>단가</td>
	  <td>납기일자</td>  
<!-- 	  <td>창고</td>   -->
	  <td>적요</td>
    </tr>
   </thead>
   <tbody>
   <tr name="trProduct" id="trProduct">
	  <td><input type="text" id="re_code" name="outboundList[0].re_code"  
	  		onclick="openChildWindow();" readonly></td>
	  <td><input type="text" id="item_code" name="outboundList[0].item_code"  
	  		onclick="openChildWindow();" readonly></td>
	  <td><input type="text" id="item_name" name="outboundList[0].item_name"  
	  		onclick="openChildWindow();" readonly> </td>
	  <td><input type="text" id="out_qty" class="out_qty" name="outboundList[0].out_qty" onclick="openChildWindow();"></td>
	  <td><input type="text" class="price" name="outboundList[0].price" placeholder="단가" 
	  		onclick="openChildWindow4();" readonly></td>
	  <td><input type="date" name="outboundList[0].due_date" placeholder="년-월-일"></td>
<!-- 	  <td><input type="text" id="factory_code" name ="outboundList[0].factory_code"  -->
<!-- 	  		onclick="openChildWindow3();" ></td> -->
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
		  var trade=document.getElementById("out_customerNm").value;
		  var employeeCd=document.getElementById("out_empCd").value;
		  var employeeNm=document.getElementById("out_empNm").value;
// 		  var recCd=document.getElementById("re_code").value;
		  var addProduct = ' <tr name="trProduct">'+
		 	' <input type="hidden" id="out_customerNm" name ="outboundList['+(idx)+'].out_customerNm" value='+trade+'>'+
		    ' <input type="hidden" id="out_empCd" name ="outboundList['+(idx)+'].out_empCd" value='+employeeCd+'>'+
		    ' <input type="hidden" id="out_empNm" name ="outboundList['+(idx)+'].out_empNm" value='+employeeNm+'>'+
// 		    ' <input type="hidden" id="out_empNm" name ="outboundList['+(idx)+'].out_empNm" value='+recCd+'>'+
			'  <td><input type="text" id="re_code" name="outboundList['+(idx)+'].re_code" onclick="openChildWindow();" readonly></td>' +
			'  <td><input type="text" id="item_code" name="outboundList['+(idx)+'].item_code" onclick="openChildWindow();" readonly></td>' +
			'  <td><input type="text" id="item_name" name="outboundList['+(idx)+'].item_name" onclick="openChildWindow();" readonly> </td>' +
			'  <td><input type="text" class="out_qty" id="out_qty" name="outboundList['+(idx)+'].out_qty" onclick="openChildWindow();" placeholder="수량"></td>' +
			'  <td><input type="text" class="price" name="outboundList['+(idx)+'].price" placeholder="단가" onclick="openChildWindow4();" readonly></td>' +
			'  <td><input type="date" name="outboundList['+(idx)+'].due_date" placeholder="년-월-일"></td>' +
// 			'  <td><input type="text" id="factory_code" name ="outboundList['+(idx)+'].factory_code" onclick="openChildWindow3();" ></td>' +
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
  		
	 
	  function openChildWindow() {	
	    var childWindow = window.open("/receive/receiveList?pop=out", "recConnection", 'width=' + popupWidth + ',height=' + popupHeight + ',left='+ popupX + ', top='+ popupY);	   
		  }
	  
// 	  function openChildWindow1() {	
// 	    var childWindow = window.open("/customer/customerList?pop=out", "customerList", 'width=' + popupWidth + ',height=' + popupHeight + ',left='+ popupX + ', top='+ popupY);	   
// 		  }
 
	  function openChildWindow2() {	
		    var childWindow = window.open("/emp/list?pop=out", "empList", 'width=' + popupWidth + ',height=' + popupHeight + ',left='+ popupX + ', top='+ popupY);		
// 		    var childWindow = window.open("/emp/list?pop=ok", "empList", 'width=' + popupWidth + ',height=' + popupHeight + ',left='+ popupX + ', top='+ popupY);		
		  }
	  
// 	  function openChildWindow3() {			
// 		    var childWindow = window.open("/outbound/factoryList", "factoryList", 'width=' + popupWidth + ',height=' + popupHeight + ',left='+ popupX + ', top='+ popupY);		
// 		  }	  
	  
	  function openChildWindow4() {		
		    var childWindow = window.open("/foundation/itemdetail/itemdetailList?pop=out", "itemList", 'width=' + popupWidth + ',height=' + popupHeight + ',left='+ popupX + ', top='+ popupY);
		  }
		// 팝업창

	  	  </script>

</html>