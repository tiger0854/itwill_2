package com.ddosirak.domain;

import java.sql.Timestamp;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class ChatVO{
	private int chat_id;
	private String chat_receiver;
	private String chat_sender;
	private String message;
	private Timestamp time;
	private String chatRoom_code;
	private int read;
	
	// getter / setter
	public int getChat_id() {
		return chat_id;
	}
	public void setChat_id(int chat_id) {
		this.chat_id = chat_id;
	}
	public String getChat_receiver() {
		return chat_receiver;
	}
	public void setChat_receiver(String chat_receiver) {
		this.chat_receiver = chat_receiver;
	}
	public String getChat_sender() {
		return chat_sender;
	}
	public void setChat_sender(String chat_sender) {
		this.chat_sender = chat_sender;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Timestamp getTime() {
		return time;
	}
	public void setTime(Timestamp time) {
		this.time = time;
	}
	public String getChatRoom_code() {
		return chatRoom_code;
	}
	public void setChatRoom_code(String chatRoom_code) {
		this.chatRoom_code = chatRoom_code;
	}
	public int getRead() {
		return read;
	}
	public void setRead(int read) {
		this.read = read;
	}
	
	//toString
	@Override
	public String toString() {
		return "ChatVO [chat_id=" + chat_id + ", chat_receiver=" + chat_receiver + ", chat_sender=" + chat_sender
				+ ", message=" + message + ", time=" + time + ", chatRoom_code=" + chatRoom_code + ", read=" + read
				+ "]";
	}
	
	
	
	
	
}// public class end
