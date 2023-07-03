package com.yedam.board.dao;

import java.util.List;

import com.yedam.board.vo.BoardVO;

public interface BoardMapper {
	public List<BoardVO> list();
	public BoardVO select(long bno);
	public int updateCnt(long bno);
	public int  delete(long bno);
	public int update(BoardVO board);
	public int insert(BoardVO board);
	
	
}
