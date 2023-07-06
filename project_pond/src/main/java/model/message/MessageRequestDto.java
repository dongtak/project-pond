package model.message;

import java.sql.Timestamp;

public class MessageRequestDto {
	
	private String messageId;
	private String userId;
	private String content;
	private Timestamp msgDate;
	
	
	public MessageRequestDto(String messageId, String userId, String content, Timestamp msgDate) {
		
		this.messageId = messageId;
		this.userId = userId;
		this.content = content;
		this.msgDate = msgDate;
	}


	public String getMessageId() {
		return messageId;
	}


	public void setMessageId(String messageId) {
		this.messageId = messageId;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public Timestamp getMsgDate() {
		return msgDate;
	}


	public void setMsgDate(Timestamp msgDate) {
		this.msgDate = msgDate;
	}
	
	
	
	
	
	
	

}
