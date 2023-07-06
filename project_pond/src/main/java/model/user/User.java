package model.user;

public class User {

	private String id;
	private String email;
	private String pwd;
	private String name;
	private int birth;
	private String phone;
	private String address;
	private int rank;
	
	
	public User(String id, String email, String pwd, String name, int birth, String phone, String address, int rank) {
		
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


	public String getEmail() {
		return email;
	}


	public String getPwd() {
		return pwd;
	}


	public String getName() {
		return name;
	}


	public int getBirth() {
		return birth;
	}


	public String getPhone() {
		return phone;
	}


	public String getAddress() {
		return address;
	}


	public int getRank() {
		return rank;
	}
	
	
	
	
	

	
}
