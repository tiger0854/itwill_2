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
<link rel="stylesheet" type="text/css" href="../../resources/css/product.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>

// $(document).ready(function() {
//     generateWorkOrderNumber(); // 페이지 로드 시 작업지시 번호 생성
    
//     function generateWorkOrderNumber() {
//         $.ajax({
//             url: '/workorder/generate',
//             success: function(data) {
//                 $('[name="wo_code"]').val(data.wo_code);
//             },
//             error: function() {
//                 alert('작업지시 번호 생성에 실패했습니다.');
//             }
//         });
//     }
// });

</script> 


</head>
<body>
<div class="black-bar"> <h4 style="text-align: center; color: white; padding-top: 8px">  <i class='bx bx-edit'></i>  작업지시 등록</h4></div>
<!-- 작업지시등록 폼 -->
		<div style="display: flex; justify-content: center; margin-bottom: 15px" >
		  <img src="../../resources/css/logo.png">
		</div>
<div class="container mt-3">
<!--  		<hr width="100%" style="border: 2px solid black"> -->
       
<!--         <hr width="100%" style="border: 2px solid black"> -->

<form action="/pro/orderWrite" method="post" >
<table class="box" style="margin-top: 30px; width: 100%">
  <tbody>
    <tr>
    
<!--     CREATE TABLE `springdb`.`prod` ( -->
<!--   `wo_code` VARCHAR(30) NOT NULL, -->
<!--   `so_code` VARCHAR(45) NULL, -->
<!--   `employee_id` INT NULL, -->
<!--   `factory_code` VARCHAR(45) NULL, -->
<!--   `line_code` VARCHAR(45) NULL, -->
<!--   `item_code` VARCHAR(45) NULL, -->
<!--   `oQTY` INT NULL, -->
<!--   `pQTY` INT NULL, -->
<!--   `sQTY` INT NULL, -->
<!--   `wo_status` VARCHAR(45) NULL, -->
<!--   `wo_date` VARCHAR(45) NULL, -->
<!--   `remark` VARCHAR(45) NULL, -->
<!--   PRIMARY KEY (`wo_code`)); -->
<!--     <td>작업지시 번호</td> -->
<!--       <td><input type="text" name="wo_code"></td> -->
    </tr>
    <tr>
      <td>수주번호</td>
      <td><input type="text" name="so_code"></td>
    </tr>
    <tr>
      <td>수주수량</td>
      <td><input type="text" name="sQTY"></td>
    </tr>
    <tr>
      <td>작업지시자</td>
      <td><input type="text" name="employee_id"></td>
    </tr>
    <tr>
      <td>납품예정일</td>
      <td><input type="date" name="delivery_date"></td>
    </tr>
    <tr>
      <td>라인코드</td>
      <td><input type="text" name="line_code"></td>
    </tr>
    <tr>
      <td>품목코드</td>
      <td><input type="text" name="item_code"></td>
    </tr>
    <tr>
      <td>지시수량</td>
      <td><input type="text" name="oQTY"></td>
    </tr>
    <tr>
      <td>생산수량</td>
      <td><input type="text" name="pQTY"></td>
    </tr>
  </tbody>
</table>
<!--     <hr width="100%" style="border: 2px solid black"> -->


<!-- 작업지시등록, 취소 버튼 -->
<div style="text-align: center; margin-top: 50px">
<button type="submit" class=btn-add> <i class='bx bx-edit'></i> 등록</button>
<button class=btn-search onclick="window.close()">X 취소</button>
</div>

</form>

<br>
</div>
</body>
</html>
