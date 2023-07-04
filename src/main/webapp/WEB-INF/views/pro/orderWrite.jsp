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

	    // 필수 필드 유효성 검사
	    if (frObj[0].checkValidity()) {
	      $.ajax({
	        url: "/pro/orderWrite", // 요청을 보낼 서버의 URL
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
	    } else {
	      // 필수 필드가 비어있을 경우 처리할 내용
	      alert("입력란을 채워주세요!");
	    }
	  });
});
	
$(document).ready(function() {
// 	  $("#re_code", window.opener.document).change("input", function() {
	    var re_code = $("#re_code").val(); // re_code 값 가져오기
	    console.log(re_code);

	    $.ajax({
	      url: "/pro/checkrecode", // 요청을 보낼 서버의 URL
	      type: "POST", // HTTP 요청 방식 (POST)
	      data: { re_code: re_code }, // 전송할 데이터
	      success: function(response) {
// 	        alert("전송성공!");
	        if (response === "true") {
	          
	        } else { 
	        	alert(re_code);
	        	console.log(re_code);
		          $("#add").prop("disabled", true);
				  $('#ipmsg').show();
				  $('#ipmsg').css('color','red');
				  $('#ipmsg').text("수주번호에 해당하는 조리가 완료되지않았습니다"); 
	        }
	      },
	      error: function(xhr, status, error) {
// 	        alert("전송실패!");
	        console.error("에러 발생:", error);
	      }
	    });
// 	  });
	});



//품명 검색 팝업창
  function opensucode(){
      window.open("/pro/suList","popup", "width=500, height=600,left=100, top=100");
  }
  
</script>
<!-- 	        opener.document.getElementById("re_code").value = a; -->
<!-- 	        opener.document.getElementById("re_qty").value = b; -->
<!-- 	        opener.document.getElementById("item_code").value = c; -->
<!-- 	        opener.document.getElementById("item_name").value = d; -->
<!-- 	        opener.document.getElementById("employee_id").value = e; -->
<!-- 	        window.close(); -->

</head>
<body>
<div class="black-bar"> <h4 style="text-align: center; color: white; padding-top: 8px">  <i class='bx bx-edit'></i>  작업지시 등록</h4></div>
<!-- 작업지시등록 폼 -->
		<div style="display: flex; justify-content: center; margin-bottom: 15px" >
<!-- 		  <img src="../../resources/css/logo.png"> -->
		</div>
<div class="container mt-3">
<!--  		<hr width="100%" style="border: 2px solid black"> -->
       
<!--         <hr width="100%" style="border: 2px solid black"> -->

<form role="form" id="fr">
<table class="box" style="margin-top: 30px; width: 100%">
  <tbody>
<%-- ${lineList} --%>
<td><input type="hidden" name="pQTY" value=0></td>
    <tr>
      <td>수주번호</td>
     <td><div class="input-group">
	    <input style="width: 40%" type="text" name="so_code" id="re_code" placeholder="수주번호" class="form-control">
	    <input type="button" class="btn btn-primary" onclick="opensucode()" value="검색">
	</div></td>
	<span id="ipmsg"></span>
    </tr>
    <tr>
      <td>수주수량</td>
      <td><input type="text" name="sQTY" id="re_qty" required readonly></td>
    </tr>
    <tr>
      <td>작업지시자</td>
      <td><input type="text" name="employee_id" id="employee_id" required readonly></td>
    </tr>
    <tr>
      <td>납품예정일</td>
      <td><input type="date" name="delivery_date" required ></td>
    </tr>
    <tr>
      <td>라인명</td>
      <td><select name="line_code" class="line_code" required>
		<c:forEach var="line" items="${lineList}">
			<option value="${line.line_code}">${line.line_name}</option>
		</c:forEach>
		</select></td>
    </tr>
    <tr>
    
    	<td>상품코드</td>
  		<td>
  	<div class="input-group">
	    <input type="text" style="width: 40%" placeholder="상품 코드" class="form-control" name="item_code" id="item_code" readonly>
	    <input type="text" style="width: 40%" placeholder="상품 이름" class="form-control" name="item_name" id="item_name" readonly>
	</div>
  		
  		
<!-- 		<input type="text" id="item_code" name="item_code" placeholder="품번검색" onclick="openItem()" width="50%" readonly>  -->
		</td>
    </tr>
    <tr>
      <td>지시수량</td>
      <td><input type="number" name="oQTY" id="re_qty2" readonly></td>
    </tr>
  </tbody>
</table>
<!--     <hr width="100%" style="border: 2px solid black"> -->


<!-- 작업지시등록, 취소 버튼 -->
<div style="text-align: center; margin-top: 50px">
<button type="button" class="btn btn-primary" id="add"> <i class='bx bx-edit'></i> 등록</button>
<button class=btn-search onclick="window.close()">X 취소</button>
</div>

</form>

<br>
</div>
</body>
</html>
