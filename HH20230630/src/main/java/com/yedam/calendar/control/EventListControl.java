package com.yedam.calendar.control;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yedam.calendar.service.CalendarService;
import com.yedam.calendar.service.CalendarServiceImpl;
import com.yedam.calendar.vo.CalendarVO;
import com.yedam.common.Control;

public class EventListControl implements Control {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse res) {
		
		CalendarService service = new CalendarServiceImpl();
		List<CalendarVO> list = service.events();
		
		// json 형식으로 만들어주는 라이브러리
		Gson gson = new GsonBuilder().create();
		String json = gson.toJson(list); // string으로 반환
		
		return json + ".json";
	}

}
