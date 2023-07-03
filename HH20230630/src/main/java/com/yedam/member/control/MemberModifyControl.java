package com.yedam.member.control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.member.service.MemberService;
import com.yedam.member.service.MemberServiceImpl;
import com.yedam.member.vo.MemberVO;

public class MemberModifyControl implements Control {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		String id = req.getParameter("uid");
		String pw = req.getParameter("upw");
		String ph= req.getParameter("uph");
		String ad = req.getParameter("uad");
		MemberVO vo = new MemberVO();
		vo.setUserId(id);
		vo.setUserPw(pw);
		vo.setUserPhone(ph);
		vo.setUserAddr(ad);
		
		
		MemberService service = new MemberServiceImpl();
		service.modifyMember(vo);
		
		//아작스로 리턴해줘야해서 다르게 보내야함 
		//{"retCode": "Success"}/{"retCode": "Fail"} 정상적으로 리턴했으면 success로 실패면 fail로 보낸다
		
		String json="";
		if(service.modifyMember(vo)) {
			json =" {\"retCode\": \"Success\"}";
		}else {
			json = "{\"retCode\": \"Fail\"}";
		}
		return json + ".json";
	}

}
