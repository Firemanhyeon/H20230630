package com.yedam.calendar.control;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yedam.calendar.service.CalendarService;
import com.yedam.calendar.service.CalendarServiceImpl;
import com.yedam.calendar.vo.CalendarVO;
import com.yedam.common.Control;

public class RemoveEventControl implements Control {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse res) {
		Map<String,String> map = new HashMap<>();
		
		CalendarService service = new CalendarServiceImpl();
		String title = req.getParameter("title");
		System.out.println(title);
		String json ="";
		CalendarVO vo =new CalendarVO();
		vo.setTitle(title);
		
		if(service.removeEvent(vo)) {
			System.out.println("as");
			map.put("retCode","Success");
		}else {
			System.out.println("as222222222222");
			map.put("retCode","Fail");
		}
		
		Gson gson= new GsonBuilder().create();
		
		return gson.toJson(map)+ ".json";
	}

}
