package hotel.model;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("myRoomDao")
public class RoomDao {

	private String namespace="hotel.model.Room";
	
	@Autowired
	SqlSessionTemplate sst;

	public int insertRoom(Room room) {
		int cnt=sst.insert(namespace+".insertRoom",room);
		return cnt;
	}
	
	public List<Room> getRoomList(Hotel hotel) {
		List<Room> roomList=sst.selectList(namespace+".getRoomList",hotel);
		return roomList;
	}

	public List<Room> getRoomOrder(int num) {
		// TODO Auto-generated method stub
		List<Room> roomlist = sst.selectList(namespace+".getRoomOrder",num);
		return roomlist;
	}
	
	
	
	
	
}