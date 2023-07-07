package model.fullmoon;

import java.sql.Timestamp;

public class FullMoonRequestDto {
	
	
	private String moonNum;
	private String title;
	private String content;
	private Timestamp createdAt;
	private int goal;
	private int donation;
	private String donationId;
	private String adminId;
	
	
	
	
	public FullMoonRequestDto(String moonNum, String title, String content, Timestamp createdAt, int goal, int donation,
			String donationId, String adminId) {
		this.moonNum = moonNum;
		this.title = title;
		this.content = content;
		this.createdAt = createdAt;
		this.goal = goal;
		this.donation = donation;
		this.donationId = donationId;
		this.adminId = adminId;
	}
	
	
	public String getMoonNum() {
		return moonNum;
	}
	public void setMoonNum(String moonNum) {
		this.moonNum = moonNum;
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
	public String getDonationId() {
		return donationId;
	}
	public void setDonationId(String donationId) {
		this.donationId = donationId;
	}
	public String getAdminId() {
		return adminId;
	}
	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}
	
	
	



	
	
	
	
	

}
