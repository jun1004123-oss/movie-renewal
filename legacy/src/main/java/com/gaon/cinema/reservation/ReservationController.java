package com.gaon.cinema.reservation;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ReservationController {
	
	@Autowired
	ReservationDAO dao;
	
	private static final Logger logger = LoggerFactory.getLogger(ReservationController.class);
	
	@RequestMapping(value = "/reservation.do", method = RequestMethod.GET)
	public ModelAndView reservation() {		ModelAndView mav = new ModelAndView();
		
		List<ReservationShowDTO> movieList = dao.dbSelectMovieNameAgeAll();
		List<ReservationShowDTO> theaterCnameList = dao.dbSelectTheaterCnameAll();
		ReservationShowDTO dto = new ReservationShowDTO();
		dto.setMovie_id(movieList.get(0).getMovie_id());
		dto.setCname(theaterCnameList.get(0).getCname());
		List<ReservationShowDTO> theaterLnameList = dao.dbSelectTheaterLname(dto);
		List<ReservationShowDTO> dateList = dao.dbSelectDateAll();
		mav.addObject("movieList", movieList);
		mav.addObject("theaterCnameList", theaterCnameList);
		mav.addObject("theaterLnameList", theaterLnameList);
		mav.addObject("dateList", dateList);
		
		mav.addObject("page", "reservation");
		mav.setViewName("mainLayout");
		return mav;
	}//reservationMovie
	
	@RequestMapping(value = "/moviereservation.do", method = RequestMethod.GET)
	public ModelAndView moviereservation(HttpServletResponse response, HttpServletRequest request) {  ModelAndView mav = new ModelAndView();
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		List<ReservationShowDTO> movieList = dao.dbSelectMovieNameAgeAll();
		List<ReservationShowDTO> theaterCnameList = dao.dbSelectTheaterCnameAll();
		ReservationShowDTO dto = new ReservationShowDTO();
		dto.setMovie_id(movieList.get(0).getMovie_id());
		dto.setCname(theaterCnameList.get(0).getCname());
		List<ReservationShowDTO> theaterLnameList = dao.dbSelectTheaterLname(dto);
		List<ReservationShowDTO> dateList = dao.dbSelectDateAll();
		String movie_id = request.getParameter("movie_id");
		String name_k = request.getParameter("name_k");
		String age = request.getParameter("age");
		
		mav.addObject("movie_id", movie_id);
		mav.addObject("name_k", name_k);
		mav.addObject("age", age);
		mav.addObject("movieList", movieList);
		mav.addObject("theaterCnameList", theaterCnameList);
		mav.addObject("theaterLnameList", theaterLnameList);
		mav.addObject("dateList", dateList);
		
		mav.addObject("page", "reservation");
		mav.setViewName("mainLayout");
		return mav;
	}//reservationMovie
	
	
	/* 영화 이름, 관람가 가져오기(전체) */
	@RequestMapping(value = "/reservationSelectMovieNameAgeAll.do", method = RequestMethod.GET)
	public void reservationSelectMovieNameAgeAll(HttpServletResponse response) {
		try {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			
			List<ReservationShowDTO> list = dao.dbSelectMovieNameAgeAll();
			/* JSON 시작 */
			String json = "{\"list\":[";
			for(int i = 0; i < list.size(); i++) {
				json = json + "{\"movie_id" + "\":" + "\"" + list.get(i).getMovie_id() + "\",";
				json = json + "\"name_k" + "\":" + "\"" + list.get(i).getName_k() + "\",";
				json = json + "\"corder" + "\":" + "\"" + list.get(i).getCorder() + "\",";
				json = json + "\"age" + "\":" + "\"" + list.get(i).getAge() + "\"}";
				if(i < list.size() - 1) { json = json + ", "; }
			}
			json = json + "]}";
			/* JSON 끝 */
			out.print(json);
		} catch(Exception e) { e.printStackTrace(); }
	}
	
	/* 영화 이름, 관람가 가져오기(도시 OR 지역 OR 날짜) */
	@RequestMapping(value = "/reservationSelectMovieNameAge.do", method = RequestMethod.GET)
	public void reservationSelectMovieNameAge(HttpServletResponse response, ReservationShowDTO dto) {
		try {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			
			List<ReservationShowDTO> list = dao.dbSelectMovieNameAge(dto);
			/* JSON 시작 */
			String json = "{\"list\":[";
			for(int i = 0; i < list.size(); i++) {
				json = json + "{\"movie_id" + "\":" + "\"" + list.get(i).getMovie_id() + "\",";
				json = json + "\"name_k" + "\":" + "\"" + list.get(i).getName_k() + "\",";
				json = json + "\"corder" + "\":" + "\"" + list.get(i).getCorder() + "\",";
				json = json + "\"age" + "\":" + "\"" + list.get(i).getAge() + "\"}";
				if(i < list.size() - 1) { json = json + ", "; }
			}
			json = json + "]}";
			/* JSON 끝 */
			out.print(json);
		} catch(Exception e) { e.printStackTrace(); }
	}
	/* 최종예약 */
	@RequestMapping(value = "/LastRev.do", method = RequestMethod.GET)
	public void LastRev(ReservationDTO dto, HttpServletResponse response) throws ServletException, IOException{
		try {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			dao.dbInsertrev(dto);
			String json = "{\"rev\":\"ok\"}";
			out.print(json);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}//reservationMovie
	/* 개인예약 확인 */
	@RequestMapping(value = "/selectrev.do", method = RequestMethod.GET)
	public ModelAndView selectrev(HttpServletResponse response, @RequestParam String userid) {
		ModelAndView mav = new ModelAndView();
		List<ReservationDTO> revList = dao.dbselectrev(userid);
		for (int i = 0; i < revList.size(); i++) {
			String seat = revList.get(i).getSeat();
			int price = revList.get(i).getPrice();
			revList.get(i).setPricecomma(String.format("%,d", price));
			seat = seat.replaceAll("/", " ");
			revList.get(i).setSeat(seat);
		}
		int i = 10000000;
		String str = String.format("%,d", i);
		
		mav.addObject("revList", revList);
		mav.addObject("page", "checkrev");
		mav.setViewName("mainLayout");
		return mav;
	}//reservationMovie
	
	/* 특정스케쥴 예약확인 */
	@RequestMapping(value = "/seatRevCheck.do", method = RequestMethod.GET)
	public void seatRevCheck(HttpServletResponse response, @RequestParam String scheduleid) {
		try {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			
			List<ReservationDTO> list = dao.dbseatRevCheck(scheduleid);
			
			StringBuilder sb = new StringBuilder();
			for (int i = 0; i < list.size() ; i++) {
				sb.append(list.get(i).getSeat());
			}
			String json = "{\"revseat\":\""+sb.toString()+"\"}";
			out.print(json);
		} catch(Exception e) { e.printStackTrace(); }
	}
	
	/* 좌석 행열 가져오기 */
	@RequestMapping(value = "/seatNum.do", method = RequestMethod.GET)
	public void seatNum(HttpServletResponse response, @RequestParam String THEATER_ID) {
		try {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			
			ReservationDTO rowcol = dao.dbseatNum(THEATER_ID);
			String json = "{\"row\":\""+rowcol.getSEATROWCOUNT()+"\", \"col\":\""+rowcol.getSEATCOLCOUNT()+"\", \"TTYPE\":\""+rowcol.getTtype()+"\"}";
			out.print(json);
		} catch(Exception e) { e.printStackTrace(); }
		
	}//seatNum end
	
	
	/* 영화관 도시 이름 가져오기(전체) */
		@RequestMapping(value = "/reservationSelectTheaterCnameAll.do", method = RequestMethod.GET)
		public void reservationSelectTheaterCnameAll(HttpServletResponse response) {
			List<ReservationShowDTO> list = dao.dbSelectTheaterCnameAll();
			/* JSON 시작 */
			try {
				response.setCharacterEncoding("UTF-8");
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				String json = "{\"list\":[";
				for(int i = 0; i < list.size(); i++) {
					json = json + "{\"cname" + "\":" + "\"" + list.get(i).getCname() + "\",";
					json = json + "\"corder" + "\":" + "\"" + list.get(i).getCorder() + "\",";
					json = json + "\"age" + "\":" + "\"" + list.get(i).getAge() + "\"}";
					if(i < list.size() - 1) { json = json + ", "; }
				}
				json = json + "]}";
				/* JSON 끝 */
				out.print(json);
			} catch (IOException e) {
			}
			
			
		} 
	
	/* 영화관 도시 이름 가져오기(영화 OR 날짜) */
	@RequestMapping(value = "/reservationSelectTheaterCname.do", method = RequestMethod.GET)
	public void reservationSelectTheaterCname(HttpServletResponse response, ReservationShowDTO dto) {
		try {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			
			List<ReservationShowDTO> list = dao.dbSelectTheaterCname(dto);
			/* JSON 시작 */
			String json = "{\"list\":[";
			for(int i = 0; i < list.size(); i++) {
				json = json + "{\"cname" + "\":" + "\"" + list.get(i).getCname() + "\",";
				json = json + "\"corder" + "\":" + "\"" + list.get(i).getCorder() + "\"}";
				if(i < list.size() - 1) { json = json + ", "; }
			}
			json = json + "]}";
			/* JSON 끝 */
			out.print(json);
		} catch(Exception e) { e.printStackTrace(); }
	}
	
	/* 영화관 지역 이름 가져오기(도시) */
	@RequestMapping(value = "/reservationSelectTheaterLnameAll.do", method = RequestMethod.GET)
	public void reservationSelectTheaterLnameAll(HttpServletResponse response, ReservationShowDTO dto) {
		try {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			
			List<ReservationShowDTO> list = dao.dbSelectTheaterLnameAll(dto);
			/* JSON 시작 */
			String json = "{\"list\":[";
			for(int i = 0; i < list.size(); i++) {
				json = json + "{\"lname" + "\":" + "\"" + list.get(i).getLname() + "\",";
				//json = json + "\"ts_id" + "\":" + "\"" + list.get(i).getTHEATER_SCHEDULE_ID() + "\",";
				json = json + "\"corder2" + "\":" + "\"" + list.get(i).getCorder2() + "\"}";
				if(i < list.size() - 1) { json = json + ", "; }
			}
			json = json + "]}";
			/* JSON 끝 */
			out.print(json);
		} catch(Exception e) { e.printStackTrace(); }
	}
	
	/* 영화관 지역 이름 가져오기(영화 AND 도시) */
	@RequestMapping(value = "/reservationSelectTheaterLname.do", method = RequestMethod.GET)
	public void reservationSelectTheaterLname(HttpServletResponse response, ReservationShowDTO dto) {
		try {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			
			List<ReservationShowDTO> list = dao.dbSelectTheaterLname(dto);
			/* JSON 시작 */
			String json = "{\"list\":[";
			for(int i = 0; i < list.size(); i++) {
				json = json + "{\"lname" + "\":" + "\"" + list.get(i).getLname() + "\",";
				//json = json + "\"ts_id" + "\":" + "\"" + list.get(i).getTHEATER_SCHEDULE_ID() + "\",";
				json = json + "\"corder2" + "\":" + "\"" + list.get(i).getCorder2() + "\"}";
				if(i < list.size() - 1) { json = json + ", "; }
			}
			json = json + "]}";
			/* JSON 끝 */
			out.print(json);
		} catch(Exception e) { e.printStackTrace(); }
	}
	
	/* 날짜 가져오기(전체) */
	@RequestMapping(value = "/reservationSelectDateAll.do", method = RequestMethod.GET)
	public void reservationSelectDateAll(HttpServletResponse response) {
		try {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			
			List<ReservationShowDTO> list = dao.dbSelectDateAll();
			/* JSON 시작 */
			String json = "{\"list\":[";
			for(int i = 0; i < list.size(); i++) {
				json = json + "{\"mstartdate" + "\":" + "\"" + list.get(i).getMstartdate() + "\"}";
				if(i < list.size() - 1) { json = json + ", "; }
			}
			json = json + "]}";
			/* JSON 끝 */
			out.print(json);
		} catch(Exception e) { e.printStackTrace(); }
	}
	
	/* 날짜 가져오기(영화 OR 도시 OR 지역) */
	@RequestMapping(value = "/reservationSelectDate.do", method = RequestMethod.GET)
	public void reservationSelectDate(HttpServletResponse response, ReservationShowDTO dto) {
		try {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			
			List<ReservationShowDTO> list = dao.dbSelectDate(dto);
			/* JSON 시작 */
			String json = "{\"list\":[";
			for(int i = 0; i < list.size(); i++) {
				json = json + "{\"mstartdate" + "\":" + "\"" + list.get(i).getMstartdate() + "\"}";
				if(i < list.size() - 1) { json = json + ", "; }
			}
			json = json + "]}";
			/* JSON 끝 */
			out.print(json);
		} catch(Exception e) { e.printStackTrace(); }
	}
	
	/* 시간 가져오기(영화 AND 도시 AND 지역 AND 날짜) */
	@RequestMapping(value = "/reservationSelectHour.do", method = RequestMethod.GET)
	public void reservationSelectHour(HttpServletResponse response, ReservationShowDTO dto) {
		try {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			
			List<ReservationShowDTO> list = dao.dbSelectHour(dto);
			
			/* JSON 시작 */
			String json = "{\"list\":[";
			for(int i = 0; i < list.size(); i++) {
				json = json + "{\"tname" + "\":" + "\"" + list.get(i).getTname() + "\",";
				json = json + "\"THEATER_ID" + "\":" + "\"" + list.get(i).getTHEATER_ID() + "\",";
				json = json + "\"THEATER_SCHEDULE_ID" + "\":" + "\"" + list.get(i).getTHEATER_SCHEDULE_ID() + "\",";
				json = json + "\"mendhour" + "\":" + "\"" + list.get(i).getMendhour() + "\",";
				json = json + "\"mstarthour" + "\":" + "\"" + list.get(i).getMstarthour() + "\"}";
				if(i < list.size() - 1) { json = json + ", "; }
			}
			json = json + "]}";
			/* JSON 끝 */
			out.print(json);
		} catch(Exception e) { System.out.println("시간가져오기 에러"); }
	}
}//ReservationController class END
