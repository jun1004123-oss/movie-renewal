package com.gaon.mail;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gaon.cinema.code.CodeDAO;
import com.gaon.cinema.code.CodeDTO;
import com.gaon.cinema.member.MemberDAO;
import com.gaon.cinema.member.MemberDTO;
import com.sun.media.jfxmedia.logging.Logger;

@Controller
public class EmailController {
    @Autowired
    private EmailSender emailSender;
    
    @Autowired
    private MemberDAO dao;
    
    @Autowired
  	private CodeDAO CodeDao;
    
    @RequestMapping("/memberpwSerch.do")
    public void sendEmailAction (HttpServletRequest request, HttpServletResponse response) throws Exception {
    		ModelAndView mav = new ModelAndView();
    		response.setCharacterEncoding("UTF-8");
  			response.setContentType("text/html;charset=UTF-8");
    		PrintWriter out = response.getWriter();
        Email email = new Email();
        MemberDTO dto = new MemberDTO();
        String id = request.getParameter("searchId");
        String name = request.getParameter("searchName");
        String reciver = request.getParameter("searchEmail"); //받을사람의 이메일입니다.
        dto.setUserid(id);
        dto.setName(name);
        dto.setEmail(reciver);
        int count = dao.pwSerch(id,name,reciver);
        if (count ==3){
        dto=dao.pwSelect(dto);
        String subject = "비밀번호 찾기 답변입니다.";
        String content = "이메일 내용입니다.\n";
        content += name+"님 패스워드 :" +dto.getUserpw()+"입니다.";
        email.setReciver(reciver);
        email.setSubject(subject);
        email.setContent(content);
        emailSender.SendEmail(email);
        out.print("{\"check\":\"" + count + "\",\"ok\": \"패스워드가 고객님의 메일로 발송되었습니다.\"}");
        }
        else {
        	out.print("{\"check\": \""+ count + "\"}");
        }
    }
    @RequestMapping("/buyMail.do")
    public void SendBuyMail (HttpServletRequest request, HttpServletResponse response, HttpSession s) throws Exception {
    	response.setCharacterEncoding("UTF-8");
    	response.setContentType("text/html;charset=UTF-8");
    	int ok=0;
    	PrintWriter out = response.getWriter();
    	Email email = new Email();
    	String id = (String)s.getAttribute("NowUser");
    	String type = request.getParameter("type");
    	String senderName = request.getParameter("senderName");
    	String senderEmail = request.getParameter("senderEmail");
    	String userName1 = request.getParameter("userName1");
    	String userEmail1 = request.getParameter("userEmail1");
    	int store_id = Integer.parseInt(request.getParameter("store_id"));
    	int buycount1 = Integer.parseInt(request.getParameter("buycount1"));
    	int getPoint = Integer.parseInt(request.getParameter("getPoint"));
    	String buyMoney = request.getParameter("buyMoney");
    	int price_sale = Integer.parseInt(request.getParameter("pricesale"));
    	String item_name = request.getParameter("itemname");
    	int myPoint = Integer.parseInt(request.getParameter("myPoint"));
    	int total = Integer.parseInt(request.getParameter("total"));
    	ok = dao.potinSub(id,getPoint);
    	if(ok==1){
    		Random rnd =new Random();
    		StringBuffer codeType =new StringBuffer();
    		StringBuffer code =new StringBuffer();
    		 
    		for(int i=0;i<30;i++){
    		    if(rnd.nextBoolean()){
    		    	code.append((char)((int)(rnd.nextInt(26))+97));
    		    }else{
    		    	code.append((rnd.nextInt(10))); 
    		    }
    		}
    		String code_name = codeType.append(type+"-"+code).toString();
    		System.out.println(codeType);
    		email.setStore_id(store_id);
    		email.setType(type);
    		email.setSenderName(senderName);
    		email.setSenderEmail(senderEmail);
    		email.setUserName(userName1);
    		email.setUserEmail(userEmail1);
    		email.setBuycount(buycount1);
    		email.setBuyMoney(buyMoney);
    		email.setGetPoint(getPoint);
    		email.setPrice_sale(price_sale);
    		email.setItem_name(item_name);
    		email.setMyPoint(myPoint);
    		email.setTotal(total);
    		CodeDTO codeDto = new CodeDTO(); 
    		codeDto.setStore_id(store_id);
    		codeDto.setSupply(buycount1);
    		codeDto.setCode_name(code_name);
    		CodeDao.create(codeDto);
    		codeDto.setTitle(item_name);
    		String startdate = CodeDao.selectStartDate(code_name);
    		String enddate = CodeDao.selectEndDate(code_name);
    		java.text.SimpleDateFormat format = new java.text.SimpleDateFormat("yyyy-MM-dd");
    		java.util.Date sdate = format.parse(startdate);
    		java.util.Date edate = format.parse(enddate);
    		 java.text.SimpleDateFormat format1 = new java.text.SimpleDateFormat("yyyy-MM-dd");
    	   String a = format1.format(sdate);
    	   String b = format1.format(edate);
    	   emailSender.codeSenderEmail(email);
    		emailSender.codeReciverEmail(email,codeDto,a,b);
    		out.print("{\"check\":\"" + ok + "\",\"msg\": \"결제 내역이 고객님의 메일로 발송되었습니다.\"}");
    	}
    }
}