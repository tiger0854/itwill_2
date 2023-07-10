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
<script>


function onInsert() {
	  var frObj = $("#fr");
	  var formData = frObj.serialize();
	    Swal.fire("작성완료!");
	    if (frObj[0].checkValidity()) {
	      $.ajax({
	        url: "/line/lineAdd", // 요청을 보낼 서버의 URL
	        type: "POST", // HTTP 요청 방식 (POST)
	        data: formData, // 전송할 데이터 (직렬화된 폼 데이터)
	        success: function(response) {
	          opener.location.reload();
	          window.close(); // 윈도우 창을 닫습니다.
	        },
	        error: function(xhr, status, error) {
//	          alert("모든 칸을 입력해 주세요!");
	          console.error("에러 발생:", error);
	        }
	      });
	    } else {
	      // 필수 필드가 비어있을 경우 처리할 내용
	      Swal.fire("모든 칸을 입력해 주세요!");
	  }
}
 

function openfactroy(){
    window.open("/line/factoryList","popup", "width=500, height=600,left=100, top=100");
}

</script>

</head>
<body>
<!-- 상품 수정 폼 -->
<div class="black-bar"> <h4 style="text-align: center; color: white; padding-top: 8px">  <i class='bx bx-edit'></i>라인 등록 하기</h4></div>
		<div style="display: flex; justify-content: center; margin-bottom: 15px" >
		  <img src="../../resources/css/logo.png">
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
      	<td>비고</td>
      	<td><input type="text" name="remark"></td>
    </tr>
  </tbody>
</table>
<!--     <hr width="100%" style="border: 2px solid black"> -->


<!-- 작업지시등록, 취소 버튼 -->
<div style="text-align: center; margin-top: 50px">
<button type="button" class=btn-add onclick="onInsert();"> <i class='bx bx-edit'></i> 등록</button>
<button class=btn-search onclick="window.close()">X 취소</button>
</div>

</form>

<br>
</div>
</body>
</html>
