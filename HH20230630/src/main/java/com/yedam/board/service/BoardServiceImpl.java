package com.yedam.board.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yedam.board.dao.BoardMapper;
import com.yedam.board.vo.BoardVO;
import com.yedam.common.DataSource;

public class BoardServiceImpl implements BoardService{
	SqlSession session=DataSource.getInstance().openSession(true);
	BoardMapper mapper = session.getMapper(BoardMapper.class);
	
	
	@Override
	public List<BoardVO> list() {
		return mapper.list();
	}

	@Override
	public BoardVO getBoard(long brdNO) {
		BoardVO vo = mapper.select(brdNO);
		mapper.updateCnt(brdNO);
		return vo;
	}

	@Override
	public boolean addBoard(BoardVO vo) {
		return mapper.insert(vo)==1;
	}

	@Override
	public boolean editBoard(BoardVO vo) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delBoard(long brdNO) {
		// TODO Auto-generated method stub
		return false;
	}

}
