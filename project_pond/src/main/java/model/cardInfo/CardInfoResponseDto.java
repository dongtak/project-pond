package model.cardInfo;

public class CardInfoResponseDto {
	private String cardNum;
	private String userId;
	private String cardName;
	private String cardPwd;
	private String cardExpire;
	
	public CardInfoResponseDto(String cardNum, String userId, String cardName, String cardPwd, String cardExpire) {
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
	public void setCardNum(String cardNum) {
		this.cardNum = cardNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getCardName() {
		return cardName;
	}
	public void setCardName(String cardName) {
		this.cardName = cardName;
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
