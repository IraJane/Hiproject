package admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import admin.model.AdminDao;
import member.model.Member;

@Controller("adminMemberDeleteController")
public class MemberDeleteController {

	private final String command = "deleteMem.ad";
	private final String goPage = "redirect:/listMem.ad";
	
	@Autowired
	private AdminDao adDao;
	
	@RequestMapping(value=command, method=RequestMethod.POST)
	public String deleteMem(
			Member member,
			@RequestParam(value="pageNumber", required=true) int pageNumber) {
	
		
		
		int m_num = member.getM_num();
		adDao.deleteMem(m_num);
		
		return goPage + "?pageNumber=" + pageNumber;
	}
}