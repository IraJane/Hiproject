package seller.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import seller.model.Seller;
import seller.model.SellerDao;

@Controller
public class SellerLoginController {
	private final String commend = "selLogin.sel";
	private final String getPage = "selLogin";
	private final String gotoPage = "redirect:/selMain.sel";
	
	@Autowired
	SellerDao selDao;
	
	
	
	@RequestMapping(value=commend, method=RequestMethod.GET)
	public String login() {
		
		
		return getPage;
	}
	
	
	
	@RequestMapping(value=commend, method=RequestMethod.POST)
	public String loginer(Seller seller,HttpServletResponse response, HttpSession session) throws IOException {
		System.out.println("id:" + seller);


		Seller login = selDao.getDetails(seller.getS_email(), seller.getS_password());
		System.out.println("login:"+login);
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter writer;
		writer = response.getWriter();
		
		if(login == null) {
			System.out.println("존재하지 않는 아이디 입니다");
			writer.print("<script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js\"></script>");
			writer.print("<script>");
			writer.print("$(function(){"
					+ "$('.wrong').append('잘못된 아이디 혹은 비번입니다')" 
					+ "})");
			writer.print("</script>");
			writer.flush();
			
			return getPage;
		}
		session.setAttribute("selloginfo", login);
		
		System.out.println("로그인 완료");
		
		
		
		return gotoPage;
	}
	
	
	
	
}
