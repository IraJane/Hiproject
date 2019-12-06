package hotel.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import hotel.model.Hotel;
import hotel.model.HotelDao;
import hotel.model.Room;
import hotel.model.RoomDao;

@Controller
public class HotelDetailController {

	private final String command="/hotelDetail.ho";
	private final String getPage="hotelDetail";
	
	@Autowired
	private HotelDao hotelDao;
	
	@Autowired
	private RoomDao roomDao;
	
	@RequestMapping(command)
	public String hotelDetail(@RequestParam("num") int num,
			@RequestParam(value="area",required=false) String area, 
			@RequestParam(value="checkin",required=false) String checkin,
			@RequestParam(value="checkout",required=false) String checkout,
			@RequestParam(value="adult",required=false) String adult,
			@RequestParam(value="child",required=false) String child,
			@RequestParam(value="room",required=false) String room,
			Model model) {
		
		System.out.println(area + checkin + checkout +","+  "a:"+ adult +  "a:"+  child +  "a:"+  room);
		
		
		Hotel hotel=hotelDao.getHotelOne(num);
		List<Room> rooms=roomDao.getRoomList(hotel);
		hotel.setRooms(rooms);
		hotel.setImages(hotel.getH_image().split(";"));
		
		model.addAttribute("hotel",hotel);
		model.addAttribute("rooms",rooms);
		
		return getPage;
	}
}