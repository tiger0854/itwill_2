<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원 급여관리</title>
<link rel="stylesheet" type="text/css" href="../../resources/css/css.css">
</head>
<body id="body-pd" style="font-family: 'TheJamsil5';">
<jsp:include page="../common/header.jsp"/>
<!-- 사원 개인이 들어오는 경우 > 급여명세서 페이지 출력 -->
<%-- ${empList } --%>
<h1>사원 급여관리</h1>
<table>
	<tr>
		<td><input type="button" value="월별 급여대장 조회"></td>
		<td><input type="button" value="연별 급여대장 조회"></td>
		<td><input type="button" value="급여 지급" onclick="location.href='/emp/salaryPay'"></td>
	</tr>
</table>
<!-- 관리자가 들어오는 경우 > 사원리스트 + 급여 대시보드 출력 -->
		    <table class="table table-striped" style="margin-top: 10px;" >
		        <tr>
		            <td><select name="department_name">
			            <optgroup label="생산">
			            	<option value="생산과">생산과</option>
			            	<option value="생산 1팀">생산 1팀</option>
			            	<option value="생산 2팀">생산 2팀</option>
			            </optgroup>
			            <optgroup label="유통">
			            	<option value="유통과">유통과</option>
			            	<option value="입고팀">입고팀</option>
			            	<option value="출고팀">출고팀</option>
			            </optgroup>
			            <optgroup label="관리">
			            	<option value="인사과">인사과</option>
			            </optgroup>
		            </select></td>
		            <td><select name="position">
			            	<option value="이사">이사</option>
			            	<option value="과장">과장</option>
			            	<option value="팀장">팀장</option>
			            	<option value="주임">주임</option>
			            	<option value="사원">사원</option>
			            	<option value="일용">일용</option>
			            	<option value="외주">외주</option>
		            </select></td>
		            <td><select name="employee_status" id="employee_status">
		        		<option value="재직중">재직중</option>
		        		<option value="퇴사">퇴사</option>
		        		<option value="휴직중">휴직중</option>
		        	</select></td>
		            <td><input type="text" size="15" placeholder="이름"><input type="button" value="검색"></td>
		        </tr>
		    </table>
		    <table class="table table-striped" style="margin-top: 10px;" >
		
		        <tr>
		            <td>사원번호</td>
		            <td>성명</td>
		            <td>부서</td>
		            <td>직급</td>
		            <td>계좌번호</td>
		        </tr>
		        <c:forEach var="vo" items="${empList }">
		        <tr>
		            <td>${vo.employee_id}</td>
		            <td><a href="/emp/salaryInfo?employee_id=${vo.employee_id}">${vo.employee_name }</a></td>
		            <td>${vo.department_name }</td>
		            <td>${vo.position }</td>
		            <td>
			            <c:if test="${empty vo.sal_account }">
			           	 	미등록
			            </c:if>
			            <c:if test="${!empty vo.sal_account }">
			            	${vo.sal_account }
			            </c:if>
		            </td>
		        </tr>
		        </c:forEach>
		    </table>
<!-- 사원리스트에서 사원 이름 클릭 > 사원 급여명세서 조회 / 수정 가능 -->


</body>
</html>