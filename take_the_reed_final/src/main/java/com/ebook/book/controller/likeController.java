package com.ebook.book.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ebook.book.service.LikeService;
import com.ebook.book.util.PageNavigator;
import com.ebook.book.vo.LikeVO;

@Controller
@RequestMapping(value="/like")
public class likeController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	private static final int COUNT_PER_PAGE = 10; // 한 페이지 당 보여줄 최대 게시글 수 private
	static final int PAGE_PER_GROUP = 5; // 한 그룹 당 보여줄 최대 페이지 수
	 
	@Autowired
	private LikeService service;
	
	// 내 서제 이동
	@RequestMapping(value = "/likeList", method = RequestMethod.GET)
	public String likeList(@RequestParam(defaultValue = "1") int currentPage, String sort, Model model, HttpSession session) {
		logger.info("likeList 메소드(GET)");
		logger.info("sort: {}", sort);
		
		// 사용자가 보길 원하는 게시판 페이지 수를 확인(기본값 1) 
		logger.info("현재 페이지(currentPage): {}",currentPage);
		
		// 로그인한 유저의 정보를 가져옴
		String userId = (String) session.getAttribute("loginId");
		logger.info("userId: {}", userId);
		
		// 검색종류 및 검색어를 입력해서 DB에서 총 게시글 수를 가져옴
		int totalRecordsCount = service.getTotalRecordsCount(userId, null, null);
		logger.info("전체 게시글 수(totalRecordsCount): {}", totalRecordsCount);
		 
		// 페이징 처리를 위한 내비게이터 객체 생성 
		PageNavigator navi = new PageNavigator(COUNT_PER_PAGE, PAGE_PER_GROUP, currentPage,totalRecordsCount);
		logger.info("생성된 페이지 내비게이터(navi): {}", navi);
		model.addAttribute("navi", navi);
		 
		if(sort == null) { 
			// xml에서 가져온 정보 저장
			 ArrayList<LikeVO> result = service.likeList(userId, sort, navi.getStartRecord(), COUNT_PER_PAGE);
			 logger.info("likeList: {}", result);
			 model.addAttribute("likeList", result); // attribute에 저장
		} else {
			return "redirect: /like/searchBoard?sort=" + sort;
		}
		 
		 return "like/likeList";
	 }
	
	@RequestMapping(value = "/likeListSearch", method = RequestMethod.GET)
	public String likeListSearch(@RequestParam(defaultValue = "1") int currentPage, Model model, HttpSession session, String sort,
			 String searchType, String searchWord) 
	{	
		logger.info("likeListSearch매소드 실행(GET)");
		
		logger.info("searchType: {}", searchType);
		logger.info("searchWord: {}", searchWord);
		
		// 로그인한 유저의 정보를 가져옴
		String userId = (String) session.getAttribute("loginId");
		logger.info("userId: {}", userId);
		
		//총 검색 갯수
		int totalRecordsCount = service.getTotalRecordsCount(userId, searchType,searchWord);
		logger.info("전체 게시글 수(totalRecordsCount): {}", totalRecordsCount);
		
		//네비
		PageNavigator navi = new PageNavigator(COUNT_PER_PAGE, PAGE_PER_GROUP, currentPage, totalRecordsCount);
		model.addAttribute("navi", navi);
		
		// 검색
		ArrayList<LikeVO> likeList = service.likeListSearch(userId, searchType, searchWord, sort, navi.getStartRecord(), COUNT_PER_PAGE);
		model.addAttribute("likeList", likeList);
		logger.info("likeList: {}", likeList);
			
		return "like/likeList";

	}
}
