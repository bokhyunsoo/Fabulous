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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fabulous.www.model.board.dto.BoardDTO;
import com.fabulous.www.service.board.BoardService;
import com.fabulous.www.service.board.Pager;
import com.fabulous.www.service.board.ReplyService;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Inject
	BoardService boardService;
	
	@Inject
	ReplyService replyService;
	
	// REST방식의 url {bno} => PathVariable로 선언
	@RequestMapping("getAttach/{bno}")
	@ResponseBody // 뷰가 아닌 데이터를 보낼 경우
	public List<String> getAttach(@PathVariable("bno") int bno){
		return boardService.getAttach(bno);
	}
	
	@RequestMapping("list.do")
	public ModelAndView list(@RequestParam(defaultValue="1") int curPage, @RequestParam(defaultValue="all") String search_option, @RequestParam(defaultValue="") String keyword) throws Exception {
		// 레코드 갯수 계산
		int count = boardService.countArticle(search_option, keyword);
		// 페이지의 시작번호, 끝번호 계산
		Pager pager = new Pager(count,curPage);
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();
		List<BoardDTO> list = boardService.listAll(start, end, search_option, keyword);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board/list");
		Map<String,Object> map = new HashMap<>();
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		map.put("pager", pager);
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
		mav.addObject("Replycount", replyService.count(bno));
		mav.addObject("Attachcount", boardService.Attachcount(bno));
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
