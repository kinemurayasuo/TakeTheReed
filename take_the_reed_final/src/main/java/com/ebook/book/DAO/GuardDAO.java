package com.ebook.book.DAO;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ebook.book.vo.BookVO;
import com.ebook.book.vo.UserVO;

@Repository
public class GuardDAO 
{
	@Autowired
	private SqlSession session;
	
	private static final Logger logger = LoggerFactory.getLogger(GuardDAO.class);
	
	public ArrayList<UserVO> userList(HashMap<String, Object> map) 
	{
		ArrayList<UserVO> result = null;
		GuardMapper mapper = null;
		
		try {
			mapper = session.getMapper(GuardMapper.class);
			result = mapper.userList(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	public int bookUpload(BookVO newBook) {
		int result = 0;
		GuardMapper mapper = null;
		
		logger.info("newBook : {}", newBook);
		
		try {
			mapper = session.getMapper(GuardMapper.class);
			result = mapper.bookUpload(newBook);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	public BookVO bookView(int bookNum) 
	{
		BookVO result = null;
		GuardMapper mapper = null;
		
		try {
			mapper = session.getMapper(GuardMapper.class);
			result = mapper.bookView(bookNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	public int getTotalRecordCount(HashMap<String, Object> map) 
	{
		int result = 0;
		GuardMapper mapper = null;
		
		try {
			mapper = session.getMapper(GuardMapper.class); 
			result = mapper.getTotalRecordsCount(map);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;	
	}

	public ArrayList<BookVO> bookList(HashMap<String, Object> map) 
	{
		ArrayList<BookVO> result = null;
		GuardMapper mapper = null;
		
		try {
			mapper = session.getMapper(GuardMapper.class);
			result = mapper.bookList(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	public BookVO bookListDetail(int bookNum) {
		BookVO result = null;
		GuardMapper mapper = null;
		
		try {
			mapper = session.getMapper(GuardMapper.class);
			result = mapper.bookListDetail(bookNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}


	public int userDelete(String userId) 
	{
		int result = 0;
		GuardMapper mapper = null;
		
		try {
			mapper = session.getMapper(GuardMapper.class);
			result = mapper.userDelete(userId);
		} catch (Exception e) {
			e.printStackTrace();			
	}
		return result;
	}
	

	public int bookListDelete(String bookNum) 
	{
		int result = 0;
		GuardMapper mapper = null;
		
		try {
			mapper = session.getMapper(GuardMapper.class);
			result = mapper.bookListDelete(bookNum);
		} catch (Exception e) {
			e.printStackTrace();			
	}
		return result;
	}

	public int bookListUpdate(BookVO bookList) 
	{
		int result = 0;
		GuardMapper mapper = null;
		
		try {
			mapper = session.getMapper(GuardMapper.class);
			
			result = mapper.bookListUpdate(bookList);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	public String starUpdate(int bookStar) 
	{
		String result = null;
		GuardMapper mapper = null;
		try 
		{
			mapper = session.getMapper(GuardMapper.class);
			result = mapper.starUpdate(bookStar);
		} catch (Exception e) 
		{
			e.printStackTrace();
		}
		
		return result;
	}



}
