package com.ebook.book.guard;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ebook.book.service.GuardService;
import com.ebook.book.util.FileService;
import com.ebook.book.util.PageNavigator;
import com.ebook.book.vo.AskVO;
import com.ebook.book.vo.BookVO;
import com.ebook.book.vo.StarVO;
import com.ebook.book.vo.UserVO;



@Controller
@RequestMapping(value = "/admin")
public class GuardController 
{	
	private static final Logger logger = LoggerFactory.getLogger(GuardController.class);
	
	private static final int COUNT_PER_PAGE = 10;
	private static final int PAGE_PER_GROUP = 10;
	
	private static final String UPLOAD_PATH = "C:\\book_upload\\";
	
	@Autowired
	private GuardService service;
	
	@RequestMapping(value = "/admin")
	public String admin(Model model) 
	{
		logger.info("관리자님 환영합니다");
		
		return "admin/admin";
	}
	
	@RequestMapping(value = "/login")
	public String login(Model model) 
	{
		return "admin/login";
	}
	
	@RequestMapping(value = "/adminPage")
	public String adminPage(Model model, HttpSession session, String sort) 
	{
		logger.info("관리자 페이지");
		
		return "admin/adminPage";
	}
	
	@RequestMapping(value = "/userList")
	public String userList(Model model, HttpSession session) 
	{
		logger.info("관리자 페이지");
		
		ArrayList<UserVO> userList = service.userList();
		model.addAttribute("userList", userList);
		logger.info("userList: {}", userList);
		
		return "admin/userList";
	}
	
	//회원 삭제
	@RequestMapping(value = "/userDelete", method = RequestMethod.GET)
	public String userDelete(String userId) 
	{
		logger.info("userDelete 메소드 실행(GET)");	
		
		boolean result = service.userDelete(userId);
		if (result) {
			logger.info("회원정보 삭제 성공");
		} else {
			logger.info("회원정보 삭제 실패");
		}

		return "redirect:/admin/userList";
	}
	
	//회원 선택삭제
    @RequestMapping(value = "/userDelete")
    public String userListDeleteSelect(HttpServletRequest request) throws Exception {
            
        String[] ajaxMsg = request.getParameterValues("valueArr");
        int size = ajaxMsg.length;
        for(int i=0; i<size; i++) {
        	service.userDelete(ajaxMsg[i]);
        }
        return "redirect:/admin/userList";
    }
	
	
	
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
		int totalRecordsCount = service.getTotalRecordsCount();
		logger.info("전체 게시글 수(totalRecordsCount): {}", totalRecordsCount);	
		
		ArrayList<BookVO> bookList = service.bookList();
		model.addAttribute("bookList", bookList);
		logger.info("bookList: {}", bookList);
		
