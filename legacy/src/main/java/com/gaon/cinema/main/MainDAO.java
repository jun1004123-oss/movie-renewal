package com.gaon.cinema.main;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gaon.cinema.join.JoinDTO;

@Repository
public class MainDAO {
	@Autowired
	private SqlSessionTemplate sql;
	
	private static Logger logger = LoggerFactory.getLogger(MainDAO.class);

	java.util.Date javatoday = new java.util.Date();     //오늘 날짜 
	SimpleDateFormat trans = new SimpleDateFormat("yyyyMMdd");
	String today = trans.format(javatoday); //오늘 날짜를 스트링으로 변환 
	
	public List<MainDTO> dbNowMovie(){
		List<MainDTO> list = sql.selectList("main.nowmovie", today);
		return list;
	}
	
	public List<MainDTO> dbNextMovie(){
		List<MainDTO> list = sql.selectList("main.nextmovie", today);
		return list;
	}
	
	public MainDTO dbMovieDetail(String MOVIE_ID){
		MainDTO dto = new MainDTO();
		dto.setToday(today);
		dto.setMOVIE_ID(Integer.parseInt(MOVIE_ID));
		MainDTO dto2 = sql.selectOne("main.movieDetail", dto);
		return dto2;
	}
}
