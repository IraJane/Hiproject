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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import seller.model.Seller;
import seller.model.SellerDao;


@Controller
public class SellerInfoController {
	private final String commend = "selInfo.sel";
	private final String getPage = "selInfo";
	private final String gotoPage = "redirect:/selInfo.sel";
	
	@Autowired
	SellerDao selDao;
	
	@RequestMapping(value=commend,method=RequestMethod.GET)
	public String info(Model model, HttpSession session) {
		Seller login =(Seller) session.getAttribute("selLoginfo");
		System.out.println(login);
		model.addAttribute("seller",login);
		
		return getPage;
	}
	
	
	@RequestMapping(value=commend, method=RequestMethod.POST)
	public ModelAndView mainer(@ModelAttribute("sel") @Valid Seller seller,BindingResult result,HttpSession session,
			@RequestParam("new_password") String newPw) {
		
		ModelAndView mav = new ModelAndView();
		if(result.hasErrors()) {
			
			System.out.println("error");
			mav.addObject("seller",seller);
			mav.setViewName(getPage);
			
			return mav;
		}
		
		if(newPw!=null && !newPw.equals("")) {
			seller.setS_password(newPw);
		}		
		
		System.out.println("ch:"+seller);
		int cnt = selDao.infoUpdate(seller);
		System.out.println("info cnt:" + cnt);
		Seller login = selDao.getDetails(seller.getS_email(), seller.getS_password());
		session.setAttribute("selLoginfo", login);
		mav.addObject("seller",login);
		mav.setViewName(getPage);
		
		return mav;
	}
	
	
	
	
	
}
