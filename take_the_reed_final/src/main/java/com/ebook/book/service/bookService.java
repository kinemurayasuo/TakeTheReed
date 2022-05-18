package com.ebook.book.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ebook.book.DAO.BookListDAO;
import com.ebook.book.controller.BookController;
import com.ebook.book.vo.BookVO;
import com.ebook.book.vo.ReadVO;
import com.ebook.book.vo.StarVO;

@Service
public class bookService 
{
	@Autowired
	private BookListDAO dao;
	
	private static final Logger logger = LoggerFactory.getLogger(BookController.class);


	public int getTotalRecordsCount(String searchType, String searchWord) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("searchType", searchType);
		map.put("searchWord", searchWord);
		
		return dao.getTotalRecordCount(map);
		
	}

	public ArrayList<BookVO> bookListSearch(String searchType, String searchWord, String sort, int startRecord, int countPerPage) 
	{
		HashMap<String, Object> map = new HashMap<>();
		map.put("searchType", searchType);
		map.put("searchWord", searchWord);
		map.put("startRecord", startRecord);
		map.put("countPerPage", countPerPage);
		map.put("sort", sort);
		
		return dao.bookListSearch(map);
	}

	public ArrayList<BookVO> bookList(String searchType, String searchWord, String sort, int startRecord, int countPerPage) 
	{
		HashMap<String, Object> map = new HashMap<>();
		map.put("searchType", searchType);
		map.put("searchWord", searchWord);
		map.put("startRecord", startRecord);
		map.put("countPerPage", countPerPage);
		map.put("sort", sort);
		
		return dao.bookList(map);
	}

	public BookVO bookDetail(int bookNum, String userId) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("userId", userId);
		map.put("bookNum", bookNum);
		
		return dao.bookDetail(map);
	}
	
	public BookVO bookDetail2(int bookNum, String userId) 
	{
		HashMap<String, Object> map = new HashMap<>();
		map.put("userId", userId);
		map.put("bookNum", bookNum);
		
		return dao.bookDetail2(map);
	}

	public String getLikeChk(int bookNum, String userId) {
		HashMap<String,Object> map = new HashMap<>();
		map.put("bookNum", bookNum);
		map.put("userId", userId);
		
		return dao.getLikeChk(map);
	}

	public BookVO bookView(int bookNum) {
		return dao.bookView(bookNum);
	}

	public void updateBookCk(int bookNum) {
		dao.updateBookCk(bookNum);
	}

	public boolean insertReadBook(ReadVO newRead, String userId, int bookNum) {
		newRead.setUserId(userId);
		newRead.setBookNum(bookNum);
		
		logger.info("newRead: {}", newRead);
		
		return dao.insertReadBook(newRead) > 0;
	}

	public boolean insertLike(int bookNum, String userId) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("bookNum", bookNum);
		map.put("userId", userId);
		
		return dao.insertLike(map) > 0;
	}

	public void updateLikechk(int bookNum, String userId) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("bookNum", bookNum);
		map.put("userId", userId);
		
		dao.updateLikeChk(map);
	}

	public boolean deleteLike(int bookNum, String userId) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("bookNum", bookNum);
		map.put("userId", userId);
		
		return dao.deleteLike(map) > 0;
	}


	public boolean starUpdate(String loginId, int bookNum, int bookStar) 
	{
		
		StarVO star = new StarVO();
		star.setBookNum(bookNum);
		star.setUserId(loginId);
		star.setBookStar(bookStar);
		
		logger.info("Star : {}" , star);

		
		return dao.starUpdate(star) >0;
	}

	public double avgScore(int bookNum) 
	{
		return dao.avgScore(bookNum);
		
		
	}

	public ArrayList<BookVO> homeBookList() {
		
		return dao.homeBookList();
	}

	public StarVO starChk(int bookNum, String userId) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("bookNum", bookNum);
		map.put("userId", userId);
		
		return dao.starChk(map);
	}

	public StarVO star(int bookNum, String userId) 
	{
		HashMap<String, Object> map = new HashMap<>();
		map.put("bookNum", bookNum);
		map.put("userId", userId);
		
		return dao.star(map);
	}

	public boolean starInsert(String loginId, int bookNum, int bookStar) 
	{
		StarVO star = new StarVO();
		star.setBookNum(bookNum);
		star.setBookStar(bookStar);
		star.setUserId(loginId);
		
		logger.info("Star : {}" , star);
		
		return dao.starInsert(star) >0;
	}

	public String subEnd(String userId) {
		return dao.subEnd(userId);
	}

	public BookVO bookDetail3(int bookNum) {
		return dao.bookDetail3(bookNum);
	}

}
