package com.ddosirak.domain;

import java.sql.Timestamp;

public class ChatRoomVO {
	private int id;
	private String chatRoom_code;
	private Timestamp regdate;
	private Timestamp chatdate;
	private String last_chat;
	
	// getter setter
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getChatRoom_code() {
		return chatRoom_code;
	}
	public void setChatRoom_code(String chatRoom_code) {
		this.chatRoom_code = chatRoom_code;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	public Timestamp getChatdate() {
		return chatdate;
	}
	public void setChatdate(Timestamp chatdate) {
		this.chatdate = chatdate;
	}
	public String getLast_chat() {
		return last_chat;
	}
	public void setLast_chat(String last_chat) {
		this.last_chat = last_chat;
	}
	
	// toString
	@Override
	public String toString() {
		return "ChatRoomVO [id=" + id + ", chatRoom_code=" + chatRoom_code + ", regdate=" + regdate + ", chatdate="
				+ chatdate + ", last_chat=" + last_chat + "]";
	}
	

}// public class end
