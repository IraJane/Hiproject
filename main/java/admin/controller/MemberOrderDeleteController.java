package admin.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import admin.model.AdminDao;
import member.model.Member;

@Controller
public class MemberOrderDeleteController {

	private final String command = "deleteOrder.ad";
	private final String getPage = "redirect:/reservationInfo.ad";
	private final String errPage = "redirect:/main.jsp";
	
	
	@Autowired
	private AdminDao adDao;

	@RequestMapping(value=command, method=RequestMethod.GET)
	public String doAction(HttpSession session,
			@RequestParam("m_num") int m_num,
			@RequestParam("mo") int o_num,
			@RequestParam("od") int r_num
			){
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
				
		Map<String, Integer>param = new HashMap<String, Integer>();
		param.put("o_num", o_num);
		param.put("r_num", r_num);
		adDao.deleteODetail(param);
		
		int cnt = adDao.findODetail(o_num);
		if(cnt==0) {
			adDao.deleteMOrder(o_num);
		}
		
		return getPage+"?m_num="+m_num;
		
	}
	

	@RequestMapping(value=command, method=RequestMethod.POST)
	public String doAction(
			HttpSession session,
			@RequestParam("m_num") int m_num,
			@RequestParam("mo") int o_num) {
		
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
		
		adDao.deleteMOrder(o_num);
		return getPage+"?m_num="+m_num;
		
	}
	
}
