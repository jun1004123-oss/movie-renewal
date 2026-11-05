package com.gaon.cinema.notice;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class NoticeController {
	
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	@RequestMapping(value = "/notice.do", method = RequestMethod.GET)
	public ModelAndView notice() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("page", "notice");
		mav.setViewName("mainLayout");
		return mav;
	}
}