		return "admin/bookList";
	}
	
	// 책 관련 된 정보 올리기
	@RequestMapping(value="/bookUpload", method= RequestMethod.GET)
	public String bookUpload() {
		logger.info("upload 메소드 실행(GET)");
		
		return "admin/bookUpload";
	}
	
	@RequestMapping(value="/bookUpload", method = RequestMethod.POST)
	public String bookUpload(BookVO newBook, @RequestParam("uploadFile1")MultipartFile mfile1, @RequestParam("uploadFile2")MultipartFile mfile2, HttpSession session) {
		logger.info("bookUpload 메소드 실행(POST)");
		
		logger.info("newBook: {}", newBook);
		logger.info("mfile1: {}", mfile1);
		logger.info("mfile2: {}", mfile2);
		String originalFilename1 = null;
		if(mfile1 != null) {
			originalFilename1 = mfile1.getOriginalFilename();
			logger.info("originalFilename1: {}", mfile1.getOriginalFilename());
		}
		String originalFilename2 = null;
		if(mfile2 != null) {
			originalFilename2 = mfile2.getOriginalFilename();
			logger.info("originalFilename2: {}", mfile2.getOriginalFilename());
		}
		
		String savedFilename1 = FileService.saveFile(mfile1, UPLOAD_PATH);
		if(savedFilename1 != null) {
			logger.info("파일 저장 성공");
			logger.info("저장된 파일명 : {}", savedFilename1);
		} else {
			logger.info("파일 저장 실패");
		}
		String savedFilename2 = FileService.saveFile(mfile2, UPLOAD_PATH);
		if(savedFilename2 != null) {
			logger.info("파일 저장 성공");
			logger.info("저장된 파일명 : {}", savedFilename2);
		} else {
			logger.info("파일 저장 실패");
		}
		
		boolean result = service.bookUpload(newBook, originalFilename1, savedFilename1, originalFilename2, savedFilename2);
		String returnUrl = null;
		if(result) {
			logger.info("게시글 작성 성공");
			returnUrl = "redirect:/admin/bookList";
		} else {
			logger.info("게시글 작성 실패");
			returnUrl = "redirect:/admin/bookUpload";
		}
		
		return returnUrl;
	}
	
	@RequestMapping(value="/bookView", method = RequestMethod.GET)
	public String bookView(int bookNum, Model model, HttpSession session) {
		logger.info("bookView 메소드 실행(GET)");
		
		logger.info("bookNum: {}", bookNum);
		
		BookVO book = service.bookView(bookNum);
		logger.info("book: {}", book);
		
		model.addAttribute("title", book.getBookName());
		model.addAttribute("book", book);
		
		return "admin/index";
	}
	
	// 관리 책 자세히 보기
	@RequestMapping(value="/bookListDetail", method = RequestMethod.GET)
	public String bookDetail(int bookNum, Model model, HttpSession session) {
		logger.info("bookDetail 메소드 실행(GET)");
		
		logger.info("bookNum : {}", bookNum);
		BookVO bookDetail = service.bookListDetail(bookNum);
		logger.info("bookDetail: {}", bookDetail);
		model.addAttribute("bookDetail", bookDetail);
		
		return "admin/bookListDetail";
	}
	
	// 별점 주기
	@RequestMapping(value = "/bookListDetail", method = RequestMethod.POST)
	public String starUpdate(HttpSession session, Model model, int bookStar)
	{
		logger.info("bookDetail 메소드 실행 (POST)");
		
		logger.info("bookStar : {} " , bookStar);
		
		model.addAttribute("bookstar : {} " , bookStar);
		String userId = (String) session.getAttribute("loginId");
		
		String path = service.starUpdate(bookStar);
		
		logger.info("path : {} " , path);
		
		logger.info("userId : {} " , userId);
		
		return "admin/bookListDetail";
	}
	
	
	// 책 수정 페이지 이동
	@RequestMapping(value = "/bookListUpdate", method = RequestMethod.GET)
	public String updateQuestion(int bookNum, Model model) {

		logger.info("bookListUpdate 메소드 실행(GET)");

		logger.info("bookNum : {}", bookNum);
		BookVO bookDetail = service.bookListDetail(bookNum);
		logger.info("bookDetail: {}", bookDetail);
		model.addAttribute("bookDetail", bookDetail);
		
		return "admin/bookListUpdate";
	}
	
	// 책 수정
	@RequestMapping(value = "/bookListUpdate", method = RequestMethod.POST)
	public String bookListUpdate(BookVO BookList, @RequestParam("uploadFile1")MultipartFile mfile1, @RequestParam("uploadFile2")MultipartFile mfile2, HttpSession session, int bookNum) {

		logger.info("bookListUpdate 메소드 실행(POST)");
		
		
		logger.info("BookList: {}", BookList);
		logger.info("mfile1: {}", mfile1);
		logger.info("mfile2: {}", mfile2);
		
		String originalFilename1 = null;
		if(mfile1 != null) {
			originalFilename1 = mfile1.getOriginalFilename();
			logger.info("originalFilename1: {}", mfile1.getOriginalFilename());
		}
		String originalFilename2 = null;
		if(mfile2 != null) {
			originalFilename2 = mfile2.getOriginalFilename();
			logger.info("originalFilename2: {}", mfile2.getOriginalFilename());
		}
		
		String savedFilename1 = FileService.saveFile(mfile1, UPLOAD_PATH);
		if(savedFilename1 != null) {
			logger.info("파일 저장 성공");
			logger.info("저장된 파일명 : {}", savedFilename1);
		} else {
			logger.info("파일 저장 실패");
		}
		String savedFilename2 = FileService.saveFile(mfile2, UPLOAD_PATH);
		if(savedFilename2 != null) {
			logger.info("파일 저장 성공");
			logger.info("저장된 파일명 : {}", savedFilename2);
		} else {
			logger.info("파일 저장 실패");
		}
		
		boolean result = service.bookListUpdate(BookList, originalFilename1, savedFilename1, originalFilename2, savedFilename2);
		
		String returnUrl = null;

		if (result) {
			logger.info("책 수정 성공");
			returnUrl = "redirect:/admin/bookList?bookNum=" + bookNum;
		} else {
			logger.info("책 수정 실패");
			returnUrl = "redirect:/admin/bookList";
		}

		
		return returnUrl;
		
	}
	
	// 책 삭제
	@RequestMapping(value = "/bookListDelete", method = RequestMethod.GET)
	public String bookListDelete(String bookNum) {
		logger.info("bookListDelete 메소드 실행(GET)");	
		
		boolean result = service.bookListDelete(bookNum);
		if (result) {
			logger.info("게시글 삭제 성공");
		} else {
			logger.info("게시글 삭제 실패");
		}

		return "redirect:/admin/bookList";
	}
	
	//책 선택삭제
    @RequestMapping(value = "/bookListDelete")
    public String bookListDeleteSelect(HttpServletRequest request) throws Exception {
            
        String[] ajaxMsg = request.getParameterValues("valueArr");
        int size = ajaxMsg.length;
        for(int i=0; i<size; i++) {
        	service.bookListDelete(ajaxMsg[i]);
        }
        return "redirect:/admin/bookList";
    }
	
}
