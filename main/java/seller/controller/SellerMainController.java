package seller.controller;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import seller.model.Seller;

@Controller
public class SellerMainController {
	private final String commend = "selMain.sel";
	private final String gotoPage = "SelMain";
	
	
	@RequestMapping(commend)
	public String main() {
		
		
		
		
		
		return gotoPage;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
