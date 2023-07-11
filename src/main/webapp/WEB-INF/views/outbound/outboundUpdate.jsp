<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<meta charset="UTF-8"> 
<head>
<link rel="icon" href="../../resources/logo_favicon.png" type="image/x-icon">
<title>출고 수정</title>
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
    
    document.getElementById("out_num").value = rowData[2];
    document.getElementById("item_name").value = rowData[4];
    document.getElementById("out_empNm").value = rowData[10];
    document.getElementById("out_qty").value = rowData[5];
    document.getElementById("due_date").value = rowData[7];
    document.getElementById("out_notes").value;
   });
      
 </script>
 </head>
 <body id="body-pd" >

  <div class="container" style="margin-top: 120px;max-width: 100% !important;">
<h4 style="font-weight: bold;" ><i class="bx bx-book"></i>출고수정</h4>
<hr style="border: 2px solid black;">

<div class="tab-content" style="margin-top: 20px; " >
 
  <form role="form" id="fr">
  <input type="text" class="form-control" name="out_num" id="out_num"  readonly>
  <hr>
  <table class="table table-bordered" style="width: 100%;">
  <thead style="border-top:3px solid #E9E9E9; background-color: #F9F9F9;text-align: center;">
    <tr>
	  <th>품목명</th>
	  <th>담당자</th>
	  <th>수량</th>
	  <th>납기일자</th>  
 	  <th>비고</th>
    </tr>
    </thead>
     <tbody style="border-bottom:3px solid #E9E9E9; ">
    <tr>
	  <td><input type="text" class="form-control" name="item_name" id="item_name" readonly></td>
	  <td><input type="text" class="form-control" name="out_empNm" id="out_empNm" readonly></td>
	  <td><input type="text" class="form-control" name="out_qty" id="out_qty" readonly></td>
	  <td><input type="date" class="form-control" name="due_date" id="due_date"></td>
	  <td><input type="text" class="form-control" name="out_notes" id="out_notes"></td>
    </tr>
    </tbody>
  </table>
<!--    <div style="color: red; font-size: small">납기일자, 비고만 수정 가능합니다.</div> -->
  	<button type="button" id="update" class="btn btn-primary">수정</button>
  </form>
  </div>
  </div>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
  <script type="text/javascript">
  $("#update").click(function() {
	    var frObj = $("#fr");
	    var formData = frObj.serialize(); 

	    $.ajax({
	      url: "/outbound/outboundUpdate", 
	      type: "POST", 
	      data: formData, 
	      success: function(response) {
	      	Swal.fire({
	              title: "수정 완료",
	              text: "",
	              icon: "success"
	            }).then(function() {
	              opener.location.reload();
	              window.close();
	            });
	      },
	      error: function(xhr, status, error) {
	        console.error("에러 ", error);
	      }
	    });
	 
	  

	});
  
  </script>
  
  
</body>
</html>