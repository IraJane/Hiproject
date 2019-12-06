package member.model;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

public class Member {
	private int m_num;
	@Email(message="이메일을 입력하세요")
	private String m_email;
	@Length(min=6, max=12, message="비밀번호는 6~12자리로 입력하세요")
	private String m_password;
	@NotEmpty(message="사용할 닉네임을 입력하세요")
	private String m_nickname;
	@NotEmpty(message="이름을 입력하세요")
	private String m_name;
	@NotEmpty(message="전화번호를 입력하세요")
	private String m_phone;
	@Length(min=6, max=12, message="비밀번호는 6~12자리로 입력하세요")
	private String new_m_password;
	
	
	
	public String getNew_m_password() {
		return new_m_password;
	}
	public void setNew_m_password(String new_m_password) {
		this.new_m_password = new_m_password;
	}
	public int getM_num() {
		return m_num;
	}
	public void setM_num(int m_num) {
		this.m_num = m_num;
	}
	public String getM_email() {
		return m_email;
	}
	public void setM_email(String m_email) {
		this.m_email = m_email;
	}
	public String getM_password() {
		return m_password;
	}
	public void setM_password(String m_password) {
		this.m_password = m_password;
	}
	public String getM_nickname() {
		return m_nickname;
	}
	public void setM_nickname(String m_nickname) {
		this.m_nickname = m_nickname;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_phone() {
		return m_phone;
	}
	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}
	
	public Member(int m_num, String m_email, String m_password, String m_nickname, String m_name, String m_phone) {
		super();
		this.m_num = m_num;
		this.m_email = m_email;
		this.m_password = m_password;
		this.m_nickname = m_nickname;
		this.m_name = m_name;
		this.m_phone = m_phone;
	}
	
	public Member() {
		super();
	}
	@Override
	public String toString() {
		return "Member [m_num=" + m_num + ", m_email=" + m_email + ", m_password=" + m_password + ", m_nickname="
				+ m_nickname + ", m_name=" + m_name + ", m_phone=" + m_phone + "]";
	}
	
	
}