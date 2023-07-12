<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="../../resources/logo_favicon.png" type="image/x-icon">
<meta charset="UTF-8">
<title>사내 메신저</title>
<link rel="stylesheet" type="text/css" href="../../resources/css/css.css">
<jsp:include page="../common/header.jsp"/>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
<style>
 	.chat_wrap {margin-right: 245px;}
	.chat_wrap .chat { padding-top: 4px; padding-bottom:50px; width: 600px; margin:auto; background-color: silver; overflow-y: scroll; height: 45em;}
	.chat_wrap .chat ul { width: 100%; list-style: none; padding-left: 0!important; }
	.chat_wrap .chat ul li { width: 100%; }
	.chat_wrap .chat ul li.left { text-align: left;  }
	.chat_wrap .chat ul li.right { text-align: right; margin-right: 100px; }
	 
	.chat_wrap .chat ul li > div { font-size: 13px;  }
	.chat_wrap .chat ul li > div.sender {  font-weight: bold; }
	.chat_wrap .chat ul li > div.message { display: inline-block; word-break:break-all; margin: 5px 3px; max-width: 75%; border: 1px solid #888; padding: 10px; border-radius: 5px; background-color: #FCFCFC; color: #555; text-align: left; }
 	.chat_wrap .chat ul li > span.timeRight {margin-bottom: 25px; font-size: 1px; vertical-align: bottom;  } 
	.chat_wrap .chat ul li > span.timeLeft {margin-bottom: 25px; font-size: 1px; vertical-align: bottom; margin-right: 10px; } 
	 	
	 	
	.chat_wrap .input-div { position: fixed; bottom: 0; width: 60%; background-color: #FFF; text-align: center;border: 1px solid #9F9F9F;margin-bottom: 20px;border-radius: 8px;margin-left: 290px;height: 100px;	box-shadow: rgba(145,158,171,0.2) 0px 0px 2px 0px,rgba(145,158,171,0.12) 0px 12px 24px -4px; }
	.chat_wrap .input-div > input { width: 90%; height: 35px; padding: 10px;}
	 
	.format { display: none; }
</style>
</head>
<body id="body-pd">
	<div class="chat_wrap">
	<table class="table table-bordered" style="margin:auto; width: 600px;margin-top: 80px;">
		<tr>
			<td>대화상대</td>
			<td>내선번호</td>
		</tr>
		<tr>
			<td>${receiverInfo.department_name } ${receiverInfo.position } <a href="#" id="empInfoA">${receiverInfo.employee_name }</a></td>
			<td>${receiverInfo.line_num }</td>
		</tr>
	</table>
	<div class="chat">
		<ul id="chat_wrap">
			<!-- 채팅 들어오는 자리 -->
        </ul>
    </div>
	<div class="input-div">
		<i class='bx bx-message-square-dots'></i><input type="text" id="message" style="border: none;" placeholder="메시지를 입력하세요"/>
		<input type="button" id="sendBtn" class="btn btn-secondary" value="전송" style="width: 100%;margin-top: 28px;"/>
	</div>
	</div>
</body>
<script type="text/javascript">
	const urlStr = window.location.href;
	console.log(urlStr);
	const url = new URL(urlStr);
	const urlParams = url.searchParams;
	var chat_sender = urlParams.get('chat_sender');
	var chat_receiver = urlParams.get('chat_receiver');
	var chatRoom_code = '';
	if(parseInt(chat_sender) > parseInt(chat_receiver)){
		chatRoom_code = chat_sender+chat_receiver;
	}else{
		chatRoom_code = chat_receiver+chat_sender;
	}// i-e end
	console.log('sender: '+chat_sender);
	console.log('receiver: '+chat_receiver);

	$("#sendBtn").click(function() {
		sendMessage();
		$('#message').val('')
	});
	var origin = $(location).attr('origin');
	var sock = new SockJS(origin+"/echo");
	sock.onopen = onOpen;
	sock.onmessage = onMessage;
	sock.onclose = onClose;
	
	// 소켓연결동작
	function onOpen(){
		var openMsg = chat_sender+'&'+chat_receiver+'&'+'ENTER-CHAT'+'&'+chatRoom_code;
		console.log(openMsg);
		sock.send(openMsg);
	} 
	// 메시지 전송
	function sendMessage() {
		var msg = chat_sender+'&'+chat_receiver+'&'+$("#message").val()+'&'+chatRoom_code;
		console.log(msg);
		sock.send(msg);
		scrollDown();
	}
	// 서버로부터 메시지를 받았을 때
	function onMessage(msg) {
		var data = msg.data;
		var sender =data.split("&")[0];
		var receiver =data.split("&")[1];
		var chat =data.split("&")[2];
		var addChat = "";
		if(sender == "${receiverInfo.employee_id }"){
			// 받은거
			addChat += "<li class='left'><div class='sender'>"
			addChat += '	<img src="../../resources/'+'${receiverInfo.employee_id }'+'.png" onerror="this.onerror=null; '; 
			addChat += " 	this.src='../../resources/default_profile_photo.png';";
			addChat += '	" width="60" height="60">';
			addChat += "${receiverInfo.employee_name }"+"</div></li>";
			addChat += "<li class='left'><div class='message'>"+chat +"</div></li>";
		}else{
			// 보낸거
// 			addChat += "<li class='right'>"+"나"+"</li>";
			addChat += "<li class='right'><div class='message'>"+chat +"</div></li>";
		}
		$("#chat_wrap").append(addChat);
	}
	// 서버와 연결을 끊었을 때
	function onClose(evt) {
// 		$("#messageArea").append("연결 끊김");

	}

	// 채팅방 생성시키는 코드
	var formdata = {'chatRoom_code':chatRoom_code};
	$.ajax({
		url:"/emp_ajax/chatRoomMakeAJAX",
		data:formdata,
		type:"POST",
		success:function(){
			console.log('채팅방 생성됨.');
		}// success end
	});// ajax end
	// 채팅창에 채팅내역 출력
	$.ajax({
		url:"/emp_ajax/chatListCallAJAX",
		data:formdata,
		type:"POST",
		success:function(data){
			console.log(data);
			console.log("${receiverInfo.employee_name }");
			var myid = "${login_id}";
			var content = "";
			for(var i=0;i<data.length;i++){
				var timeTmp = new Date(data[i].time  - (60*60*1000)*9);
				
				var year = timeTmp.getFullYear();
				var month = ('0' + (timeTmp.getMonth() + 1)).slice(-2);
				var day = ('0' + timeTmp.getDate()).slice(-2);

				var dateString = year + '년' + month  + '월' + day +'일';
				
				var hours = ('0' + timeTmp.getHours()).slice(-2); 
				var minutes = ('0' + timeTmp.getMinutes()).slice(-2);
				var seconds = ('0' + timeTmp.getSeconds()).slice(-2); 

				var timeString = hours + ':' + minutes  + ':' + seconds;
				
				if(data[i].chat_sender == myid ){
					content += "<li class='right'><span class='timeRight'>"+dateString+" "+timeString+"</span><div class='message'>"+data[i].message+"</div></li>";
				}else{
					content += "<li class='left'><div class='sender'>"
					content += '	<img src="../../resources/'+'${receiverInfo.employee_id }'+'.png" onerror="this.onerror=null; '; 
					content += " 	this.src='../../resources/default_profile_photo.png';";
					content += '	" width="30" height="30">';
					content += "${receiverInfo.employee_name }"+"</div></li>";
					content += "<li class='left'><div class='message'>"+data[i].message+"</div><span class='timeLeft'>"+dateString+" "+timeString+"</span></li>";
				}// i-e end
			}// for end
			$('#chat_wrap').append(content);
		}// success end
	});// ajax end
	
	// 엔터키 입력
		document.addEventListener("keyup", function(event) {
		    if (event.key === 'Enter') {
		    	sendMessage();
		    	$('#message').val('');
		    }// if end
		});// enter press event
	// 스크롤 아래로
	function scrollDown(){
// 		$('.chat').scrollTop($('.chat')[0].scrollHeight);
		$('.chat').animate({
         	scrollTop: $('.chat')[0].scrollHeight
        }, 400);
		window.scrollTo(0,document.body.scrollHeight);
		}// scrollDown end
	
	// 이름 클릭시 정보페이지 출력
	$('#empInfoA').on('click',function(){
		window.open("/emp/info?employee_id=${receiverInfo.employee_id}", "fullscreen=yes");
	}); // click end
	
</script>
</html>