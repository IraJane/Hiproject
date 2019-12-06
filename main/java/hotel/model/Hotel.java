package hotel.model;

import java.util.Arrays;
import java.util.List;

import org.hibernate.validator.constraints.NotEmpty;

public class Hotel {
	private int num;
	private int selNum;
	@NotEmpty(message = "호텔이름은 필수입니다.")
	private String h_name;
	private String h_nation;
	private String h_address1;
	private String h_address2;
	private String h_type;
	private String h_phone;
	private String h_facilities;
	private String h_internet;
	private String h_animal;
	private String h_parking;
	private String h_smoke;
	private String h_language;
	private String h_hotel_url;
	private String h_image;
	private String h_comment;
	private int h_room_num;
	private String[] images;
	private List<Room> rooms;
	
	
	public Hotel() {
		super();
		// TODO Auto-generated constructor stub
	}


	public int getNum() {
		return num;
	}


	public void setNum(int num) {
		this.num = num;
	}


	public int getSelNum() {
		return selNum;
	}


	public void setSelNum(int selNum) {
		this.selNum = selNum;
	}


	public String getH_name() {
		return h_name;
	}


	public void setH_name(String h_name) {
		this.h_name = h_name;
	}


	public String getH_nation() {
		return h_nation;
	}


	public void setH_nation(String h_nation) {
		this.h_nation = h_nation;
	}


	public String getH_address1() {
		return h_address1;
	}


	public void setH_address1(String h_address1) {
		this.h_address1 = h_address1;
	}


	public String getH_address2() {
		return h_address2;
	}


	public void setH_address2(String h_address2) {
		this.h_address2 = h_address2;
	}


	public String getH_type() {
		return h_type;
	}


	public void setH_type(String h_type) {
		this.h_type = h_type;
	}


	public String getH_phone() {
		return h_phone;
	}


	public void setH_phone(String h_phone) {
		this.h_phone = h_phone;
	}


	public String getH_facilities() {
		return h_facilities;
	}


	public void setH_facilities(String h_facilities) {
		this.h_facilities = h_facilities;
	}


	public String getH_internet() {
		return h_internet;
	}


	public void setH_internet(String h_internet) {
		this.h_internet = h_internet;
	}


	public String getH_animal() {
		return h_animal;
	}


	public void setH_animal(String h_animal) {
		this.h_animal = h_animal;
	}


	public String getH_parking() {
		return h_parking;
	}


	public void setH_parking(String h_parking) {
		this.h_parking = h_parking;
	}


	public String getH_smoke() {
		return h_smoke;
	}


	public void setH_smoke(String h_smoke) {
		this.h_smoke = h_smoke;
	}


	public String getH_language() {
		return h_language;
	}


	public void setH_language(String h_language) {
		this.h_language = h_language;
	}


	public String getH_hotel_url() {
		return h_hotel_url;
	}


	public void setH_hotel_url(String h_hotel_url) {
		this.h_hotel_url = h_hotel_url;
	}


	public String getH_image() {
		return h_image;
	}


	public void setH_image(String h_image) {
		this.h_image = h_image;
	}


	public String getH_comment() {
		return h_comment;
	}


	public void setH_comment(String h_comment) {
		this.h_comment = h_comment;
	}


	public int getH_room_num() {
		return h_room_num;
	}


	public void setH_room_num(int h_room_num) {
		this.h_room_num = h_room_num;
	}


	public String[] getImages() {
		return images;
	}


	public void setImages(String[] images) {
		this.images = images;
	}


	public List<Room> getRooms() {
		return rooms;
	}


	public void setRooms(List<Room> rooms) {
		this.rooms = rooms;
	}


	public Hotel(int num, int selNum, String h_name, String h_nation, String h_address1, String h_address2,
			String h_type, String h_phone, String h_facilities, String h_internet, String h_animal, String h_parking,
			String h_smoke, String h_language, String h_hotel_url, String h_image, String h_comment, int h_room_num,
			String[] images, List<Room> rooms) {
		super();
		this.num = num;
		this.selNum = selNum;
		this.h_name = h_name;
		this.h_nation = h_nation;
		this.h_address1 = h_address1;
		this.h_address2 = h_address2;
		this.h_type = h_type;
		this.h_phone = h_phone;
		this.h_facilities = h_facilities;
		this.h_internet = h_internet;
		this.h_animal = h_animal;
		this.h_parking = h_parking;
		this.h_smoke = h_smoke;
		this.h_language = h_language;
		this.h_hotel_url = h_hotel_url;
		this.h_image = h_image;
		this.h_comment = h_comment;
		this.h_room_num = h_room_num;
		this.images = images;
		this.rooms = rooms;
	}


	


	@Override
	public String toString() {
		return "Hotel [num=" + num + ", selNum=" + selNum + ", h_name=" + h_name + ", h_nation=" + h_nation
				+ ", h_address1=" + h_address1 + ", h_address2=" + h_address2 + ", h_type=" + h_type + ", h_phone="
				+ h_phone + ", h_facilities=" + h_facilities + ", h_internet=" + h_internet + ", h_animal=" + h_animal
				+ ", h_parking=" + h_parking + ", h_smoke=" + h_smoke + ", h_language=" + h_language + ", h_hotel_url="
				+ h_hotel_url + ", h_image=" + h_image + ", h_comment=" + h_comment + ", h_room_num=" + h_room_num
				+ ", images=" + Arrays.toString(images) + ", rooms=" + rooms + "]";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	

	
	
	
	
	
	
	
}
