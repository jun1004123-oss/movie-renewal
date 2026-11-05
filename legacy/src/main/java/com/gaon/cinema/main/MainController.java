package com.gaon.cinema.main;

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
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Autowired
	private MainDAO dao;
	
	@RequestMapping(value = "/mainLayout.do", method = RequestMethod.GET)
	public ModelAndView mainLayout(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		String mainPage = request.getParameter("mainPage");
		if(mainPage == null) { mainPage = "main"; }
		mav.addObject("mainPage", mainPage);
		mav.setViewName("mainLayout");
		return mav;
	}
	
	@RequestMapping(value = "/main.do", method = RequestMethod.GET)
	public ModelAndView main() {
		ModelAndView mav = new ModelAndView();
		List<MainDTO> nowlist = dao.dbNowMovie();
		List<MainDTO> nextlist = dao.dbNextMovie();
		mav.addObject("moviepage", "nowmovie");
		mav.addObject("nowmovie", nowlist);
		mav.addObject("nextmovie", nextlist);
		mav.addObject("page", "main");
		mav.setViewName("mainLayout");
		return mav;
		
	}
/*test*/
	@RequestMapping(value = "/step2.do", method = RequestMethod.GET)
	public ModelAndView step2() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("page", "step2");
		mav.setViewName("mainLayout");
		return mav;
		
	}
/*test*/
	
	@RequestMapping(value = "/mainDetail.do", method = RequestMethod.GET)
	public void movieDetail(HttpServletResponse response,HttpServletRequest request) throws ServletException, IOException{
		SimpleDateFormat trans = new SimpleDateFormat("yyyy.MM.dd");
		PrintWriter out = response.getWriter();
		String MOVIE_ID = request.getParameter("MOVIE_ID");
		MainDTO m_Detail = dao.dbMovieDetail(MOVIE_ID);
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
		sb.append("\"R_TIME\": \""+ m_Detail.getR_TIME() + "\", ");
		sb.append("\"STARTDATE\": \""+ trans.format(m_Detail.getSTARTDATE()) + "\", ");
		sb.append("\"ENDDATE\": \""+ trans.format(m_Detail.getENDDATE()) + "\", ");
		sb.append("\"dday\": \""+ m_Detail.getDday() + "\" ");
		sb.append("}");
		out.print(sb.toString());
	}	
}
