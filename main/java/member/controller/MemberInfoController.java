package member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import member.model.Member;
import member.model.MemberDao;

@Controller
public class MemberInfoController {
	private final String command = "info.mem";
	private final String command2 = "update.mem";
	private final String command3 = "delete.mem";
	private final String command4 = "deleteConfirm.mem";
	private final String getPage = "memberInfoForm";
	private final String getPage2 = "memberDeleteForm";
	private final String goPage = "redirect:/main.jsp";
	
	@Autowired
	private MemberDao memDao;
	
	@RequestMapping(command)
	public String info(
			HttpSession session, Model model
			) {
		Member member = (Member) session.getAttribute("loginfo");
		
		model.addAttribute("member", member);
		
		return getPage;
	}
	
	@RequestMapping(command2)
	public ModelAndView update(Member member, HttpSession session) {
		
		String npassword = member.getNew_m_password();
		String opassword = member.getM_password();
		System.out.println("npass1 :" + npassword);
		System.out.println("opass1 :" + opassword);
		
		
		if(npassword != "") {
			member.setM_password(npassword);
			System.out.println("npass2 :" + npassword);
		} else {
			member.setM_password(opassword);			
		}
		session.setAttribute("loginfo", member);
		System.out.println("member :" + member);
	
		
		memDao.update(member);
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName(goPage);
		return mav;
	}
	
	@RequestMapping(command3)
	public String delete(
			HttpSession session, Model model
			) {
		Member member = (Member) session.getAttribute("loginfo");
		
		model.addAttribute("member", member);
		
		return getPage2;
	}
	
	@ResponseBody
	@RequestMapping(command4)
	public String deleteConfirm(
			@RequestParam(value="m_email") String m_email,
			@RequestParam(value="m_password") String m_password,
			HttpSession session, Model model
			) {

		String success = "1";
		String error = null;

		
		Member member = (Member) session.getAttribute("loginfo");
		
		String password = member.getM_password();
		
		if(password.equals(m_password)) {
		memDao.delete(member);
		
		session.invalidate();
		
		return success;
		} else {
			return error;
		}
	}
}