package admin.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import hotel.model.Hotel;
import hotel.model.HotelDao;
import hotel.model.Room;
import hotel.model.RoomDao;
import member.model.Member;
import member.model.MemberDao;
import order.model.MainOrder;
import order.model.MainOrderDao;
import order.model.OrderDetail;
import order.model.OrderDetailDao;

@Controller("adminSellerHotelNowController")
public class SellerHotelNowController {

   private final String command ="hotelNow.ad";
   private final String getPage2="redirect:/hotelNow.ad";
   private final String getPage="adHotelNow";
   private final String errPage = "redirect:/main.jsp";
   
   @Autowired
   private HotelDao hotelDao;
   @Autowired
   private RoomDao roomDao;
   @Autowired
   private MemberDao memberDao;
   @Autowired
   private MainOrderDao mainOrderDao;
   @Autowired
   private OrderDetailDao orderDetailDao;
   
   @RequestMapping(value=command, method=RequestMethod.GET)
   public String doAction(@RequestParam("s_num") int s_num, Model model, HttpSession session) {
      
      //ADMIN CHECK 
      if ((Member) session.getAttribute("loginfo") == null) {
         return errPage;
      }
      Member loginfo = (Member) session.getAttribute("loginfo");
      String adCheck = loginfo.getM_email();
      if (!adCheck.equals("admin@admin.com")) {
         return errPage;
      }
      //ADMIN CHECK END
      
      List<Hotel> hotel = hotelDao.getList(s_num);
      System.out.println("hotel:" + hotel);
      model.addAttribute("hotel",hotel);
      
      List<MainOrder> mainOlist = mainOrderDao.getSellerOrders();
      model.addAttribute("mainOlist", mainOlist);
      
      List<Room> roomList = roomDao.getRoomAllList();
      model.addAttribute("roomList", roomList);
      
      List<OrderDetail> orderDlist = orderDetailDao.getOrderRooms();
      model.addAttribute("orderDlist", orderDlist);
      
      List<Member> memberlist = memberDao.getAllMembers();
      model.addAttribute("memberlist", memberlist);
   
      model.addAttribute("s_num", s_num);
      
      return getPage;
   }
   
   
   @RequestMapping(value=command, method=RequestMethod.POST)
   public String doAction(@RequestParam("s_num") int s_num, @RequestParam("onum") int onum, Model model) {
	   
	   System.out.println(onum +","+ s_num);
	   
      mainOrderDao.updateCheckin(onum);
      model.addAttribute("s_num", s_num);
      
      return getPage2;
   }
}