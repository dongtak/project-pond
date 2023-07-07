
package model.user;

import java.util.Date;

public class UserRequestDto {
	

	private String id;
	private String pwd;
	private String name;
	private String email;
	private int birth;
	private String phone;
	private String address;

	
	
	
	public UserRequestDto(String id, String pwd, String name, String email, int birth, String phone, String address
			) {
		
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.email = email;
		this.birth = birth;
		this.phone = phone;
		this.address = address;

	}
	
	public UserRequestDto(String id, String pwd, String name, String email
			) {
		
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.email = email;

	}
	

	
	public UserRequestDto(String id, String pwd, String name, String email, int birth, String phone
		) {
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.email = email;
		this.birth = birth;
		this.phone = phone;

	}
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getBirth() {
		return birth;
	}
	public void setBirth(int birth) {
		this.birth = birth;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}

	
	
	


	
	
	
	

}
