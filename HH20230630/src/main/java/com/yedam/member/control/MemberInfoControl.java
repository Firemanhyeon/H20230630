package com.yedam.member.control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.member.service.MemberService;
import com.yedam.member.service.MemberServiceImpl;
import com.yedam.member.vo.MemberVO;

public class MemberInfoControl implements Control {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		//service : getMember(id),mapper select(MemberVO id)
		//admin/memberInfo.jsp
		
		String no = req.getParameter("uid");
		MemberService service =new MemberServiceImpl();
		MemberVO vo = service.getMember(no);
		
		req.setAttribute("members", vo);
		
		
		return "admin/memberInfo.tiles";
		

	}

}
