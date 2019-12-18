package admin.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import admin.model.AdminDao;
import seller.model.Seller;




@Controller
public class SellerInsertController {
	private final String command = "insertSel.ad";
	private final String getPage = "adSellerInsertForm";
	private final String gotoPage = "redirect:/listSel.ad";
	
	@Autowired
	private AdminDao adDao;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String doAction() {
		System.out.println("인서트 겟요청");

		return getPage;
	}

	@RequestMapping(value=command, method=RequestMethod.POST)
	public String doAction(
			@ModelAttribute("seller") @Valid Seller seller, 
			Model model
			) {
		System.out.println("인서트 포스트요청");
		System.out.println(seller);
		int cnt = adDao.insertSel(seller);
		System.out.println(cnt);
		return gotoPage;
	}

	
	
	
}