package model.fullmoon;

import java.sql.Timestamp;

public class FullMoonResponseDto {
	private String moonNum;
	private String adminId;
	private String title;
	private Timestamp createdAt;
	private String finishAt;
	private int goal;
	private int donate;
	private int status;
	private int messageCnt;
	

	public FullMoonResponseDto(String moonNum, String adminId, String title, Timestamp createdAt,
			String finishAt,int goal, int donate, int status, int messageCnt) {
		super();
		this.moonNum = moonNum;
		this.adminId = adminId;
		this.title = title;
		this.createdAt = createdAt;
		this.finishAt = finishAt;
		this.goal = goal;
		this.donate = donate;
		this.status = status;
		this.messageCnt = messageCnt;
	}
	
	public String getFinishAt() {
		return finishAt;
	}

	public void setFinishAt(String finishAt) {
		this.finishAt = finishAt;
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
	public int getDonate() {
		return donate;
	}
	public void setDonate(int donate) {
		this.donate = donate;
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
