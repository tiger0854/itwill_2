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
<link rel="stylesheet" type="text/css" href="../../resources/css/css.css">

</head>
<body>
	<h3>품목검색</h3>
	
	<div class="input-group" style="margin-bottom: 10px;">
    <input type="text"placeholder="상품 검색하기" class="form-control">
    <button type="button" class="btn btn-primary" onclick="openChildWindow();">검색</button>

    </div>

  <table border="1" class="table table-hover">
  <tr>
  <th>담당자 코드</th> 
  <th>담당자 이름</th>

  </tr>
  
  <tr onclick="sendInfo(this);">
  <td>001</td>
  <td>양다영</td>

  </tr>
  
  <tr>
  <td>002</td>
  <td>눈사람</td>

  </tr>
  
  </table>
	
	
<script>
    function sendInfo(row) {
      var data2 = [];
      var cells = row.getElementsByTagName("td");
      for (var i = 0; i < cells.length; i++) {
        data2.push(cells[i].innerText);
      }
      // 정보를 부모 창으로 전달합니다.
       window.opener.document.getElementById("order_resp").value = data2[1];
      window.close();
    }
  </script>

</body>
</html>