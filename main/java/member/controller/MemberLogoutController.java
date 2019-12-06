package member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberLogoutController {
	private final String command = "logout.mem";
	private final String goPage = "redirect:/main.jsp";

	@RequestMapping(command)
	public String logout(HttpSession session) {
		session.invalidate();

		return goPage;
	}
}