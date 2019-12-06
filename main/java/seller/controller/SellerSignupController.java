package seller.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import seller.model.Seller;
import seller.model.SellerDao;




@Controller
public class SellerSignupController {
	private final String commend = "selSignup.sel";
	private final String getPage = "selSignup";
	private final String gotoPage = "redirect:/selMain.sel";
	
	@Autowired
	SellerDao selDao;
	
	@RequestMapping(value=commend, method=RequestMethod.GET)
	public String signup() {
		
		
		
		
		
		
		return getPage;
	}
	
	
	@RequestMapping(value=commend, method=RequestMethod.POST)
	public ModelAndView signer(@ModelAttribute("sel") @Valid Seller seller,
			BindingResult result) {
		
		System.out.println("seller iii");
		ModelAndView mav = new ModelAndView();
		
		
		if(result.hasErrors()) {
			
			mav.addObject("sel",seller);
			mav.setViewName(getPage);
			return mav;
		}
		
		int cnt = selDao.insertData(seller);
		System.out.println(cnt);
		
		
		
		
		
		System.out.println(seller);
		
		
		mav.setViewName(gotoPage);
		return mav;
	}
	
	
	
}
