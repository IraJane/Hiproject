package admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import hotel.model.Hotel;
import hotel.model.HotelDao;
import hotel.model.Room;
import hotel.model.RoomDao;
import member.model.Member;
import member.model.MemberDao;
import order.model.MainOrder;
import order.model.MainOrderDao;
import order.model.OrderDetail;
import order.model.OrderDetailDao;

@Controller("adminSellerHotelNowController")
public class SellerHotelNowController {

	private final String command ="hotelNow.ad";
	private final String getPage="adHotelNow";
	
	
	@Autowired
	private HotelDao hotelDao;
	
	@Autowired
	private RoomDao roomDao;
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private MainOrderDao mainOrderDao;
	
	@Autowired
	private OrderDetailDao orderDetailDao;
	
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String doAction(
			@RequestParam("s_num") int s_num, 
			Model model) {
		
		
		List<Hotel> hotel = hotelDao.getList(s_num);
		System.out.println("hotel:" + hotel);
		model.addAttribute("hotel",hotel);
		
		
		List<MainOrder> mainOlist = mainOrderDao.getSellerOrders();
		model.addAttribute("mainOlist", mainOlist);
		
		
		List<Room> roomList = roomDao.getRoomAllList();
		model.addAttribute("roomList", roomList);
		
		
		List<OrderDetail> orderDlist = orderDetailDao.getOrderRooms();
		model.addAttribute("orderDlist", orderDlist);
		
		
		
		List<Member> memberlist = memberDao.getAllMembers();
		model.addAttribute("memberlist", memberlist);
		
		
		
		model.addAttribute("s_num",s_num);
		return getPage;
	}
	
	
}
