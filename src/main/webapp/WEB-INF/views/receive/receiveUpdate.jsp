<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<meta charset="UTF-8"> 
<head>
<title>수주 수정</title>
<link rel="stylesheet" type="text/css" href="../../resources/css/css.css">
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.7/dist/sweetalert2.min.css">
 <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.7/dist/sweetalert2.all.min.js"></script>
<script type="text/javascript">


</script>
</head>
<body id="body-pd" style="font-family: 'TheJamsil5';">
<jsp:include page="../common/header.jsp"/>

<h1>receiveUpdate.jsp</h1>
  <h1>수주수정</h1>
  
   <table border="1" class="table table-bordered">
  <tr>
  <th>수주번호</th>
  <th>품목명</th>
  <th>수주업체</th>
  <th>수주수량</th>
  </tr>
  
  <tr>
  <td><input type="text" name="rec_code" readonly></td>
  <td><input type="text" name="item_name" readonly></td>
  <td><input type="text" name="" readonly></td>
  <td><input type="text" name="rec_qty"></td>
  </tr>
  
  </table>
</body>
</html>