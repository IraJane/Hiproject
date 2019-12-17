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

	public int updateRoom(Room room) {
		int cnt=sst.update(namespace+".updateRoom",room);
		return cnt;
	}

	public int deleteRoom(int r_num) {
		int cnt=sst.delete(namespace+".deleteRoom",r_num);
		return cnt;
	}

	public int deleteHotelRoom(int h_num) {
		int cnt=sst.delete(namespace+".deleteHotelRoom",h_num);
		return cnt;
		
	}
	public List<Room> getRoomAllList() {
		// TODO Auto-generated method stub
		List<Room> room =sst.selectList(namespace +".getRoomAllList");
		return room;
	}
	
	
	
	
	
}