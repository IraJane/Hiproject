package admin.controller;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdminMainController {

	private final String command = "/main.ad";
	private final String getPage = "adMain";
	

	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doAction(HttpServletResponse response) {
		
		
		return getPage;
		
	}

}