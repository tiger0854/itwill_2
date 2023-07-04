<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>chat</title>
<link rel="stylesheet" type="text/css" href="../../resources/css/css.css">
<jsp:include page="../common/header.jsp"/>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
</head>
<body id="body-pd">
	<input type="text" id="message" />
	<input type="button" id="sendBtn" value="submit"/>
	<div id="messageArea"></div>
</body>
<script type="text/javascript">
	const urlStr = window.location.href;
	console.log(urlStr);
	const url = new URL(urlStr);
	const urlParams = url.searchParams;
	var chat_sender = urlParams.get('chat_sender');
	var chat_receiver = urlParams.get('chat_receiver');
	
	console.log('sender: '+chat_sender);
	console.log('receiver: '+chat_receiver);

	$("#sendBtn").click(function() {
		sendMessage();
		$('#message').val('')
	});

	let sock = new SockJS("http://localhost:8088/echo");
	sock.onmessage = onMessage;
	sock.onclose = onClose;
	// 메시지 전송
	function sendMessage() {
		if(parseInt(chat_sender) > parseInt(chat_receiver)){
			var chatRoom_code = chat_sender+chat_receiver;
		}else{
			var chatRoom_code = chat_receiver+chat_sender;
		}// i-e end
		var msg = chat_sender+'&'+chat_receiver+'&'+$("#message").val()+'&'+chatRoom_code;
		sock.send(msg);
	}
	// 서버로부터 메시지를 받았을 때
	function onMessage(msg) {
		var data = msg.data;
		var sender =data.split("&")[0];
		var receiver =data.split("&")[1];
		var chat =data.split("&")[2];
		$("#messageArea").append("<p>"+"보낸사람:"+sender +"받은사람:"+receiver +"</p>");
		$("#messageArea").append("<p>"+chat +"</p>");
	}
	// 서버와 연결을 끊었을 때
	function onClose(evt) {
		$("#messageArea").append("연결 끊김");

	}
</script>
</html>