package model.message;

import java.sql.Timestamp;

public class Message {

	private String messageId;
	private String userId;
	private String content;
	private Timestamp msgDate;
	
	
	public Message(String messageId, String userId, String content, Timestamp msgDate) {
	
		this.messageId = messageId;
		this.userId = userId;
		this.content = content;
		this.msgDate = msgDate;
	}


	public String getMessageId() {
		return messageId;
	}


	public String getUserId() {
		return userId;
	}


	public String getContent() {
		return content;
	}


	public Timestamp getMsgDate() {
		return msgDate;
	}
	
	
	
	
	

	
}
