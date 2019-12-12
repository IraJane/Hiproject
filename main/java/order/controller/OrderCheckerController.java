package order.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import order.model.MainOrderDao;

@Controller
public class OrderCheckerController {
	private final String commend = "checkCheckin.der";
	private final String gotoPage = "redirect:/hotelNow.ho";
	
	
	
	
	
	@RequestMapping(commend)
	public String checker(@RequestParam("onum") int onum) {
		
		return gotoPage;
	}
}
