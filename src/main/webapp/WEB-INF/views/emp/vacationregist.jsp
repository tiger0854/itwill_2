<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>휴가신청</title>
<link rel="stylesheet" type="text/css" href="../../resources/css/css.css">
</head>
<body id="body-pd" style="font-family: 'TheJamsil5';">
<jsp:include page="../common/header.jsp"/>

  <h1>휴가신청페이지</h1>

  <form method="post" action="/emp/vacationregist">
	<table class="table table-striped">
		
			   사원 아이디:
			    <input type="text" name="employee_id" required><br><br>
			   직위:
			    <input type="text" name="position" required><br><br>
			   부서:
			    <input type="text" name="department_name" required><br><br>
			   휴대폰번호:
			    <input type="text" name="phone_num"><br><br>
			   휴가관리:
			    <input type="text" name="vacation_management"><br><br>
			   휴가 시작일:
			    <input type="date" name="vacation_start" required><br><br>
                         휴가 종료일:
			    <input type="date" name="vacation_finish" required><br><br>
                         휴가 사유:
			    <input type="text" name="vacation_reason" required><br><br>
                         휴가 승인여부:
			    <input type="text" name="approve" required><br><br>
                         휴가 승인자:
			    <input type="text" name="approve_emp" required><br><br>
                         휴가 대체인:
			    <input type="text" name="subsitute" required><br><br>
                         사원명:
			    <input type="text" name="employee_name" required><br><br>
                         휴가 승인일자:
			    <input type="date" name="approve_date" required><br><br>
                         휴가 신청일자:
			    <input type="date" name="prop_date" required><br><br>
                         연차 일 수 :
			    <input type="number" name="vacation_date" required><br><br>

	</table>
  <input type="submit" value="휴가신청">
 </form>
  
  
</body>
</html>