<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="../../resources/logo_favicon.png" type="image/x-icon">
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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>

<script>

function onInsert() {
	
	  var employee_name = $("#employee_name").val();
	  
	  if(employee_name === ''){
		    Swal.fire("입력란을 채워주세요!");
		}
	  
	  var frObj = $("#fr");
	  var formData = frObj.serialize();

	  if (frObj[0].checkValidity()) {
	    Swal.fire({
	      title: "작성 성공!",
	      text: "작성이 성공하였습니다.",
	      icon: "success",
	      showCancelButton: false,
	      confirmButtonText: "확인"
	    }).then(function(result) {
	      if (result.isConfirmed) {
	        $.ajax({
	          url: "/pro/orderWrite",
	          type: "POST",
	          data: formData,
	          success: function(response) {
	            opener.location.reload();
	            window.close();
	          },
	          error: function(xhr, status, error) {
	            Swal.fire("작성 실패!");
	          }
	        });
	      }
	    });
	  } else {
	    Swal.fire("입력란을 채워주세요!");
	  }
	}
function recodecheck() {
	  var re_code = $("#re_code").val(); // re_code 값 가져오기
	  console.log(re_code);
	  $.ajax({
	    url: "/pro/checkrecode", // 첫 번째 요청을 보낼 서버의 URL
	    type: "GET", // HTTP 요청 방식 (GET)
	    data: { re_code: re_code }, // 전송할 데이터
	    success: function(response) {
	      if (response === true) {
	        // 두 번째 ajax 호출
	        $.ajax({
	          url: "/pro/checksuList", // 두 번째 요청을 보낼 서버의 URL
	          type: "GET", // HTTP 요청 방식 (GET)
	          data: { re_code: re_code }, // 전송할 데이터
	          success: function(response) {
	        	if(response === true){
	        	 // 두 번째 요청이 성공한 경우 처리할 내용
			        $("#add").prop("disabled", false);
			        $('#ipmsg').show();
			        $('#ipmsg').css('color', 'green');
			        $('#ipmsg').text("*수주번호에 해당하는 조리가 완료되었습니다");
		        }else{
			        $("#add").prop("disabled", true);
			        $('#ipmsg').show();
			        $('#ipmsg').css('color', 'red');
			        $('#ipmsg').text("*중복된 수주 등록은 불가능합니다");   	
		        }   	 
	          },
	          error: function(xhr, status, error) {
	            console.error("두 번째 요청 에러 발생:", error);
	          }
	        });
	      } else {
	        $("#add").prop("disabled", true);
	        $('#ipmsg').show();
	        $('#ipmsg').css('color', 'red');
	        $('#ipmsg').text("*수주번호에 해당하는 조리가 완료되지 않았습니다");
	      }
	    },
	    error: function(xhr, status, error) {
	      console.error("첫 번째 요청 에러 발생:", error);
	    }
	  });
	}


//품명 검색 팝업창
function opensucode() {
  var childWindow = window.open("/pro/suList", "popup", "width=500, height=600, left=100, top=100");
  childWindow.onunload = recodecheck;
}
  
// openempList()  
function openempList() {
  var childWindow = window.open("/pro/empList", "popup", "width=500, height=600, left=100, top=100");
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
	    <input style="width: 40%" type="text" name="so_code" onclick="recodecheck()" id="re_code" placeholder="수주번호" class="form-control">
	    <input type="button" class="btn btn-primary" onclick="opensucode();" value="검색">
	</div></td>
	<span id="ipmsg"></span>
    </tr>
    <tr>
      <td>수주수량</td>
      <td><input type="text" name="sQTY" id="re_qty" required readonly></td>
    </tr>
    <tr>
      <td>작업지시자</td>
      <td>
    <div class="input-group">
	    <input type="text" style="width: 40%" placeholder="지시자 ID" class="form-control" name="employee_id" id="employee_id" readonly required> 
	    <input type="text" style="width: 40%" placeholder="지시자 이름" class="form-control" name="employee_name" id="employee_name" readonly required>
	    <input type="button" class="btn btn-primary" onclick="openempList();" value="검색">
	</div>
      </td>
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
<button type="button" class="btn btn-primary" id="add" onclick="onInsert();"> <i class='bx bx-edit'></i> 등록</button>
<button class=btn-search onclick="window.close()">X 취소</button>
</div>

</form>

<br>
</div>
</body>
</html>
