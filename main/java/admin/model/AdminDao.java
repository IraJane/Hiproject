package admin.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import hotel.model.Hotel;
import hotel.model.Room;
import member.model.Member;
import member.model.ReviewComposite;
import seller.model.Seller;
import utility.Paging;

@Component("myAdmin")
public class AdminDao {
	private final String namespace = "admin.model.Admin";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public AdminDao() {
		System.out.println("AdminDao()");
	}
	
	
	
	/*seller*/
	
	public int getSelCount(Map<String, String> map) {
		System.out.println("dao.getSelCount");
		int totalCount= sqlSessionTemplate.selectOne(namespace + ".getSelCount");
		return totalCount;
	}

	public List<Seller> getSelList(Paging pageInfo, Map<String, String> map) {
		System.out.println("dao.getSetlList");
		RowBounds row = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		List<Seller> selList = sqlSessionTemplate.selectList(namespace + ".getSelList", map, row );
		
		return selList;
	}

	public void deleteSel(int s_num) {
		sqlSessionTemplate.delete(namespace + ".deleteSel", s_num);
	}

	public void updateSel(int s_num) {
		sqlSessionTemplate.update(namespace + ".updateSel", s_num);
	
	}

	public Seller selectSel(int s_num) {
		Seller seller = sqlSessionTemplate.selectOne(namespace + ".selectSel", s_num);	
		return seller;
	}

	public void updateSelInfo(Seller seller) {
		sqlSessionTemplate.update(namespace + ".updateSelInfo", seller);
	}

	public int insertSel(Seller seller) {
		System.out.println(seller);
		int cnt = sqlSessionTemplate.insert(namespace + ".insertSel", seller);
//		sqlSessionTemplate.insert(namespace + ".insertSel", seller); 
		System.out.println(cnt);
		return cnt;
	}
	
	
	
	/*member*/
	
	public int getTotalCountMem(Map<String, String> map) {
		int totalCount = sqlSessionTemplate.selectOne(namespace + ".getTotalCountMem");
		return totalCount;
	}

	public List<Member> getMemList(Paging pageInfo, Map<String, String> map) {
		RowBounds row = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		List<Member> memList = sqlSessionTemplate.selectList(namespace + ".getMemList", map, row);
		return memList;
	}

	public void deleteMem(int m_num) {
		sqlSessionTemplate.delete(namespace + ".deleteMem", m_num);
	}

	public Member updateView(int m_num) {
		Member member = sqlSessionTemplate.selectOne(namespace + ".updateView", m_num);
		return member;
	}

	public void updateMem(Member member) {
		sqlSessionTemplate.update(namespace + ".updateMem", member);
	}

	public Member getOneMember(int m_num) {
		Member member = sqlSessionTemplate.selectOne(namespace +".seletOneMember", m_num);
		return member;
	}
	
	
	/*hottel*/

	public int getHotelCount(int num) {
		int totalCount = sqlSessionTemplate.selectOne(namespace + ".getHotelCount", num);
		return totalCount;
	}

	public List<Hotel> getHotelList(int num) {
		List<Hotel> hotelList = sqlSessionTemplate.selectList(namespace + ".getHotelList", num);
		return hotelList;
	}

	public List<Room> getRoomList(String hname) {
		List<Room> roomList = sqlSessionTemplate.selectList(namespace + ".getRoomList", hname);
		return roomList;
	}
	

	/*public int insertHotel(Hotel hotel) {
		int hotelcnt = sqlSessionTemplate.insert(namespace+ ".insertHotel", hotel);
		return hotelcnt;
	}
	public int insertRoom(Room room) {
		int roomcnt = sqlSessionTemplate.insert(namespace + ".insertRoom", room);
		return roomcnt;
	}
	public void updateHotel(Hotel hotel) {
		sqlSessionTemplate.update(namespace + ".updateHotel", hotel);
	}
	public int updateRoom(Room room) {
		int cnt = sqlSessionTemplate.update(namespace+ ".updateRoom", room);
		return cnt;
	}*/
	
	public void deleteHotel(int h_num) {
		sqlSessionTemplate.delete(namespace + ".deleteHotel", h_num);
	}

	public void deleteHotelRoom(int h_num) {
		sqlSessionTemplate.delete(namespace + ".deleteHotelRoom", h_num);
		
	}

	public void deleteMOrder(int o_num) {
		sqlSessionTemplate.delete(namespace + ".deleteMOrder", o_num);
		
	}

	public void deleteODetail(Map<String, Integer> param) {
		sqlSessionTemplate.delete(namespace + ".deleteODetail", param);
		
	}
	
	public int findODetail(int o_num) {
		int cnt = sqlSessionTemplate.selectOne(namespace+ ".findODetail", o_num);
		return cnt;
	}


	public int deleteReview(int c_num) {
		int cnt = sqlSessionTemplate.delete(namespace + ".deleteReview" + c_num);
		return cnt;
	}
	
	
	public int getRvcCnt(Map<String,String> map) {
		int cnt = sqlSessionTemplate.selectOne(namespace + ".getRvcCnt");	//null
		return cnt;
	}
	
	public List<ReviewComposite> getRvcList(Paging pageInfo, Map<String,String> map) {
		RowBounds row = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		List<ReviewComposite> list = sqlSessionTemplate.selectList(namespace + ".getRvcList", map, row);
		return list;
	}

		


	
	
	

	





	
}