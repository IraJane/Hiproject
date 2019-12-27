package admin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import admin.model.AdminDao;
import hotel.model.Hotel;
import hotel.model.HotelDao;
import hotel.model.Room;
import hotel.model.RoomDao;
import member.model.Member;
import order.model.MainOrder;
import order.model.MainOrderDao;
import order.model.OrderDetail;
import order.model.OrderDetailDao;

@Controller("adminMemberReservationController")
public class MemberReservationController {

	
	private final String command = "/reservationInfo.ad";
	private final String getPage ="adMemberReservationForm";
	private final String errPage = "redirect:/main.jsp";
	
	@Autowired
	HotelDao hotelDao;
	@Autowired
	RoomDao roomDao;
	@Autowired
	AdminDao adDao;
	@Autowired
	MainOrderDao mainOrderDao;
	@Autowired
	OrderDetailDao orderDetailDao;
	
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String doAction(@RequestParam("m_num") int m_num,Model model, HttpSession session) {
		//ADMIN CHECK 
		if ((Member) session.getAttribute("loginfo") == null) {
			return errPage;
		}
		Member loginfo = (Member) session.getAttribute("loginfo");
		String adCheck = loginfo.getM_email();
		if (!adCheck.equals("admin@admin.com")) {
			return errPage;
		}
		//ADMIN CHECK END
		
		Member login = adDao.getOneMember(m_num);
		
		
		List<MainOrder> mainOrderd = mainOrderDao.getMemberOrders(login);
		System.out.println("mainorder:"+ mainOrderd);
		
		model.addAttribute("mainOrderd", mainOrderd);
		
		@SuppressWarnings("rawtypes")
		Map<String, List<Map>> totalOrder = new HashMap<String, List<Map>>();
		
		Map<String, List<OrderDetail>> orderdetailMap = new HashMap<String,List<OrderDetail>>();
		List<OrderDetail> orderdetail = orderDetailDao.getOrderRooms();
		orderdetailMap.put("odetail", orderdetail);
		
		Map<String,List<Room>> roomMap = new HashMap<String,List<Room>>();
		List<Room> rooms = roomDao.getRoomAllList();
		roomMap.put("room",rooms);
		
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
		
		model.addAttribute("totalOrder",totalOrder);
		model.addAttribute("m_num", m_num);
		
		return getPage;
	}
	
	
}
