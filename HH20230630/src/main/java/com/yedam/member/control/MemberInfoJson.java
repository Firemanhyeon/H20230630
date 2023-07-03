package com.yedam.member.control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.member.service.MemberService;
import com.yedam.member.service.MemberServiceImpl;
import com.yedam.member.vo.MemberVO;

public class MemberInfoJson implements Control {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		String uid = req.getParameter("uid");
		
		
		return null;
	}

}
