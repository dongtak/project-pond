package model.fullmoon;

import java.sql.Timestamp;

public class FullMoon {

	private String moonNum;
	private String adminId;
	private String title;
	private String content;
	private Timestamp createdAt;
	private Timestamp finishAt;
	private int goal;
	private int donate;
	private int status;
	private int messageCnt;

	public FullMoon(String moonNum, String adminId, String title, String content, Timestamp createdAt, int goal,
			Timestamp finishAt,int donate, int status, int messageCnt) {
		super();
		this.moonNum = moonNum;
		this.adminId = adminId;
		this.title = title;
		this.content = content;
		this.createdAt = createdAt;
		this.finishAt = finishAt;
		this.goal = goal;
		this.donate = donate;
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
	
	public Timestamp getFinishAt() {
		return finishAt;
	}
	
	public int getGoal() {
		return goal;
	}

	public int getDonate() {
		return donate;
	}

	public int getStatus() {
		return status;
	}

	public int getMessageCnt() {
		return messageCnt;
	}
	
	

}
