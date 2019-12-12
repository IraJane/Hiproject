package order.model;

public class MainOrder {
	private int o_num;
	private int m_num ;
	private String o_orderdate ;
	private String o_checkin ;
	private String o_checkout ;
	private String o_totalpeople ;
	private String o_comment ;
	private String o_checker ;
	private String o_engname ;
	public int getO_num() {
		return o_num;
	}
	public void setO_num(int o_num) {
		this.o_num = o_num;
	}
	public int getM_num() {
		return m_num;
	}
	public void setM_num(int m_num) {
		this.m_num = m_num;
	}
	public String getO_orderdate() {
		return o_orderdate;
	}
	public void setO_orderdate(String o_orderdate) {
		this.o_orderdate = o_orderdate;
	}
	public String getO_checkin() {
		return o_checkin;
	}
	public void setO_checkin(String o_checkin) {
		this.o_checkin = o_checkin;
	}
	public String getO_checkout() {
		return o_checkout;
	}
	public void setO_checkout(String o_checkout) {
		this.o_checkout = o_checkout;
	}
	public String getO_totalpeople() {
		return o_totalpeople;
	}
	public void setO_totalpeople(String o_totalpeople) {
		this.o_totalpeople = o_totalpeople;
	}
	public String getO_comment() {
		return o_comment;
	}
	public void setO_comment(String o_comment) {
		this.o_comment = o_comment;
	}
	public String getO_checker() {
		return o_checker;
	}
	public void setO_checker(String o_checker) {
		this.o_checker = o_checker;
	}
	public String getO_engname() {
		return o_engname;
	}
	public void setO_engname(String o_engname) {
		this.o_engname = o_engname;
	}
	public MainOrder(int o_num, int m_num, String o_orderdate, String o_checkin, String o_checkout,
			String o_totalpeople, String o_comment, String o_checker, String o_engname) {
		super();
		this.o_num = o_num;
		this.m_num = m_num;
		this.o_orderdate = o_orderdate;
		this.o_checkin = o_checkin;
		this.o_checkout = o_checkout;
		this.o_totalpeople = o_totalpeople;
		this.o_comment = o_comment;
		this.o_checker = o_checker;
		this.o_engname = o_engname;
	}
	public MainOrder() {
		super();
	}
	@Override
	public String toString() {
		return "MainOrder [o_num=" + o_num + ", m_num=" + m_num + ", o_orderdate=" + o_orderdate + ", o_checkin="
				+ o_checkin + ", o_checkout=" + o_checkout + ", o_totalpeople=" + o_totalpeople + ", o_comment="
				+ o_comment + ", o_checker=" + o_checker + ", o_engname=" + o_engname + "]";
	}
	
	
	
	
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
