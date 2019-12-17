package seller.controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import seller.model.Seller;
import seller.model.SellerDao;


@Controller
public class SellerInfoController {
	private final String commend = "selInfo.sel";
	private final String getPage = "selInfo";
	private final String gotoPage = "selInfo";
	
	@Autowired
	SellerDao selDao;
	
	@RequestMapping(value=commend,method=RequestMethod.GET)
	public String info(Model model, HttpSession session) {
		Seller login =(Seller) session.getAttribute("selloginfo");
		System.out.println(login);
		model.addAttribute("seller",login);
		
		return getPage;
	}
	
	
	@RequestMapping(value=commend, method=RequestMethod.POST)
	public ModelAndView mainer(@ModelAttribute("sel") @Valid Seller seller,BindingResult result) {
		
		ModelAndView mav = new ModelAndView();
		if(result.hasErrors()) {
			
			System.out.println("error");
			mav.addObject("seller",seller);
			mav.setViewName(getPage);
			
			return mav;
		}
		System.out.println("ch:"+seller);
		
		int cnt = selDao.infoUpdate(seller);
		System.out.println("info cnt:" + cnt);
		mav.addObject("seller",seller);
		mav.setViewName(getPage);
		
		return mav;
	}
	
	
	
	
	
}
