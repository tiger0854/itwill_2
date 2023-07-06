<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../../resources/css/css.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script type="text/javascript">
	$(document).ready(function() {
	    $('#pay_date').click(function() {
	      var orderDateValue = $("input[name='order_date']").val();
	      $('#pay_date').attr("min", orderDateValue);
	    });
	  });
	
	window.addEventListener("message", function(event) {
	      var rowData = event.data;
	      
	      document.getElementById("order_number").value = rowData[0];
	      document.getElementById("order_piece").value = rowData[3];
	      document.getElementById("order_date").value = rowData[4];
	      document.getElementById("pay_date").value = rowData[5];
	      document.getElementById("resp").value = rowData[8];
	      document.getElementById("order_trade").value = rowData[9];
	    });
		  
  

	</script>
	
	
</head>
<body>
	<h4 style="text-align: center;">발주서 수정</h4>
	<hr style="border-width: 1.3px;border-style: solid;">
	<form id="fr" role="form">
		
		<table class="table">
		<tr>
		<th>발주번호</th> 
		<td><input type="text" id="order_number"  name="order_number" readonly="readonly" class="form-control"></td>
		</tr>
		<tr>
		<th>발주수량</th> 
		<td><input type="number" id="order_piece" name="order_piece"class="form-control"></td>
		</tr>
		<tr>
		<th>발주일자</th> 
		<td><input type="date" id="order_date" name="order_date"class="form-control"></td>
		</tr>
		<tr>
		<th>납기일자</th>
		<td><input type="date" id="pay_date" name="pay_date"class="form-control"></td>
		</tr>
		<tr>
		<th>담당자</th>
		<td>
		<div class="input-group">
		    <input type="text"placeholder="담당자 검색하기" class="form-control" name="order_resp" id="resp" readonly="readonly"  onclick="openChildWindow2();">
		    <button class="btn btn-primary" type="button" onclick="openChildWindow2();">검색</button>   
    	</div>
    	</td>
    	</tr>
    	<tr>
	 	<th>거래처</th>
	 	<td>
	 	 <div class="input-group">  
		    <input type="text"placeholder="거래처 검색하기" class="form-control" name="order_trade" id="order_trade" readonly="readonly"onclick="openChildWindow3();" >
		    <button class="btn btn-primary" type="button" onclick="openChildWindow3();">검색</button>
  		</div>
  		</td>
  		</tr>
   	 </table>
   	 	<div style="margin-top: 10px;float: right;">
			<button type="button" class="btn btn-primary" id="modify">수정완료</button>
			<input type="button" value="닫기" class="btn btn-secondary" onclick="window.close();">
		</div>
	</form>
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript">
	
		    $("#modify").click(function() {
		      var frObj = $("#fr");
		      var formData = frObj.serialize(); // 폼 데이터를 직렬화합니다.

		      $.ajax({
		        url: "/inbound/orderModify", // 요청을 보낼 서버의 URL
		        type: "POST", // HTTP 요청 방식 (POST)
		        data: formData, // 전송할 데이터 (직렬화된 폼 데이터)
		        success: function(response) {
		        	Swal.fire({
		                title: "수정이 완료되었습니다.",
		                text: "",
		                icon: "success"
		              }).then(function() {
		                opener.location.reload();
		                window.close();
		              });
		        },
		        error: function(xhr, status, error) {
		          console.error("에러 발생:", error);
		        }
		      });
		   
		    
		  
		  });
		    
		    var popupWidth = 500;
		    var popupHeight = 400;

		    var popupX = Math.ceil(( window.screen.width - popupWidth )/2);
		    var popupY = Math.ceil(( window.screen.height - popupHeight )/2); 
		    
		    function openChildWindow2() {

		    	   var childWindow2 = window.open("/emp/list?pop=ok", "empList", 'width=' + popupWidth + ',height=' + popupHeight + ',left='+ popupX + ', top='+ popupY);

		      } //empList팝업
		      
		    function openChildWindow3() {

		    	 var childWindow3 = window.open("/customer/customerList?pop=ok", "tradeList", 'width=' + popupWidth + ',height=' + popupHeight + ',left='+ popupX + ', top='+ popupY);
		     
		      } //tradeList팝업   
	
	</script>

</body>
</html>