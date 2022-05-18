package com.ebook.book.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ebook.book.service.CheckoutService;

@Controller
@RequestMapping(value = "/checkout")
public class checkoutcontroller {
	private static final Logger logger = LoggerFactory.getLogger(checkoutcontroller.class);
	
	@Autowired
	private CheckoutService service;
	
	// 결제 페이지 이동
	@RequestMapping(value = "/checkout", method = RequestMethod.GET)
	public String checkout() {
		logger.info("checkout(GET) 메소드 실행");
		
		return "checkout/checkout";
	}
	
	@RequestMapping(value = "/sub", method = RequestMethod.POST)
	public String sub(int addDate, HttpSession session, Model model, HttpServletResponse response_equals) throws IOException {
		logger.info("sub(POST) 메소드 실행");
		
		String userId = (String) session.getAttribute("loginId");
		logger.info("userId: {}", userId);
		
		if(userId != null) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("userId", userId);
			map.put("addDate", addDate);
			
			logger.info("안녕하세요{}", userId);
			// 구독 여부 확인
			boolean chkSub = service.chkSub(userId);
			logger.info("감사해요");
			// 구독 중이 아님, 구독 만료일을 오늘로 설정(구독 중일 때는 아무런 처리를 안함)
			if (chkSub == false) {
				logger.info("구독 중이 아님, {}구독만료일을 오늘 날자로 변경 시도", userId);
				boolean resultUpdateSubEndSet = service.updateSubEndSet(userId);
				if (resultUpdateSubEndSet) {
					logger.info("오늘 날짜로 설정 완료");
				} else {
					logger.info("오늘 날짜로 설정 실패");
				}
			}
			// 구독 만료일 갱신
			String path = service.sub(map);
			
			return path;
		} else {
			return "redirect:/user/login";
		}
	}
}
