package admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import admin.model.AdminDao;
import member.model.Member;
import utility.Paging;

@Controller
public class MemberListController {

	private final String command = "listMem.ad";
	private final String getPage = "adMemList";

	@Autowired
	private AdminDao adDao;

	@RequestMapping(value=command, method= RequestMethod.GET)
	private ModelAndView memList(
			@RequestParam(value = "pageNumber", required = false) String pageNumber,
			@RequestParam(value = "pageSize", required = false) String pageSize, 
			@RequestParam(value = "whatColumn", required = false) String whatColumn,
			@RequestParam(value = "keyword", required = false) String keyword,
			HttpServletRequest request) {	

		Map<String, String> map = new HashMap<String, String>();
		map.put("whatColumn", whatColumn);
		map.put("keyword", "%" + keyword + "%");

		int totalCount = adDao.getTotalCountMem(map);
		String url = request.getContextPath() + "/" + command;
		Paging pageInfo = new Paging(pageNumber, pageSize, totalCount, url, whatColumn, keyword, null);
		List<Member> memList = adDao.getMemList(pageInfo, map);

		ModelAndView mav = new ModelAndView();

		mav.addObject("pageInfo", pageInfo);
		mav.addObject("whatColumn", whatColumn);
		mav.addObject("keyword", keyword);
		mav.addObject("memList", memList);
		
		mav.setViewName(getPage);
		return mav;
	}
}