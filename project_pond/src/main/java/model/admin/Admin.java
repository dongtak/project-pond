package model.admin;

public class Admin {

	private String adminId;
	private String adminPwd;
	
	
	public Admin(String adminId, String adminPwd) {
		this.adminId = adminId;
		this.adminPwd = adminPwd;
	}
	
	
	public String getAdminId() {
		return adminId;
	}
	public String getAdminPwd() {
		return adminPwd;
	}

	
	
}
