package seller.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SellerLogoutController {
	private final String commend = "logout.sel";
	
	@RequestMapping(commend)
	public String logout(HttpSession session) {
		session.invalidate();
		
		
		return "redirect:/selMain.sel";
	}
}
