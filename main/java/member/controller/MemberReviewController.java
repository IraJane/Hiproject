package member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import hotel.model.Hotel;
import hotel.model.HotelDao;
import member.model.Member;
import member.model.Review;
import member.model.ReviewDao;
import order.model.MainOrder;
import order.model.MainOrderDao;



@Controller
public class MemberReviewController {
	public final String command = "review.mem";
	/*public final String getPage = "";*/
	
	
	@Autowired
	private ReviewDao rvDao;
	
	@Autowired
	private MainOrderDao mainOrderDao;
	
	@Autowired
	HotelDao hotelDao;

	@ResponseBody
	@RequestMapping(value=command, method=RequestMethod.POST)
	public void doAction(HttpSession session, Review review, MainOrder mainorder,Hotel hotel) {
		Member login = (Member) session.getAttribute("loginfo");
		
		System.out.println(login.getM_num());

		System.out.println("onum : " + review.getO_num());
		System.out.println("ccomment : " + review.getC_comment());
		System.out.println("cnum : " + review.getC_num());
		System.out.println("cstar : " + review.getC_star());
		System.out.println("hnum :" + review.getH_num()); 
		
		
		review.setM_num(login.getM_num());
		review.setC_checker(1);
		System.out.println(review.getM_num());
		
		rvDao.writeReview(review);
		
		
		mainOrderDao.checkReview(mainorder);
		
		int h_num = review.getH_num();
	    float avg = rvDao.avgStar(h_num);  
	    hotel.setH_staravg(avg);
	    hotelDao.avgStar(hotel);
		
	}
	
}