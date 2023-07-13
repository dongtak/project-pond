package model.admin;

public class Admin {

	private String admin_id;
	private String admin_pwd;
	private String admin_name;
	private String admin_auth;
	
	
	public Admin(String admin_id, String admin_pwd, String admin_name, String admin_auth) {
		super();
		this.admin_id = admin_id;
		this.admin_pwd = admin_pwd;
		this.admin_name = admin_name;
		this.admin_auth = admin_auth;
	}
	
	public String getAdmin_id() {
		return admin_id;
	}
	public String getAdmin_pwd() {
		return admin_pwd;
	}
	public String getAdmin_name() {
		return admin_name;
	}
	public String getAdmin_auth() {
		return admin_auth;
	}
	






}
	
	
