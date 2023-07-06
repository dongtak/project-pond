package model.payment;

import java.sql.Timestamp;

public class PaymentRequestDto {
	
	private String userid;
	private int field;
	private String moonNum;
	private Timestamp payday;
	
	
	
	public PaymentRequestDto(String userid, int field, String moonNum, Timestamp payday) {
		
		this.userid = userid;
		this.field = field;
		this.moonNum = moonNum;
		this.payday = payday;
	}



	public String getUserid() {
		return userid;
	}



	public void setUserid(String userid) {
		this.userid = userid;
	}



	public int getField() {
		return field;
	}



	public void setField(int field) {
		this.field = field;
	}



	public String getMoonNum() {
		return moonNum;
	}



	public void setMoonNum(String moonNum) {
		this.moonNum = moonNum;
	}



	public Timestamp getPayday() {
		return payday;
	}



	public void setPayday(Timestamp payday) {
		this.payday = payday;
	}
	
	
	
	
	
	

}
