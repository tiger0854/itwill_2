<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../resources/css/css.css">
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#update').on('click',function(){
		alert('수정 진행');
		var button = '<input type="submit" value="저장" id="save">';
		$('#save_button_place').html(button)

		$('#bank_name').attr('readonly',false);
		$('#sal_account').attr('readonly',false);


// 		$('#save').on('click',function(){
// 			location.reload();
// 		})// save click function end
		
	})// update click function end
	
	$("#gender").val("${evo.gender}").prop("selected", true); 
	$("#marriage").val("${evo.marriage}").prop("selected", true); 
	$("#position").val("${evo.position}").prop("selected", true); 
	$("#department_name").val("${evo.department_name}").prop("selected", true); 
	$("#employee_status").val("${evo.employee_status}").prop("selected", true); 
	
	});// jQ end

</script>
</head>
<body id="body-pd" style="font-family: 'TheJamsil5';">
<jsp:include page="../common/header.jsp"/>
	<div>
	<br>
	    <h1>사원 급여 정보</h1>
<%-- 	    	    ${evo } --%>
	    	    <hr>
	    	     ${svo }
	    <form action="" method="post">
	    <input type="hidden" name="employee_id" value="${evo.employee_id }">
	    <!-- 권한제어 -->
<%-- 	    <c:if test="${sessionScope.department_name eq '인사팀' }"> --%>
<!-- 		    <input type="button" value="수정" id="update"> -->
		    <input type="button" value="등록" onclick="location.href='/emp/salaryInsert?employee_id=${evo.employee_id }'">
		    <span id="save_button_place"></span>
<%-- 	    </c:if> --%>
	    <input type="button" value="뒤로가기" onclick="location.href='/emp/salary'">
	    
		    <table class="table table-striped" style="margin-top: 10px;" >
		
		        <tr>
		            <td rowspan="4"><img src="/img/employee_photo/${evo.employee_id}.png" alt="profile_photo" width="150" height="150"></td>
		            <td>성명</td>
		            <td><input type="text" size="50" value="${evo.employee_name }" id="employee_name" name="employee_name" readonly></td>
		            <td>주민등록번호</td>
		            <td><input type="text" size="50" value="${evo.jumin}" id="jumin" name="jumin" readonly></td>
		        </tr>
		        <tr>
		            <td>부서/직급</td>
		            <td><select name="department_name" id="department_name" disabled>
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
		            </select>
		            <select name="position" id="position" disabled>
			            	<option value="이사">이사</option>
			            	<option value="과장">과장</option>
			            	<option value="팀장">팀장</option>
			            	<option value="주임">주임</option>
			            	<option value="사원">사원</option>
			            	<option value="일용">일용</option>
			            	<option value="외주">외주</option>
		            </select></td>
		            <td>재직여부</td>
		        	<td><select name="employee_status" id="employee_status" disabled>
		        		<option value="재직중">재직중</option>
		        		<option value="퇴사">퇴사</option>
		        		<option value="휴직중">휴직중</option>
		        	</select></td>
		        </tr>
		        <tr>
		            <td>휴대폰 번호</td>
		            <td><input type="text" size="50" value="${evo.phone_num }" id="phone_num" name="phone_num" readonly></td>
		            <td>지급예정일</td>
		            <td><input type="date" value="2023-06-01" id="emp_date" name="emp_date" readonly></td>
		        </tr>
		        <tr>
		            <td>이메일</td>
		            <td><input type="text" size="50" value="${evo.email }" id="email" name="email" readonly></td>
		            <td>계좌번호</td>
		            <td><input type="text" size="8" value="${evo.bank_name}" id="bank_name" name="bank_name" readonly>
		            <input type="text" size="40" value="${evo.sal_account}" id="sal_account" name="sal_account" readonly></td>
		        </tr>
		    </table>
	    </form>

	 </div>
	    
	 <div>
		<table class="table table-striped" style="margin-top: 10px;" >
			<tr>
				<td>지급일자</td>
				<td>지급액수</td>
				<td>지급현황</td>
				<td>상세조회</td>
			</tr>
			<c:if test="${empty salaryList }">
			<tr>
				<td colspan="4">지급내역 없음</td>
			</tr>
			</c:if>
				<c:if test="${!empty salaryList }">
					<c:forEach var="svo" items="${salaryList}">
						<tr>
							<td>${svo.sal_date }</td>
							<td><fmt:formatNumber value="${svo.salary*10000}"/> 원</td>
							<td>지급완료</td>
							<td><a href="/emp/salaryDetail?employee_id=${evo.employee_id}&sal_date=${svo.sal_date}">상세조회(아이콘)</a></td>
						</tr>
					</c:forEach>
				</c:if>
		</table>
	 </div>

    
</body>
</html>