package admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import admin.model.AdminDao;
import member.model.Member;

@Controller("adminMemberUpdateController")
public class MemberUpdateController {
	private final String command = "/updateMem.ad";
	private final String getPage = "adMemInfo";
	private final String goPage = "redirect:/listMem.ad";

	@Autowired
	private AdminDao adDao;

	@RequestMapping(value = command, method = RequestMethod.GET)
	public String updateMem(@RequestParam(value = "m_num", required = true) int m_num,
			@RequestParam(value = "pageNumber", required = true) int pageNumber, Model model) {

		Member member = adDao.updateView(m_num);

		model.addAttribute("member", member);
		model.addAttribute("pageNumber", pageNumber);
		return getPage;

	}

	@RequestMapping(value = command, method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView updateMem(Member member, @RequestParam(value = "pageNumber", required = true) int pageNumber) {
		ModelAndView mav = new ModelAndView();
		
		String npw = member.getNew_m_password();
		if (npw != null) {
			member.setM_password(npw);
			adDao.updateMem(member);		
		}
		mav.setViewName(goPage + "?pageNumber=" + pageNumber);

		return mav;
	}
}