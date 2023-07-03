package com.yedam.board.control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yedam.board.service.ReplyService;
import com.yedam.board.service.ReplyServiceImpl;
import com.yedam.board.vo.ReplyVO;
import com.yedam.common.Control;

public class AddReplyControl implements Control {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		//원본글 작성자 댓글내용
		String bno = req.getParameter("bno");
		String replyer = req.getParameter("replyer");
		String reply = req.getParameter("reply");
		
		ReplyVO vo = new ReplyVO();
		vo.setBrdNo(Long.parseLong(bno));
		vo.setReply(reply);
		vo.setReplyer(replyer);
		
		ReplyService svc = new ReplyServiceImpl();
		svc.addReply(vo);
		
		Gson gson = new GsonBuilder().create();
		
		return gson.toJson(vo)+".json";
	}

}
