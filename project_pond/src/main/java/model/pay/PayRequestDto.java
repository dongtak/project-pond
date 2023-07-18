package model.pay;

import java.sql.Timestamp;

public class PayRequestDto {

	private String payNum;
	private String cardNum;
	private String userId;
	private String moonNum;
	private String name;
	private String message;
	private int payMoney;
	private Timestamp payDay;
	
	public PayRequestDto(String payNum, String cardNum, String userId, String moonNum, String name, String message,
			int payMoney, Timestamp payDay) {
		super();
		this.payNum = payNum;
		this.cardNum = cardNum;
		this.userId = userId;
		this.moonNum = moonNum;
		this.name = name;
		this.message = message;
		this.payMoney = payMoney;
		this.payDay = payDay;
	}
	

	public PayRequestDto(String moonNum, String name, String message, int payMoney) {
		super();
		this.moonNum = moonNum;
		this.name = name;
		this.message = message;
		this.payMoney = payMoney;
	}


	public String getPayNum() {
		return payNum;
	}

	public void setPayNum(String payNum) {
		this.payNum = payNum;
	}

	public String getCardNum() {
		return cardNum;
	}

	public void setCardNum(String cardNum) {
		this.cardNum = cardNum;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getMoonNum() {
		return moonNum;
	}

	public void setMoonNum(String moonNum) {
		this.moonNum = moonNum;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public int getPayMoney() {
		return payMoney;
	}

	public void setPayMoney(int payMoney) {
		this.payMoney = payMoney;
	}

	public Timestamp getPayDay() {
		return payDay;
	}

	public void setPayDay(Timestamp payDay) {
		this.payDay = payDay;
	}
	
	

}
