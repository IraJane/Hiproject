package order.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
import seller.model.Seller;

@Controller
public class SellerHotelNowController {
	private final String commend = "hotelNow.der";
	private final String getPage = "hotelNow";
	
	@Autowired
	HotelDao hotelDao;
	
	@Autowired
	RoomDao roomDao;
	
	@Autowired
	MemberDao memberDao;
	
	
	@Autowired
	MainOrderDao mainOrderDao;
	
	@Autowired
	OrderDetailDao orderDetailDao;
	
	
	@RequestMapping(commend)
	public String now(HttpSession session,Model model) {
		
		Seller login = (Seller) session.getAttribute("selloginfo");
		System.out.println(login);
		
		
		
		List<Hotel> hotel = hotelDao.getList(login.getS_num());
		System.out.println("hi hotel:"+hotel);
		model.addAttribute("hotel",hotel);
		
		
		//여기까지 호텔 가지고 오는 부분
		
		
		List<MainOrder> mainOlist = mainOrderDao.getSellerOrders();
		model.addAttribute("mainOlist",mainOlist);
		System.out.println(mainOlist);
		
		
		List<Room> roomList = roomDao.getRoomAllList();
		model.addAttribute("roomList",roomList);
		
		
		
		
		List<OrderDetail> orderDlist = orderDetailDao.getOrderRooms();
		model.addAttribute("orderDlist",orderDlist);
		
		
		List<Member> memberlist = memberDao.getAllMembers();
		model.addAttribute("memberlist",memberlist);
		
		
		return getPage;
	}
}