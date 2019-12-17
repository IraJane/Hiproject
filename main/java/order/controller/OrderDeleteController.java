package order.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import order.model.MainOrderDao;
import order.model.OrderDetailDao;

@Controller
public class OrderDeleteController {

	private final String command="deleteOrder.der";
	private final String gotoPage="redirect:/memberReservationForm.der";
	
	@Autowired
	private MainOrderDao mainOrderDao;
	
	@Autowired
	private OrderDetailDao orderDetailDao;
	
	@RequestMapping(command)
	public String deleteOrder(@RequestParam("o_num") int o_num) {  
		mainOrderDao.deleteMOrder(o_num);
		orderDetailDao.deleteODetail(o_num);
		return gotoPage;
	}
}