package com.gaon.cinema.event;

import java.io.IOException;

import java.io.PrintWriter;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.gaon.cinema.movie.MovieDTO;

@Controller
public class EventController {
	
	private static final Logger logger = LoggerFactory.getLogger(EventController.class);
	
	@Autowired
	private EventDAO dao;
	
	@RequestMapping(value = "/event.do", method = RequestMethod.GET)
	public ModelAndView event() {
		ModelAndView mav = new ModelAndView();
		
		List<EventDTO> nowevent = dao.dbNowEvent();
		List<EventDTO> endevent = dao.dbEndEvent();
		mav.addObject("nowevent", nowevent);
		mav.addObject("endevent", endevent);
		mav.addObject("page", "event");
		mav.setViewName("mainLayout");
		return mav;
	}
	
	@RequestMapping(value="/eventDetail.do", method=RequestMethod.GET)
	public void eventDetail(HttpServletRequest request, HttpServletResponse response) throws IOException{
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
		PrintWriter out = response.getWriter();
		String event_id = request.getParameter("event_id");
		EventDTO dto = dao.dbEventDetail(event_id);
		StringBuilder sb = new StringBuilder();
		sb.append("{");
		sb.append("\"event_id\": \"" + dto.getEvent_id() + "\", " );
		sb.append("\"title\": \""+ dto.getTitle() + "\", ");
		sb.append("\"e_start\": \"" + sdf.format(dto.getE_start()) + "\", ");
		sb.append("\"e_end\": \"" + sdf.format(dto.getE_end()) + "\", ");
		sb.append("\"poster\": \"" + dto.getPoster() + "\", ");
		sb.append("\"img\": \"" + dto.getImg() + "\" ");
		sb.append("}");
		out.print(sb.toString());
	}
	
}
