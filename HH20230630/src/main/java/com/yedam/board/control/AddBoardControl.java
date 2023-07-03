package com.yedam.board.control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.board.service.BoardService;
import com.yedam.board.service.BoardServiceImpl;
import com.yedam.board.vo.BoardVO;
import com.yedam.common.Control;

public class AddBoardControl implements Control {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		BoardService service = new BoardServiceImpl();

		String title = req.getParameter("title");
		String writer = req.getParameter("writer");
		String content = req.getParameter("content");

		BoardVO vo = new BoardVO();
		vo.setBrdTitle(title);
		vo.setBrdWriter(writer);
		vo.setBrdContent(content);

		// {"retCode":"Success"}/ {"retCode":"Fail"}
		if (service.addBoard(vo)) {
			return "boardList.do";

		} else {
			return "addBoard.do";
		}
	}

}
