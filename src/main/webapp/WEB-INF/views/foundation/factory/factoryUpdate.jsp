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
<link rel="stylesheet" type="text/css" href="../css/product.css">
</head>
<body>
<!-- 창고수정 폼 -->
<div class="black-bar"> <h4 style="text-align: center; color: white; padding-top: 8px">  <i class='bx bx-edit'></i>  작업지시 수정</h4></div>
		<div style="display: flex; justify-content: center; margin-bottom: 15px" >
		  <img src="../../../resources/css/logo.png">
		</div>
		
<div class="container mt-3">
<!--         <hr width="100%" style="border: 2px solid black"> -->

<form action="" method="post" >
<table class="box" style="margin-top: 30px; width: 100%">
  <tbody>
    <tr>
      <td>공장코드</td>
      <td>${vo.factory_code}</td>
    </tr>
    <tr>
      <td>공장명</td>
      <td><input type="text" name="factory_name" value="${vo.factory_name }" required="required"></td>
    </tr>
  </tbody>
</table>
<!--     <hr width="100%" style="border: 2px solid black"> -->


<!-- 창고등록, 취소 버튼 -->
<div style="text-align: center; margin-top: 50px">
<button type="submit" class=btn-add> <i class='bx bx-edit'></i> 수정</button>
<button class=btn-search onclick="window.close()">X 취소</button>
</div>

</form>

<br>
</div>
</body>
</html>