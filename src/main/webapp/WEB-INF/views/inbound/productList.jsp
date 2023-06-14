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
  <th>품목코드</th> 
  <th>품목명[규격명]</th>
  <th>단가</th> 
  <th>전체재고</th>
  </tr>
  
  <tr onclick="sendInfo(this);">
  <td>001</td>
  <td>양반김</td>
  <td>100</td>
  <td>100</td>
  </tr>
  
  <tr>
  <td>002</td>
  <td>샌드위치햄</td>
  <td>100원</td>
  <td>100</td>
  </tr>
  
  </table>
	
	
<script>
    function sendInfo(row) {
      var data = [];
      var cells = row.getElementsByTagName("td");
      for (var i = 0; i < cells.length; i++) {
        data.push(cells[i].innerText);
      }
      // 정보를 부모 창으로 전달합니다.
      window.opener.postMessage(data, "*");
      window.close();
    }
  </script>

</body>
</html>