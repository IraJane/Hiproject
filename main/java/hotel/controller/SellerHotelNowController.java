package hotel.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import hotel.model.Hotel;
import hotel.model.HotelDao;
import seller.model.Seller;

@Controller
public class SellerHotelNowController {
	private final String commend = "hotelNow.ho";
	private final String getPage = "hotelNow";
	
	@Autowired
	HotelDao hoDao;
	
	@RequestMapping(commend)
	public ModelAndView now(HttpSession session) {
		Seller login = (Seller) session.getAttribute("loginfo");
		System.out.println(login);
		int num = login.getNum();
		List<Hotel> hodetail = hoDao.getList(num);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("hodetail",hodetail);
		mav.setViewName(getPage);
		
		System.out.println(hodetail);
		
		return mav;
	}
}
