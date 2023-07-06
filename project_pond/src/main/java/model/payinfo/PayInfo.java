package model.payinfo;

public class PayInfo {

	private String userid;
	private String cardName;
	private String cardNum;
	private String cardPwd;
	private String cardExpire;
	
	
	public PayInfo(String userid, String cardName, String cardNum, String cardPwd, String cardExpire) {
		
		this.userid = userid;
		this.cardName = cardName;
		this.cardNum = cardNum;
		this.cardPwd = cardPwd;
		this.cardExpire = cardExpire;
	}


	public String getUserid() {
		return userid;
	}


	public String getCardName() {
		return cardName;
	}


	public String getCardNum() {
		return cardNum;
	}


	public String getCardPwd() {
		return cardPwd;
	}


	public String getCardExpire() {
		return cardExpire;
	}
	
	
	
	
	

}
