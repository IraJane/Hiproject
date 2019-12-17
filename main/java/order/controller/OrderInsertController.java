package order.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import order.model.MainOrder;
import order.model.MainOrderDao;
import order.model.OrderDetail;
import order.model.OrderDetailDao;

@Controller
public class OrderInsertController {
	private final String commend = "orderThis.der";
	private final String getPage = "orderDone";
	
	@Autowired
	MainOrderDao mainorderDao;
	
	@Autowired
	OrderDetailDao orderdetailDao;
	
	@RequestMapping(commend)
	public String insert(@RequestParam("rooms") String rooms,MainOrder mainorder,OrderDetail orderdetail) {
		System.out.println(rooms);
		System.out.println(mainorder);
		System.out.println(orderdetail);
		
		
		
		
		int cnt = mainorderDao.insertOrders(mainorder);
		System.out.println("insert:"+cnt);
		
		int o_num = mainorderDao.getMaxNum();
		
		
		String[] bb = rooms.split(",");
		System.out.println("bb:"+bb.length);
	/*	System.out.println(bb[0]+";"+bb[1]);*/
		
		
		for(int i = 0; i<bb.length;i++) {
			
			String[] aa = bb[i].split("=");
			System.out.println(aa[0] + aa[1]);
			int a1 = Integer.parseInt(aa[0]);
			int a2 = Integer.parseInt(aa[1]);
			
			int cnnt = orderdetailDao.insertOrderDetails(a1,a2,o_num);
			System.out.println("insert:"+cnnt);
			
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		return getPage;
	}

}