package model.payment;

import java.sql.Timestamp;

public class Payment {
	
	private String userid;
	private int field;
	private String moonNum;
	private Timestamp payday;
	
	
	public Payment(String userid, int field, String moonNum, Timestamp payday) {
	
		this.userid = userid;
		this.field = field;
		this.moonNum = moonNum;
		this.payday = payday;
	}


	public String getUserid() {
		return userid;
	}


	public int getfield() {
		return field;
	}


	public String getMoonNum() {
		return moonNum;
	}


	public Timestamp getPayday() {
		return payday;
	}
	
	
	
	
	
	
}
