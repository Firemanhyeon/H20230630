package com.yedam.board.control;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yedam.board.service.ReplyService;
import com.yedam.board.service.ReplyServiceImpl;
import com.yedam.board.vo.ReplyVO;
import com.yedam.common.Control;

public class ReplyListControl implements Control {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		//list도 넘기고 totalcount도 넘겨야해서 map타입
		Map<String, Object>map = new HashMap<>();
		
		String brdNo= req.getParameter("brdNo");
		//페이징
		String page = req.getParameter("page");
		page=page==null ? "1" : page;
		
		
		ReplyService svc = new ReplyServiceImpl();
		List<ReplyVO> list =svc.replyList(Long.parseLong(brdNo),Integer.parseInt(page));
		
		//페이징
		int totalCount = svc.replyCount(Long.parseLong(brdNo));
		map.put("list", list);
		map.put("count", totalCount);
		
		Gson gson= new GsonBuilder().create();
		return gson.toJson(map)+".json";
	}

}
