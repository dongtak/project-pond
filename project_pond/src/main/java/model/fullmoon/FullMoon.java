package model.fullmoon;

import java.sql.Date;
import java.sql.Timestamp;

public class FullMoon {

	private String moonNum;
	private String adminId;
	private String title;
	private Timestamp createdAt;
	private String finishAt;
	private int goal;
	private int donate;
	private int status;
	private int messageCnt;

	public FullMoon(String moonNum, String adminId, String title, Timestamp createdAt, int goal,
			String finishAt,int donate, int status, int messageCnt) {
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

	public String getMoonNum() {
		return moonNum;
	}

	public String getAdminId() {
		return adminId;
	}

	public String getTitle() {
		return title;
	}

	public Timestamp getCreatedAt() {
		return createdAt;
	}
	
	public String getFinishAt() {
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
