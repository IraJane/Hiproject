package admin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import admin.model.QaDao;
import member.model.Member;

@Controller
public class AdminMainController {

	private final String command = "/main.ad";
	private final String getPage = "adMain";
	private final String gotoPage = "redirect:/main.jsp";

	@Autowired
	QaDao qDao;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doAction(Model model, HttpSession session) {

		if ((Member) session.getAttribute("loginfo") == null) {
			return gotoPage;
		}
		Member loginfo = (Member) session.getAttribute("loginfo");
		String adCheck = loginfo.getM_email();
		if (!adCheck.equals("admin@admin.com")) {
			return gotoPage;
		}
		
		int newQ = qDao.getCountNew();
		model.addAttribute("newQ", newQ);
		

		return getPage;

	}

}
