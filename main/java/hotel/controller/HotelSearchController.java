package hotel.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import hotel.model.Hotel;
import hotel.model.HotelDao;
import hotel.model.Room;
import hotel.model.RoomDao;
import hotel.model.Search;

@Controller
public class HotelSearchController {
	private final String commend = "Search.ho";
	private final String gotoPage = "bigSearch";
	
	@Autowired
	HotelDao hoDao;
	
	@Autowired
	RoomDao roomDao;
	
	
	
	@RequestMapping(commend)
	public String search (HttpServletRequest request,Search search,
			Model model,HttpSession session) {
		

		System.out.println("area:"+search.getArea()+","+"checkin:"+search.getCheckin()+","+"checkout:"+search.getCheckout()+","+"adult:"+search.getAdult()+","
				+"child:"+search.getChild()+","+"room:"+search.getRoom()+","+
				"searchas:"+search.getSearchas()+","+"filterType:"+search.getFilterType() 
				);
		

		
		
		String url=request.getContextPath()+commend;
		int totalCount=hoDao.getTotalCount();
		System.out.println("총 호텔 개수:"+totalCount);
		
		
		if(search.getFilterType()!=null) {
			String[] filters=search.getFilterType().split(",");
			search.setFilters(filters);
		}
		
		model.addAttribute("search", search);
				
		List<Hotel> hotelList=hoDao.selectAll(search); 
		
		
		
		
		/*List<Hotel> list = hoDao.selectAll(area);
		System.out.println(list.size());*/
		
		
		
		
		
		System.out.println(hotelList);
		for(int i=0;i<hotelList.size();i++) {
			String[] images=hotelList.get(i).getH_image().split(";");
			hotelList.get(i).setImages(images);
			List<Room> roomList=roomDao.getRoomList(hotelList.get(i));
			hotelList.get(i).setRooms(roomList);
		}
		
		
		
	/*	model.addAttribute("list",list);*/
		model.addAttribute("hotelList",hotelList);
		
		return gotoPage;
	}
}
