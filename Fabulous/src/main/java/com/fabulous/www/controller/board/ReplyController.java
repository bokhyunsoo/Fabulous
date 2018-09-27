package com.fabulous.www.controller.board;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.fabulous.www.model.board.dto.ReplyDTO;
import com.fabulous.www.service.board.Pager;
import com.fabulous.www.service.board.ReplyService;

//Controller - 뷰를 리턴
//데이터를 리턴하려면 @ResponseBody
//RestController - 데이터(json)를 리턴
//	 뷰를 리턴하려면 ModelAndView

@RestController // 스프링 4.0부터 사용
@RequestMapping("/reply/*")
public class ReplyController {

	@Inject
	ReplyService replyService;
	
	@RequestMapping("insert.do")
	public void insert(@ModelAttribute ReplyDTO dto, HttpSession session) {
		String userid = (String) session.getAttribute("userid");
		dto.setReplyer(userid);
		replyService.create(dto);
	}
	
	// RestController의 주용도는 뷰가 아닌 데이터를 리턴
	// 뷰를 리턴할 경우는 ModelAndView 사용
	@RequestMapping("list.do")
	public ModelAndView list(@RequestParam int bno, @RequestParam(defaultValue="1") int curPage, ModelAndView mav, HttpSession session) {
		// 댓글의 갯수 계산
		int count = replyService.count(bno);
		// 페이징 처리 클래스
		Pager pager = new Pager(count,curPage);
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();
		List<ReplyDTO> list = replyService.list(bno, start, end, session);
		mav.setViewName("board/reply_list"); // 뷰의 이름
		mav.addObject("list", list); // 뷰에 전달할 데이터
		mav.addObject("pager", pager); // 페이지 내비게이션
		return mav;
	}
	
	// @ResponseBody : 리턴 타입이 json
//	@RequestMapping("list_json.do")
//	public @ResponseBody List<ReplyDTO>
//	list_json(@RequestParam(defaultValue="1") int curPage, @RequestParam int bno, HttpSession session){
//		return replyService.list(bno, 1, 10, session);
//	}
	
	// 댓글 상세보기
	@RequestMapping("detail/{rno}")
	public ModelAndView replyDetail(@PathVariable("rno") Integer rno, ModelAndView mav) {
		ReplyDTO dto = replyService.detail(rno);
		mav.setViewName("board/reply_detail");
		mav.addObject("dto", dto);
		return mav;
	}
	
	// 댓글 수정 처리
	// RequestMethod를 여러 방식으로 설정할 경우 {}안에 작성
	@RequestMapping(value="update/{rno}", method= {RequestMethod.PUT, RequestMethod.PATCH})
	public ResponseEntity<String> replyUpdate(@PathVariable("rno") Integer rno, @RequestBody ReplyDTO dto) {
		ResponseEntity<String> entity = null;
		try {
			dto.setRno(rno);
			replyService.update(dto);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	// 댓글 삭제 처리
	@RequestMapping("delete/{rno}")
	public ResponseEntity<String> replyDelete(@PathVariable("rno") Integer rno) {
		ResponseEntity<String> entity = null;
		try {
			replyService.delete(rno);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
			
		}
		return entity;
	}
}
