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

import admin.model.AdminDao;
import member.model.Member;
import seller.model.Seller;


@Controller
public class SellerInsertController {
	private final String command = "insertSel.ad";
	private final String getPage = "adSellerInsertForm";
	private final String gotoPage = "redirect:/listSel.ad";
	private final String errPage = "redirect:/main.jsp";
	
	@Autowired
	private AdminDao adDao;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String doAction(HttpSession session) {
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
			
		return getPage;
	}
	
	@RequestMapping(value=command, method=RequestMethod.POST)
	public String doAction(
			@ModelAttribute("seller") @Valid Seller seller, BindingResult result, Model model, HttpSession session) {
		
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
		
		if(result.hasErrors()) {
			System.out.println("유효성 검사 오류");
			model.addAttribute("seller", seller);
			return getPage;
		}
		int cnt = adDao.insertSel(seller);
		System.out.println(cnt);
		
		return gotoPage;
	}

}