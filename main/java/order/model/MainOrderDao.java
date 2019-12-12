package order.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("myMainOrderDao")
public class MainOrderDao {
	private String namespace = "order.model.MainOrder";
	
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;


	public int insertOrders(MainOrder mainorder) {
		// TODO Auto-generated method stub
		mainorder.setO_totalpeople("3");
		int cnt = sqlSessionTemplate.insert(namespace + ".insertOrders",mainorder);
		return cnt;
	}


	public int getMaxNum() {
		// TODO Auto-generated method stub
		int cnt =sqlSessionTemplate.selectOne(namespace +".getMaxNum");
		return cnt;
	}

	
	

}
