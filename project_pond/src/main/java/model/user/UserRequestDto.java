
package model.user;

public class UserRequestDto {
	

	private String id;
	private String email;
	private String pwd;
	private String name;
	private int birth;
	private String phone;
	private String address;
	private int rank;
	
	
	
	public UserRequestDto(String id, String email, String pwd, String name, int birth, String phone, String address,
			int rank) {
		
		this.id = id;
		this.email = email;
		this.pwd = pwd;
		this.name = name;
		this.birth = birth;
		this.phone = phone;
		this.address = address;
		this.rank = rank;
	}



	public String getId() {
		return id;
	}



	public void setId(String id) {
		this.id = id;
	}



	public String getEmail() {
		return email;
	}



	public void setEmail(String email) {
		this.email = email;
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



	public int getRank() {
		return rank;
	}



	public void setRank(int rank) {
		this.rank = rank;
	}
	
	
	
	
	
	
	
	
	

}
