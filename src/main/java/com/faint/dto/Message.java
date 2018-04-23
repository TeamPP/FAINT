package com.faint.dto;

import java.util.Date;

public class Message {
	private int message_rownum;
	private int first_message_rownum;
	private Date sendtime;
	private int read_status;
	private String comment;
	private String sender;
	private String receiver;
	private String sender_delete;
	private String receiver_delete;
	private int unread_count;
	
	public Message(){}

	public Message(int message_rownum, int first_message_rownum, Date sendtime, int read_status, String comment,
			String sender, String receiver, String sender_delete, String receiver_delete) {
		super();
		this.message_rownum = message_rownum;
		this.first_message_rownum = first_message_rownum;
		this.sendtime = sendtime;
		this.read_status = read_status;
		this.comment = comment;
		this.sender = sender;
		this.receiver = receiver;
		this.sender_delete = sender_delete;
		this.receiver_delete = receiver_delete;
	}

	public int getMessage_rownum() {
		return message_rownum;
	}

	public void setMessage_rownum(int message_rownum) {
		this.message_rownum = message_rownum;
	}

	public int getFirst_message_rownum() {
		return first_message_rownum;
	}

	public void setFirst_message_rownum(int first_message_rownum) {
		this.first_message_rownum = first_message_rownum;
	}

	public Date getSendtime() {
		return sendtime;
	}

	public void setSendtime(Date sendtime) {
		this.sendtime = sendtime;
	}

	public int getRead_status() {
		return read_status;
	}

	public void setRead_status(int read_status) {
		this.read_status = read_status;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	public String getSender_delete() {
		return sender_delete;
	}

	public void setSender_delete(String sender_delete) {
		this.sender_delete = sender_delete;
	}

	public String getReceiver_delete() {
		return receiver_delete;
	}

	public void setReceiver_delete(String receiver_delete) {
		this.receiver_delete = receiver_delete;
	}

	public int getUnread_count() {
		return unread_count;
	}

	public void setUnread_count(int unread_count) {
		this.unread_count = unread_count;
	}

	@Override
	public String toString() {
		return "message [message_rownum=" + message_rownum + ", first_message_rownum=" + first_message_rownum
				+ ", sendtime=" + sendtime + ", read_status=" + read_status + ", comment=" + comment + ", sender="
				+ sender + ", receiver=" + receiver + ", sender_delete=" + sender_delete + ", receiver_delete="
				+ receiver_delete + ", unread_count=" + unread_count + "]";
	}

	
		
}
