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
<meta charset="UTF-8">
<script type="text/javascript">
		window.addEventListener("message", function(event) {
		    var rowData = event.data;
		    
		    document.getElementById("in_number").value = rowData[1];
		    document.getElementById("material_code").value = rowData[3];
		    document.getElementById("in_piece").value = rowData[4];
		
		  });
		
		window.onload = function() {
		 $('#in_Epiece').keyup(function() {
		     var in_piece = parseInt($('#in_piece').val());
		     var in_Epiece = parseInt($('#in_Epiece').val());
			
			  if(in_piece < in_Epiece){
				  $('#ipmsg').show();
				  $('#ipmsg').css('color','red');
				  $('#ipmsg').text("입고예정 수량보다 많은 수량 입력불가. 입고예정수량:"+in_piece);  
				  $('#confirm').attr('disabled','disabled'); 
			  }else{
				  $('#ipmsg').hide();
				  $('#confirm').removeAttr('disabled');
			  }
			   
			});//입고수량이 발주수량보다 많을 수 없음 
			}
</script>
	
</head>
<body>
		<input type="hidden" id="in_piece">
	<form id="fr" role="form">
		입고번호<input type="text" id="in_number"  name="in_number" class="form-control" readonly="readonly"> <br>
		자재코드<input type="text" id="material_code"  name="material_code" class="form-control" readonly="readonly"> <br>
		
		입고 완료 수량<input type="number" id="in_Epiece"  name="in_Epiece" class="form-control" min="0"><span id="ipmsg"></span> <br>
		
		입고 완료일 <input type="date" id="in_Edate" name="in_Edate" class="form-control"><br>

    <div style="margin-top: 10px;float: right;">
	<input type="button" class="btn btn-primary" id="confirm" value="입고처리하기">
	<input type="button" value="닫기" class="btn btn-secondary" onclick="window.close();">
	</div>
	</form>
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript">
	
		    $("#confirm").click(function() {
		      var frObj = $("#fr");
		      var formData = frObj.serialize(); // 폼 데이터를 직렬화합니다.
		      var Epiece = parseInt($('#in_Epiece').val());
		      var code = $('#material_code').val();
		      
		      $.ajax({
		        url: "/inbound/InboundProcess?Epiece="+Epiece+"&Code="+code, // 요청을 보낼 서버의 URL
		        type: "POST", // HTTP 요청 방식 (POST)
		        data: formData, // 전송할 데이터 (직렬화된 폼 데이터)
		        success: function(response) {
		        	Swal.fire({
		                title: "입고처리가 완료되었습니다.",
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
	
	</script>

</body>
</html>