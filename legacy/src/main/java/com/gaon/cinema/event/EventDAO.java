package com.gaon.cinema.event;

import java.text.SimpleDateFormat;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gaon.cinema.event.EventDAO;
import com.gaon.cinema.event.EventDTO;
import com.gaon.cinema.movie.MovieDTO;
import com.gaon.cinema.event.EventDTO;

@Repository
public class EventDAO {
	@Autowired
	private SqlSessionTemplate sql;
	
	private static Logger logger = LoggerFactory.getLogger(EventDAO.class);
	
	SimpleDateFormat trans = new SimpleDateFormat("yyyyMMdd");
	java.util.Date javatoday = new java.util.Date();     //오늘 날짜 
	String today = trans.format(javatoday); //오늘 날짜를 스트링으로 변환 
	
	public List<EventDTO> dbNowEvent(){
		EventDTO dto = new EventDTO();
		dto.setToday(today);
		List<EventDTO> list = sql.selectList("event.nowevent",dto);
		return list;
	}

	public List<EventDTO> dbEndEvent(){
		EventDTO dto = new EventDTO();
		dto.setToday(today);
		List<EventDTO> list = sql.selectList("event.endevent",dto);
		return list;
	}
	
	public EventDTO dbEventDetail(String event_id){
		EventDTO dto = new EventDTO();
		dto.setToday(today);
		dto.setEvent_id(Integer.parseInt(event_id));
		dto = sql.selectOne("event.eventdetail",dto);
		return dto;
	}
	
	
}
