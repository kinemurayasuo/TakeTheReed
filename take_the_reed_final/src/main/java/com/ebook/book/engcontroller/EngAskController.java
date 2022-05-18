package com.ebook.book.engcontroller;

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

import com.ebook.book.service.AskListService;
import com.ebook.book.util.PageNavigator;
import com.ebook.book.vo.AskVO;
import com.ebook.book.vo.ReplyVO;

@Controller
@RequestMapping(value = "/eask")
public class EngAskController 
{
	private static final Logger logger = LoggerFactory.getLogger(EngAskController.class);
	
	private static final int COUNT_PER_PAGE = 10;
	private static final int PAGE_PER_GROUP = 10;
	
	@Autowired
	private AskListService service;

	// 문의사항 가져오기
	@RequestMapping(value = "/askList", method = RequestMethod.GET)
	public String askList(@RequestParam(defaultValue = "1") int currentPage, String sort, Model model, String searchType, HttpSession session, String searchWord) 
	{
		//전체
		logger.info("askList 메소드 (GET)");
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
			ArrayList<AskVO> askList = service.askList(null, null, sort, navi.getStartRecord(), COUNT_PER_PAGE);
			model.addAttribute("askList", askList);
			logger.info("askList: {}", askList);
			
		} else {
			
			return "redirect:/eng/ask/askListSearch?sort=" + sort;
		}
		
