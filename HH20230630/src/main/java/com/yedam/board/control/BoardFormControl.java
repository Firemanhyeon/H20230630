package com.yedam.board.control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.board.service.BoardService;
import com.yedam.board.service.BoardServiceImpl;
import com.yedam.board.vo.BoardVO;
import com.yedam.common.Control;

public class BoardFormControl implements Control {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		return "board/boardForm.tiles";
	}

}
