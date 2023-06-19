<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>휴가 수정</title>

 <title>휴가 수정</title>
</head>
<%-- ${param.vacation_id } --%>
<%-- ${vvo} --%>
<body>

    <div id="popupForm" class="popup">
        <h2>휴가 수정</h2>
        <form method="post" action="">
        	<input type="hidden" name=vacation_id value="${param.vacation_id }">
            <label for="name">사원 아이디:</label>
            <input type="text" name="employee_id" value="${vvo.employee_id}" required>

            <label for="email">직위:</label>
            <input type="text" name="position" value="${vvo.position}" required>

            <label for="message">부서:</label>
            <input type="text" name="department_name" value="${vvo.department_name}" required></textarea>
            
            <label for="name">휴대폰번호:</label>
            <input type="text" name="phone_num" value="${vvo.phone_num}" required>
            
            <label for="name">휴가관리:</label>
            <input type="text" name="vacation_management" value="${vvo.vacation_management}" required>
            
            <label for="name">휴가 시작일:</label>
            <input type="text" name="vacation_start" value="${vvo.vacation_start}" required>
            
            <label for="name">휴가 종료일:</label>
            <input type="text" name="vacation_finish" value="${vvo.vacation_finish}" required>

            <button type="submit">수정하기</button>
        </form>
    </div>

</body>
</html>