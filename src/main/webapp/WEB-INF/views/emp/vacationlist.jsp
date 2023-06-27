<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>휴가관리리스트</title>
<link rel="stylesheet" type="text/css" href="../../resources/css/css.css">
<script>
function vacationmodify(vacation_id) {
	  var popupUrl = '/emp/vacationmodify?vacation_id='+vacation_id;
	  window.open(popupUrl, '_blank', 'width=500,height=600,left=100, top=100');
	}
</script>
<script>
function vacationdelete(vacation_id) {
	if(confirm("정말로 삭제하시겠습니까?")){
		location.href='/emp/vacationdelete?vacation_id='+vacation_id;
	}
}
</script>
</head>
<body id="body-pd" style="font-family: 'TheJamsil5';">
<jsp:include page="../common/header.jsp"/>
	<h1>휴가관리리스트페이지(관리자)</h1>
<%-- 	${vacationList } --%>
<%-- ${vc.employee_id} --%>

	
	<!-- 휴가나간 인원일떄만 테이블에 값을 가져오도록 하는 코드 -->
	
	<table class="table table-striped" style="margin-top: 10px;">
		<tr>
			<td>사원 아이디</td>
			<td>사원명</td>
			<td>휴가 승인일자</td>
			<td>휴가 신청일자</td>
			<td>연차 일 수</td>
			<td>휴가 사유</td>
			<td>휴가 승인여부</td>
			<td>휴가 승인자</td>
			<td>대체인</td>
			<td>수정</td>
			<td>삭제</td>
		</tr>
		<c:forEach var="vc" items="${vacationList}">
			<tr>
				<td>${vc.employee_id }</td>
				<td>${vc.employee_name }</td>
				<td>${vc.approve_date }</td>
				<td>${vc.prop_date }</td>
				<td>${vc.vacation_date }</td>
				<td>${vc.vacation_reason }</td>
				<td>${vc.approve }</td>
				<td>${vc.approve_emp }</td>
				<td>${vc.subsitute }</td>
				<td><button onclick="vacationmodify('${vc.vacation_id}')">수정하기</button></td>
				<td><button onclick="vacationdelete('${vc.vacation_id}')">삭제하기</button></td>
				
			</tr>
		</c:forEach>
	</table>
	
	
	
	
	
	
</body>
</html>