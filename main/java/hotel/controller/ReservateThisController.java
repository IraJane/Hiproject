package hotel.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import hotel.model.Search;

@Controller
public class ReservateThisController {
	private final String commend = "reservate.ho";
	private final String getPage = "reservateForm";
	
	
	@Autowired
	HotelDao hotelDao;
	
	@Autowired
	RoomDao roomDao;
	
	
	@RequestMapping(commend)
	public String reservate (@RequestParam("h_num") int h_num,@RequestParam("whichrooms") String whichrooms,
			@RequestParam("howmanyrooms") String howmanyrooms,
			Room room,Search search,Model model,HttpSession session) {
		
		/*Member login = (Member) session.getAttribute("loginfo");
		System.out.println(login);*/
		System.out.println("h_num:"+h_num);
		
		
		
		Hotel hotel =hotelDao.getHotelOne(h_num);
		
		
		
		
		System.out.println(whichrooms + ";" + howmanyrooms);
		
		String[] aa = whichrooms.split(","); //방번호	
		String[] bb = howmanyrooms.split(",");  //방 갯수 
		/*for(String th:a) {
			System.out.println("th:"+th);
			
		}*/
		
		Map<String, String> rooms = new HashMap<String, String>();
		for(int i = 1;i<aa.length;i++) {
			
			String r_num = aa[i];
			String howmany = bb[i];
			
			rooms.put(r_num, howmany);
			model.addAttribute("rooms",rooms);
			System.out.println("rooms:"+rooms);
			
		}
		
		List<Room> list = roomDao.getRoomAllList();
		model.addAttribute("list",list);
		System.out.println(list.size());
		
		
		
		
		
		
		
		
		
		
		
		
		model.addAttribute("hotel",hotel);
		model.addAttribute("search",search);
	/*	model.addAttribute("login",login);*/
		
		
		
		
		return getPage;
	}

}
