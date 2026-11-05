package com.gaon.cinema.member;

import java.io.File;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.gaon.cinema.login.LoginDTO;
import com.gaon.mail.Email;
import com.gaon.mail.EmailController;

@Controller
public class MemberController {
	@Autowired
	MemberDAO dao;
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	@Autowired
	private ServletContext application;
	
	@RequestMapping("/memberPreSerch.do")
	public ModelAndView memberPreSerch(HttpServletRequest request, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("page", "memberPreSearch");
		mav.setViewName("mainLayout");
		return mav;
	}

	@RequestMapping("/memberidSerch.do")
	public void memberidSerch(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		try {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
			String name = request.getParameter("searchName");
			String email = request.getParameter("searchEmail");
			MemberDTO dto = new MemberDTO();
			dto.setName(name);
			dto.setEmail(email);
			int count = dao.idSerch(dto);
			if(count == 1){
				dto = dao.idSelect(dto);
				out.print("{\"check\": \""+ count +"\",\"id\": \""+dto.getUserid()+"\"}");
			}else{
				mav.addObject("check", dto.getCnt());
				out.print("{\"check\": \" 존재하지않는 아이디입니다 \"}");
			}
		}catch(Exception ex){	ex.printStackTrace();	}
	}
	
	@RequestMapping("/member.do")
	public ModelAndView member(HttpServletRequest request, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String id = (String)session.getAttribute("NowUser");
		MemberDTO dto = new MemberDTO();
		dto.setUserid(id);
		dto=dao.dbmember(dto);
		
		String year = new SimpleDateFormat("yyyy").format(dto.getBirth());
		String month = new SimpleDateFormat("MM").format(dto.getBirth());
		String day = new SimpleDateFormat("dd").format(dto.getBirth());
		
		mav.addObject("year", year);
		mav.addObject("month", month);
		mav.addObject("day", day);
		mav.addObject("member", dto);
		mav.addObject("page", "member");
		mav.setViewName("mainLayout");
		return mav;
	}
	
	@RequestMapping("/memberPreEdit.do")
	public ModelAndView memberPreEdit(HttpServletRequest request, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String id = (String)session.getAttribute("NowUser");
		MemberDTO dto = new MemberDTO();
		dto.setUserid(id);
		dto=dao.dbmember(dto);
		
		String year = new SimpleDateFormat("yyyy").format(dto.getBirth());
		String month = new SimpleDateFormat("MM").format(dto.getBirth());
		String day = new SimpleDateFormat("dd").format(dto.getBirth());
		mav.addObject("year", year);
		mav.addObject("month", month);
		mav.addObject("day", day);
		mav.addObject("member", dto);
		mav.addObject("page", "memberPreEdit");
		mav.setViewName("mainLayout");
		return mav;
	}
	
	@RequestMapping("/memberEdit.do")
	public ModelAndView memberEdit(MemberDTO dto,HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		try{
		String path = application.getRealPath("/resources/img/member/");
		String img = dto.getUpload().getOriginalFilename();
		File file = new File(path,img);
		dto.getUpload().transferTo(file);
		dto.setImg_file(img);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		String day = request.getParameter("day");
		java.util.Date tempDate;
		tempDate = sdf.parse(year + "-" + month + "-" + day);
		java.sql.Date date = new java.sql.Date(tempDate.getTime());
		dto.setBirth(date);
		
		dao.dbEdit(dto);
		
		year = new SimpleDateFormat("yyyy").format(dto.getBirth());
		month = new SimpleDateFormat("MM").format(dto.getBirth());
		day = new SimpleDateFormat("dd").format(dto.getBirth());
		
		session.setAttribute("NowUser", dto.getUserid());
		session.setAttribute("Nowname", dto.getName());
		session.setAttribute("Nowpoint", dto.getPoint());
		session.setAttribute("Nowimg", dto.getImg_file());
		session.setAttribute("Nowpath", path);
		
		mav.addObject("year", year);
		mav.addObject("month", month);
		mav.addObject("day", day);
		mav.addObject("member", dto);
		mav.addObject("page", "member");
		mav.setViewName("mainLayout");
		}catch(Exception e){ e.printStackTrace();}
		return mav;
	}
	
	@RequestMapping("/memberDelete.do")
	public ModelAndView memberDelete(HttpServletRequest request, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String id = (String)session.getAttribute("NowUser");
		MemberDTO dto = new MemberDTO();
		dto.setUserid(id);
		int ok = dao.dbDelete(dto);
		if(ok == 1){
			session.setAttribute("ok","이용해주셔서 감사합니다.");
			session.removeAttribute("NowUser"); 
			mav.addObject("page", "main");
			mav.setViewName("mainLayout");
			return mav;
		}
		mav.setViewName("redirect:/main.do");
		return mav;
	}
	
}
