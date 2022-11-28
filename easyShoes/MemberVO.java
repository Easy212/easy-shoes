package easyShoes;

import java.sql.Date;

public class MemberVO {
	private String id; //아이디
	private String name; //이름
	private String pw; //비밀번호
	private String confirmPw; //비밀번호
	private String hp; //전화번호
	private String email; //이메일
	private String sex; //성별
	private Date birth; //생년월일
	private String region; //지역
	private int shoesSize;//신발사이즈
	
	
	public MemberVO() {
		
	}
	public MemberVO(String id, String name, String pw, String confirmPw, String hp, String email, String sex,
			Date birth, String region, int shoesSize) {
		this.id = id;
		this.name = name;
		this.pw = pw;
		this.confirmPw = confirmPw;
		this.hp = hp;
		this.email = email;
		this.sex = sex;
		this.birth = birth;
		this.region = region;
		this.shoesSize = shoesSize;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getConfirmPw() {
		return confirmPw;
	}
	public void setConfirmPw(String confirmPw) {
		this.confirmPw = confirmPw;
	}
	public String getHp() {
		return hp;
	}
	public void setHp(String hp) {
		this.hp = hp;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public Date getBirth() {
		return birth;
	}
	public void setBirth(Date birth) {
		this.birth = birth;
	}
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	public int getShoesSize() {
		return shoesSize;
	}
	public void setShoesSize(int shoesSize) {
		this.shoesSize = shoesSize;
	}
	
}


