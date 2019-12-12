package seller.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import seller.model.SellerDao;

@Controller
public class SellerDeleteController {
	private final String commend = "selDelete.sel";
	private final String gotoPage = "redirect:/selMain.sel";
	
	@Autowired
	SellerDao seldao;
	
	
	@RequestMapping(commend)
	public String delete(@RequestParam("num") int s_num,HttpSession session) {
		System.out.println("delete:"+ s_num);
		
		int cnt = seldao.deleteThis(s_num);
		System.out.println("cnt:" + cnt);
		session.invalidate();
		return gotoPage;
	}
}
