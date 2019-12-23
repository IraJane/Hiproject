package admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import admin.model.QaDao;

@Controller
public class QaDeleteController {

	private final String command = "deleteQa.ad";
	private final String gotoPage = "redirect:/listQa.ad";
	
	@Autowired
	private QaDao qDao;
	

	@RequestMapping(value=command, method=RequestMethod.GET)
	public String doAction(			
			@RequestParam(value = "q_num", required = true) int q_num,
			@RequestParam(value = "pageNumber", required = false) String pageNumber,
			@RequestParam(value = "whatColumn", required = false) String whatColumn,
			@RequestParam(value = "keyword", required = false) String keyword,		
			Model model) {
		
		
		int cnt = qDao.deleteQa(q_num);	
		System.out.println("qa삭제:" + cnt);

		return gotoPage;
		
	}
	
}
