package hotel.model;

public class Room { 
	
	private String[] type;
	private int[] price;
	private String[] breakfast;
	private int[] person;
	private int[] stock;
	private String[] num;
	
	private int r_num;
	private int h_num;
	private String r_type;
	private int r_price;
	private int r_person;
	private String r_breakfast;
	private int r_stock;
	private String originHname;
	
	public Room() {
		super();
		
	}

	public Room(String r_type, int r_price, int r_person, int r_stock, String r_breakfast, int h_num) {
		super();
		this.r_type = r_type;
		this.r_price = r_price;
		this.r_person = r_person;
		this.r_stock = r_stock;
		this.r_breakfast = r_breakfast;
		this.h_num = h_num;
	}
	
	

	public Room(int r_num, String r_type, int r_price, int r_person, int r_stock, String r_breakfast) {
		super();
		this.r_num = r_num;
		this.r_type = r_type;
		this.r_price = r_price;
		this.r_person = r_person;
		this.r_stock = r_stock;
		this.r_breakfast = r_breakfast;
	}

	public String[] getType() {
		return type;
	}



	public void setType(String[] type) {
		this.type = type;
	}



	public int[] getPrice() {
		return price;
	}



	public void setPrice(int[] price) {
		this.price = price;
	}



	public String[] getBreakfast() {
		return breakfast;
	}



	public void setBreakfast(String[] breakfast) {
		this.breakfast = breakfast;
	}



	public int[] getPerson() {
		return person;
	}



	public void setPerson(int[] person) {
		this.person = person;
	}



	public int[] getStock() {
		return stock;
	}



	public void setStock(int[] stock) {
		this.stock = stock;
	}

	

	public String[] getNum() {
		return num;
	}

	public void setNum(String[] num) {
		this.num = num;
	}

	public int getR_num() {
		return r_num;
	}


	public void setR_num(int r_num) {
		this.r_num = r_num;
	}


	public String getR_type() {
		return r_type;
	}



	public void setR_type(String r_type) {
		this.r_type = r_type;
	}



	public int getR_price() {
		return r_price;
	}



	public void setR_price(int r_price) {
		this.r_price = r_price;
	}



	public int getR_person() {
		return r_person;
	}



	public void setR_person(int r_person) {
		this.r_person = r_person;
	}



	public int getR_stock() {
		return r_stock;
	}



	public void setR_stock(int r_stock) {
		this.r_stock = r_stock;
	}



	public String getR_breakfast() {
		return r_breakfast;
	}



	public void setR_breakfast(String r_breakfast) {
		this.r_breakfast = r_breakfast;
	}


	public int getH_num() {
		return h_num;
	}


	public void setH_num(int h_num) {
		this.h_num = h_num;
	}


	public String getOriginHname() {
		return originHname;
	}


	public void setOriginHname(String originHname) {
		this.originHname = originHname;
	}
	
	
	
}