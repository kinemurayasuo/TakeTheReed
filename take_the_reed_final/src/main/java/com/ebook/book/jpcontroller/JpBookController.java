package com.ebook.book.jpcontroller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ebook.book.service.bookService;
import com.ebook.book.util.PageNavigator;
import com.ebook.book.vo.BookVO;
import com.ebook.book.vo.ReadVO;
import com.ebook.book.vo.StarVO;

@Controller
@RequestMapping(value = "/jpBook")
public class JpBookController 
{
	private static final Logger logger = LoggerFactory.getLogger(JpBookController.class);
	
	private static final int COUNT_PER_PAGE = 12;
	private static final int PAGE_PER_GROUP = 10;
	
	@Autowired
	private bookService service;
	
	//테마 화면 가져오기
	@RequestMapping(value = "/bookList", method = RequestMethod.GET)
	public String bookList(@RequestParam(defaultValue = "1") int currentPage, String sort, Model model, String searchType, HttpSession session, String searchWord)
	{
		//전체
		logger.info("bookList 메소드 (GET)");
		logger.info("sort: {}", sort);

		logger.info("현재 페이지(currentPage): {}", currentPage);
		
		logger.info("searchType: {}", searchType);
		logger.info("searchWord: {}", searchWord);
		
		// 검색종류 검색어 입력 db 총 게시물 가져오기
		int totalRecordsCount = service.getTotalRecordsCount(null, null);
		logger.info("전체 게시글 수(totalRecordsCount): {}", totalRecordsCount);	
		
		//네비
		PageNavigator navi = new PageNavigator(COUNT_PER_PAGE, PAGE_PER_GROUP, currentPage, totalRecordsCount);
		model.addAttribute("navi", navi);
		
		// 게시글 시작 번호, 불러울 게시글 수를 전달해서 현재 페이지에 해당하는 10개의 개시글만 가져오도록 설정
		if(sort == null) {
			ArrayList<BookVO> bookList = service.bookList(null, null, sort, navi.getStartRecord(), COUNT_PER_PAGE);
			model.addAttribute("bookList", bookList);
			logger.info("bookList: {}", bookList);
			
		} else {
			
			return "redirect:/jp/book/bookListSearch?sort=" + sort;
		}
		
		return "jp/book/bookList";
	}
	
	@RequestMapping(value = "/bookListSearch", method = RequestMethod.GET)
	public String bookListSearch(@RequestParam(defaultValue = "1") int currentPage, Model model, HttpSession session, String sort,
			 String searchType,
			 String searchWord) 
	{	
		logger.info("bookListSearch매소드 실행(GET)");
		
		logger.info("searchType: {}", searchType);
		logger.info("searchWord: {}", searchWord);
		//전체
		int totalRecordsCount = service.getTotalRecordsCount(searchType,searchWord);
		logger.info("전체 게시글 수(totalRecordsCount): {}", totalRecordsCount);
		
		//네비
		PageNavigator navi = new PageNavigator(COUNT_PER_PAGE, PAGE_PER_GROUP, currentPage, totalRecordsCount);
		model.addAttribute("navi", navi);
		
		// 검색
		ArrayList<BookVO> bookList = service.bookListSearch(searchType, searchWord, sort, navi.getStartRecord(), COUNT_PER_PAGE);
		model.addAttribute("bookList", bookList);
		logger.info("bookList: {}", bookList);
			
		return "jp/book/bookList";
	}
	
	// 책 자세히 보기
	@RequestMapping(value="/bookDetail", method = RequestMethod.GET)
	public String bookDetail(int bookNum, Model model, HttpSession session) {
		logger.info("bookDetail 메소드 실행(GET)");
		
	     String userId = (String) session.getAttribute("loginId");
 		 logger.info("userId: {}", userId);
 		 logger.info("bookNum: {}", bookNum);
 		 
 		 if(userId != null) {
 			 StarVO star = service.star(bookNum, userId);
 			 model.addAttribute("star" , star);
 			 logger.info("star: {}", star);
 			 
 			 if(star == null) 
 			 {
 				 logger.info("detail 실행");
 				 BookVO bookDetail = service.bookDetail(bookNum, userId);
 				 logger.info("bookDetail: {}", bookDetail);
 				 logger.info("userId: {} " , userId);
 				 model.addAttribute("bookDetail", bookDetail);
 				 model.addAttribute("userId" , userId);
 				 
 			 } 
 			 else 
 			 {
 				 logger.info("detail2 실행");
 				 BookVO bookDetail2 = service.bookDetail2(bookNum, userId);
 				 logger.info("bookDetail2: {}", bookDetail2);
 				 model.addAttribute("bookDetail", bookDetail2);
 			 }
 			 
 			String likeChk = service.getLikeChk(bookNum, userId);
			logger.info("likeChk: {}", likeChk);
			if(likeChk == null) {
				model.addAttribute("likeChk", 0);
				logger.info("likeChk: {}", likeChk);
			} else {
				model.addAttribute("likeChk", likeChk);
				logger.info("likeChk: {}", likeChk);
			}
			
 		 } else {
 			 logger.info("detail3 실행");
 			BookVO bookDetail3 = service.bookDetail3(bookNum);
 			logger.info("bookDetail3: {}", bookDetail3);
 			model.addAttribute("bookDetail", bookDetail3);
 		 }
		
		
		model.addAttribute("bookNum", bookNum);
	
		
		return "jp/book/bookDetail";
	}

