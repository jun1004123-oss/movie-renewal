package com.gaon.cinema.join;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.annotation.Around;
import org.slf4j.Logger;

import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class JoinController {
	private static final Logger logger = LoggerFactory.getLogger(JoinController.class);
	
	@Autowired
	private ServletContext application;
	@Autowired
	private JoinDAO dao;
	
	@RequestMapping("/write.do")
	public ModelAndView write(){
		ModelAndView mav = new ModelAndView();
		mav.addObject("page","join");
		mav.setViewName("mainLayout");
		return mav;
	}
	
	@RequestMapping("/join.do")
	public ModelAndView join(HttpServletRequest request,JoinDTO dto){
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		int ok;
		try {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		String day = request.getParameter("day");
		java.util.Date tempDate;
		tempDate = sdf.parse(year + "-" + month + "-" + day);
		java.sql.Date date = new java.sql.Date(tempDate.getTime());
		dto.setBirth(date);
		
		String path = application.getRealPath("/resources/img/member/");
		String img = dto.getUpload().getOriginalFilename();
		File file = new File(path,img);
		dto.getUpload().transferTo(file);
		dto.setImg_file(img);
		ok=dao.dbjoin(dto);
		if(ok==1){
			session.setAttribute("ok","회원가입 축하드립니다."+ "<br>" +"2000포인트 지급되었습니다.");
			mav.setViewName("redirect:/main.do");
			return mav;
		}
		
		} catch (Exception e) {e.printStackTrace();	}
		mav.setViewName("redirect:/main.do");
		return mav;
		
	}
	
	@RequestMapping("/search.do")
	public void search(HttpServletResponse response,HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		PrintWriter out;
		try {
			out = response.getWriter();
			String id = request.getParameter("loginID");
			int count = dao.idSearch(id);
			if(count == 1){
				out.print("{\"check\": \""+ count + "\"}");
			}else{
				mav.addObject("check", count);
				out.print("{\"check\": \""+ count + "\"}");
			}
		} catch (IOException e) {e.printStackTrace();}
		return;
	}
	
}
