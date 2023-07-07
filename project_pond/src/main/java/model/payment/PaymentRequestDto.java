package model.payment;

import java.sql.Timestamp;

public class PaymentRequestDto {
	
	private String userid;
	private String moonNum;
	private int cost;
	private Timestamp payday;
	

	public PaymentRequestDto(String userid, String moonNum, int cost, Timestamp payday) {
		this.userid = userid;
		this.moonNum = moonNum;
		this.cost = cost;
		this.payday = payday;
	}


	public String getUserid() {
		return userid;
	}


	public void setUserid(String userid) {
		this.userid = userid;
	}


	public String getMoonNum() {
		return moonNum;
	}


	public void setMoonNum(String moonNum) {
		this.moonNum = moonNum;
	}


	public int getCost() {
		return cost;
	}


	public void setCost(int cost) {
		this.cost = cost;
	}


	public Timestamp getPayday() {
		return payday;
	}


	public void setPayday(Timestamp payday) {
		this.payday = payday;
	}



	
	
	
	
	
	
	

}
