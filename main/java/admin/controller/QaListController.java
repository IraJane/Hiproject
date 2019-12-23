package admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import admin.model.Qa;
import admin.model.QaDao;
import utility.Paging;

@Controller
public class QaListController {
	private final String command = "/listQa.ad";
	private final String getPage = "qaList";

	@Autowired
	private QaDao qDao;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doAction(
			@RequestParam(value = "pageNumber", required = false) String pageNumber,
			@RequestParam(value = "pageSize", required = false) String pageSize, 
			@RequestParam(value = "whatColumn", required = false) String whatColumn,
			@RequestParam(value = "keyword", required = false) String keyword,
			Model model, HttpServletRequest request) {
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("whatColumn", whatColumn);
		map.put("keyword", "%" + keyword + "%");
		System.out.println("what?KEy" + whatColumn + keyword);

		int qaCount = qDao.getQaCount(map);
		System.out.println("qaCount:" + qaCount);
		String url = request.getContextPath() + command;
		Paging pageInfo = new Paging(pageNumber, pageSize, qaCount, url, whatColumn, keyword, null); // whologin=null
		List<Qa> qaList = qDao.getQaList(pageInfo, map);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("whatColumn", whatColumn);
		model.addAttribute("keyword",keyword);
		model.addAttribute("qaList", qaList);
		
		return getPage;
	}


}
