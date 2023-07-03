package com.yedam.member.control;

import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yedam.common.Control;
import com.yedam.member.service.MemberService;
import com.yedam.member.service.MemberServiceImpl;
import com.yedam.member.vo.MemberVO;

public class MemberAddControl implements Control {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		//uid uname upw uphone uaddr ubirth 파라미터로 넘
		String uid = req.getParameter("uid");
		String uname = req.getParameter("uname");
		String upw = req.getParameter("upw");
		String uphone = req.getParameter("uphone");
		String uaddr=req.getParameter("uaddr");
		String ubirth = req.getParameter("ubirth");
		System.out.println(ubirth);
		SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd");
		MemberVO vo = new MemberVO();
		vo.setUserId(uid);
		vo.setUserPw(upw);
		vo.setUserPhone(uphone);
		vo.setUserName(uname);
		vo.setUserAddr(uaddr);
		try {
			vo.setUserBirth(sdf.parse(ubirth));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		MemberService svc = new MemberServiceImpl();
		svc.insert(vo);
		
		Gson gson = new GsonBuilder().create();
		
		return gson.toJson(vo) +".json";
	}

}
