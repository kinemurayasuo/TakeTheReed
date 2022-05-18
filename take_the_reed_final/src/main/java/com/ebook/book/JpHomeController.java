package com.ebook.book;

import java.util.ArrayList;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ebook.book.service.bookService;
import com.ebook.book.vo.BookVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class JpHomeController {
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@Autowired
	bookService service;
	
	private static final Logger logger = LoggerFactory.getLogger(JpHomeController.class);
	
	@RequestMapping(value = "/jp", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		ArrayList<BookVO> homeBookList = service.homeBookList();
		if(homeBookList != null) {
			logger.info("homeBookList: {}", homeBookList);
			model.addAttribute("homeBookList", homeBookList);
		}
		
		return "jp/homeJp";
	}
	
	
}

