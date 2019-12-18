package order.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import order.model.MainOrder;
import order.model.MainOrderDao;



@Controller
public class testController {
	private final String commend = "test.der";
	
	
	@Autowired
	MainOrderDao mainOrderDao;
	
	
	@RequestMapping(commend)
	public String test() {
		
		
		return "test";
	}
	
	@ResponseBody
	@RequestMapping("tester.der")
	public List<MainOrder> tester() {
		
		
	/*	List<MainOrder> main =	mainOrderDao.getSellerOrders();*/
		ArrayList<MainOrder> list = new ArrayList<MainOrder>();
		list.add(new MainOrder(0, 0, "2012.12.12","2012/12/12","2012/12/12","3","ddd","1","d"));

		
		
		
		
		
		
		
		return list;
	}
	

}
