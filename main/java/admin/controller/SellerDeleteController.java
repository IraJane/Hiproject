package admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import admin.model.AdminDao;

@Controller("adminSellerDeleteController")
public class SellerDeleteController {

	
	private final String command = "deleteSel.ad";
	private final String gotoPage= "redirect:/listSel.ad";
	
	@Autowired
	private AdminDao adDao;
	

	@RequestMapping(value=command, method=RequestMethod.GET)
	public String doAction(@RequestParam("s_num") int s_num) {	
		adDao.deleteSel(s_num);
		return gotoPage;
	}
	
	
	
}
