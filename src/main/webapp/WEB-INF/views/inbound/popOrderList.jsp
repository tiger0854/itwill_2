<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../../resources/css/css.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>발주대기LIST</h3>
	<div class="input-group" style="margin-bottom: 10px;">
    <input type="text"placeholder="발주번호 검색하기" class="form-control">
    <button type="button" class="btn btn-primary" onclick="openChildWindow();">검색</button>

    </div>
 <table border="1" class="table table-hover">
    <thead style="border-bottom: 1px solid">
      <tr>
        <th>발주번호</th>
        <th>상품코드</th>
        <th>상품명</th>
        <th>발주수량</th>
        <th>발주일자</th>


      </tr>
    </thead>

    
    
    <c:forEach var="vo" items="${orderList}">
    <c:if test="${vo.order_state == 0 }">
      <tr onclick="sendInfo(this);">
        <td>${vo.order_number }</td>
        <td>${vo.material_code }</td>
        <td>${vo.material_name }</td>
        <td>${vo.order_piece }</td>
        <td>${vo.order_date }</td>   
      </tr>
	  </c:if>
      </c:forEach>
   
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