<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Messenger</title>
<link rel="stylesheet" type="text/css" href="../../resources/css/css.css">
<jsp:include page="../common/header.jsp"/>
<style>
.emp_select{float: left; margin-right: 20px;}
.time{font-size: 1px; margin: 1px 0 10px 14px;}
 td>a{margin-left: 10px;}
.chatLink{font-size: 1.2em; font-weight:bold; color:black;  width:50px; height: 50px;}
.chatMsg{margin-left: 10px;}
/* thead{border-top: 1px solid; border-bottom: 1px dotted; border-right: 1px solid; border-left: 1px solid;} */
/* tbody{border-right: 1px solid; border-left: 1px solid; border-bottom: 2px solid ;} */
/* .divCss{background-color: silver;} */
.chatHead{border-bottom: 1px dotted;}
.chatBody{border-bottom: 3px solid;}
</style>
</head>
<body id="body-pd">
<h1>대화 내역</h1>
<form action="/public/chat" method=get>
		<div id="emp_select" class="emp_select">
			<input type="submit" value="대화 열기"><br><br><input type="hidden" name="chat_sender" value="${login_id }">
		</div>
</form>
	<div id="chatRoomListHERE" class="divCss">
		
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
				select += '<option value="noSelect" selected>대화 상대를 선택하세요.</option>';
				var pro_arr = [];
				var ret_arr = [];
				var emp_arr = [];
				if(data.length !== 0){
					for(var i=0;i<data.length;i++){
						if(data[i].employee_status == '재직중' && data[i].position != '일용' && data[i].employee_id != "${login_id}"){
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
		
		// 값 선택 안하면 채팅못하고 돌아오도록 함.
		var selectCheckValue = "${selectCheck}";
		if(selectCheckValue == "NOSELECT" ){
			Swal.fire({
				title: "검색 내용을 입력해주세요!",
				icon: "warning",
					  confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
					  confirmButtonText: '확인', // confirm 버튼 텍스트 지정
				}) // swal end
		}// if end
		
		$.ajax({
			url:'/emp_ajax/chatRoomAJAX',
			type:'POST',
			success:function(data){
				console.log(data);
				$.each(data,function(key,value){
					var employee_id = key;
					var employee_name = value[0];
					var chatRoom_code = value[1].chatRoom_code;

					var last_chat =  value[1].last_chat;
					if(last_chat == null){
						last_chat = '아직 대화를 나누지 않았습니다.';
					}
					
					console.log(employee_id);
					console.log(employee_name);
					console.log(chatRoom_code);
// 					console.log(chatdate);
					console.log(last_chat);
					if(value[1].chatdate != null){
						var timeTmp = new Date(value[1].chatdate  - (60*60*1000)*9);
						
						var year = timeTmp.getFullYear();
						var month = ('0' + (timeTmp.getMonth() + 1)).slice(-2);
						var day = ('0' + timeTmp.getDate()).slice(-2);
	
						var dateString = year + '년' + month  + '월' + day +'일';
						
						var hours = ('0' + timeTmp.getHours()).slice(-2); 
						var minutes = ('0' + timeTmp.getMinutes()).slice(-2);
						var seconds = ('0' + timeTmp.getSeconds()).slice(-2); 
	
						var timeString = hours + ':' + minutes  + ':' + seconds;
						var chatdate = dateString+" "+timeString;
					}else{
						var chatdate =  ' ---- ---- ';
					}// i-e end
					
					var table = '';
					table += '<thead>';
					table += '	<tr>';
					table += '		<td class="chatHead"><a href="/public/chat?chat_receiver='+employee_id+'&chat_sender=${login_id}" class="chatLink">'+employee_name+'</a></td>';
					table += '	</tr>';
					table += '</thead>';
					table += '<tbody>';
					table += '	<tr>';
					table += '		<td class="chatBody"><div class="chatMsg">'+last_chat +' '+'</div><div class="time">'+chatdate+'</div></td>';
					table += '	</tr>';
					table += '</tbody>';
					
					$('#chatRoomListHERE').append(table);
					
				}); // each end
			}// success end
		}); // ajax end
		
	});// jQ end
</script>
<script src="https://cdn.jsdelivr.net/npm/gasparesganga-jquery-loading-overlay@2.1.7/dist/loadingoverlay.min.js"></script>
<script>
	$.LoadingOverlay("show");
	
	setTimeout(function(){
	    $.LoadingOverlay("hide");
	}, 2000);
</script>
</html>


































