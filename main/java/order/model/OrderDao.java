package order.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("myOrder")
public class OrderDao {
	private String namespace = "order.model.Order";
	
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public int insertOrder(Order order) {
		// TODO Auto-generated method stub
		int cnt = sqlSessionTemplate.insert(namespace + ".insertOrder",order);
		return cnt;
	}

	public List<Order> getOrderList() {
		// TODO Auto-generated method stub
		List <Order> orderlist = sqlSessionTemplate.selectList(namespace+".getorderlist");
		return orderlist;
	}

	public int changeChecking(int onum) {
		// TODO Auto-generated method stub
		int cnt = sqlSessionTemplate.update(namespace + ".changeChecking",onum);
		return cnt;
	}
	

}
