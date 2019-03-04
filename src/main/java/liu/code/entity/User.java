package liu.code.entity;

public class User {
	private Integer uid;
	private String  name;
	private int   gender;
	private String telephone;
	private String password;
	private String address;
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getGender() {
		return gender;
	}
	public void setGender(int gender) {
		this.gender = gender;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public User(Integer uid, String name, int gender, String telephone, String password, String address) {
		super();
		this.uid = uid;
		this.name = name;
		this.gender = gender;
		this.telephone = telephone;
		this.password = password;
		this.address = address;
	}
	public User(String telephone, String password) {
		super();
		this.telephone = telephone;
		this.password = password;
	}
	public User() {
		super();
	}
	
}
