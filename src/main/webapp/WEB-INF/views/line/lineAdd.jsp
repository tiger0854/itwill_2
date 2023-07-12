<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../css/css.css">
<link rel="stylesheet" type="text/css" href="../../resources/css/product.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<link rel="icon" href="../../resources/logo_favicon.png" type="image/x-icon">
<script>


function onInsert() {
	  var frObj = $("#fr");
	  var formData = frObj.serialize();

	  if (frObj[0].checkValidity()) {
	    Swal.fire({
	      title: "작성 성공!",
	      text: "작성이 성공하였습니다.",
	      icon: "success",
	      showCancelButton: false,
	      confirmButtonText: "확인"
	    }).then(function() {
	      $.ajax({
	        url: "/line/lineAdd",
	        type: "POST",
	        data: formData,
	        success: function(response) {
	          opener.location.reload();
	          window.close();
	        },
	        error: function(xhr, status, error) {
	          Swal.fire("빈칸을 입력해주세요!");
	        }
	      });
	    });
	  } else {
	    Swal.fire("입력란을 채워주세요!");
	  }
	}	

function openfactroy(){
    window.open("/line/factoryList","popup", "width=500, height=600,left=100, top=100");
}

//openempList()  
function openempList() {
  var childWindow = window.open("/pro/empList", "popup", "width=500, height=600, left=100, top=100");
}
 

</script>

</head>
<body>
<!-- 상품 수정 폼 -->
<div class="black-bar"> <h4 style="text-align: center; color: white; padding-top: 8px">  <i class='bx bx-edit'></i>라인 등록 하기</h4></div>
		<div style="display: flex; justify-content: center; margin-bottom: 15px" >
<!-- 		  <img src="../../resources/css/logo.png"> -->
		</div>
<div class="container mt-3">
<!--  		<hr width="100%" style="border: 2px solid black"> -->

<!--         <hr width="100%" style="border: 2px solid black"> -->
<!-- 품번, 품명, 자재유형(완제품,부자재), 재고단위, 사용여부,단가 등록 -->
<form id="fr" method="post">
<table class="box" style="margin-top: 30px; width: 100%">
  <tbody>
    <tr>
      <td>라인명</td>
      <td><input type="text" name="line_name" required="required"></td>
    </tr>
    <tr>
    <td>작업장</td>
	 <td><div class="input-group">
	    <input type="text" style="width: 40%" placeholder="공장 코드" class="form-control" name="factory_code" id="factory_code" readonly  required>
	    <input type="text" style="width: 40%" placeholder="공장 이름" class="form-control" name="factory_name" id="factory_name" readonly  required>
	    <button type="button" class="btn btn-primary" onclick="openfactroy();">검색</button>
	</div></td>
	</tr>
    <tr>
     <td>라인등록자</td>
      <td>
    <div class="input-group">
	    <input type="text" style="width: 40%" placeholder="지시자 ID" class="form-control" name="employee_id" id="employee_id" readonly>
	    <input type="text" style="width: 40%" placeholder="지시자 이름" class="form-control" name="employee_name" id="employee_name" readonly>
	    <input type="button" class="btn btn-primary" onclick="openempList();" value="검색">
	</div>
      </td>
	</tr>
    <tr>
      	<td>비고</td>
      	<td><input type="text" name="remark"></td>
    </tr>
  </tbody>
</table>
<!--     <hr width="100%" style="border: 2px solid black"> -->


<!-- 작업지시등록, 취소 버튼 -->
<div style="text-align: center; margin-top: 50px">
<button type="button" class="btn btn-outline-primary" onclick="onInsert();"> <i class='bx bx-edit'></i> 등록</button>
<button type="button" class="btn btn-danger" onclick="window.close()">X 취소</button>
</div>

</form>

<br>
</div>
</body>
</html>
