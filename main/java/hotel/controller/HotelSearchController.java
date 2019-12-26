package hotel.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import hotel.model.Hotel;
import hotel.model.HotelDao;
import hotel.model.Room;
import hotel.model.RoomDao;
import hotel.model.Search;
import member.model.ReviewComposite;
import member.model.ReviewCompositeDao;

@Controller
public class HotelSearchController {
	private final String commend = "Search.ho";
	private final String gotoPage = "bigSearch";
	
	@Autowired
	HotelDao hoDao;
	
	@Autowired
	RoomDao roomDao;
	
	@Autowired
	ReviewCompositeDao reviewComDao;
	
	
	
	@RequestMapping(commend)
	public String search ( Search search,HttpServletRequest request,
			Model model,HttpSession session) {
		
	/*	if(result.hasErrors()) {
			
			
			return "redirect:/main.jsp";
			
		}
		*/
		

		System.out.println("area:"+search.getArea()+","+"checkin:"+search.getCheckin()+","+"checkout:"+search.getCheckout()+","+"adult:"+search.getAdult()+","
				+"child:"+search.getChild()+","+"room:"+search.getRoom()+","+
				"searchas:"+search.getSearchas()+","+"filterType:"+search.getFilterType() 
				);
		

		
		
		String url=request.getContextPath()+commend;
		
		
		int totalCount=hoDao.getTotalCount();
		System.out.println("총 호텔 개수:"+totalCount);
		
		
		if(search.getFilterType()!=null) {
			String f =new String();
			String a =new String();
			
			String[] filtypes =search.getFilterType().split(",");
			System.out.println("fff:"+filtypes);
			for(int i = 0; i<filtypes.length;i++) {
				if(!filtypes[i].contains("등급")) {
					if(!f.isEmpty()) {
						f = f + "," +filtypes[i];
					} else {
						f = filtypes[i];
					}
					
				} else {
					if(!a.isEmpty()) {
						a = a + "," +filtypes[i];
					} else {
						a = filtypes[i];
					}
					
				}
				
				
			}
			
			String[] filters = f.split(",");
			String[] gradeArray = a.split(",");
			search.setFilters(filters);
			//search.setGradeArray(gradeArray);
			//dur
			
			
			
			
			
		}
		

		
		System.out.println(search);
		
		model.addAttribute("search", search);
				
		List<Hotel> hotelList=hoDao.selectAll(search); 
		
		
		
		
		/*List<Hotel> list = hoDao.selectAll(area);
		System.out.println(list.size());*/
		
		/*Map<Integer,Integer> avgNum= new HashMap<Integer,Integer>();
		for(int i = 0; i< hotelList.size();i++) {
			int h_num = hotelList.get(i).getH_num();
			Integer rcom = reviewComDao.getAvg(h_num);
			avgNum.put(h_num, rcom);
			
		}
		
		model.addAttribute("avgNum",avgNum);
		*/
		
		
		
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
