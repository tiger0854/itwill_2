<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="../../resources/logo_favicon.png" type="image/x-icon">
<meta charset="UTF-8">
<title>출고 처리</title>
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

	window.addEventListener("message", function(event) {
    var rowData = event.data;
    
//     document.getElementById("re_code").value = rowData[0];
    document.getElementById("out_num").value = rowData[2];
    document.getElementById("out_qty").value = rowData[5];
   });
      
 </script>

</head>


 <body id="body-pd" >
  <div class="container" style="margin-top: 120px;max-width: 100% !important;">
<h4 style="font-weight: bold;" ><i class="bx bx-book"></i>출고처리</h4>
<hr style="border: 2px solid black;">
<div class="tab-content" style="margin-top: 20px; " >

   <form role="form" id="fr">
   <input type="hidden" name="re_code" id="re_code"><br>
    출고 번호 <input type="text" class="form-control" name="out_num" id="out_num" readonly><br>
    <br>
    출고 예정 수량 <input type="text" class="form-control" name="out_qty" id="out_qty" readonly><br>
    <br>
    출고 수량 <input type="number" class="form-control" name="out_Cqty" id="out_Cqty" ><br>
    <p id="out_Cqty_error" style="color: red; font-size: small;"></p>
    <br>
    출고 일자 <input type="date" class="form-control" name="out_date" id="out_date" ><br>
    <p id="date_error" style="color: red; font-size: small;"></p>
    <br>
  <hr>
    <p id="qty_error" style="color: red; font-size: small;"></p>
  	<button type="button" id="outCompleted" class="btn btn-primary">출고 완료</button>
  </form>
</div>
</div>
</body>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">
		

		// 입력 필드와 에러 메시지 요소를 가져옵니다.
		var outCqtyInput = document.getElementById('out_Cqty');
		var errorElement = document.getElementById('out_Cqty_error');
		
		// 입력 필드의 값이 변경될 때마다 처리하는 이벤트 리스너를 추가합니다.
		outCqtyInput.addEventListener('input', function() {
		  // 입력된 값을 가져옵니다.
		  var enteredQty = parseInt(outCqtyInput.value);
		  var outQtyFromVO = parseInt(document.getElementById('out_qty').value);
		  // VO의 out_qty 값을 가져옵니다. 
		
		  
		  // 입력된 값과 VO의 out_qty 값을 비교합니다.
		  if (enteredQty > outQtyFromVO) {
		    // 입력된 값이 예상 수량보다 크면 에러 메시지를 출력합니다.
		    errorElement.textContent = '출고 예정 수량보다 큽니다.';
		  } else if (enteredQty < outQtyFromVO) {
		    // 입력된 값이 예상 수량보다 작거나 같으면 에러 메시지를 지웁니다.
		    errorElement.textContent = '출고 예정 수량보다 작습니다.';
		  } else if (enteredQty == outQtyFromVO) {
			errorElement.textContent = '출고 가능';
		  } else {
			errorElement.textContent = '';
		  }
		});


		
		
		
		
	    $("#outCompleted").click(function() {
	    	
			var enteredQty = parseInt(outCqtyInput.value);
	   		var outQtyFromVO = parseInt(document.getElementById('out_qty').value);
	   	  	var errorElement = document.getElementById('date_error');
	    	
	    	  // 입력된 값과 VO의 out_qty 값을 비교합니다.
	    	  if (enteredQty > outQtyFromVO || enteredQty < outQtyFromVO || isNaN(enteredQty) || enteredQty === "") {
		            $('input#out_Cqty').focus();
		        	return false;
	    	  }	else if ($('input#out_date').val().trim() == ''){
		    		$('input#out_date').val('');
		            $('input#out_date').focus();
		    		errorElement.textContent = '출고 일자를 입력해주세요.';
		        	return false;
			     }
	    	
	      var frObj = $("#fr");
// 	      var reCodeValue = $("#re_code").val(); // re_code 요소의 값을 가져옵니다.
	      var formData = frObj.serialize(); // 폼 데이터를 직렬화합니다.
	      
	   // formData 변수에 re_code 값을 추가합니다.
// 	      formData += "&re_code=" + encodeURIComponent(reCodeValue);

	      $.ajax({
	        url: "/outbound/outProcess", // 요청을 보낼 서버의 URL
	        type: "POST", // HTTP 요청 방식 (POST)
	        data: formData, // 전송할 데이터 (직렬화된 폼 데이터)
	        success: function(response) {
	        	Swal.fire({
	                title: "출고 처리가 완료되었습니다.",
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
	    
	    
	    var outDateInput = document.getElementById('out_date');
	    outDateInput.addEventListener('input', function() {
	    	var errorElement = document.getElementById('date_error');
			errorElement.textContent = ''; // 출고일자 오류 메시지 초기화
		});



</script>
</html>