package com.fabulous.www.service.board;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.fabulous.www.model.board.dto.BoardDTO;

public interface BoardService {
	public void deleteFile(String fullName);
	public List<String> getAttach(int bno);
	public void create(BoardDTO dto) throws Exception;
	public BoardDTO read(int bno) throws Exception;
	public void update(BoardDTO dto) throws Exception;
	public void delete(int bno) throws Exception;
	public List<BoardDTO> listAll(int start, int end,String search_option, String keyword) throws Exception;
	public void increaseViewcnt(int bno, HttpSession session) throws Exception; // 조회수 증가
	// 레코드 갯수 계산
	public int countArticle(String search_option, String keyword) throws Exception;
}
