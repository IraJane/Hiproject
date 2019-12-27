package admin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import member.model.Member;
import member.model.MemberDao;

@Controller
public class MemberInsertController {

	private final String command = "insertMem.ad";
	private final String getPage = "adMemInsert";
	private final String gotoPage = "redirect:/listMem.ad";
	private final String errPage = "redirect:/main.jsp";
	
	@Autowired
	private MemberDao memDao;
	
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
	public String doAction(Member member, HttpSession session) {
		
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
	
		memDao.registerMem(member);
		return gotoPage;
	}
}