	// 책 보기
	@RequestMapping(value = "/bookView", method = RequestMethod.GET)
	public String bookView(int bookNum, ReadVO newRead, Model model, HttpSession session,
			HttpServletResponse response_equals) throws IOException {
		logger.info("bookView 메소드 실행(GET)");

		logger.info("bookNum: {}", bookNum);

		BookVO book = service.bookView(bookNum);
		service.updateBookCk(bookNum);

		logger.info("book: {}", book);

		// 책을 보지 못하는 유저
		
		String userId = (String) session.getAttribute("loginId");
		if(userId == null) {
			response_equals.setContentType("text/html; charset=UTF-8");
			PrintWriter out_equals = response_equals.getWriter();
			out_equals.println("<script>alert('로그인 후 이용 가능한 서비스 입니다.');" + "opener.location.href='/user/login';\r\n"
					+ "            window.close();</script>");
			out_equals.flush();
		} else {
			String subEnd = service.subEnd(userId);
			
			if (subEnd != null) 
			{
				logger.info("subEnd: {}", subEnd);
				boolean result = service.insertReadBook(newRead, userId, bookNum);
				if (result) {
					logger.info("과거내역 입력 완료");
					logger.info("newRead: {}", newRead);
				} else {
					logger.info("과거내역 입력 실패!!");
				}
				
				model.addAttribute("title", book.getBookName());
				model.addAttribute("bookCon", book.getSavedFilename2());
				model.addAttribute("book", book);
				
			} 
			else 
			{
				logger.info("subEnd: {}", subEnd);
				response_equals.setContentType("text/html; charset=UTF-8");
				PrintWriter out_equals = response_equals.getWriter();
				out_equals.println("<script>alert('구독자가 아닙니다.');" + "opener.location.href='/checkout/checkout';\r\n"
						+ "            window.close();</script>");
				out_equals.flush();
				
			}
		}
		return "jp/book/index";
	}
	
	// 찜 선택
	@ResponseBody
	@RequestMapping(value="/clickLike", method = RequestMethod.POST)
	public int clickLike(int bookNum, int likeChk, HttpSession session) {
		logger.info("clickLike 메소드 실행(POST)");
		logger.info("bookNum : {}", bookNum);
		logger.info("likeChk: {}", likeChk);
		String userId = (String) session.getAttribute("loginId");
		logger.info("userId: {}", userId);
		int mark = 0;
		
		if(userId == null) {
			mark = -1;
		} else if(likeChk == 0 && userId != null) {
			boolean result = service.insertLike(bookNum, userId);
			if(result) {
				service.updateLikechk(bookNum, userId);
				
				mark = 0;
			}
		} else if(likeChk == 1 && userId != null) {
			boolean result = service.deleteLike(bookNum, userId);
			
			mark = 1;
		}
		
		return mark;
	}
	 
	// 별점 하기
	@ResponseBody
	@RequestMapping(value="/starUpdate", method = RequestMethod.POST)
	
	// 변수없는데 가져올라고 하니까 오류먹지
	public double starUpdate(HttpSession session , int bookStar, StarVO star, Model model, int bookNum) 
	{
		logger.info("starUpdate 추천 하기(POST)");
		double score = 0.0;
		
		String userId = (String) session.getAttribute("loginId");
		
		StarVO starChk = service.starChk(bookNum, userId);
		logger.info("starChk : {} " , starChk);
		
		if(starChk == null) 
		{
			boolean result = service.starInsert(userId , bookNum, bookStar);
			if(result) 
			{
				logger.info("result 1 실행");
				
				score = service.avgScore(bookNum);
				logger.info("bookNum : {} " , bookNum);
				
				
				logger.info("score: {}", score);
			}
		}
			
		return score;
	}
}
