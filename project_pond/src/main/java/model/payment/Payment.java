package model.payment;

import java.sql.Timestamp;

public class Payment {
	
	private String userid;
	private String moonNum;
	private int cost;
	private Timestamp payday;
	
	
	public Payment(String userid, String moonNum,int cost, Timestamp payday) {
	
		this.userid = userid;
		this.moonNum = moonNum;
		this.cost = cost;
		this.payday = payday;
	}


	public String getUserid() {
		return userid;
	}


	public int getCost() {
		return cost;
	}


	public String getMoonNum() {
		return moonNum;
	}


	public Timestamp getPayday() {
		return payday;
	}
	
	
	
	
	
	
}
