package order.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import hotel.model.Search;
import member.model.Member;

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


	public List<MainOrder> getSellerOrders() {
		// TODO Auto-generated method stub
		List<MainOrder> mod = sqlSessionTemplate.selectList(namespace +".getSellerOrders");
		return mod;
	}


	public List<MainOrder> getMemberOrders(Member login) {
		// TODO Auto-generated method stub
		List<MainOrder> md = sqlSessionTemplate.selectList(namespace + ".getMemberOrders",login);
		return md;
	}


	public int updateCheckin(int onum) {
		// TODO Auto-generated method stub
		int cnt = sqlSessionTemplate.update(namespace+ ".updateChecker",onum);
		return cnt;
	}
	
	public void deleteMOrder(int o_num) {
		sqlSessionTemplate.delete(namespace+".deleteMOrder",o_num);

	}


	public MainOrder getAllOrders( int o_num, String o_checkin) {
		// TODO Auto-generated method stub
		MainOrder mooo = new MainOrder();
		mooo.setO_num(o_num);
		mooo.setO_checkin(o_checkin);
		
		MainOrder cnt = sqlSessionTemplate.selectOne(namespace+".getAllOrders",mooo);
		return cnt;
	}


	public void checkReview(MainOrder mainorder) {
		sqlSessionTemplate.update(namespace+ ".checkReview", mainorder);
		
	}


	


	

	


	

	
	

}
