package admin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import admin.model.AdminDao;
import member.model.Member;

@Controller("adminMemberDeleteController")
public class MemberDeleteController {

	private final String command = "deleteMem.ad";
	private final String goPage = "redirect:/listMem.ad";
	private final String errPage = "redirect:/main.jsp";
	
	@Autowired
	private AdminDao adDao;
	
	@RequestMapping(value=command, method=RequestMethod.POST)
	public String deleteMem(Member member, HttpSession session,
			@RequestParam(value="pageNumber", required=true) int pageNumber) {
	
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
		
		int m_num = member.getM_num();
		adDao.deleteMem(m_num);
		
		return goPage + "?pageNumber=" + pageNumber;
	}
}