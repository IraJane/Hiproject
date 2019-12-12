package hotel.model;

public class Search {
	private String area;
	private String checkin;
	private String checkout;
	private String adult;
	private String child;
	private String room;
	private String searchas;
	private String filterType;
	private String[] filters;
		
	public Search() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Search(String area, String checkin, String checkout, String adult, String child, String room) {
		super();
		this.area = area;
		this.checkin = checkin;
		this.checkout = checkout;
		this.adult = adult;
		this.child = child;
		this.room = room;
	}

	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
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
	public String getAdult() {
		return adult;
	}
	public void setAdult(String adult) {
		this.adult = adult;
	}
	public String getChild() {
		return child;
	}
	public void setChild(String child) {
		this.child = child;
	}
	public String getRoom() {
		return room;
	}
	public void setRoom(String room) {
		this.room = room;
	}
	
	public String getSearchas() {
		return searchas;
	}

	public void setSearchas(String searchas) {
		this.searchas = searchas;
	}


	public String getFilterType() {
		return filterType;
	}

	public void setFilterType(String filterType) {
		this.filterType = filterType;
	}

	public String[] getFilters() {
		return filters;
	}

	public void setFilters(String[] filters) {
		this.filters = filters;
	}

	
	
	
}