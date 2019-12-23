package member.model;

import java.util.Date;

public class ReviewComposite {
	private int c_num;
	private Date c_date;
	private int c_star;
	private String c_comment;
	private String m_nickname;
	private Date o_checkin;
	private Date o_checkout;
	private String r_type;
	private String h_name;
	
	
	
	public int getC_num() {
		return c_num;
	}
	public void setC_num(int c_num) {
		this.c_num = c_num;
	}
	public Date getC_date() {
		return c_date;
	}
	public void setC_date(Date c_date) {
		this.c_date = c_date;
	}
	public int getC_star() {
		return c_star;
	}
	public void setC_star(int c_star) {
		this.c_star = c_star;
	}
	public String getC_comment() {
		return c_comment;
	}
	public void setC_comment(String c_comment) {
		this.c_comment = c_comment;
	}
	public String getM_nickname() {
		return m_nickname;
	}
	public void setM_nickname(String m_nickname) {
		this.m_nickname = m_nickname;
	}
	public Date getO_checkin() {
		return o_checkin;
	}
	public void setO_checkin(Date o_checkin) {
		this.o_checkin = o_checkin;
	}
	public Date getO_checkout() {
		return o_checkout;
	}
	public void setO_checkout(Date o_checkout) {
		this.o_checkout = o_checkout;
	}
	public String getR_type() {
		return r_type;
	}
	public void setR_type(String r_type) {
		this.r_type = r_type;
	}
	public String getH_name() {
		return h_name;
	}
	public void setH_name(String h_name) {
		this.h_name = h_name;
	}
	
	
	public ReviewComposite(int c_num, Date c_date, int c_star, String c_comment, String m_nickname, Date o_checkin,
			Date o_checkout, String r_type, String h_name) {
		super();
		this.c_num = c_num;
		this.c_date = c_date;
		this.c_star = c_star;
		this.c_comment = c_comment;
		this.m_nickname = m_nickname;
		this.o_checkin = o_checkin;
		this.o_checkout = o_checkout;
		this.r_type = r_type;
		this.h_name = h_name;
	}
	public ReviewComposite() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}