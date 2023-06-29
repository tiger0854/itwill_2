<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <title>나의휴가 내역</title>
 <link rel="stylesheet" type="text/css" href="../../resources/css/css.css">
</head>
<body id="body-pd" style="font-family: 'TheJamsil5';">
<jsp:include page="../common/header.jsp"/>
  <div class="table table-striped">
    <h1>나의휴가 내역</h1>
    <table class="table table-striped" style="margin-top: 10px;">
      <thead>
        <tr>
          <th>사원아이디</th>
          <th>직위</th>
          <th>부서</th>
          <th>휴대폰번호</th>
          <th>휴가관리</th>
          <th>휴가시작일</th>
          <th>휴가종료일</th>
          <th>휴가 사유</th>
          <th>휴가 승인여부</th>
          <th>휴가 승인자</th>
          <th>휴가 대체인</th>
          <th>사원명</th>
          <th>휴가 승인일자</th>
          <th>휴가 신청일자</th>
          <th>연차 일 수</th>
        </tr>
      </thead>
      <c:forEach var="mvc" items="${myvacationList }">
	      <tbody>
	        <tr>
	          <td>${mvc.employee_id }</td>
	          <td>${mvc.position }</td>
	          <td>${mvc.department_name }</td>
	          <td>${mvc.phone_num }</td>
	          <td>${mvc.vacation_management }</td>
	          <td>${mvc.vacation_start }</td>
	          <td>${mvc.vacation_finish}</td>
	          <td>${mvc.vacation_reason}</td>
	          <td>${mvc.approve}</td>
	          <td>${mvc.approve_emp}</td>
	          <td>${mvc.subsitute}</td>
	          <td>${mvc.employee_name}</td>
	          <td>${mvc.approve_date}</td>
	          <td>${mvc.prop_date}</td>
	          <td>${mvc.vacation_date}</td>
	        </tr>
	        <!-- 다른 휴가 내역을 여기에 추가 -->
	      </tbody>
      </c:forEach>
    </table>
  </div>
</body>
</html>
    