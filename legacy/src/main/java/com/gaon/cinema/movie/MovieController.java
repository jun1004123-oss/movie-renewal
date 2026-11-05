package com.gaon.cinema.movie;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MovieController {
	
	private static final Logger logger = LoggerFactory.getLogger(MovieController.class);
	
	@Autowired
	private MovieDAO dao;
	
	@RequestMapping(value = "/movie.do", method = RequestMethod.GET)
	public ModelAndView movie() {
		ModelAndView mav = new ModelAndView();
		List<MovieDTO> nowlist = dao.dbNowMovie();
		List<MovieDTO> nextlist = dao.dbNextMovie();
		mav.addObject("moviepage", "nowmovie");
		mav.addObject("nowmovie", nowlist);
		mav.addObject("nextmovie", nextlist);
		mav.addObject("page", "movie");
		mav.setViewName("mainLayout");
		return mav;
	}
	
	@RequestMapping(value = "/movieDetail.do", method = RequestMethod.GET)
	public void movieDetail(HttpServletResponse response,HttpServletRequest request) throws ServletException, IOException{
		SimpleDateFormat trans = new SimpleDateFormat("yyyy.MM.dd");
		PrintWriter out = response.getWriter();
		String MOVIE_ID = request.getParameter("MOVIE_ID");
		MovieDTO m_Detail = dao.dbMovieDetail(MOVIE_ID);
		StringBuilder sb = new StringBuilder();
		sb.append("{");
		sb.append("\"MOVIE_ID\": \""+ m_Detail.getMOVIE_ID() + "\", "); 
		sb.append("\"NAME_K\": \""+ URLEncoder.encode(m_Detail.getNAME_K() , "UTF-8") + "\", "); 
		sb.append("\"NAME_E\": \""+ URLEncoder.encode(m_Detail.getNAME_E() , "UTF-8") + "\", "); 
		sb.append("\"AGE\": \""+ URLEncoder.encode(m_Detail.getAGE() , "UTF-8") + "\", ");		 
		sb.append("\"AGEtext\": \""+ URLEncoder.encode(m_Detail.getAGEtext() , "UTF-8") + "\", ");
		sb.append("\"D_DAY\": \""+ trans.format(m_Detail.getD_DAY()) + "\", ");
		sb.append("\"DIRECTOR\": \""+ URLEncoder.encode(m_Detail.getDIRECTOR() , "UTF-8") + "\", ");
		sb.append("\"ACTOR\": \""+ URLEncoder.encode(m_Detail.getACTOR() , "UTF-8") + "\", ");
		sb.append("\"GENRE\": \""+ URLEncoder.encode(m_Detail.getGENRE() , "UTF-8") + "\", ");
		sb.append("\"PAGE\": \""+ URLEncoder.encode(m_Detail.getPAGE() , "UTF-8") + "\", ");
		sb.append("\"AVG\": \""+ m_Detail.getAVG()+ "\", ");
		sb.append("\"AVG_NUM\": \""+ m_Detail.getAVG_NUM() + "\", ");
		sb.append("\"CONTENT\": \""+ URLEncoder.encode(m_Detail.getCONTENT() , "UTF-8") + "\", ");
		sb.append("\"POSTER\": \""+ URLEncoder.encode(m_Detail.getPOSTER() , "UTF-8") + "\", ");
		sb.append("\"MOVIE\": \""+ URLEncoder.encode(m_Detail.getMOVIE() , "UTF-8") + "\", ");
		sb.append("\"STEEL1\": \""+ URLEncoder.encode(m_Detail.getSTEEL1() , "UTF-8") + "\", ");
		sb.append("\"STEEL2\": \""+ URLEncoder.encode(m_Detail.getSTEEL2() , "UTF-8") + "\", ");
		sb.append("\"STEEL3\": \""+ URLEncoder.encode(m_Detail.getSTEEL3() , "UTF-8") + "\", ");
		sb.append("\"STEEL4\": \""+ URLEncoder.encode(m_Detail.getSTEEL4() , "UTF-8") + "\", ");
		sb.append("\"STEEL5\": \""+ URLEncoder.encode(m_Detail.getSTEEL5() , "UTF-8") + "\", ");
		sb.append("\"STEEL6\": \""+ URLEncoder.encode(m_Detail.getSTEEL6() , "UTF-8") + "\", ");
		sb.append("\"STEEL7\": \""+ URLEncoder.encode(m_Detail.getSTEEL7() , "UTF-8") + "\", ");
		sb.append("\"R_TIME\": \""+ m_Detail.getR_TIME() + "\", ");
		sb.append("\"STARTDATE\": \""+ trans.format(m_Detail.getSTARTDATE()) + "\", ");
		sb.append("\"ENDDATE\": \""+ trans.format(m_Detail.getENDDATE()) + "\", ");
		sb.append("\"dday\": \""+ m_Detail.getDday() + "\" ");
		sb.append("}");
		out.print(sb.toString());
	}
	
	@RequestMapping(value = "/movieDetailrate.do", method = RequestMethod.GET)
	public void movieDetailrate(HttpServletResponse response,HttpServletRequest request) throws ServletException, IOException{
		PrintWriter out = response.getWriter();
		String MOVIE_ID = request.getParameter("MOVIE_ID");
		String ratevalue = request.getParameter("value");
		String AVG = request.getParameter("AVG");
		String AVG_NUM = request.getParameter("AVG_NUM");
		String NowUser = request.getParameter("NowUser");
		dao.dbRateInsert(MOVIE_ID, NowUser);
		MovieDTO rateresult = dao.dbMovieRate(MOVIE_ID, ratevalue, AVG, AVG_NUM);
		StringBuilder sb = new StringBuilder();
		sb.append("{");
		sb.append("\"AVG\": \""+ rateresult.getAVG() + "\", "); 
		sb.append("\"AVG_NUM\": \""+ rateresult.getAVG_NUM() + "\""); 
		sb.append("}");
		out.print(sb.toString());
	}
	
	@RequestMapping(value = "/RateCheck.do", method = RequestMethod.GET)
	public void RateCheck(HttpServletResponse response,HttpServletRequest request) throws ServletException, IOException{
		PrintWriter out = response.getWriter();
		String MOVIE_ID = request.getParameter("MOVIE_ID");
		String NowUser = request.getParameter("NowUser");
		int check = dao.dbRateCheck(MOVIE_ID, NowUser);
		out.print("{\"check\":\""+check+"\"}");
	}
	
	@RequestMapping(value = "/LikeCheck.do", method = RequestMethod.GET)
	public void LikeCheck(HttpServletResponse response,HttpServletRequest request) throws ServletException, IOException{
		PrintWriter out = response.getWriter();
		String MOVIE_ID = request.getParameter("MOVIE_ID");
		String NowUser = request.getParameter("NowUser");
		int check = dao.dbLikeCheck(MOVIE_ID, NowUser);
		out.print("{\"check\":\""+check+"\"}");
	}
	
	@RequestMapping(value = "/LikeAdd.do", method = RequestMethod.GET)
	public void LikeAdd(HttpServletResponse response,HttpServletRequest request) throws ServletException, IOException{
		PrintWriter out = response.getWriter();
		String MOVIE_ID = request.getParameter("MOVIE_ID");
		String NowUser = request.getParameter("NowUser");
		dao.dbLikeInsert(MOVIE_ID, NowUser);
		out.print("{\"check\":\"1\"}");
	}
	
	@RequestMapping(value = "/LikeRemove.do", method = RequestMethod.GET)
	public void LikeRemove(HttpServletResponse response,HttpServletRequest request) throws ServletException, IOException{
		PrintWriter out = response.getWriter();
		String MOVIE_ID = request.getParameter("MOVIE_ID");
		String NowUser = request.getParameter("NowUser");
		dao.dbLikeDelete(MOVIE_ID, NowUser);
		out.print("{\"check\":\"1\"}");
	}
	
	@RequestMapping(value = "/LikeMovie.do", method = RequestMethod.GET)
	public ModelAndView LikeMovie(HttpServletRequest request) throws ServletException, IOException{
		ModelAndView mav = new ModelAndView();
		String emp = "true"; 
		String NowUser = request.getParameter("NowUser");
		List<MovieDTO> likeMovie = dao.dbLikeMovie(NowUser);
		if(!likeMovie.isEmpty()){emp = "false";}
		mav.addObject("emp", emp);
		mav.addObject("likeMovie", likeMovie);
		mav.addObject("page", "likeMovie");
		mav.setViewName("mainLayout");
		return mav;
	}
}
