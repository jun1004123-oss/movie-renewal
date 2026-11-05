package com.gaon.cinema.movie;

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
public class MovieDAO {
	@Autowired
	private SqlSessionTemplate sql;
	
	private static Logger logger = LoggerFactory.getLogger(MovieDAO.class);

	java.util.Date javatoday = new java.util.Date();     //오늘 날짜 
	SimpleDateFormat trans = new SimpleDateFormat("yyyyMMdd");
	String today = trans.format(javatoday); //오늘 날짜를 스트링으로 변환 
	
	public List<MovieDTO> dbNowMovie(){
		List<MovieDTO> list = sql.selectList("movie.nowmovie", today);
		return list;
	}
	
	public List<MovieDTO> dbNextMovie(){
		List<MovieDTO> list = sql.selectList("movie.nextmovie", today);
		return list;
	}
	
	public MovieDTO dbMovieDetail(String MOVIE_ID){
		MovieDTO dto = new MovieDTO();
		dto.setToday(today);
		dto.setMOVIE_ID(Integer.parseInt(MOVIE_ID));
		MovieDTO dto2 = sql.selectOne("movie.movieDetail", dto);
		return dto2;
	}
	
	public MovieDTO dbMovieRate(String MOVIE_ID, String ratevalue, String AVG, String AVG_NUM){
		DecimalFormat df = new DecimalFormat(".00");
		MovieDTO dto = new MovieDTO();
		dto.setMOVIE_ID(Integer.parseInt(MOVIE_ID));
		dto.setRatevalue(ratevalue);
		dto.setAVG(Double.parseDouble(df.format((Double.parseDouble(AVG)*Double.parseDouble(AVG_NUM)+Double.parseDouble(ratevalue))/(Double.parseDouble(AVG_NUM)+1)))); 
		dto.setAVG_NUM(Integer.parseInt(AVG_NUM)+1);
		sql.update("movie.movieRate", dto);
		MovieDTO dto2 = sql.selectOne("movie.movieRateDetail", dto);
		return dto2;
	}
	
	public void dbRateInsert(String MOVIE_ID, String NowUser){
		JoinDTO joindto= new JoinDTO();
		joindto = sql.selectOne("movie.RateCheck", NowUser);
		String MOVIE_RATE = joindto.getMOVIE_RATE() + "/" + MOVIE_ID;
		RateDTO dto = new RateDTO();
		dto.setNowUser(NowUser);
		dto.setMOVIE_RATE(MOVIE_RATE);
		sql.update("movie.RateUpdate", dto);
	}
	
	public int dbRateCheck(String MOVIE_ID, String NowUser){
		int check = 0;
		JoinDTO dto= new JoinDTO();
		dto = sql.selectOne("movie.RateCheck", NowUser);
		if(dto.getMOVIE_RATE().matches(".*"+MOVIE_ID+".*")){check=1;}
		return check;
	}
	
	public int dbLikeCheck(String MOVIE_ID, String NowUser){
		int check = 0;
		JoinDTO dto= new JoinDTO();
		dto = sql.selectOne("movie.LikeCheck", NowUser);
		if(dto.getMOVIE_LIKE().matches(".*"+MOVIE_ID+".*")){check=1;}
		return check;
	}
	
	public void dbLikeInsert(String MOVIE_ID, String NowUser){
		JoinDTO joindto= new JoinDTO();
		joindto = sql.selectOne("movie.LikeCheck", NowUser);
		String MOVIE_LIKE = joindto.getMOVIE_LIKE() + "/" + MOVIE_ID + "/";
		while(MOVIE_LIKE.matches(".*//.*")){
			MOVIE_LIKE = MOVIE_LIKE.replaceAll("//", "/");
		}
		RateDTO dto = new RateDTO();
		dto.setNowUser(NowUser);
		dto.setMOVIE_LIKE(MOVIE_LIKE);
		sql.update("movie.LikeUpdate", dto);
	}
	
	public void dbLikeDelete(String MOVIE_ID, String NowUser){
		JoinDTO joindto= new JoinDTO();
		joindto = sql.selectOne("movie.LikeCheck", NowUser);
		String MOVIE_LIKE = joindto.getMOVIE_LIKE().replace(MOVIE_ID, "");
		while(MOVIE_LIKE.matches(".*//.*")){
			MOVIE_LIKE = MOVIE_LIKE.replaceAll("//", "/");
		}
		RateDTO dto = new RateDTO();
		dto.setNowUser(NowUser);
		dto.setMOVIE_LIKE(MOVIE_LIKE);
		sql.update("movie.LikeUpdate", dto);
	}
	
	public List<MovieDTO> dbLikeMovie(String NowUser){
		List<MovieDTO> list = new ArrayList<MovieDTO>();
		JoinDTO joindto= new JoinDTO();
		joindto = sql.selectOne("movie.LikeCheck", NowUser);
		String likelist = joindto.getMOVIE_LIKE();
		MovieDTO spend = new MovieDTO();
		if(!likelist.equals("empty/")&&!likelist.equals("empty")){
			while(!likelist.equals("empty/")&&!likelist.equals("empty")){
				String MOVIE_ID = likelist.substring(likelist.indexOf("/")+1, likelist.indexOf("/", likelist.indexOf("/")+1));
				spend.setToday(today);
				spend.setMOVIE_ID(Integer.parseInt(MOVIE_ID));
				MovieDTO dto = sql.selectOne("movie.likemovie", spend);
				list.add(dto);
				likelist = likelist.replaceFirst("/"+MOVIE_ID, "");
			}
		}
		return list;
	}
	
}
