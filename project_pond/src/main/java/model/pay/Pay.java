package model.pay;

import java.sql.Timestamp;

public class Pay {
	
	private String payNum;
	private String cardNum;
	private String userId;
	private String moonNum;
	private String name;
	private String message;
	private int payMoney;
	private Timestamp payDay;
	
	public Pay(String payNum, String cardNum, String userId, String moonNum, String name, String message, int payMoney,
			Timestamp payDay) {
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

	public String getPayNum() {
		return payNum;
	}

	public String getCardNum() {
		return cardNum;
	}

	public String getUserId() {
		return userId;
	}

	public String getMoonNum() {
		return moonNum;
	}

	public String getName() {
		return name;
	}

	public String getMessage() {
		return message;
	}

	public int getPayMoney() {
		return payMoney;
	}

	public Timestamp getPayDay() {
		return payDay;
	}
	

}
