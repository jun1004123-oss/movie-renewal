package com.gaon.cinema.admin;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.gaon.cinema.member.MemberDTO;
import com.gaon.cinema.movie.MovieDTO;
import com.gaon.cinema.reservation.ReservationDTO;
import com.gaon.cinema.theater.TheaterDTO;
import com.gaon.cinema.theaterSeat.TheaterSeatDTO;

@Controller
public class AdminController {
	
	@Autowired
	private ServletContext application;
	
	@Autowired
	private AdminDAO dao;
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	/* 회원관리 목록보기 */
	@RequestMapping(value = "/adminMemberList.do", method = RequestMethod.GET)
	public ModelAndView adminMemberList() {
		ModelAndView mav = new ModelAndView();
		
		List<MemberDTO> memberList = dao.dbSelectMemberAll();
		mav.addObject("memberList", memberList);
		
		mav.addObject("page", "adminMemberList");
		mav.setViewName("mainLayout");
		return mav;
	}
	
	/* 예약관리 목록보기 */
	@RequestMapping(value = "/adminReservationList.do", method = RequestMethod.GET)
	public ModelAndView adminReservationList() {
		ModelAndView mav = new ModelAndView();
		
		List<ReservationDTO> reservationList = dao.dbSelectReservationAll();
		mav.addObject("reservationList", reservationList);
		
		mav.addObject("page", "adminReservationList");
		mav.setViewName("mainLayout");
		return mav;
	}
	
	/* 영화, 영화관 목록보기 */
	@RequestMapping(value = "/adminMovieTheaterList.do", method = RequestMethod.GET)
	public ModelAndView adminMovieTheaterList() {
		ModelAndView mav = new ModelAndView();
		
		List<MovieDTO> movieList = dao.dbSelectMovieAll();
		List<TheaterDTO> theaterList = dao.dbSelectTheaterAll();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일");
		for(int i = 0; i < movieList.size(); i++) {
			movieList.get(i).setSTARTDATESTRING(sdf.format(movieList.get(i).getSTARTDATE()));
			movieList.get(i).setENDDATESTRING(sdf.format(movieList.get(i).getENDDATE()));
		}
		mav.addObject("movieList", movieList);
		mav.addObject("theaterList", theaterList);
		
		mav.addObject("page", "adminMovieTheaterList");
		mav.setViewName("mainLayout");
		return mav;
	}
	
	/* 영화 추가하기 폼 */
	@RequestMapping(value = "/adminMoviePreInsert.do", method = RequestMethod.GET)
	public ModelAndView adminMoviePreInsert() {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("page", "adminMovieInsert");
		mav.setViewName("mainLayout");
		return mav;
	}
	
	/* 영화 추가하기 동작 */
	@RequestMapping(value = "/adminMovieInsert.do", method = RequestMethod.POST)
	public ModelAndView adminMovieInsert(MovieDTO dto) {
		ModelAndView mav = new ModelAndView();
		
		String AGEtext = dto.getAGEtext();
		if(AGEtext.equals("전체 관람가")) { dto.setAGE("all"); }
		else if(AGEtext.equals("12세 관람가")) { dto.setAGE("12"); }
		else if(AGEtext.equals("15세 관람가")) { dto.setAGE("15"); }
		else if(AGEtext.equals("청소년 관람불가")) { dto.setAGE("19"); }
		
		/** 
		 * 이미지 파일 설정
		 */
		String path = application.getRealPath("/resources/img/movie");
		String POSTER = dto.getPOSTERFILE().getOriginalFilename();
		dto.setPOSTER(POSTER);
		File POSTERFILE = new File(path, POSTER);
		String STEEL1 = dto.getSTEEL1FILE().getOriginalFilename();
		dto.setSTEEL1(STEEL1);
		File STEEL1FILE = new File(path, STEEL1);
		String STEEL2 = dto.getSTEEL2FILE().getOriginalFilename();
		dto.setSTEEL2(STEEL2);
		File STEEL2FILE = new File(path, STEEL2);
		String STEEL3 = dto.getSTEEL3FILE().getOriginalFilename();
		dto.setSTEEL3(STEEL3);
		File STEEL3FILE = new File(path, STEEL3);
		String STEEL4 = dto.getSTEEL4FILE().getOriginalFilename();
		dto.setSTEEL4(STEEL4);
		File STEEL4FILE = new File(path, STEEL4);
		String STEEL5 = dto.getSTEEL5FILE().getOriginalFilename();
		dto.setSTEEL5(STEEL5);
		File STEEL5FILE = new File(path, STEEL5);
		String STEEL6 = dto.getSTEEL6FILE().getOriginalFilename();
		dto.setSTEEL6(STEEL6);
		File STEEL6FILE = new File(path, STEEL6);
		String STEEL7 = dto.getSTEEL7FILE().getOriginalFilename();
		dto.setSTEEL7(STEEL7);
		File STEEL7FILE = new File(path, STEEL7);
		try {
			dto.getPOSTERFILE().transferTo(POSTERFILE);
			dto.getSTEEL1FILE().transferTo(STEEL1FILE);
			dto.getSTEEL2FILE().transferTo(STEEL2FILE);
			dto.getSTEEL3FILE().transferTo(STEEL3FILE);
			dto.getSTEEL4FILE().transferTo(STEEL4FILE);
			dto.getSTEEL5FILE().transferTo(STEEL5FILE);
			dto.getSTEEL6FILE().transferTo(STEEL6FILE);
			dto.getSTEEL7FILE().transferTo(STEEL7FILE);
		} catch(Exception e) { e.printStackTrace(); }
		/** 
		 * 이미지 파일 설정 끝
		 */
		
		/**
		 * 날짜 포맷 설정
		 */
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			dto.setD_DAY(sdf.parse(dto.getD_DAYSTRING()));
			dto.setSTARTDATE(sdf.parse(dto.getSTARTDATESTRING()));
			dto.setENDDATE(sdf.parse(dto.getENDDATESTRING()));
		} catch(Exception e) { e.printStackTrace(); }
		/**
		 * 날짜 포맷 설정 끝
		 */
		
