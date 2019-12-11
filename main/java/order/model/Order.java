package order.model;

public class Order {
	
	private int onum; //예약 고유 번호
	private String oemail; //예약 이메일
	private String oname; //예약 사람 이름 
	private String hname; //호텔이름
	private String orderdate; //예약한 날짜 
	private String checkin; //체크인
	private String checkout; //체크아웃 
	private String people; //인원 
	private String roomtype; //예약한 방 타입 
	private String totalprice; //가격
	private String comments; //comments
	private String checker; //체크인 했나 안했나 확인용 0과1로만 
	
	
	
	
	
	public int getOnum() {
		return onum;
	}
	public void setOnum(int onum) {
		this.onum = onum;
	}
	public String getOemail() {
		return oemail;
	}
	public void setOemail(String oemail) {
		this.oemail = oemail;
	}
	public String getOname() {
		return oname;
	}
	public void setOname(String oname) {
		this.oname = oname;
	}
	public String getHname() {
		return hname;
	}
	public void setHname(String hname) {
		this.hname = hname;
	}
	public String getOrderdate() {
		return orderdate;
	}
	public void setOrderdate(String orderdate) {
		this.orderdate = orderdate;
	}
	public String getCheckin() {
		return checkin;
	}
	public void setCheckin(String checkin) {
		this.checkin = checkin;
	}
	public String getCheckout() {
		return checkout;
	}
	public void setCheckout(String checkout) {
		this.checkout = checkout;
	}
	public String getPeople() {
		return people;
	}
	public void setPeople(String people) {
		this.people = people;
	}
	public String getRoomtype() {
		return roomtype;
	}
	public void setRoomtype(String roomtype) {
		this.roomtype = roomtype;
	}
	public String getTotalprice() {
		return totalprice;
	}
	public void setTotalprice(String totalprice) {
		this.totalprice = totalprice;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public String getChecker() {
		return checker;
	}
	public void setChecker(String checker) {
		this.checker = checker;
	}
	public Order(int onum,String oemail, String oname, String hname, String orderdate, String checkin, String checkout,
			String people, String roomtype, String totalprice, String comments, String checker) {
		super();
		this.onum = onum;
		this.oemail = oemail;
		this.oname = oname;
		this.hname = hname;
		this.orderdate = orderdate;
		this.checkin = checkin;
		this.checkout = checkout;
		this.people = people;
		this.roomtype = roomtype;
		this.totalprice = totalprice;
		this.comments = comments;
		this.checker = checker;
	}
	public Order() {
		super();
	}
	@Override
	public String toString() {
		return "Order [oemail=" + onum+oemail + ", oname=" + oname + ", hname=" + hname + ", orderdate=" + orderdate
				+ ", checkin=" + checkin + ", checkout=" + checkout + ", people=" + people + ", roomtype=" + roomtype
				+ ", totalprice=" + totalprice + ", comments=" + comments + ", checker=" + checker + "]";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
