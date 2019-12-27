package admin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import admin.model.AdminDao;
import member.model.Member;

@Controller("adminSellerDeleteController")
public class SellerDeleteController {

	
	private final String command = "deleteSel.ad";
	private final String gotoPage= "redirect:/listSel.ad";
	private final String errPage = "redirect:/main.jsp";
	
	
	@Autowired
	private AdminDao adDao;
	

	@RequestMapping(value=command, method=RequestMethod.GET)
	public String doAction(@RequestParam("s_num") int s_num, HttpSession session) {	
		
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
		
		adDao.deleteSel(s_num);
		return gotoPage;
	}
	
	
	
}
