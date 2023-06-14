<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>급여명세서</title>
<link rel="stylesheet" type="text/css" href="../../resources/css/css.css">
</head>
<body id="body-pd" style="font-family: 'TheJamsil5';">
<jsp:include page="../common/header.jsp"/>
<h1>급여명세서</h1>
<input type="button" value="뒤로가기" onclick="location.href='/emp/salaryInfo?employee_id=${evo.employee_id}'">
<table class="table table-striped" style="margin-top: 10px;" >
	<tr>
		<td>사원번호</td>
		<td>사원명</td>
		<td>주민등록번호</td>
		<td>부서/직급</td>
	 </tr>
	<tr>
		<td>${evo.employee_id}</td>
		<td>${evo.employee_name}</td>
		<td>${evo.jumin }</td>
		<td>${evo.department_name } / ${evo.position }</td>
	 </tr>
	<tr>
		<td>현재은행</td>
		<td colspan="2">현재계좌</td>
		<td>기준연봉</td>
	</tr>
	<tr>
		<td>${evo.bank_name }</td>
		<td colspan="2">${evo.sal_account }</td>
		<td>${evo.year_sal } 만원</td>
	 </tr>
</table>

<table class="table table-striped" style="margin-top: 10px;">
	<tr>
		<td>지급은행</td>
		<td>지급계좌</td>
		<td>일자</td>
	</tr>
	<tr>
		<td>${svo.bank_name }</td>
		<td>${svo.sal_account }</td>
		<td>${svo.sal_date }</td>
	</tr>
	<tr>
		<td>기준 월급</td>
		<td>공제액</td>
		<td>실 지급액수</td>
	</tr>
	<tr>
		<td><fmt:formatNumber value="${svo.salary*10000*1.0989}"/>원</td>
		<td><fmt:formatNumber value="${svo.salary*10000*1.0989-svo.salary*10000}"/>원</td>
		<td><fmt:formatNumber value="${svo.salary*10000}"/>원</td>
	</tr>
</table>

</body>
</html>