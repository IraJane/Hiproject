package admin.controller;

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
	
	@Autowired
	private MemberDao memDao;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String doAction() {
		
		return getPage;
	}

	@RequestMapping(value=command, method=RequestMethod.POST)
	public String doAction(Member member) {
	memDao.registerMem(member);
		
		return gotoPage;
	}
}
