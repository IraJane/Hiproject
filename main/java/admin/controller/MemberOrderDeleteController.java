package admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import order.model.MainOrderDao;
import order.model.OrderDetailDao;

@Controller
public class MemberOrderDeleteController {

	private final String command = "deleteOd.ad";
	private final String gotoPage = "redirect:/reservationInfo.ad";
	
	@Autowired
	private MainOrderDao mainOrderDao;
	@Autowired
	private OrderDetailDao orderDetailDao;
	
	
	@RequestMapping(command)
	public String doAction(
			@RequestParam("m_num") int m_num,
			@RequestParam("mo") int o_num,
			@RequestParam("od") int r_num, Model model) {
		mainOrderDao.deleteMOrder(o_num);
		orderDetailDao.deleteODetail(r_num);
		return gotoPage+"?m_num="+m_num;
	}
	
	
}