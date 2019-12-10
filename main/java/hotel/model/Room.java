package hotel.model;

import java.util.Arrays;

public class Room { 
	
	private String[] type;
	private int[] price;
	private String[] breakfast;
	private int[] person;
	private int[] stock;
	private int selnum;


	private String r_type;
	private int r_price;
	private int r_person;
	private int r_stock;
	private String r_breakfast;
	private String hname;
	
	
	
	
	public Room(String[] type, int[] price, String[] breakfast, int[] person, int[] stock, int selnum, String r_type,
			int r_price, int r_person, int r_stock, String r_breakfast, String hname) {
		super();
		this.type = type;
		this.price = price;
		this.breakfast = breakfast;
		this.person = person;
		this.stock = stock;
		this.selnum = selnum;
		this.r_type = r_type;
		this.r_price = r_price;
		this.r_person = r_person;
		this.r_stock = r_stock;
		this.r_breakfast = r_breakfast;
		this.hname = hname;
	}
	public int getSelnum() {
		return selnum;
	}
	public void setSelnum(int selnum) {
		this.selnum = selnum;
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
	public String getHname() {
		return hname;
	}
	public void setHname(String hname) {
		this.hname = hname;
	}
	@Override
	public String toString() {
		return "Room [type=" + Arrays.toString(type) + ", price=" + Arrays.toString(price) + ", breakfast="
				+ Arrays.toString(breakfast) + ", person=" + Arrays.toString(person) + ", stock="
				+ Arrays.toString(stock) + ", r_type=" + r_type + ", r_price=" + r_price + ", r_person=" + r_person
				+ ", r_stock=" + r_stock + ", r_breakfast=" + r_breakfast + ", hname=" + hname + "]";
	}
	public Room(String[] type, int[] price, String[] breakfast, int[] person, int[] stock, String r_type, int r_price,
			int r_person, int r_stock, String r_breakfast, String hname) {
		super();
		this.type = type;
		this.price = price;
		this.breakfast = breakfast;
		this.person = person;
		this.stock = stock;
		this.r_type = r_type;
		this.r_price = r_price;
		this.r_person = r_person;
		this.r_stock = r_stock;
		this.r_breakfast = r_breakfast;
		this.hname = hname;
	}
	public Room() {
		super();
	}
	
	
	public Room(String r_type, int r_price, int r_person, int r_stock, String r_breakfast, String hname,int selnum) {
		super();
		this.r_type = r_type;
		this.r_price = r_price;
		this.r_person = r_person;
		this.r_stock = r_stock;
		this.r_breakfast = r_breakfast;
		this.hname = hname;
		this.selnum = selnum;
	}
	
	
	
	
	
	
	
	
	
}