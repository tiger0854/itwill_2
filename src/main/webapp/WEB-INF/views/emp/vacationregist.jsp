<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>휴가신청</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="icon" href="../../resources/logo_favicon.png" type="image/x-icon">
<link href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../../resources/css/css.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script type="text/javascript">
          
$(document).ready(function() {
    $(".btn-add").click(function() {
    	
      var startDate = $("input[name='vacation_start']").val();
      var endDate = $("input[name='vacation_finish']").val();
      var employeeId = $("input[name='employee_id']").val();
      var position = $("input[name='position']").val();
      var departmentName = $("input[name='department_name']").val();
      var vacationManagement = $("select[name='vacation_management']").val();
      var vacationStart = $("input[name='vacation_start']").val();
      var vacationFinish = $("input[name='vacation_finish']").val();
      var vacationReason = $("select[name='vacation_reason']").val();
      var subsitute = $("input[name='subsitute']").val();
      var employeeName = $("input[name='employee_name']").val();
      var propDate = $("input[name='prop_date']").val();
	
      // 필수 입력 필드 중 하나라도 비어 있는지 확인하고 비어있으면 입력해야 된다고 설정.
      if (
        employeeId === "" ||
        position === "" ||
        departmentName === "" ||
        vacationManagement === null ||
        vacationStart === "" ||
        vacationFinish === "" ||
        vacationReason === null ||
        subsitute === "" ||
        employeeName === "" ||
        propDate === ""
      ) {
    	Swal.fire("빈칸을 채워주세요!");
        return false; // 폼 제출을 막습니다.
      }

      
       if (endDate < startDate) {
    	    Swal.fire("휴가 종료일은 휴가 시작일보다 앞설 수 없습니다!");
//             alert("휴가 종료일은 휴가 시작일보다 앞설 수 없습니다.");
            return false; // 휴가 신청이 제출되지 않도록 중단합니다.
         }
    	
      var frObj = $("#fr");
      var formData = frObj.serialize(); // 폼 데이터를 직렬화합니다.
         
      if (frObj[0].checkValidity()) {
    	    Swal.fire({
    	      title: "휴가 신청 성공!",
    	      text: "휴가 신청이 성공하였습니다.",
    	      icon: "success",
    	      showCancelButton: false,
    	      confirmButtonText: "확인"
    	    }).then(function() {
    	      $.ajax({
    	        url: "/emp/vacationregist",
    	        type: "POST",
    	        data: formData,
    	        success: function(response) {
    	           Swal.fire("휴가신청 성공!");
  				   opener.location.reload();
    	          window.close();
    	        }
    	      });
    	  });
  	  } else {
  	    Swal.fire("휴가 신청 실패!");
  	  } 
    });
    $(document).ready(function() {
    	  // 휴가 신청일자 입력란에 오늘 날짜를 설정합니다.
    	  var today = new Date().toISOString().split('T')[0];
    	  $('input[name="prop_date"]').val(today);
    	});
  });
   </script>

<link rel="stylesheet" type="text/css" href="../../resources/css/css.css">
</head>
<body id="body-pd" style="font-family: 'TheJamsil5';">


  <img src="/resources/css/logo.png" alt="로고 이미지"><h1 style="text-align: center;">휴가신청</h1>
	<hr style="border-width: 1.3px;border-style: solid;">
	  <form method="post" id="fr" role="form">
		<table class="table table-striped">
			
				   사원 아이디:
				    <input type="text" name="employee_id" value="${vvo.employee_id }" required class="form-control"><br><br>
				   직위:
				    <input type="text" name="position" value="${vvo.position }" required class="form-control"><br><br>
				   부서:
				    <input type="text" name="department_name" value="${vvo.department_name }" required class="form-control"><br><br>
				   휴대폰번호:
				    <input type="text" name="phone_num" value="${vvo.phone_num }" class="form-control"><br><br>
				   휴가종류:
				    <select name="vacation_management" required class="form-control">
					  <option value="" selected disabled>휴가 관리를 선택하세요</option>
					  <option value="연차">연차</option>
					  <option value="출산 휴가">출산 휴가</option>
					  <option value="배우자 출산 휴가">배우자 출산 휴가</option>
					  <option value="생리 휴가">생리 휴가</option>
					  <option value="가족 돌봄 휴가">가족 돌봄 휴가</option>
					</select><br><br>
				   휴가 시작일:
				    <input type="date" name="vacation_start" required class="form-control"><br><br>
	                         휴가 종료일:
				    <input type="date" name="vacation_finish" required class="form-control"><br><br>
	                         휴가 사유:
				    <select name="vacation_reason" required class="form-control">
					  <option value="" selected disabled>휴가 사유를 선택하세요</option>
					  <option value="연차">연차</option>
					  <option value="병가">병가</option>
					  <option value="육아휴직">육아휴직</option>
					  <option value="경조사">경조사</option>
					  <option value="기타">기타</option>
					</select><br><br>
	                         휴가 대체인:
				    <input type="text" name="subsitute" required class="form-control"><br><br>
	                         사원명:
				    <input type="text" name="employee_name" value="${vvo.employee_name}" required class="form-control"><br><br>
	                         휴가 신청일자:
				    <input type="date" name="prop_date" required class="form-control">

		</table>
	  <button type="button" class=btn-add> <i class='bx bx-edit'></i> 휴가신청</button>
	 </form>
  
  
</body>
</html>