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
      <td>창고코드</td>
      <td>${resultvo.wh_code}</td>
    </tr>
    <tr>
      <td>창고명</td>
      <td><input type="text" name="wh_name" value="${resultvo.wh_name }" required="required"></td>
    </tr>
    <tr>
      <td>재고/자재</td>
      <td>
      <select name="retail_code">
      <option value="재고">재고 창고</option>
      <option value="자재">자재 창고</option>
      </select>
      </td>
    </tr>
    <tr>
      <td>냉장/냉동/상온</td>
      <td>
      <select name="wh_type">
      <option value="냉장">냉장</option>
      <option value="냉동">냉동</option>
      <option value="상온">상온</option>
      </select>
      </td>
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
