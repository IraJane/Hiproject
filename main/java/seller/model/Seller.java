package seller.model;

import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;
import org.hibernate.validator.constraints.Range;

public class Seller {
	private int num;
	@Email(message="이메일 형태로 입력해주세요")
	private String email;
	
	@NotEmpty(message="비밀번호를 입력해주세요")
	private String password;
	
	@NotEmpty(message="이름을 입력해주세요")
	private String name;
	
	@Pattern(regexp="^[0-9]+$", message="숫자만 입력해주세요")
	@Size(min=10, max=11, message="전화번호양식에 부적합합니다")
	private String phone;
	
	@Size(min=10, max=10, message="숫자 10자를 입력해주세요")
	private String comnumber;
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getComnumber() {
		return comnumber;
	}
	public void setComnumber(String comnumber) {
		this.comnumber = comnumber;
	}
	public Seller(int num, String email, String password, String name, String telephone, String comnumber) {
		super();
		this.num = num;
		this.email = email;
		this.password = password;
		this.name = name;
		this.phone = phone;
		this.comnumber = comnumber;
	}
	public Seller() {
		super();
	}
	@Override
	public String toString() {
		return "Seller [num=" + num + ", email=" + email + ", password=" + password + ", name=" + name + ", phone="
				+ phone + ", comnumber=" + comnumber + "]";
	}
	
	
	
	
	
	
}
