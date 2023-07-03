package com.yedam.board.control;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yedam.board.service.ReplyService;
import com.yedam.board.service.ReplyServiceImpl;
import com.yedam.common.Control;

public class DelReplyControl implements Control {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		Map<String , String >map = new HashMap<>();//성공실패 두개로 나뉘기때문에 맵사용
		
		String rno =req.getParameter("rno");
		
		ReplyService svc = new ReplyServiceImpl();
		
		
		if(svc.removeReply(Long.parseLong(rno))) {
			map.put("retCode", "Success");
		}else {
			map.put("retCode", "Fail");
		}
		Gson gson=new GsonBuilder().create();
		
		return gson.toJson(map)+".json";
	}

}