		return "eng/ask/askList";
	}
		
	@RequestMapping(value = "/askListSearch", method = RequestMethod.GET)
	public String askListSearch(@RequestParam(defaultValue = "1") int currentPage, Model model, HttpSession session, String sort,
			 String searchType,
			 String searchWord) 
	{	
		logger.info("askListSearch매소드 실행(GET)");
		
		logger.info("searchType: {}", searchType);
		logger.info("searchWord: {}", searchWord);
		//전체
		int totalRecordsCount = service.getTotalRecordsCount(searchType,searchWord);
		logger.info("전체 게시글 수(totalRecordsCount): {}", totalRecordsCount);
		
		//네비
		PageNavigator navi = new PageNavigator(COUNT_PER_PAGE, PAGE_PER_GROUP, currentPage, totalRecordsCount);
		model.addAttribute("navi", navi);
		
		// 검색
		ArrayList<AskVO> askList = service.askListSearch(searchType, searchWord, sort, navi.getStartRecord(), COUNT_PER_PAGE);
		model.addAttribute("askList", askList);
		logger.info("askList: {}", askList);
			
		return "eng/ask/askList";

	}
	// 문의사항 페이지 이동
	@RequestMapping(value = "/askListWrite", method = RequestMethod.GET)
	public String boardListWrite(Model model, HttpSession session) 
	{
		logger.info("askListWrite 메소드 실행(GET)");
		
		String userId = (String) session.getAttribute("loginId");
		model.addAttribute("userId", userId);
		
		String userNm = (String) session.getAttribute("loginName");
		model.addAttribute("userNm", userNm);
		
		logger.info("userId: {}", userId);
		logger.info("userNm: {}", userNm);
		return "eng/ask/askListWrite"; 
	}
	
	
	
	// 문의사항 쓰기
	@RequestMapping(value = "/askListWrite", method = RequestMethod.POST)
	public String askListWrite(Model model, HttpSession session, String askTitle, String askCon)
	{
		logger.info("askListWrite 메소드 실행 (POST)");
		
		String userId = (String) session.getAttribute("loginId");
		logger.info("userId: {}", userId);
		
		String userNm = (String) session.getAttribute("loginName");
		logger.info("userNm{} ", userNm);
		
		boolean result = service.insertAskWrite(askTitle, askCon, userId, userNm);
		
		String returnUrl = null;
		
		if(result) 
		{
			logger.info("게시판 입력 성공");
			returnUrl = "redirect:/eng/ask/askList";
		}
		else 
		{
			logger.info("게시판 입력에 실패 하였 습니다");
			returnUrl = "redirect:/eng/ask/askListWrite";
		}
		
		
		
		return returnUrl;
	}
	
	// 게시글 읽기
	@RequestMapping(value = "/ask", method = RequestMethod.GET)
	public String question(Model model, int askNum, HttpSession session) {
		logger.info("ask 메소드 실행(GET)");
		
		String userId = (String) session.getAttribute("loginId");
		model.addAttribute("userId", userId);
		
		String userNm = (String) session.getAttribute("loginName");
		model.addAttribute("userNm", userNm);
		
		AskVO askList = service.selectAsk(askNum);
		model.addAttribute("askList", askList);
		
		ArrayList<ReplyVO> replyList = service.readAllReply(askNum);
		model.addAttribute("replyList",replyList);

		return "eng/ask/ask";
	}
	
	// 글 수정 페이지 이동
	@RequestMapping(value = "/askListUpdate", method = RequestMethod.GET)
	public String updateQuestion(int askNum, Model model) {

		logger.info("askListUpdate 메소드 실행(GET)");

		AskVO askList = service.selectAsk(askNum);

		model.addAttribute("askList", askList);

		return "eng/ask/askListUpdate";
	}
	
	// 글 수정
	@RequestMapping(value = "/askListUpdate", method = RequestMethod.POST)
	public String updateQuestion(AskVO askList, HttpSession session, int askNum) {

		logger.info("updateUpdate 메소드 실행(POST)");

		String userId = (String) session.getAttribute("loginId");
		
		boolean result = service.updateAsk(askList, userId);
		
		String returnUrl = null;

		if (result) {
			logger.info("게시글 수정 성공");
			returnUrl = "redirect:/eng/ask/ask?askNum=" + askNum;
		} else {
			logger.info("게시글 수정 실패");
			returnUrl = "redirect:/eng/ask/askList";
		}

		
		return returnUrl;
		
	}
	
	//게시글 삭제
	@RequestMapping(value = "/deleteAsk", method = RequestMethod.GET)
	public String deleteQuestion(int askNum) {
		logger.info("deleteAsk 메소드 실행(GET)");	
		
		boolean resultPlus = service.deleteAskReply(askNum);
		if(resultPlus) {
			logger.info("글-댓글 삭제 성공");
		} else {
			logger.info("글-댓글 삭제 실패");
		}
		
		boolean result = service.deleteAsk(askNum);
		if (result) {
			logger.info("게시글 삭제 성공");
		} else {
			logger.info("게시글 삭제 실패");
		}

		return "redirect:/eng/ask/askList";
	}
	
	// 문의 댓글 쓰기
	@RequestMapping(value = "/replyWrite", method = RequestMethod.POST)
	public String replyWrite(HttpSession session,String replyContent,int askNum) {
		logger.info("replyWrite 메소드 실행(POST)");
		String userNm = (String) session.getAttribute("loginName");
		String userId = (String) session.getAttribute("loginId");
		
		boolean result = service.replyWrite(replyContent,askNum,userId,userNm);
						
		String returnUrl = null;
		if(result) {
			logger.info("댓글 작성 성공");
			returnUrl="redirect:/eng/ask/ask?askNum="+askNum;
		}else {
			logger.info("댓글 작성 실패");
			returnUrl="redirect:/eng/ask?askNum="+askNum;
		}
		return returnUrl;
	}
	

	// 댓글 삭제
	@RequestMapping(value="/deleteReply", method = RequestMethod.GET)
	public String deleteReply(int replyNum,int askNum) {
		logger.info("deleteReply 메소드 실행(GET)");
		
		logger.info("replyNum: {}", replyNum);
		logger.info("askNum: {}", askNum);
		boolean result = service.deleteReply(replyNum);
			if(result) {
			logger.info("댓글 삭제 성공");
			} else {
			logger.info("댓글 삭제 실패");
			}	
		
		return "redirect:/eng/ask/ask?askNum="+askNum; 
	}
	
	
	// 댓글 수정
	@RequestMapping(value="/updateReply", method = RequestMethod.POST)
	public String updateReply(int replyNum,int askNum,String replyContent) {
		logger.info("updateReply 메소드 실행(POST)");
		
		ReplyVO updateReply = new ReplyVO();
		updateReply.setReplyNum(replyNum);
		updateReply.setReplyContent(replyContent);
		boolean result = service.updateReply(updateReply);
		if(result) {
			logger.info("댓글 수정 성공");
		} else {
			logger.info("댓글 수정 실패");
		}	
		
		return "redirect:/eng/ask/ask?askNum="+askNum; 
	}
}