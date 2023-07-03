package com.yedam.board.control;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.board.service.BoardService;
import com.yedam.board.service.BoardServiceImpl;
import com.yedam.board.vo.BoardVO;
import com.yedam.common.Control;


public class BoardListControl implements Control {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		BoardService service = new BoardServiceImpl();
		
		List<BoardVO> list =service.list();
		
		req.setAttribute("boards", list);
		
		return "board/boardList.tiles";
	}

}
