package admin.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import admin.model.Qa;
import admin.model.QaDao;

@Controller
public class QaInsertController {
	private final String command ="insertQa.ad";
	private final String getPage = "qaInsert";
	private final String gotoPage = "redirect:/main.jsp";
	
	
	@Autowired
	private QaDao qDao;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String doAction() {
		
				
		return getPage;
	}
	

	@RequestMapping(value=command, method=RequestMethod.POST)
	public String doAction(
			@ModelAttribute("qa") @Valid Qa qa, BindingResult result,
			Model model, HttpServletResponse response) {

		
		if(result.hasErrors()) {
			System.out.println("유효성검사 오류");
			model.addAttribute("qa",qa);
			return getPage;
		}
		int cnt = qDao.insertQa(qa);
		System.out.println("qa삽입:"+ cnt);
		
		return gotoPage;
	}
}
	
	
	