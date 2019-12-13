package order.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import order.model.MainOrder;
import order.model.MainOrderDao;
import order.model.OrderDetail;
import order.model.OrderDetailDao;

@Controller
public class MemberReservationFormController {
	private final String commend = "memberReservationForm.der";
	private final String getPage = "memberReservationForm";
	
	@Autowired
	HotelDao hotelDao;
	
	@Autowired
	RoomDao roomDao;
	
	@Autowired
	MainOrderDao mainOrderDao;
	
	@Autowired
	OrderDetailDao orderDetailDao;
	
	
	
	@RequestMapping(commend)
	public String reservation(HttpSession session, Model model) {
		
		Member login = (Member) session.getAttribute("loginfo");
		
		
		List<MainOrder> mainOrderd =mainOrderDao.getMemberOrders(login);
		System.out.println("mianorder:" + mainOrderd);
		
		model.addAttribute("mainOrderd",mainOrderd);
		
		@SuppressWarnings("rawtypes")
		Map<String,List<Map>> totalOrder =new HashMap<String,List<Map>>(); 
		
		Map<String,List<OrderDetail>> orderdetailMap =new HashMap<String,List<OrderDetail>>(); 
		List<OrderDetail> orderdetail = orderDetailDao.getOrderRooms();
		orderdetailMap.put("odetail", orderdetail);
		
		Map<String,List<Room>> roomMap = new HashMap<String,List<Room>>();
		List<Room> rooms = roomDao.getRoomAllList();
		roomMap.put("room", rooms);
		
		
		Map<String,List<Hotel>> hotelMap = new HashMap<String,List<Hotel>>();
		List<Hotel> hotels = hotelDao.getAllHotelList();
		hotelMap.put("hotel", hotels);
		
		
		@SuppressWarnings("rawtypes")
		List<Map> list = new ArrayList<Map>();
		list.add(hotelMap);
		list.add(roomMap);
		list.add(orderdetailMap);
		
		totalOrder.put("list", list);
		System.out.println("tot:"+totalOrder);
		
		
		
		/*List<OrderDetail> orderdetail = orderDetailDao.getOrderRooms();
		model.addAttribute("orderdetail",orderdetail);*/
		
		
		
		
		model.addAttribute("totalOrder",totalOrder);
		
		return getPage;
	}
}
