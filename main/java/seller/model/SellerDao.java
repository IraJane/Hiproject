package seller.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("mySeller")
public class SellerDao {
	private final String namespace = "seller.model.Seller";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public SellerDao() {
		
		System.out.println("seller dao passing through");
	}

	public int insertData(Seller seller) {
		// TODO Auto-generated method stub
		int cnt = sqlSessionTemplate.insert(namespace + ".insertData",seller);
		return cnt;
	}

	public Seller getDetails(String s_email, String s_password) {
		Seller seller = new Seller();
		seller.setS_email(s_email);
		seller.setS_password(s_password);
		// TODO Auto-generated method stub
		Seller bean = sqlSessionTemplate.selectOne(namespace + ".getDetail", seller);
		return bean;
	}

	public int infoUpdate(Seller seller) {
		// TODO Auto-generated method stub
		int cnt = sqlSessionTemplate.update(namespace + ".infoUpdate", seller);
		return cnt;
	}

	public int deleteThis(int s_num) {
		// TODO Auto-generated method stub
		int cnt = sqlSessionTemplate.delete(namespace + ".deleteThis",s_num);
		return cnt;
	}
	
	
	
	

}
