<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="../../resources/logo_favicon.png" type="image/x-icon">
<meta charset="UTF-8">
<title>휴가 수정</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../css/css.css">
<link rel="stylesheet" type="text/css" href="../../resources/css/product.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>	
$(document).ready(function() {
	  $(".btn-add").click(function() {
	    var frObj = $("#fr");
	    var formData = frObj.serialize(); // 폼 데이터를 직렬화합니다.
	    
	   	  // 휴가 시작일과 휴가 종료일의 값을 가져옵니다.
	      var vacationStart = new Date($("input[name='vacation_start']").val());
	      var vacationFinish = new Date($("input[name='vacation_finish']").val());
	      
	      // 날짜 차이를 계산하여 연차 일 수에 대입합니다.
	      var vacationDate = Math.ceil((vacationFinish - vacationStart) / (1000 * 60 * 60 * 24));
	      $("input[name='vacation_date']").val(vacationDate);
	    
	    $.ajax({
	      url: "/emp/vacationmodify", // 요청을 보낼 서버의 URL
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
 <title>휴가 수정</title>
</head>
<%-- ${param.vacation_id } --%>
<%-- ${vvo} --%>
<body>

    <div id="popupForm" class="popup">
        <h2>휴가 수정</h2>
        <form method="post" action="" id="fr">
        	<input type="hidden" name=vacation_id value="${param.vacation_id }">
            <label for="id">사원 아이디:</label>
            <input type="text" name="employee_id" value="${vvo.employee_id}" required>

            <label for="position">직위:</label>
            <input type="text" name="position" value="${vvo.position}" required>

            <label for="depart">부서:</label>
            <input type="text" name="department_name" value="${vvo.department_name}" required></textarea>
            
            <label for="phone">휴대폰번호:</label>
            <input type="text" name="phone_num" value="${vvo.phone_num}" required>
            
            <label for="vacationm">휴가관리:</label>
            <input type="text" name="vacation_management" value="${vvo.vacation_management}" required>
            
            <label for="vacations">휴가 시작일:</label>
            <input type="text" name="vacation_start" value="${vvo.vacation_start}" required>
            
            <label for="vacatione">휴가 종료일:</label>
            <input type="text" name="vacation_finish" value="${vvo.vacation_finish}" required>
            
            <label for="vacationr">휴가 사유:</label>
            <input type="text" name="vacation_reason" value="${vvo.vacation_reason}" required>

            <label for="vacationap">휴가 승인여부:</label>
            <input type="text" name="approve" value="${vvo.approve}" required>
			
            <label for="app_name">휴가 승인자:</label>
            <input type="text" name="approve_emp" value="${vvo.approve_emp}" required>
            
            <label for="sub">대체인:</label>
            <input type="text" name="subsitute" value="${vvo.subsitute}" required>
            
        </form>
            <button class="btn-add">수정하기</button>
    </div>

</body>
</html>