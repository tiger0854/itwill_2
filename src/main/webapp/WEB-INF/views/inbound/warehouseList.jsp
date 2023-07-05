<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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
	<h3>창고목록</h3>
  <table border="1" class="table table-hover">
  <tr>
  <th>창고 코드</th> 
  <th>창고 이름</th>

  </tr>
  <c:forEach var="vo" items="${whList}">
	<c:if test="${vo.retail_code == '자재'}">
  <tr onclick="sendInfo(this);">
  <td>${vo.wh_code }</td>
  <td>${vo.wh_name }</td>
  </tr>
  </c:if>
</c:forEach>
  
  </table>
  <div style="color: red; margin-bottom: 10px;">*자재 창고만 노출됩니다.</div>	
	
<script>
    function sendInfo(row) {
      var data2 = [];
      var cells = row.getElementsByTagName("td");
      for (var i = 0; i < cells.length; i++) {
        data2.push(cells[i].innerText);
      }
      // 정보를 부모 창으로 전달합니다.
       window.opener.document.getElementById("wh_code").value = data2[0];
      window.close();
    }
  </script>
</body>
</html>