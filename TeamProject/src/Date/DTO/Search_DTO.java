package Date.DTO;

public class Search_DTO {
	private String id;//ID
	private String pw;//암호
	private String name;//이름
	private String jumin;//주민번호
	private String phone;//휴대폰
	private String nick;//닉네임
	private String email;//이메일
	private int gender;//성별
	private int age;//나이
	private String address;
	private int admin;
	
	private String u_mypicture;	// 프로필 사진
	
	public String getU_mypicture() {
		return u_mypicture;
	}
	public void setU_mypicture(String u_mypicture) {
		this.u_mypicture = u_mypicture;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getJumin() {
		return jumin;
	}
	public void setJumin(String jumin) {
		this.jumin = jumin;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getGender() {
		return gender;
	}
	public void setGender(int gender) {
		this.gender = gender;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getAdmin() {
		return admin;
	}
	public void setAdmin(int admin) {
		this.admin = admin;
	}
	
	
	
	
	
	
}
