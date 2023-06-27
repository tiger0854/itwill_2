<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" rel="stylesheet">
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../../resources/css/css.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
 <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> <!-- 우편api -->

<script type="text/javascript">
	
	function addr() {
	new daum.Postcode({
		    oncomplete : function(data) {
			document.getElementById("zipcode").value = data.zonecode; // 우편 번호 넣기
			document.getElementById("cus_address").value = data.address; // 주소 넣기
		}
	}).open();
	}; //우편주소창부르기


	$(document).ready(function() {
		
		var data = "${result}";
		if (data == "INSERTOK") {
		
			Swal.fire({
	            title: "등록이 완료되었습니다.",
	            text: "",
	            icon: "success"
	          }).then(function() {
	            opener.location.reload();
	            window.close();
	          });
		}//거래처 등록 완료시 alert띄우고 창닫기
	
		
		$('#cus_number').keyup(function(){
			  var cus_number =  $('#cus_number').val();
			  $.ajax({
				  type : "POST",
				  url : "/customer/NumberCheck",
				  data: {cus_number: cus_number},
				  success:function(data){
					  
					  if(data == 1 && cus_number != ''){
					  
					  $('#checkmsg').css('color','red');
					  $('#checkmsg').text("이미 존재하는 사업자번호 입니다.");  
					  $('#submit').attr('disabled','disabled');
				      return;
						  
					  }else if (data != 1 && cus_number != ''){
							
					  $('#checkmsg').css('color','green');
					  $('#checkmsg').text("사용가능한 사업자번호 입니다.");
					  $('#submit').removeAttr('disabled');
					  return;
					  }
				  }//success 
			  });// ajax
			  if($('#cus_number').val() == ""){
				  $('#checkmsg').css('color','red');
				  $('#checkmsg').text("사업자번호를 입력해주세요.");  
				  $('#submit').attr('disabled','disabled'); 
				  return;
			  }
		  }); // 아이디중복확인 
		
		
	
	}); 

</script>




</head>
<body>

	
	<h2 style="text-align: center;">거래처 등록</h2>
	
	<form action="" method="post">
	
		<div class="container" >
		
  <table style="margin: auto;width: 80%;">
  <tr>
    <th>거래처명</th>
    <td><input type="text" name="cus_name" class="form-control"></td>
  </tr>
  <tr>
    <th>거래처분류</th>
    <td>	<select name="cus_stat" class="form-control">
		<option>거래처 분류를 선택해주세요.</option>
		<option value="1">납입처</option>
		<option value="2">납품처</option>
		</select></td>
  </tr>
  <tr>
    <th>사업자번호</th>
    <td><input type="text" name="cus_number" class="form-control" id="cus_number"> <span id="checkmsg"></span></td>
  </tr>
  <tr>
    <th>대표자</th>
    <td><input type="text" name="cus_rep" class="form-control"></td>
  </tr>
  <tr>
    <th>담당자</th>
    <td><input type="text" name="cus_resp" class="form-control"></td>
  </tr>
  <tr>
    <th>담당자 연락처</th>
    <td><input type="text" name="cus_phone" class="form-control"></td>
  </tr>
  <tr>
    <th>대표번호</th>
    <td><input type="text" name="cus_call"class="form-control"></td>
  </tr>
  <tr>
    <th>팩스번호</th>
    <td><input type="text" name="cus_fax" class="form-control"></td>
  </tr>
  <tr>
    <th>업태</th>
    <td><input type="text" name="cus_business" class="form-control"></td>
  </tr>
  <tr>
    <th>종목</th>
    <td><input type="text" name="cus_event" class="form-control"></td>
  </tr>
  <tr>
    <th>주소</th>
    
    <td><input type="text" id="zipcode" onclick="addr();">
    <input type="text" name="cus_address" class="form-control" onclick="addr();" id="cus_address">
    <input type="text" name="address2" id="cus_address2" placeholder="상세주소를 입력해주세요.">
    </td>
   	<tr>
					
  </tr>
  <tr>
    <th>적요</th>
    <td><textarea rows="" cols="" name="cus_memo" class="form-control"></textarea></td>
  </tr>
 
</table>
		
		<!-- 버튼 -->
		<div style="margin-top: 10px;float: right;">
			<input type="submit" value="등록" class="btn btn-primary">
			<input type="button" value="닫기" onclick="window.close();"class="btn btn-danger">
			<input type="reset" value="초기화" class="btn btn-secondary">
		</div>
		<!-- 버튼 -->
		</div>
	</form>
	

	
</body>
</html>