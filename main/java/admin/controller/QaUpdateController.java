package admin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import admin.model.QaDao;
import member.model.Member;

@Controller
public class QaUpdateController {

	private final String command = "updateQa.ad";
	private final String gotoPage = "redirect:/listQa.ad";
	private final String errPage = "redirect:/main.jsp";
	
	
	@Autowired
	private QaDao qDao;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	/*@ResponseBody*/
	public String doAction(		
			@RequestParam(value="q_num", required=true) int q_num,
			@RequestParam(value="pageNumber", required=true) int pageNumber,
			@RequestParam(value="whatColumn", required=false) String whatColumn,
			@RequestParam(value="keyword", required=false) String keyword,
			Model model, HttpSession session) {
		
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
		
		System.out.println("q_num:" + q_num);
		int cnt = qDao.updateQa(q_num);
		System.out.println("updateQna:"+cnt);
		model.addAttribute("pageNumber", pageNumber);
		model.addAttribute("whatColumn", whatColumn);
		model.addAttribute("keyword", keyword);
			
		return gotoPage;
		
	}
}
