package order.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberReservationFormController {
	private final String commend = "memberReservationForm.der";
	private final String getPage = "memberReservationForm";
	
	
	@RequestMapping(commend)
	public String reservation() {
		
		return getPage;
	}
}
