package hotel.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import hotel.model.HotelDao;
import hotel.model.Room;
import hotel.model.RoomDao;
import member.model.Member;

@Controller
public class ReservateThisController {
	private final String commend = "reservate.ho";
	private final String getPage = "reservateForm";
	
	
	@Autowired
	HotelDao hotelDao;
	
	@Autowired
	RoomDao roomDao;
	
	
	@RequestMapping(commend)
	public String reservate (@RequestParam("totalprice") String totalprice,
			@RequestParam(value="checkin",required=false) String checkin,
			@RequestParam(value="checkout",required=false) String checkout,
			@RequestParam(value="adult",required=false) String adult,
			@RequestParam(value="child",required=false) String child,
			Room room,Model model,HttpSession session) {
		
		Member login = (Member) session.getAttribute("loginfo");
		System.out.println(login);
		
		System.out.println("totalprice"+totalprice);
		System.out.println("rb:"+room+adult+child);
		model.addAttribute("totalprice",totalprice);
		model.addAttribute("checkin",checkin);
		model.addAttribute("checkout",checkout);
		model.addAttribute("adult",adult);
		model.addAttribute("child",child);
		
		int kid = Integer.parseInt(child);
		int people = Integer.parseInt(adult);
		
		
		
		
		
		if(kid>1) {
			int a = kid/2;
			people = people + a;
			model.addAttribute("people",people);
			
		}
		
		
		
		
		return getPage;
	}

}
