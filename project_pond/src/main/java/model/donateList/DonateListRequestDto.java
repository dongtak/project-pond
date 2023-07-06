package model.donateList;

public class DonateListRequestDto {
	
	private String userId;
	private String moonNum;
	
	
	public DonateListRequestDto(String userId, String moonNum) {
		
		this.userId = userId;
		this.moonNum = moonNum;
	
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
	
	
	
	
	
	
	

}
