package com.gaon.cinema.login;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {
	@Autowired
	private LoginDAO dao;
	@Autowired
	private ServletContext application;
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@RequestMapping("/login.do")
	public void login(HttpServletResponse response,HttpServletRequest request) throws ServletException, IOException{
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		try {
			PrintWriter out = response.getWriter();
			String id = request.getParameter("loginID");
			String pw = request.getParameter("loginPW");
			int count = dao.loginSerch(id, pw);
			if(count == 2){
				LoginDTO dto = dao.Select(id,pw);
				String path = application.getContextPath()+"/resources/img/member/";
				session.setAttribute("NowUser", dto.getUSERID());
				session.setAttribute("Nowname", dto.getNAME());
				session.setAttribute("Nowpoint", dto.getPoint());
				session.setAttribute("Nowimg", dto.getImg_file());
				session.setAttribute("Nowpath", path);
				out.print("{\"check\": \""+ count + "\"}");
			}else{
				mav.addObject("check", count);
				out.print("{\"check\": \""+ count + "\"}");
			}
		}catch(Exception ex){	ex.printStackTrace();	}
	}
	
	@RequestMapping("/logout.do")	
	public ModelAndView logout(HttpServletResponse response,HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		session.invalidate();
		mav.setViewName("redirect:/main.do");
		return mav;
	}
	
}
