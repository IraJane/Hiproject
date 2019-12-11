package hotel.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import hotel.model.Hotel;
import hotel.model.HotelDao;
import hotel.model.RoomDao;
import order.model.Order;
import order.model.OrderDao;
import seller.model.Seller;

@Controller
public class SellerHotelNowController {
	private final String commend = "hotelNow.ho";
	private final String getPage = "hotelNow";
	
	@Autowired
	HotelDao hoDao;
	
	@Autowired
	RoomDao roomDao;
	
	@Autowired
	OrderDao orderDao;
	
	@RequestMapping(commend)
	public ModelAndView now(HttpSession session) {
		Seller login = (Seller) session.getAttribute("loginfo");
		System.out.println(login);
		int num = login.getNum();
		String email = login.getEmail();
		List<Hotel> hodetail = hoDao.getList(num);
		System.out.println(num +"," +email);
		
		List<Order> thisRoom = orderDao.getOrderList();
			
		
		
		System.out.println("thisroom:"+thisRoom);
			
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("hodetail",hodetail);
		mav.addObject("thisRoom",thisRoom);
		mav.setViewName(getPage);
		
		System.out.println(hodetail);
		
		
		
		
		
		
		
		
		
		
		
		return mav;
	}
}
