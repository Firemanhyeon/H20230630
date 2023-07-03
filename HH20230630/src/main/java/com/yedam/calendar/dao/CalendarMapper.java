package com.yedam.calendar.dao;

import java.util.List;

import com.yedam.calendar.vo.CalendarVO;

public interface CalendarMapper {
	
	// 목록
	public List<CalendarVO> getList();
	
	// 추가
	public int insert(CalendarVO vo);
	
	// 제거
	public int delete(CalendarVO vo);
}
