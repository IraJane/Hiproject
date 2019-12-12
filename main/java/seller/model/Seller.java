package seller.model;

import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;
import org.hibernate.validator.constraints.Range;

public class Seller {
	private int s_num;
	@Email(message="이메일 형태로 입력해주세요")
	private String s_email;
	
	@NotEmpty(message="비밀번호를 입력해주세요")
	private String s_password;
	
	@NotEmpty(message="이름을 입력해주세요")
	private String s_name;
	
	@Pattern(regexp="^[0-9]+$", message="숫자만 입력해주세요")
	@Size(min=10, max=11, message="전화번호양식에 부적합합니다")
	private String s_phone;
	
	@Size(min=10, max=10, message="숫자 10자를 입력해주세요")
	private String s_comnumber;

	public int getS_num() {
		return s_num;
	}

	public void setS_num(int s_num) {
		this.s_num = s_num;
	}

	public String getS_email() {
		return s_email;
	}

	public void setS_email(String s_email) {
		this.s_email = s_email;
	}

	public String getS_password() {
		return s_password;
	}

	public void setS_password(String s_password) {
		this.s_password = s_password;
	}

	public String getS_name() {
		return s_name;
	}

	public void setS_name(String s_name) {
		this.s_name = s_name;
	}

	public String getS_phone() {
		return s_phone;
	}

	public void setS_phone(String s_phone) {
		this.s_phone = s_phone;
	}

	public String getS_comnumber() {
		return s_comnumber;
	}

	public void setS_comnumber(String s_comnumber) {
		this.s_comnumber = s_comnumber;
	}

	public Seller(int s_num, String s_email, String s_password, String s_name, String s_phone, String s_comnumber) {
		super();
		this.s_num = s_num;
		this.s_email = s_email;
		this.s_password = s_password;
		this.s_name = s_name;
		this.s_phone = s_phone;
		this.s_comnumber = s_comnumber;
	}

	public Seller() {
		super();
	}

	@Override
	public String toString() {
		return "Seller [s_num=" + s_num + ", s_email=" + s_email + ", s_password=" + s_password + ", s_name=" + s_name
				+ ", s_phone=" + s_phone + ", s_comnumber=" + s_comnumber + "]";
	}
	
	
	
	
	
	
	
	
	
	
}
