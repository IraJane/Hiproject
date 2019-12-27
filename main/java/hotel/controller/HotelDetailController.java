package hotel.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import member.model.Member;
import member.model.ReviewComposite;
import member.model.ReviewCompositeDao;
import order.model.MainOrderDao;
import order.model.OrderDetail;
import order.model.OrderDetailDao;

@Controller
public class HotelDetailController {

	private final String command="hotelDetail.ho";
	private final String getPage="hotelDetail";
	
	@Autowired
	private HotelDao hotelDao;
	
	@Autowired
	private RoomDao roomDao;
	
	@Autowired
	MainOrderDao mainDao;
	
	@Autowired
	OrderDetailDao odetailDao;
	
	@Autowired
	private ReviewCompositeDao rvcDao;
	
	@RequestMapping(command)
	public String hotelDetail(@RequestParam("h_num") int h_num,Search search,
			Model model,HttpSession session) throws ParseException {
		
		System.out.println(h_num);
		System.out.println("area:"+search.getArea()+","+"checkin:"+search.getCheckin()+","+"checkout:"+search.getCheckout()+","+"adult:"+search.getAdult()+","
				+"child:"+search.getChild()+","+"room:"+search.getRoom()+","+
				"searchas:"+search.getSearchas()+","+"filterType:"+search.getFilterType() 
				);
		
		
		
		
		
		Hotel hotel=hotelDao.getHotelOne(h_num);
		
		
		List<ReviewComposite> review = rvcDao.getReviewList(h_num);
		
		
		List<Room> rooms=roomDao.getRoomList(hotel);
		hotel.setRooms(rooms);
		if(hotel.getH_image()!=null) {
			hotel.setImages(hotel.getH_image().split(";"));
		}
		if(hotel.getH_address1().indexOf("(")!=-1) {
			String address=hotel.getH_address1().substring(0,hotel.getH_address1().indexOf("(")-1);
			hotel.setH_address1(address);
		}
		if(hotel.getH_facilities().length()>2) {
			String facil=hotel.getH_facilities().substring(3);  
			hotel.setH_facilities(facil);	
		}

		
		
		Member login = (Member) session.getAttribute("loginfo");
		
		System.out.println(login);
		String checkin = search.getCheckin();
		String checkout = search.getCheckout();
		
		List<OrderDetail> detailList = odetailDao.getDateLists(checkin, checkout);
		System.out.println(detailList);
		
		
		
		
		Map<Integer, Integer> map = new HashMap<Integer, Integer>();
		for(int i = 0; i < rooms.size();i++) {
			for(int j = 0; j < detailList.size();j++) {
			if(rooms.get(i).getR_num() == detailList.get(j).getR_num()) {
				
				System.out.println("GOOD  rnum:" + rooms.get(i).getR_num() + "detail:" + detailList.get(j));
				
				if(map.containsKey(rooms.get(i).getR_num())) {
					int num = map.get(rooms.get(i).getR_num());
					System.out.println("num:"+num);
					System.out.println("ocount:"+detailList.get(j).getO_count());
					map.put(rooms.get(i).getR_num(), num+detailList.get(j).getO_count());
					
				} else {
					
					
					map.put(rooms.get(i).getR_num(), detailList.get(j).getO_count());
					
				}
				
			} else {
				
				System.out.println(" NOT    rnum:" + rooms.get(i).getR_num() + "detail:" + detailList.get(j));
			}
			
			
		}
		}
		
		System.out.println("map:"+map);
		
		
		
		model.addAttribute("map",map);
		model.addAttribute("search",search);
		model.addAttribute("hotel",hotel);
		model.addAttribute("rooms",rooms);
		model.addAttribute("review", review);
		System.out.println("review : " + review);
		System.out.println(rooms);
		System.out.println("detail 지나감");
		return getPage;
	}
}