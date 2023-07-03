package com.yedam.calendar.service;

import java.util.List;

import com.yedam.calendar.vo.CalendarVO;

public interface CalendarService {
	
	// 전체 목록
	List<CalendarVO> events();
	
	// 일정 등록
	public boolean addEvent(CalendarVO vo);
	
	// 일정 삭제
	public boolean removeEvent(CalendarVO vo);
	
	
}
