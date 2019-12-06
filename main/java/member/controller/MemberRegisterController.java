package member.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	public String register(@Valid Member member, BindingResult result) {
		
		if(result.hasErrors()) {
			return getPage;
		}
			
		
		memDao.registerMem(member);
		
		return goPage;
	}
}