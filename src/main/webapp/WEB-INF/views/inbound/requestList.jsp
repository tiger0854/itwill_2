<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	<h3>자재 요청 목록</h3>

  <table border="1" class="table table-hover">
  <tr>
  <th>NO</th> 
  <th>자재코드</th> 
  <th>자재명</th>
  <th>요청수량</th>
  <th>수주번호</th>
  </tr>
  
  <c:forEach var="vo" items="${requestList}">
  <c:if test="${vo.state == 0 }">
  <tr onclick="sendInfo(this);">
  <td>${vo.request_id }</td>
  <td>${vo.material_code}</td>
  <td>${vo.material_name}</td>
  <td>${(vo.material_con * vo.re_qty)+20}</td>
  <td>${vo.re_code}</td>
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
     window.opener.document.getElementById("request_id").value = data[0];
     window.opener.document.getElementById("material_code").value = data[1];
     window.opener.document.getElementById("material_name").value = data[2];
     window.opener.document.getElementById("order_piece").value = data[3];
      window.close();
    }
  </script>

</body>
</html>