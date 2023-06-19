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
<!-- <link rel="stylesheet" type="text/css" href="../css/css.css"> -->
<link rel="stylesheet" type="text/css" href="../../resources/css/product.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function() {
    $(".btn-add").click(function() {
      var frObj = $("#fr");
      var formData = frObj.serialize(); // 폼 데이터를 직렬화합니다.
      $.ajax({
        url: "/line/lineAdd", // 요청을 보낼 서버의 URL
        type: "POST", // HTTP 요청 방식 (POST)
        data: formData, // 전송할 데이터 (직렬화된 폼 데이터)
        success: function(response) {
		 alert("작성 성공!");
		 opener.location.reload();
         window.close(); // 윈도우 창을 닫습니다.
        },
        error: function(xhr, status, error) {
          console.error("에러 발생:", error);
        }
      });
    });
  });

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
<form id="fr" action="" method="post">
<table class="box" style="margin-top: 30px; width: 100%">
  <tbody>
    <tr>

      <td>라인명</td>
      <td><input type="text" name="line_name"></td>
    </tr>
    <tr>
      <td>작업장</td>
      <td><input type="text" name="factory_code"></td>
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
<button class=btn-add> <i class='bx bx-edit'></i> 등록</button>
<button class=btn-search onclick="window.close()">X 취소</button>
</div>

</form>

<br>
</div>
</body>
</html>
