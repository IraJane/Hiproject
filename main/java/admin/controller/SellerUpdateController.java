package admin.controller;

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

import admin.model.AdminDao;
import member.model.Member;
import seller.model.Seller;
@Controller("adminSellerUpdateController")
public class SellerUpdateController {
	
	private final String command = "updateSel.ad";
	private final String getPage = "adSelInfo";
	private final String gotoPage = "redirect:/listSel.ad";
	private final String errPage = "redirect:/main.jsp";
	
	
	@Autowired
	private AdminDao adDao;
	
	@RequestMapping(command)
	public String doAction(@RequestParam("s_num") int s_num, Model model, HttpSession session) {
		//ADMIN CHECK 
		if ((Member) session.getAttribute("loginfo") == null) {
			return errPage;
		}
		Member loginfo = (Member) session.getAttribute("loginfo");
		String adCheck = loginfo.getM_email();
		if (!adCheck.equals("admin@admin.com")) {
				return errPage;
		}	
		//ADMIN CHECK END
		
		Seller seller = adDao.selectSel(s_num);
		model.addAttribute("seller", seller);
		return getPage;
	}
	
	@RequestMapping(value=command, method=RequestMethod.POST)
	public ModelAndView doAction(@ModelAttribute("sel") @Valid Seller seller, BindingResult result, HttpSession session) {
		

		ModelAndView mav= new ModelAndView();
		
		//ADMIN CHECK 
		if ((Member) session.getAttribute("loginfo") == null) {
			mav.setViewName(errPage);
			return mav;
		}
		Member loginfo = (Member) session.getAttribute("loginfo");
		String adCheck = loginfo.getM_email();
		if (!adCheck.equals("admin@admin.com")) {
				mav.setViewName(errPage);
				return mav;
		}	
		//ADMIN CHECK END
		
		if(result.hasErrors()) {
			System.out.println("error");
			mav.addObject("seller", seller);
			mav.setViewName(getPage);
			return mav;
		}
		adDao.updateSelInfo(seller);
		mav.setViewName(gotoPage);
		return mav;
	}
	
}
