package hotel.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
public class HotelSearchController {
	private final String commend = "Search.ho";
	private final String gotoPage = "bigSearch";
	
	@Autowired
	HotelDao hoDao;
	
	@Autowired
	RoomDao roomDao;
	
	
	
	@RequestMapping(commend)
	public String search (HttpServletRequest request,@RequestParam(value="area",required=false) String area, 
			@RequestParam(value="checkin",required=false) String checkin,
			@RequestParam(value="checkout",required=false) String checkout,
			@RequestParam(value="adult",required=false) String adult,
			@RequestParam(value="child",required=false) String child,
			@RequestParam(value="room",required=false) String room,
			Model model,HttpSession session) {
		
		System.out.println(area + checkin + checkout +","+  "a:"+ adult +  "a:"+  child +  "a:"+  room);
		
		
		model.addAttribute("area",area);
		model.addAttribute("checkin",checkin);
		model.addAttribute("checkout",checkout);
		model.addAttribute("adult",adult);
		model.addAttribute("child",child);
		model.addAttribute("room",room);

		
		
		String url=request.getContextPath()+commend;
		int totalCount=hoDao.getTotalCount();
		System.out.println("총 호텔 개수:"+totalCount);
		
		
		
		
		
		
		
		/*List<Hotel> list = hoDao.selectAll(area);
		System.out.println(list.size());*/
		
		
		
		
		List<Hotel> hotelList=hoDao.selectAll(area);
		System.out.println(hotelList);
		for(int i=0;i<hotelList.size();i++) {
			String[] images=hotelList.get(i).getH_image().split(";");
			hotelList.get(i).setImages(images);
			List<Room> roomList=roomDao.getRoomList(hotelList.get(i));
			hotelList.get(i).setRooms(roomList);
		}
		
		
		
	/*	model.addAttribute("list",list);*/
		model.addAttribute("hotelList",hotelList);
		
		return gotoPage;
	}
}
