package model.fullmoon;

import java.sql.Timestamp;

public class FullMoon {

	private String moonNum;
	private String title;
	private String content;
	private Timestamp createdAt;
	private int goal;
	private int donation;
	private String donationId;
	private String adminId;
	
	
	public FullMoon(String moonNum, String title, String content, Timestamp createdAt, int goal, int donate,
			String donateId, String adminId) {
		
		this.moonNum = moonNum;
		this.title = title;
		this.content = content;
		this.createdAt = createdAt;
		this.goal = goal;
		this.donation = donate;
		this.donationId = donateId;
		this.adminId = adminId;
	}


	public String getMoonNum() {
		return moonNum;
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


	public int getDonate() {
		return donation;
	}


	public String getDonateId() {
		return donationId;
	}


	public String getAdminId() {
		return adminId;
	}
	
	
	
	
	
	

	
}
