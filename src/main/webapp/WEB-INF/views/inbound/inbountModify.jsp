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
<title>Insert title here</title>


	<script type="text/javascript">
	
	window.addEventListener("message", function(event) {
	      var rowData = event.data;
	      
	      document.getElementById("in_number").value = rowData[1];
	      document.getElementById("in_date").value = rowData[7];
	      document.getElementById("wh_code").value = rowData[9];
	      document.getElementById("in_expir").value = rowData[10];
	

	      
	    });
		
  

	</script>
	
	
</head>
<body>
		<h4 style="text-align: center;">입고 수정</h4>
	<hr style="border-width: 1.3px;border-style: solid;">
	<form id="fr" role="form">
		<table class="table">
		  <tr>
	  		<th>입고예정번호</th>
	   		<td><input type="text" id="in_number" name="in_number" readonly="readonly" class="form-control" ></td>
	 	  </tr>
		  <tr>	
		    <th>입고일자</th>
		    <td><input type="date" id="in_date" name="in_date" class="form-control" ></td>
		  </tr>
		  <tr>
		    <th>유통기한</th>
		    <td><input type="date" id="in_expir" name="in_expir" class="form-control" ></td>
		  </tr>
		  <tr>
		  <th>입고창고</th>
		  <td>
			  <div class="input-group">
	  		 	 <input type="text"placeholder="창고 검색하기" class="form-control" name="wh_code" id="wh_code" readonly="readonly" >
	    	 	 <button class="btn btn-primary" type="button" onclick="openChildWindow();">검색</button>
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
		        url: "/inbound/inbountModify", // 요청을 보낼 서버의 URL
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

		        var childWindow2 = window.open("/inbound/empList", "empList", 'width=' + popupWidth + ',height=' + popupHeight + ',left='+ popupX + ', top='+ popupY);

		      } //empList팝업
		      

	
	</script>

</body>
</html>