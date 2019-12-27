package admin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import admin.model.AdminDao;
import member.model.Member;

@Controller("adminReviewDeleteController")
public class ReviewDeleteController {
	
	private final String command = "/deleteReview.ad";
	private final String gotoPage = "redirect:/listReview.ad";
	private final String errPage = "redirect:/main.jsp";
	
	@Autowired
	private AdminDao adDao;

	@RequestMapping(value=command, method=RequestMethod.GET)
	public String doAction(@RequestParam("c_num") int c_num, HttpSession session) {
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
		
		
		System.out.println("c_num:" + c_num);
		
		int cnt = adDao.deleteReview(c_num);
		System.out.println("리뷰삭제:"+cnt);
		return gotoPage;
		
	}
}
