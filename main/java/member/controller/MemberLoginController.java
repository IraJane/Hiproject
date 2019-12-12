package member.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import member.model.Member;
import member.model.MemberDao;

@Controller
public class MemberLoginController {
	private final String command = "/login.mem";
	private final String getPage = "memberLoginForm";
	private final String goPage = "redirect:/main.jsp";
	private final String adPage = "redirect:/main.ad";
	
	@Autowired
	private MemberDao memDao;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String login() {
		return getPage;
	}
	
	@RequestMapping(value=command, method=RequestMethod.POST)
	public ModelAndView login(Member member, HttpServletResponse response,
			HttpSession session) throws IOException {
		//System.out.println("member.getM_email() : " + member.getM_email());
		ModelAndView mav = new ModelAndView();
		
		Member login = memDao.login(member);
		//System.out.println("login.getM_password() : " + login.getM_password());
	
		if(login.getM_email() == null) {
		
			mav.setViewName(getPage);
			return mav;
			
		} else if (login.getM_email().equals("admin@admin")) {
			session.setAttribute("loginfo", login);
			mav.setViewName(adPage);
			
			return mav;
		}
		
		else {
			session.setAttribute("loginfo", login);
			
			mav.setViewName(goPage);
			return mav;
		}
	}
}