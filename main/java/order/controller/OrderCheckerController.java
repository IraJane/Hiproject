package order.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import order.model.OrderDao;

@Controller
public class OrderCheckerController {
	private final String commend = "checkCheckin.der";
	private final String gotoPage = "redirect:/hotelNow.ho";
	
	
	@Autowired
	OrderDao orderDao;
	
	
	@RequestMapping(commend)
	public String checker(@RequestParam("onum") int onum) {
		int cnt = orderDao.changeChecking(onum);
		System.out.println(cnt);
		System.out.println("지나감"+onum);
		return gotoPage;
	}
}
