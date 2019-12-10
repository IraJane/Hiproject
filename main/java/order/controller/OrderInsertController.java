package order.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import order.model.Order;
import order.model.OrderDao;

@Controller
public class OrderInsertController {
	private final String commend = "orderThis.der";
	private final String getPage = "orderDone";
	
	@Autowired
	OrderDao orderDao;
	
	@RequestMapping(commend)
	public String insert(Order order) {
		System.out.println(order);
		int cnt = orderDao.insertOrder(order);
		System.out.println(cnt);
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		return getPage;
	}

}
