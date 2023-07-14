package model.fullmoon;

import java.sql.Timestamp;

public class FullMoonRequestDto {
	
	
	private String moonNum;
	private String adminId;
	private String title;
	private String content;
	private Timestamp createdAt;
	private int goal;
	private int donation;
	private int status;
	private int messageCnt;
	
	
	
	public FullMoonRequestDto(String moonNum, String adminId, String title, String content, Timestamp createdAt,
			int goal, int donation, int status, int messageCnt) {
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
	public void setMoonNum(String moonNum) {
		this.moonNum = moonNum;
	}
	public String getAdminId() {
		return adminId;
	}
	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Timestamp createdAt) {
		this.createdAt = createdAt;
	}
	public int getGoal() {
		return goal;
	}
	public void setGoal(int goal) {
		this.goal = goal;
	}
	public int getDonation() {
		return donation;
	}
	public void setDonation(int donation) {
		this.donation = donation;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getMessageCnt() {
		return messageCnt;
	}
	public void setMessageCnt(int messageCnt) {
		this.messageCnt = messageCnt;
	}
	
	
	
	

	
	
	
	
	

}
