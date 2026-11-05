package com.gaon.cinema.qna;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javafx.scene.media.Media;
import com.gaon.cinema.qna.QnaDTO;
import com.gaon.cinema.qnaReply.QnaReplyDAO;
import com.gaon.cinema.qnaReply.QnaReplyDTO;
import com.gaon.cinema.util.PagingHandler;

@Controller
public class QnaController {
	
	@Autowired
	private QnaDAO dao;
	
	@Autowired
	private QnaReplyDAO qrdao;

	private static final Logger logger = LoggerFactory.getLogger(QnaController.class);

	//--리스트
	@RequestMapping(value = "/qnaList.do", method = RequestMethod.GET)
	public ModelAndView qnaList(QnaDTO dto, HttpServletRequest request) throws ServletException, IOException{
		ModelAndView mav = new ModelAndView();		/* 검색 처리 */
		String skey =  dto.getSkey() == null ? "title" : dto.getSkey();
		String sval = dto.getSval() == null ? "" : dto.getSval();
		String returnstring = "&skey=" + skey + "&sval=" +sval;
		//검색 dto 세팅
		dto.setSkey(skey);
		dto.setSval(sval);
		/* 검색 처리 끝 */
		
		/* 페이징 처리 */
		int total = dao.dbCountAll();	//전체 글의 개수
		 
		String pageNum = request.getParameter("pagenum");
		if(pageNum==null||pageNum==""){
			pageNum = String.valueOf(dto.getPagenum()==0 ? 1 : dto.getPagenum());
		}
		PagingHandler ph = new PagingHandler(dao.dbCountSearch(dto), 10, 5, Integer.parseInt(pageNum));
		
		//페이징 dto 세팅
		dto.setStart(ph.getStart());
		dto.setEnd(ph.getEnd());
		/* 페이징 처리 끝 */
		
		/* qnaList.jsp에 객체 추가 */
		mav.addObject("list", dao.dbSelect(dto));
		mav.addObject("total", total);
		mav.addObject("searchtotal", ph.getSearchtotal());
		mav.addObject("pagenum", ph.getPagenum());
		mav.addObject("pagelistsize", ph.getPagelistsize());
		mav.addObject("pagestart", ph.getPagestart());
		mav.addObject("pageend", ph.getPageend());
		mav.addObject("pagelistnum", ph.getPagelistnum());
		mav.addObject("pagelisttotal", ph.getPagelisttotal());
		mav.addObject("returnstring", returnstring);
		/* qnalist.jsp에 객체 추가 끝 */
		
	  mav.addObject("page", "qnaList");
		mav.setViewName("mainLayout");
		return mav;
	}//end
	
	//--한건상세
	@RequestMapping(value="/qnaDetail.do")
	public ModelAndView qnaDetail(HttpServletResponse response, @RequestParam int qna_id, HttpServletRequest request) {	
		ModelAndView mav = new ModelAndView();
		
		/* 게시판 */
		dao.dbAddCount(qna_id); //게시글을 클릭하자마자 조회수 1 증가
		QnaDTO dto = dao.dbDetail(qna_id);
		mav.addObject("bean", dto);
		
		String pageNum = request.getParameter("pagenum");
		if(pageNum==null){
			pageNum = "1";
		}
		
		/* 게시판 댓글 */
		List<QnaReplyDTO> replyList = qrdao.dbSelectQnaReply(qna_id);
		mav.addObject("replyList", replyList);
		mav.addObject("pagenum", pageNum);
		mav.addObject("page", "qnaDetail");
		mav.setViewName("mainLayout");
		return mav;
	}//end
	
	// --게시글 작성폼 띄우기
	@RequestMapping(value = "/qnaPreInsert.do", method = RequestMethod.GET)
	public ModelAndView qnaPreInsert() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("page", "qnaInsert");
		mav.setViewName("mainLayout");
		return mav;
	}//AddInsert end
	
	// --게시글 데이터베이스로 추가
	@RequestMapping(value = "/qnaInsert.do", method = RequestMethod.GET)
	public ModelAndView qnaInsert(QnaDTO dto) {
		ModelAndView mav = new ModelAndView();
		dao.dbInsert(dto);
		mav.setViewName("redirect:/qnaList.do");
		return mav;
	}
	
//--수정(가짜)
	@RequestMapping(value = "/qnaPreEdit.do", method = RequestMethod.GET)
	public ModelAndView qnaPreEdit(@RequestParam int qna_id) {
		ModelAndView mav = new ModelAndView();
		QnaDTO dto = dao.dbDetail(qna_id);
		mav.addObject("bean", dto);
		mav.addObject("page", "qnaEdit");
		mav.setViewName("mainLayout");
		return mav;
	}//PreEdit end
	
	//수정(진짜)
	@RequestMapping(value = "/qnaEdit.do", method = RequestMethod.GET)
	public ModelAndView qnaEdit(QnaDTO dto) {
		ModelAndView mav = new ModelAndView();	
		dao.dbEdit(dto);
		mav.setViewName("redirect:/qnaDetail.do?qna_id="+dto.getQna_id());
		return mav;
	}//Edit end
	
	//--삭제
	@RequestMapping(value = "/qnaDelete.do", method = RequestMethod.GET)
	public ModelAndView qnaDelete(QnaDTO dto) {
		ModelAndView mav = new ModelAndView();	
		dao.dbDelete(dto);
		mav.setViewName("redirect:/qnaList.do");
		return mav;
	}//end
	
}//QnaController class END
