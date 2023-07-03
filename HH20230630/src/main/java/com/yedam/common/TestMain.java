package com.yedam.common;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yedam.board.dao.ReplyMapper;
import com.yedam.board.vo.ReplyVO;

public class TestMain {

	public static void main(String[] args) {
		SqlSession session = DataSource.getInstance().openSession();
//		MemberMapper mapper = session.getMapper(MemberMapper.class);
//		
//		List<Map<String,Object>>list = mapper.charData();//List<Map<String,Object>>타입이다 
//		for(Map<String , Object> map: list) {
//			System.out.println("부서: "+ map.get("DEPARTMENT_NAME")+", 인원: "+ map.get("CNT"));
//		}
		ReplyMapper mapper = session.getMapper(ReplyMapper.class);
//		
		//등록테스트
		ReplyVO vo = new ReplyVO();
//		vo.setBrdNo(964);
//		vo.setReply("dd");
//		vo.setReplyer("cvvv");
//		System.out.println("등록완료");
//		mapper.insertReply(vo);
//		
		//삭제테스트
//		mapper.deleteReply(9);
//		System.out.println("삭제완료");
//		
		
		ReplyVO reply = new ReplyVO();
		
		reply.setBrdNo(964);
		reply.setReply("댓글연습입니다 수정입니다");
		reply.setReplyer("kkkddd");
		reply.setReplyNo(7);
		
		//수정 테스트
		ReplyVO vo2 = new ReplyVO();
		vo2.setBrdNo(964);
		vo2.setReply("댓글연습입니다 수정입니다");
		vo2.setReplyer("kkkddd");
		vo2.setReplyNo(7);	
		mapper.updateReply(vo2);
		
		//list테스트
//		List<ReplyVO> list = mapper.selectList(964);
//		
//		for(ReplyVO vo1 : list) {
//			System.out.println(vo1.toString());
		}
	

}
