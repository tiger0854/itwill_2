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
		table += '<td><input type="text" size="8" name="employee_name"></td>';
		table += '<td><select name="gender"><option value="남">남</option><option value="여">여</option></select></td>';
		table += '<td><select name="department_name" value="생산 1팀"><option>생산 1팀</option><option value="생산 2팀">생산 2팀</option></select></td>';
		table += '<td><select name="working_hour"><option value="오전반">오전반</option><option value="오후반">오후반</option><option value="전일반">전일반</option></select></td>';
		table += '<td><input type="text" name="jumin"></td>';
		table += '<td><input type="text" size="8" name="bank_name"></td>';
		table += '<td><input type="text" name="sal_account"></td>';
		table += '</tr>';
		$('#alTable > tbody:last').append(table);
		count++;
	}) // add end
	$('#add').on('click',function(){
		var table = '<tr>';
		table += '<td>'+count+'</td>';
		table += '<td><input type="text" size="8" name="employee_name"></td>';
		table += '<td><select name="gender"><option value="남">남</option><option value="여">여</option></select></td>';
		table += '<td><select name="department_name" value="생산 1팀"><option>생산 1팀</option><option value="생산 2팀">생산 2팀</option></select></td>';
		table += '<td><select name="working_hour"><option value="오전반">오전반</option><option value="오후반">오후반</option><option value="전일반">전일반</option></select></td>';
		table += '<td><input type="text" name="jumin"></td>';
		table += '<td><input type="text" size="8" name="bank_name"></td>';
		table += '<td><input type="text" name="sal_account"></td>';
		table += '</tr>';
		$('#alTable > tbody:last').append(table);
		count++;
	}) // add end
	  $('#delete').on('click',function() {
		    $('#alTable > tbody > tr:last').remove();
		   	count--;
		   	if(count < 1){
				alert('등록란을 추가해주세요!');
				count = 1;
		   	}// if end
	 }); // delete end		
	 
	
	});// jQ end
</script>
</head>
<body id="body-pd" style="font-family: 'TheJamsil5';">
<jsp:include page="../common/header.jsp"/>
<h1>일용직 일괄등록</h1>
<input type="button" value="등록란 추가" id="add">
<input type="button" value="등록란 제거" id="delete">
<table class="table table-striped" style="margin-top: 10px;" id="alTable">
	<thead>
		<tr>
			<td>번호</td>
			<td>이름</td>
			<td>성별</td>
			<td>부서</td>
			<td>근무시간</td>
			<td>주민등록번호</td>
			<td>은행</td>
			<td>계좌번호</td>
		</tr>
	</thead>
	<tbody></tbody>
</table>

</body>
</html>