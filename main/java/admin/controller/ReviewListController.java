package admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import admin.model.AdminDao;
import member.model.Member;
import member.model.ReviewComposite;
import utility.Paging;

@Controller("adminReviewListController")
public class ReviewListController {

	private final String command = "/listReview.ad";
	private final String getPage = "reviewList";
	private final String errPage = "redirect:/main.jsp";
	
	
	@Autowired
	private AdminDao adDao;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String doAction(
			@RequestParam(value="pageNumber",required=false) String pageNumber,
			@RequestParam(value="pageSize",required=false) String pageSize,
			@RequestParam(value="whatColumn",required=false) String whatColumn,
			@RequestParam(value="keyword",required=false) String keyword,
			HttpServletRequest request, Model model, HttpSession session) {
		
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
				
		Map<String, String> map = new HashMap<String,String>();
		map.put("whatColumn", whatColumn);
		map.put("keyword", "%" + keyword + "%");
		System.out.println("what?KEy:"+whatColumn+keyword);
		
		int totalCount = adDao.getRvcCnt(map); // null,null
		String url = request.getContextPath() + command;
		Paging pageInfo = new Paging(pageNumber, pageSize, totalCount, url, whatColumn, keyword, null);
		System.out.println("totalCount:"+totalCount);
		
		List<ReviewComposite> list = adDao.getRvcList(pageInfo, map);
	
		model.addAttribute("list", list);
		return getPage;
	}
	
	
	
	
	
}

