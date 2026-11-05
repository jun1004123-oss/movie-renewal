package com.gaon.cinema.qnaReply;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.gaon.cinema.qna.QnaDTO;

@Controller
public class QnaReplyController {
	
	@Autowired
	QnaReplyDAO dao;
	
	private static final Logger logger = LoggerFactory.getLogger(QnaReplyController.class);
	
	@RequestMapping(value = "/qnaReplyInsert.do", method = RequestMethod.GET)
	public ModelAndView qnaReplyInsert(QnaReplyDTO dto) {
		ModelAndView mav =  new ModelAndView();	
		dao.dbAddQnaReply(dto);
		mav.setViewName("redirect:/qnaDetail.do?qna_id=" + dto.getQna_id());
		return mav;
	}//qnaReplyInsert end 
	
	
	//수정
	@RequestMapping(value = "/EditQnaReply.do", method = RequestMethod.GET)
	public ModelAndView EditQnaReply(QnaReplyDTO dto) {
		ModelAndView mav = new ModelAndView();	
		dao.dbEditQnaReply(dto);
		mav.setViewName("redirect:/qnaDetail.do?qna_id=" + dto.getQna_id());
		return mav;
	}//Edit end
	
	//--삭제
	@RequestMapping(value = "/DeleteQnaReply.do", method = RequestMethod.GET)
	public ModelAndView DeleteQnaReply(QnaReplyDTO dto) {
		ModelAndView mav = new ModelAndView();	
		dao.dbDeleteQnaReply(dto);
		mav.setViewName("redirect:/qnaDetail.do?qna_id=" + dto.getQna_id());
		return mav;
	}//DeleteQnaReply end
	
}//QnaController class END
