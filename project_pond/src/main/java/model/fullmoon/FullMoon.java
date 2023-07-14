package model.fullmoon;

import java.sql.Timestamp;

public class FullMoon {

	private String moonNum;
	private String adminId;
	private String title;
	private String content;
	private Timestamp createdAt;
	private int goal;
	private int donation;
	private int status;
	private int messageCnt;
	
	public FullMoon(String moonNum, String adminId, String title, String content, Timestamp createdAt, int goal,
			int donation, int status, int messageCnt) {
		
		this.moonNum = moonNum;
		this.adminId = adminId;
		this.title = title;
		this.content = content;
		this.createdAt = createdAt;
		this.goal = goal;
		this.donation = donation;
		this.status = status;
		this.messageCnt = messageCnt;
	}
	public String getMoonNum() {
		return moonNum;
	}
	public String getAdminId() {
		return adminId;
	}
	public String getTitle() {
		return title;
	}
	public String getContent() {
		return content;
	}
	public Timestamp getCreatedAt() {
		return createdAt;
	}
	public int getGoal() {
		return goal;
	}
	public int getDonation() {
		return donation;
	}
	public int getStatus() {
		return status;
	}
	public int getMessageCnt() {
		return messageCnt;
	}
	
	
	
	
	
	

	
}
