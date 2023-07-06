package model.user;

public class User {

	private String id;
	private String pwd;
	private String name;
	private String email;
	private int birth;
	private String phone;
	private String address;
	private int rank;
	
	
	
	public User(String id, String pwd, String name, String email, int birth, String phone, String address, int rank) {
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.email = email;
		this.birth = birth;
		this.phone = phone;
		this.address = address;
		this.rank = rank;
	}

	public User(String id, String pwd, String name, String email, int birth, String phone, String address) {
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.email = email;
		this.birth = birth;
		this.phone = phone;
		this.address = address;

	}
	public User(String id, String pwd, String name, String email, int birth, String phone) {
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
	public String getPwd() {
		return pwd;
	}
	public String getName() {
		return name;
	}
	public String getEmail() {
		return email;
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
