package model.pay;

import java.sql.Timestamp;

public class Pay {
	
	private String pay_num;
	private String card_num;
	private String user_id;
	private String moon_num;
	private String name;
	private String message;
	private String pay_money;
	private Timestamp pay_day;
	
	public Pay(String pay_num, String card_num, String user_id, String moon_num, String name, String message,
			String pay_money, Timestamp pay_day) {
		this.pay_num = pay_num;
		this.card_num = card_num;
		this.user_id = user_id;
		this.moon_num = moon_num;
		this.name = name;
		this.message = message;
		this.pay_money = pay_money;
		this.pay_day = pay_day;
	}
	
	
	public String getPay_num() {
		return pay_num;
	}
	public String getCard_num() {
		return card_num;
	}
	public String getUser_id() {
		return user_id;
	}
	public String getMoon_num() {
		return moon_num;
	}
	public String getName() {
		return name;
	}
	public String getMessage() {
		return message;
	}
	public String getPay_money() {
		return pay_money;
	}
	public Timestamp getPay_day() {
		return pay_day;
	}
	
	
	

}