		dao.dbInsertMovie(dto);
		
		mav.setViewName("redirect:/adminMovieTheaterList.do");
		return mav;
	}
	
	/* 영화 수정하기 폼 */
	@RequestMapping(value = "/adminMoviePreEdit.do", method = RequestMethod.GET)
	public ModelAndView adminMoviePreEdit() {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("page", "adminMovieEdit");
		mav.setViewName("mainLayout");
		return mav;
	}
	
	/* 영화 수정하기 동작 */
	@RequestMapping(value = "/adminMovieEdit.do", method = RequestMethod.GET)
	public ModelAndView adminMovieEdit(MovieDTO dto) {
		ModelAndView mav = new ModelAndView();
		
		dao.dbUpdateMovie(dto);
		
		mav.setViewName("redirect:/adminMovieTheaterList.do");
		return mav;
	}
	
	/* 영화 삭제하기 동작 */
	@RequestMapping(value = "/adminMovieDelete.do", method = RequestMethod.GET)
	public ModelAndView adminMovieDelete(@RequestParam int movie_id) {
		ModelAndView mav = new ModelAndView();
		
		dao.dbDeleteMovie(movie_id);
		
		mav.setViewName("redirect:/adminMovieTheaterList.do");
		return mav;
	}
	
	/* 영화관 추가하기 폼 */
	@RequestMapping(value = "/adminTheaterPreInsert.do", method = RequestMethod.GET)
	public ModelAndView adminTheaterPreInsert() {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("page", "adminTheaterInsert");
		mav.setViewName("mainLayout");
		return mav;
	}
	
	/* 영화관 추가하기 동작 */
	@RequestMapping(value = "/adminTheaterInsert.do", method = RequestMethod.GET)
	public ModelAndView adminTheaterInsert(TheaterDTO tdto, TheaterSeatDTO tsdto, @RequestParam String listSeat) {
		ModelAndView mav = new ModelAndView();
		
		String[] list = listSeat.split(",");
		/* 영화관 추가 */
		tdto.setSeatcount(list.length);
		dao.dbInsertTheater(tdto);
		
		/* 영화관 좌석 추가 */
		tsdto.setTheater_id(dao.dbSelectTheaterLastTheater_id());
		for(int i = 0; i < list.length; i++) {
			tsdto.setSeat(list[i]);
			dao.dbInsertTheaterSeat(tsdto);
		}
		
		mav.setViewName("redirect:/adminMovieTheaterList.do");
		return mav;
	}
	
	/* 영화관 수정하기 폼 */
	@RequestMapping(value = "/adminTheaterPreEdit.do", method = RequestMethod.GET)
	public ModelAndView adminTheaterPreEdit() {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("page", "adminTheaterEdit");
		mav.setViewName("mainLayout");
		return mav;
	}
	
	/* 영화관 수정하기 동작 */
	@RequestMapping(value = "/adminTheaterEdit.do", method = RequestMethod.GET)
	public ModelAndView adminTheaterEdit(TheaterDTO dto) {
		ModelAndView mav = new ModelAndView();
		
		dao.dbUpdateTheater(dto);
		
		mav.setViewName("redirect:/adminMovieTheaterList.do");
		return mav;
	}
	
	/* 영화관 삭제하기 동작 */
	@RequestMapping(value = "/adminTheaterDelete.do", method = RequestMethod.GET)
	public ModelAndView adminTheaterDelete(@RequestParam int theater_id) {
		ModelAndView mav = new ModelAndView();
		
		dao.dbDeleteTheater(theater_id);
		
		mav.setViewName("redirect:/adminMovieTheaterList.do");
		return mav;
	}
}
