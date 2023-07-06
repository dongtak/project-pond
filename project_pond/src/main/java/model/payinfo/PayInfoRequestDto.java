package model.payinfo;

public class PayInfoRequestDto {
	
	
	private String userid;
	private String cardName;
	private String cardNum;
	private String cardPwd;
	private String cardExpire;
	
	
	public PayInfoRequestDto(String userid, String cardName, String cardNum, String cardPwd, String cardExpire) {
		
		this.userid = userid;
		this.cardName = cardName;
		this.cardNum = cardNum;
		this.cardPwd = cardPwd;
		this.cardExpire = cardExpire;
	}


	public String getUserid() {
		return userid;
	}


	public void setUserid(String userid) {
		this.userid = userid;
	}


	public String getCardName() {
		return cardName;
	}


	public void setCardName(String cardName) {
		this.cardName = cardName;
	}


	public String getCardNum() {
		return cardNum;
	}


	public void setCardNum(String cardNum) {
		this.cardNum = cardNum;
	}


	public String getCardPwd() {
		return cardPwd;
	}


	public void setCardPwd(String cardPwd) {
		this.cardPwd = cardPwd;
	}


	public String getCardExpire() {
		return cardExpire;
	}


	public void setCardExpire(String cardExpire) {
		this.cardExpire = cardExpire;
	}
	
	
	
	
	
	
	
	
	

}
