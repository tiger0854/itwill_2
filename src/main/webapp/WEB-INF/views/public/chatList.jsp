<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>chatList</title>
<link rel="stylesheet" type="text/css" href="../../resources/css/css.css">
<jsp:include page="../common/header.jsp"/>
</head>
<body id="body-pd">
<h1>채팅내역</h1>
<form action="/public/chat" method=get>
<!-- 	 -->
		<div id="emp_select">
		
		</div>
	<input type="hidden" name="chat_sender" value="${login_id }">
	<input type="submit" value="채팅하기">
</form>
	<div>
		<table>
			<c:forEach var="room" items="${chatRoomList }">
				<c:forEach var="chat" items="${chatList }">
					<c:if test="${room eq chat.chatRoom_code }">
						<tr>
							<td>
								${room}
							</td>
						</tr>
					</c:if>
				</c:forEach>
			</c:forEach>
		</table>
	</div>


</body>
<script>
	$(document).ready(function(){
		$.ajax({
			url:"/emp_ajax/empListAJAX",
			type : 'POST',
			success:function(data){
				console.log(data);
				var select = '<select id="empSelect" name="chat_receiver">';
				select += '<option value="" disabled selected>채팅 대상을 선택하세요.</option>';
				var pro_arr = [];
				var ret_arr = [];
				var emp_arr = [];
				if(data.length !== 0){
					for(var i=0;i<data.length;i++){
						if(data[i].employee_status == '재직중' && data[i].position != '일용'){
							if(data[i].department_name == '인사과'){
								emp_arr.push('<option value='+data[i].employee_id+'>'+data[i].position+' '+data[i].employee_name+'</option>');
							}else if(data[i].department_name == '생산과' || data[i].department_name == '생산 1팀' || data[i].department_name == '생산 2팀' ){
								pro_arr.push('<option value='+data[i].employee_id+'>'+data[i].position+' '+data[i].employee_name+'</option>')
							}else if(data[i].department_name == '유통과' || data[i].department_name == '출고팀' || data[i].department_name == '입고팀' ){
								ret_arr.push('<option value='+data[i].employee_id+'>'+data[i].position+' '+data[i].employee_name+'</option>')
							}
						}// if end
					}// for end
					select += '<optgroup label="생산">';
						for(var j=0;j<pro_arr.length;j++){
							select += pro_arr[j];
						}// for end
					select += '</optgroup>';

					select += '<optgroup label="유통">';
						for(var j=0;j<ret_arr.length;j++){
							select += ret_arr[j];
						}// for end
					select += '</optgroup>';

					select += '<optgroup label="인사">';
						for(var j=0;j<emp_arr.length;j++){
							select += emp_arr[j];
						}// for end
					select += '</optgroup>';
				}// if end
				
				
				select += '</select>';
				$('#emp_select').append(select);
			}// success function
		});// ajax end
		
		
	});// jQ end
</script>
</html>


































