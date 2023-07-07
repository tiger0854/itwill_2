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
      url: "/pro/orderEdit", // 요청을 보낼 서버의 URL
      type: "POST", // HTTP 요청 방식 (POST)
      data: formData, // 전송할 데이터 (직렬화된 폼 데이터)
      success: function(response) {
		 alert("수정 성공!");
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
<!-- 작업지시수정 폼 -->
<div class="black-bar"> <h4 style="text-align: center; color: white; padding-top: 8px">  <i class='bx bx-edit'></i> 작업지시 수정</h4></div>
		<div style="display: flex; justify-content: center; margin-bottom: 15px" >
		  <img src="../../resources/css/logo.png">
		</div>



<div class="container mt-3">
<!--         <hr width="100%" style="border: 2px solid black"> -->
<%-- ${pvo} --%>
<form role="form" id="fr" method="post" action="">
<table class="box" style="margin-top: 30px; width: 100%">
  <tbody>
    <tr>
      <td>작업지시 번호</td>
      <td><input type="text" value="${pvo.wo_code}" readonly="readonly"></td>
    </tr>
    <tr>
      <td>수주번호</td>
      <td><input type="text" value="${pvo.so_code}" name="so_code" readonly="readonly"></td>
    </tr>
    <tr>
      <td>작업지시자</td>
      <td><input type="text" value="${pvo.employee_id}" name="employee_id" readonly="readonly"></td>
    </tr>
    <tr>
      <td>납품예정일</td>
      <td><input type="date" value="${pvo.delivery_date}" name="delivery_date" readonly="readonly"></td>
    </tr>
    <tr>
      <td>라인코드</td>
      <td><input type="text" value="${pvo.line_code}" name="line_code" ></td>
    </tr>
    <tr>
      <td>품목코드</td>
      <td><input type="text" value="${pvo.item_code}" name="item_code" readonly="readonly"></td>
    </tr>
    <tr>
      <td>지시일자</td>
      <td><input type="date" value="${pvo.wo_date}" readonly="readonly"></td>
    </tr>
    <tr>
      <td>지시수량</td>
      <td><input type="number" value="${pvo.oQTY}" name="oQTY" ></td>
    </tr>
    <tr>
	    <td>현재 지시 상태</td>
		    <td>${pvo.wo_status}</td>
	    </tr>
    <tr>
    <tr>
   		<td>지시 상태 변경</td>
   		<td><input type="text" value="${pvo.wo_status}" name="wo_status" ></td>
    <tr>
      <td>생산수량</td>
      <td><input type="number" value="${pvo.pQTY}" name="pQTY" readonly="readonly"></td>
    </tr>
  </tbody>
</table>
<!--     <hr width="100%" style="border: 2px solid black"> -->


<!-- 작업지시등록, 취소 버튼 -->
<div style="text-align: center; margin-top: 50px">
<button class=btn-add> <i class='bx bx-edit'></i> 수정</button>
<button class=btn-search onclick="window.close()">X 닫기</button>
</div>

</form>

<br>
</div>
</body>
</html>
