package hotel.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("myHotel")
public class HotelDao {
	private final String namespace = "hotel.model.Hotel";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public int insertHotel(Hotel hotel) {
		int cnt=sqlSessionTemplate.insert(namespace+".insertHotel",hotel);
		return cnt;
	}
	
	
	
	public int getTotalCount() {
		int totalCount=sqlSessionTemplate.selectOne(namespace+".getTotalCount");
		return totalCount;
	}
	

	
	
	
	
	
	

	public List<Hotel> selectAll(String area) {
		// TODO Auto-generated method stub
		
		List<Hotel> list = sqlSessionTemplate.selectList(namespace +".getHotelList", area);
		return list;
	}

	public Hotel detailData(String h_name) {
		// TODO Auto-generated method stub
		Hotel hotel = sqlSessionTemplate.selectOne(namespace + ".detailData",h_name);
		return hotel;
	}

	public List<Hotel> getList(int num) {
		// TODO Auto-generated method stub
		List<Hotel> cnt = sqlSessionTemplate.selectList(namespace + ".getThisList", num);
		return cnt;
	}



	public Hotel getHotelOne(int num) {
		Hotel hotel=sqlSessionTemplate.selectOne(namespace+".getHotelOne",num);
		return hotel;
	}
	
	
	
	
	
	
	
	

}
