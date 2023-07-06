<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일용직 일괄등록</title>
<link rel="stylesheet" type="text/css" href="../../resources/css/css.css">
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var count = 1;
	$(document).ready(function(){
		var table = '<tr>';
		table += '<td>'+count+'</td>';
		table += '<td><input type="text" size="8" name="employeelist[0].employee_name"></td>';
		table += '<td><select name="employeelist[0].gender"><option value="남">남</option><option value="여">여</option></select></td>';
		table += '<td><select name="employeelist[0].department_name" value="생산 1팀"><option>생산 1팀</option><option value="생산 2팀">생산 2팀</option></select></td>';
		table += '<td><select name="employeelist[0].working_hours"><option value="오전반">오전반</option><option value="오후반">오후반</option><option value="전일반">전일반</option></select></td>';
		table += '<td><input type="text" name="employeelist[0].phone_num"></td>';
		table += '<td><input type="text" name="employeelist[0].jumin"></td>';
		table += '<td><input type="text" size="8" name="employeelist[0].bank_name"></td>';
		table += '<td><input type="text" name="employeelist[0].sal_account"></td>';
		table += '<td><input type="hidden" name="employeelist[0].position" value="일용"></td>';
		table += '<td><input type="hidden" name="employeelist[0].employee_status" value="재직중"></td>';
		table += '<td><input type="hidden" name="employeelist[0].emp_date" value="'+dateString+'"></td>';
		table += '</tr>';
		$('#alTable > tbody:last').append(table);
		count++;
	}) // first add end
	
	$('#add').on('click',function(){
		if(count <= 20){
		var table = '<tr>';
		table += '<td>'+count+'</td>';
		table += '<td><input type="text" size="8" name="employeelist['+(count-1)+'].employee_name"></td>';
		table += '<td><select name="employeelist['+(count-1)+'].gender"><option value="남">남</option><option value="여">여</option></select></td>';
		table += '<td><select name="employeelist['+(count-1)+'].department_name" value="생산 1팀"><option>생산 1팀</option><option value="생산 2팀">생산 2팀</option></select></td>';
		table += '<td><select name="employeelist['+(count-1)+'].working_hours"><option value="오전반">오전반</option><option value="오후반">오후반</option><option value="전일반">전일반</option></select></td>';
		table += '<td><input type="text" name="employeelist['+(count-1)+'].phone_num"></td>';
		table += '<td><input type="text" name="employeelist['+(count-1)+'].jumin"></td>';
		table += '<td><input type="text" size="8" name="employeelist['+(count-1)+'].bank_name"></td>';
		table += '<td><input type="text" name="employeelist['+(count-1)+'].sal_account"></td>';
		table += '<td><input type="hidden" name="employeelist['+(count-1)+'].position" value="일용"></td>';
		table += '<td><input type="hidden" name="employeelist['+(count-1)+'].employee_status" value="재직중"></td>';
		table += '<td><input type="hidden" name="employeelist['+(count-1)+'].emp_date" value="'+dateString+'"></td>';
		table += '</tr>';
		$('#alTable > tbody:last').append(table);
		count++;
		}else if(count > 20){
			alert('20명 이상 일괄등록할 수 없습니다!');
		}
	}) // add end
	
	  $('#delete').on('click',function() {
		   	if(count > 2){
			    $('#alTable > tbody > tr:last').remove();
			   	count--;
		   	}else{
				alert('등록란을 추가해주세요!');
				count = 2;
		   	}// i-e end
	 }); // delete end	
	
	var today = new Date();

	var year = today.getFullYear();
	var month = ('0' + (today.getMonth() + 1)).slice(-2);
	var day = ('0' + today.getDate()).slice(-2);

	var dateString = year + '-' + month  + '-' + day;

	console.log(dateString);
	
	});// jQ end
</script>
</head>
<body id="body-pd" style="font-family: 'TheJamsil5';">
<jsp:include page="../common/header.jsp"/>
<h1>일용직 일괄등록</h1>
<form action="" method="post">
	<input type="button" value="등록란 추가" id="add">
	<input type="button" value="등록란 제거" id="delete">
	<input type="button" value="뒤로가기" onclick="location.href='/emp/list'">
	<input type="submit" value="일괄 등록">
	
	<table class="table table-striped" style="margin-top: 10px;" id="alTable">
		<thead>
			<tr>
				<td>번호</td>
				<td>이름</td>
				<td>성별</td>
				<td>부서</td>
				<td>근무시간</td>
				<td>전화번호</td>
				<td>주민등록번호</td>
				<td>은행</td>
				<td>계좌번호</td>
			</tr>
		</thead>
		<tbody></tbody>
	</table>
</form>

</body>
</html>