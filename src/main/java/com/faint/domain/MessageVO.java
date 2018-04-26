package com.faint.domain;

import com.google.gson.Gson;

public class MessageVO {
	private int id;			//메시지 번호
	private String message;		//메시지 내용
	private String type;		//all, to 전체, 귓속말
	private String receiver;	//귓속말 대상 
	private String email;		//메시지 보낸 이메일
	private String msgRegist;	//메시지 전송일
	private int readCheck;		//읽음 여부 
	
	
	public static MessageVO converMessage(String source){
		MessageVO message = new MessageVO();
		Gson gson = new Gson();
		message = gson.fromJson(source, MessageVO.class);
		
		return message;
	}
	
	public int getReadCheck() {
		return readCheck;
	}

	public void setReadCheck(int readCheck) {
		this.readCheck = readCheck;
	}

	public int getId() {
		return id;
	}

	public void setBno(int bno) {
		this.id = bno;
	}

	public String getMsgRegist() {
		return msgRegist;
	}

	public void setMsgRegist(String msgRegist) {
		this.msgRegist = msgRegist;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	@Override
	public String toString() {
		return "MessageVO [bno=" + id + ", message=" + message + ", type=" + type + ", receiver=" + receiver
				+ ", email=" + email + ", msgRegist=" + msgRegist + ", readCheck=" + readCheck + "]";
	}

}
