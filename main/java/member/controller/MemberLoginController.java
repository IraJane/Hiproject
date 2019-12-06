package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

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
		ModelAndView mav = new ModelAndView();
		
		Member login = memDao.login(member);
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter writer;
		writer = response.getWriter();
		
		if(login == null) {
			writer.print("<script type='text/javascript'>");
			writer.print("alert('아이디 혹은 비밀번호가 틀립니다')");
			writer.print("</script>");
			writer.flush();
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