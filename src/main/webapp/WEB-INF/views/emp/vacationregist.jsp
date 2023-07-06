<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>휴가신청</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css">	
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css" rel="stylesheet">
<!-- <link rel="stylesheet" type="text/css" href="../css/css.css"> -->
<link rel="stylesheet" type="text/css" href="../../resources/css/product.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script type="text/javascript">
          
$(document).ready(function() {
    $(".btn-add").click(function() {
    	
      var startDate = $("input[name='vacation_start']").val();
      var endDate = $("input[name='vacation_finish']").val();

       if (endDate < startDate) {
            alert("휴가 종료일은 휴가 시작일보다 앞설 수 없습니다.");
            return false; // 휴가 신청이 제출되지 않도록 중단합니다.
         }
    	
      var frObj = $("#fr");
      var formData = frObj.serialize(); // 폼 데이터를 직렬화합니다.
         
      $.ajax({
        url: "/emp/vacationregist", // 요청을 보낼 서버의 URL
        type: "POST", // HTTP 요청 방식 (POST)
        data: formData, // 전송할 데이터 (직렬화된 폼 데이터)
        success: function(response) {
         alert("휴가신청 성공!");
         opener.location.reload();
         window.close(); // 윈도우 창을 닫습니다.
        },
        error: function(xhr, status, error) {
          console.error("에러 발생:", error);
        }
      });
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
<jsp:include page="../common/header.jsp"/>

  <h1>휴가신청</h1>

  <form method="post" id="fr">
	<table class="table table-striped">
		
			   사원 아이디:
			    <input type="text" name="employee_id" value="${vvo.employee_id }" required><br><br>
			   직위:
			    <input type="text" name="position" value="${vvo.position }" required><br><br>
			   부서:
			    <input type="text" name="department_name" value="${vvo.department_name }" required><br><br>
			   휴대폰번호:
			    <input type="text" name="phone_num" value="${vvo.phone_num }"><br><br>
			   휴가종류:
<!--  			    <input type="text" name="vacation_management"><br><br>  -->
			    <select name="vacation_management" required>
				  <option value="" selected disabled>휴가 관리를 선택하세요</option>
				  <option value="연차">연차</option>
				  <option value="출산 휴가">출산 휴가</option>
				  <option value="배우자 출산 휴가">배우자 출산 휴가</option>
				  <option value="생리 휴가">생리 휴가</option>
				  <option value="가족 돌봄 휴가">가족 돌봄 휴가</option>
				</select><br><br>
			   휴가 시작일:
			    <input type="date" name="vacation_start" required><br><br>
                         휴가 종료일:
			    <input type="date" name="vacation_finish" required><br><br>
                         휴가 사유:
<!-- 			    <input type="text" name="vacation_reason" required><br><br> -->
			    <select name="vacation_reason" required>
				  <option value="" selected disabled>휴가 사유를 선택하세요</option>
				  <option value="연차">연차</option>
				  <option value="병가">병가</option>
				  <option value="육아휴직">육아휴직</option>
				  <option value="경조사">경조사</option>
				  <option value="기타">기타</option>
				</select><br><br>
<!--                          휴가 승인여부: -->
<!-- 			    <input type="text" name="approve" required><br><br> -->
<!--                          휴가 승인자: -->
<!-- 			    <input type="text" name="approve_emp" required><br><br> -->
                         휴가 대체인:
			    <input type="text" name="subsitute" required><br><br>
                         사원명:
			    <input type="text" name="employee_name" value="${vvo.employee_name}" required><br><br>
<!--                          휴가 승인일자: -->
<!-- 			    <input type="date" name="approve_date" required><br><br> -->
                         휴가 신청일자:
			    <input type="date" name="prop_date" required><br><br>
                         연차 일 수 :
			    <input type="hidden" name="vacation_date" value="${vvo.vacation_date}"><br><br>
                         휴가 아이디 :
			    <input type="hidden" name="vacation_id" value="${vvo.vacation_id}"><br><br>

	</table>
<!--   <input type="submit" value="휴가신청" id="btn"> -->
  <button type="button" class=btn-add> <i class='bx bx-edit'></i> 휴가신청</button>
 </form>
  
  
</body>
</html>