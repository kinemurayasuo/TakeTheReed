package com.ebook.book.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ebook.book.DAO.GuardDAO;
import com.ebook.book.guard.GuardController;
import com.ebook.book.vo.BookVO;
import com.ebook.book.vo.UserVO;

@Service
public class GuardService 
{
	private static final Logger logger = LoggerFactory.getLogger(GuardController.class);

	@Autowired
	private GuardDAO dao;

	public ArrayList<UserVO> userList() 
	{
		HashMap<String, Object> map = new HashMap<>();
		
		return dao.userList(map);
	}

	public boolean bookUpload(BookVO newBook, String originalFilename1, String savedFilename1, String originalFilename2,
			String savedFilename2) 
	{
		newBook.setOriginalFilename1(originalFilename1);
		newBook.setSavedFilename1(savedFilename1);
		newBook.setOriginalFilename2(originalFilename2);
		newBook.setSavedFilename2(savedFilename2);
		
		logger.info("newBook: {}", newBook);
		
		return dao.bookUpload(newBook) > 0;
	}

	public BookVO bookView(int bookNum) 
	{
		return dao.bookView(bookNum);
	}

	public int getTotalRecordsCount() 
	{
		HashMap<String, Object> map = new HashMap<>();
		
		return dao.getTotalRecordCount(map);
	}

	public ArrayList<BookVO> bookList() 
	{
		HashMap<String, Object> map = new HashMap<>();
		
		return dao.bookList(map);
	}

	public BookVO bookListDetail(int bookNum) 
	{
		return dao.bookListDetail(bookNum);
	}

	public boolean userDelete(String userId) 
	{
		return dao.userDelete(userId) >0;
	}

	public boolean bookListDelete(String bookNum) 
	{
		return dao.bookListDelete(bookNum) >0;
		
	}

	public boolean bookListUpdate(BookVO bookList, String originalFilename1, String savedFilename1, String originalFilename2, String savedFilename2) 
	{
		bookList.setOriginalFilename1(originalFilename1);
		bookList.setSavedFilename1(savedFilename1);
		bookList.setOriginalFilename2(originalFilename2);
		bookList.setSavedFilename2(savedFilename2);
		
		logger.info("bookList: {}", bookList);
		
		return dao.bookListUpdate(bookList) >0;
	}

	public String starUpdate(int bookStar) 
	{
		return dao.starUpdate(bookStar);
	}




	
}
