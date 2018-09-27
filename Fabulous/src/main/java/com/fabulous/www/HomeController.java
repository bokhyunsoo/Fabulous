package com.fabulous.www;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fabulous.www.model.notice.dto.NoticeDTO;
import com.fabulous.www.service.board.Pager;
import com.fabulous.www.service.notice.NoticeService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Inject
	NoticeService noticeService;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home(@RequestParam(defaultValue="1") int curPage) throws Exception {
		int count = noticeService.countArticle();
		Pager pager = new Pager(count,curPage);
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();
		List<NoticeDTO> list = noticeService.listAll(start, end);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("home");
		Map<String,Object> map = new HashMap<>();
		map.put("list", list);
		map.put("count", list.size());
		map.put("pager", pager);
		mav.addObject("map", map);
		return mav;
	}
	
}
