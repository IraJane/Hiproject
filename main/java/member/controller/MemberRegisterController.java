package member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import member.model.Member;
import member.model.MemberDao;

@Controller
public class MemberRegisterController {
	private final String command = "register.mem";
	private final String getPage = "memberRegisterForm";
	private final String goPage = "redirect:/main.jsp";
	
	@Autowired
	private MemberDao memDao;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String register() {
		return getPage;
	}
	
	@RequestMapping(value=command, method=RequestMethod.POST)
	@ResponseBody
	public String register(Member member, HttpServletRequest request) {
		//System.out.println("member.getM_email() : "  + member.getM_email());
		/*if(result.hasErrors()) {
			System.out.println("2");
			return getPage;
		}*/
			
		memDao.registerMem(member);
		
		return goPage;
	}
}