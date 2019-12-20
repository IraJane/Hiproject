package hotel.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import order.model.MainOrder;
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
	
	@RequestMapping(command)
	public String hotelDetail(@RequestParam("h_num") int h_num,Search search,
			Model model) {
		
		System.out.println(h_num);
		System.out.println("area:"+search.getArea()+","+"checkin:"+search.getCheckin()+","+"checkout:"+search.getCheckout()+","+"adult:"+search.getAdult()+","
				+"child:"+search.getChild()+","+"room:"+search.getRoom()+","+
				"searchas:"+search.getSearchas()+","+"filterType:"+search.getFilterType() 
				);
		
		
		Hotel hotel=hotelDao.getHotelOne(h_num);
		
		List<Room> rooms=roomDao.getRoomList(hotel);
		hotel.setRooms(rooms);
		hotel.setImages(hotel.getH_image().split(";"));
		
		
		String address=hotel.getH_address1().substring(0,hotel.getH_address1().indexOf("(")-1);
		hotel.setH_address1(address);
		
		
		
		
		String firstDate = search.getCheckin();
		String lastDate = search.getCheckout();
		  
		  
		SimpleDateFormat format = new SimpleDateFormat("yyyy-mm-dd");
        // date1, date2 두 날짜를 parse()를 통해 Date형으로 변환.
        Date FirstDate = null;
        Date SecondDate;
        long calDate;
        long calDateDays = 0;
        String today = null;
        Map<Integer,List<OrderDetail>> detailss = new HashMap<Integer,List<OrderDetail>>();
        
		try {
			FirstDate = format.parse(firstDate);
	        SecondDate = format.parse(lastDate);
	        
	        // Date로 변환된 두 날짜를 계산한 뒤 그 리턴값으로 long type 변수를 초기화 하고 있다.
	        // 연산결과 -950400000. long type 으로 return 된다.
	        calDate = FirstDate.getTime() - SecondDate.getTime(); 
	        
	        // Date.getTime() 은 해당날짜를 기준으로1970년 00:00:00 부터 몇 초가 흘렀는지를 반환해준다. 
	        // 이제 24*60*60*1000(각 시간값에 따른 차이점) 을 나눠주면 일수가 나온다.
	        calDateDays = calDate / ( 24*60*60*1000); 
	 
	        calDateDays = Math.abs(calDateDays);
	        
	        System.out.println("두 날짜의 날짜 차이: "+calDateDays);

		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		  
		for(int i =0; i<calDateDays;i++) {  
			SimpleDateFormat simple = new SimpleDateFormat("yyyy-MM-dd");

			
			Calendar cal = Calendar.getInstance();
			cal.setTime(FirstDate);
			cal.add(Calendar.DATE, +i); // 하루 이후
			today = simple.format(cal.getTime());  //  23~26으로 설정하면 23 24 25 나옴 

			
			System.out.println(today);
			
			
			for(int j = 0; j<rooms.size();j++) { //27 28 2개
				List<OrderDetail> cc = new ArrayList<OrderDetail>();
				OrderDetail dd = new OrderDetail();
				
				System.out.println(rooms.get(j).getR_num());  //23일에 27, 28  24일에 27, 28 25일에 27 28 
				int r_num = rooms.get(j).getR_num();
				System.out.println("rnum:"+r_num);
				
				List<OrderDetail> odetail = odetailDao.getOrderStocks(r_num);  //방번호로 odetail 가지고 옴
				System.out.println("odetail:"+odetail);
				System.out.println(odetail);//27만 옴 
				for(int k = 0; k<odetail.size();k++) {
					int o_num = odetail.get(k).getO_num();
					System.out.println("o:"+o_num +today);
					MainOrder mainorder = mainDao.getAllOrders(o_num,today); 
					//메인 오더에 해당 날짜와 o_num 을 가진게 있는지 체크
				
					
					System.out.println("m:"+mainorder); // 23일에 1개 있음 출력 확인 
					System.out.println("------1- mainorder 진입------------");
					if(mainorder != null) {
						
						
						System.out.println("-------happy because mainorder is not null   -------");
						
						/*List<OrderDetail> list =odetailDao.getThisOrderDetails(o_num);*/
						System.out.println("odetail size   -->:"+odetail.size());
						
						
						/*for(int q = 0; q<list.size();q++) {*/
							System.out.println("odetail.get(k)   --->:"+odetail.get(k));
							
							//System.out.println("true  or false :"+ detailss.containsKey(odetail.get(k).getR_num()));
							
							
							
							/*dd = odetail.get(k);*/
							
							/*if(detailss.containsKey(list.get(q).getR_num()) == false ) {*/
								
								System.out.println("cc contains   --->: " + cc);
								
								
								System.out.println("Before adding   total   ----> :"+detailss);
								cc.add(odetail.get(k));
								System.out.println("after adding ---> :"+detailss);
								/*System.out.println("TOTAL  33333:"+detailss);*/
								System.out.println("-------3---add all---------");
								
								
								
								
								
								
								
							/*} else if(detailss.containsKey(list.get(q).getR_num()) == true) {*/
								/*List<OrderDetail> aa = new ArrayList<OrderDetail>();*/
								/*System.out.println("AA  3: " + aa);*/
								/*List<OrderDetail> nn = detailss.get(list.get(q).getR_num());*/
								/*aa.add(list.get(q));*/
						
							/*	System.out.println("a:"+aa);*/
								
								/*for(int h = 0; h<nn.size();h++) {
									OrderDetail mm = nn.get(h);
									cc.clear();
									cc.add(mm);
									
									
									
								}*/
							
							
							
							
							
								/*detailss.put(list.get(q).getR_num(), aa);*/
								//System.out.println("TOTAL  44444:"+detailss);
								//System.out.println("-------4   ---------");
								
						
						/*}*/
						
						
					} // if문
						
						
						
						System.out.println("end if detailss --->  :"+detailss);
						System.out.println("end if cc --->  :"+cc);
						System.out.println("-------2------------");
						
						
						
						
				/*		
					} else {
						
						System.out.println("sad");
					}
					*/
					
					
						System.out.println("sad  no mainorder  -----");
				}
				
				
				
				
				
				
				
				detailss.put(r_num, cc);
				
			}
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
		}

	
		  
		  
		System.out.println("TOTAL:"+detailss);
		  
		  
		  
		  
		  
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		model.addAttribute("detailss",detailss);
		model.addAttribute("search",search);
		model.addAttribute("hotel",hotel);
		model.addAttribute("rooms",rooms);
		System.out.println(rooms);
		System.out.println("detail 지나감");
		return getPage;
	}
}