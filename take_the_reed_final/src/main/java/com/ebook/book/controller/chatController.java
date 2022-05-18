package com.ebook.book.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/chat")
public class chatController {
	
	private static final Logger logger = LoggerFactory.getLogger(chatController.class);

	@RequestMapping(value = "/chat.do", method = RequestMethod.GET)
	public String chat() {
		logger.info("chat 메소드 실행(GET)");
		
		return "/chat/chat";
	}
}
