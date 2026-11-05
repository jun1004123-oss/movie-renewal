package com.gaon.cinema.admin;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gaon.cinema.member.MemberDTO;
import com.gaon.cinema.movie.MovieDTO;
import com.gaon.cinema.reservation.ReservationDTO;
import com.gaon.cinema.theater.TheaterDTO;
import com.gaon.cinema.theaterSeat.TheaterSeatDTO;

@Repository
public class AdminDAO {
	
	@Autowired
	private SqlSessionTemplate temp;
	
	/**
	 * 영화관리 부분
	 */
	
	/* 영화 목록 보기 */
	public List<MovieDTO> dbSelectMovieAll() {
		List<MovieDTO> list = temp.selectList("admin.selectMovieAll");
		return list;
	}
	
	/* 영화관 목록 보기 */
	public List<TheaterDTO> dbSelectTheaterAll() {
		List<TheaterDTO> list = temp.selectList("admin.selectTheaterAll");
		return list;
	}
	
	/* 영화관 최근 THEATER_ID 보기 */
	public int dbSelectTheaterLastTheater_id() {
		int theater_id = temp.selectOne("selectTheaterLastTheater_id");
		return theater_id;
	}
	
	/* 영화 추가 */
	public void dbInsertMovie(MovieDTO dto) {
		temp.insert("admin.insertMovie", dto);
	}
	
	/* 영화관 추가 */
	public void dbInsertTheater(TheaterDTO dto) {
		temp.insert("admin.insertTheater", dto);
	}
	
	/* 영화관 좌석 추가 */
	public void dbInsertTheaterSeat(TheaterSeatDTO dto) {
		temp.insert("admin.insertTheaterSeat", dto);
	}
	
	/* 영화 수정 */
	public void dbUpdateMovie(MovieDTO dto) {
		temp.update("admin.updateMovie", dto);
	}
	
	/* 영화관 수정 */
	public void dbUpdateTheater(TheaterDTO dto) {
		temp.update("admin.updateTheater", dto);
	}
	
	/* 영화관 좌석 수정 */
	public void dbUpdateTheaterSeat(TheaterSeatDTO dto) {
		temp.update("admin.updateTheaterSeat", dto);
	}
	
	/* 영화 삭제 */
	public void dbDeleteMovie(int movie_id) {
		temp.delete("admin.deleteMovie", movie_id);
	}
	
	/* 영화관 삭제 */
	public void dbDeleteTheater(int theater_id) {
		temp.delete("admin.deleteTheater", theater_id);
	}
	
	/**
	 * 영화관리 부분 끝
	 */
	
	/**
	 * 예약관리 부분
	 */
	
	/* 예약 목록 보기 */
	public List<ReservationDTO> dbSelectReservationAll() {
		List<ReservationDTO> list = temp.selectList("admin.selectReservationAll");
		return list;
	}
	
	/**
	 * 예약관리 부분 끝
	 */
	
	/**
	 * 회원관리 부분
	 */
	
	/* 회원 목록 보기 */
	public List<MemberDTO> dbSelectMemberAll() {
		List<MemberDTO> list = temp.selectList("admin.selectMemberAll");
		return list;
	}
	
	/**
	 * 회원관리 부분 끝
	 */
}
