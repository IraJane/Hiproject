package member.model;

import java.util.Date;

public class Review {
	private int c_num;
	private int m_num;
	private int o_num;
	private String c_comment;
	private int c_star;
	private int c_checker;
	private int h_num;
	private Date c_date;
	
	
	public Date getC_date() {
		return c_date;
	}
	public void setC_date(Date c_date) {
		this.c_date = c_date;
	}
	public int getH_num() {
		return h_num;
	}
	public void setH_num(int h_num) {
		this.h_num = h_num;
	}
	public int getC_num() {
		return c_num;
	}
	public void setC_num(int c_num) {
		this.c_num = c_num;
	}
	public int getM_num() {
		return m_num;
	}
	public void setM_num(int m_num) {
		this.m_num = m_num;
	}
	public int getO_num() {
		return o_num;
	}
	public void setO_num(int o_num) {
		this.o_num = o_num;
	}
	public String getC_comment() {
		return c_comment;
	}
	public void setC_comment(String c_comment) {
		this.c_comment = c_comment;
	}
	public int getC_star() {
		return c_star;
	}
	public void setC_star(int c_star) {
		this.c_star = c_star;
	}
	public int getC_checker() {
		return c_checker;
	}
	public void setC_checker(int c_checker) {
		this.c_checker = c_checker;
	}
	
	
	public Review(int c_num, int m_num, int o_num, String c_comment, int c_star, int c_checker, int h_num,
			Date c_date) {
		super();
		this.c_num = c_num;
		this.m_num = m_num;
		this.o_num = o_num;
		this.c_comment = c_comment;
		this.c_star = c_star;
		this.c_checker = c_checker;
		this.h_num = h_num;
		this.c_date = c_date;
	}
	public Review() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
}