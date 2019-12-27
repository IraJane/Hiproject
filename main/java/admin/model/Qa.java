package admin.model;

import java.util.Date;

import org.hibernate.validator.constraints.NotBlank;


public class Qa {
	private int q_num;
	private int m_num;	
	@NotBlank(message="분류를 선택해주세요.")
	private String q_title;
	@NotBlank(message="내용을 입력해주세요.")
	private String q_comment;
	private Date q_regdate;	// sysdate: 문의등록일자
	private int q_checked;	//0:미답변, 1:답변
	
	private String m_email;
	
	public String getM_email() {
		return m_email;
	}
	public void setM_email(String m_email) {
		this.m_email = m_email;
	}
	
	
	
	public Qa() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Qa [q_num=" + q_num + ", m_num=" + m_num + ", q_title=" + q_title + ", q_comment=" + q_comment
				+ ", q_regdate=" + q_regdate + ", q_checked=" + q_checked + "]";
	}
	public int getQ_num() {
		return q_num;
	}
	public void setQ_num(int q_num) {
		this.q_num = q_num;
	}
	public int getM_num() {
		return m_num;
	}
	public void setM_num(int m_num) {
		this.m_num = m_num;
	}
	public String getQ_title() {
		return q_title;
	}
	public void setQ_title(String q_title) {
		this.q_title = q_title;
	}
	public String getQ_comment() {
		return q_comment;
	}
	public void setQ_comment(String q_comment) {
		this.q_comment = q_comment;
	}
	public Date getQ_regdate() {
		return q_regdate;
	}
	public void setQ_regdate(Date q_regdate) {
		this.q_regdate = q_regdate;
	}
	public int getQ_checked() {
		return q_checked;
	}
	public void setQ_checked(int q_checked) {
		this.q_checked = q_checked;
	}
	
	
	
	
}