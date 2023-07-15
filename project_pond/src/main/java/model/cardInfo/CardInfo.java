package model.cardInfo;

public class CardInfo {
	private String cardNum;
	private String userId;
	private String cardName;
	private String cardPwd;
	private String cardExpire;
	
	
	public CardInfo(String cardNum, String userId, String cardName, String cardPwd, String cardExpire) {
		super();
		this.cardNum = cardNum;
		this.userId = userId;
		this.cardName = cardName;
		this.cardPwd = cardPwd;
		this.cardExpire = cardExpire;
	}


	public String getCardNum() {
		return cardNum;
	}


	public String getUserId() {
		return userId;
	}


	public String getCardName() {
		return cardName;
	}


	public String getCardPwd() {
		return cardPwd;
	}


	public String getCardExpire() {
		return cardExpire;
	}
	
	
	
}
