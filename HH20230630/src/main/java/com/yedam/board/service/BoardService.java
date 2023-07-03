package com.yedam.board.service;

import java.util.List;

import com.yedam.board.vo.BoardVO;

public interface BoardService {
	public List<BoardVO> list();
	public BoardVO getBoard(long brdNO);
	public boolean addBoard(BoardVO vo);
	public boolean editBoard(BoardVO vo);
	public boolean delBoard(long brdNO);
}
