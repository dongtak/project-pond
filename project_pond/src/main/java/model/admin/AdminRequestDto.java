package model.admin;

public class AdminRequestDto {
	
	private String adminId;
	private String adminPwd;
	
	
	public AdminRequestDto(String adminId, String adminPwd) {

		this.adminId = adminId;
		this.adminPwd = adminPwd;
	}


	public String getAdminId() {
		return adminId;
	}


	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}


	public String getAdminPwd() {
		return adminPwd;
	}


	public void setAdminPwd(String adminPwd) {
		this.adminPwd = adminPwd;
	}
	
	
	
	

	
	
	

}
