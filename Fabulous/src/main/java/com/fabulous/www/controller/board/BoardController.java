package com.fabulous.www.controller.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fabulous.www.model.board.dto.BoardDTO;
import com.fabulous.www.service.board.BoardService;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Inject
	BoardService boardService;
	
	@RequestMapping("list.do")
	public ModelAndView list(String search_option, String keyword) throws Exception {
		int start = 0;
		int end = 0;
		List<BoardDTO> list = boardService.listAll(start, end, search_option, keyword);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board/list");
		Map<String,Object> map = new HashMap<>();
		map.put("list", list);
		map.put("count", list.size());
		mav.addObject("map", map);
		return mav;
	}
	
	@RequestMapping("write.do")
	public String write() {
		return "board/write";
	}
	
	@RequestMapping("insert.do")
	public String insert(@ModelAttribute BoardDTO dto, HttpSession session) throws Exception {
		// 로그인한 사용자 아이디(세션변수)
		String writer = (String)session.getAttribute("userid");
		dto.setWriter(writer);
		boardService.create(dto);
		return "redirect:/board/list.do";
	}
	
	@RequestMapping("view.do")
	public ModelAndView view(@RequestParam int bno, HttpSession session) throws Exception {
		// 조회수 증가처리
		boardService.increaseViewcnt(bno, session);
		// 레코드를 리턴받음
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board/view");
		mav.addObject("dto", boardService.read(bno));
		return mav;
	}
	
	@RequestMapping("update.do")
	public String update(@ModelAttribute BoardDTO dto) throws Exception {
		boardService.update(dto);
		return "redirect:/board/list.do";
	}
	
	@RequestMapping("delete.do")
	public String delete(@RequestParam int bno) throws Exception {
		boardService.delete(bno);
		return "redirect:/board/list.do";
	}
}
