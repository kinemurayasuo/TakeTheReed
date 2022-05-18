package com.ebook.book.DAO;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ebook.book.controller.BookController;
import com.ebook.book.vo.BookVO;
import com.ebook.book.vo.ReadVO;
import com.ebook.book.vo.StarVO;
@Repository
public class BookListDAO 
{
	@Autowired
	private SqlSession session;
	
	private static final Logger logger = LoggerFactory.getLogger(BookController.class);

	public int getTotalRecordCount(HashMap<String, Object> map) 
	{
		int result = 0;
		BookListMapper mapper = null;
		
		try {
			mapper = session.getMapper(BookListMapper.class); 
			result = mapper.getTotalRecordsCount(map);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;	
	}

	public ArrayList<BookVO> bookListSearch(HashMap<String, Object> map) 
	{
		ArrayList<BookVO> result = null;
		BookListMapper mapper = null;
		
		try {
			mapper = session.getMapper(BookListMapper.class);
			result = mapper.bookListSearch(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	public ArrayList<BookVO> bookList(HashMap<String, Object> map) 
	{
		ArrayList<BookVO> result = null;
		BookListMapper mapper = null;
		
		try {
			mapper = session.getMapper(BookListMapper.class);
			result = mapper.bookList(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	public BookVO bookDetail(HashMap<String, Object> map) {
		BookVO result = null;
		BookListMapper mapper = null;
		
		try {
			mapper = session.getMapper(BookListMapper.class);
			result = mapper.bookDetail(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public BookVO bookDetail2(HashMap<String, Object> map) {
		BookVO result = null;
		BookListMapper mapper = null;
		
		try {
			mapper = session.getMapper(BookListMapper.class);
			result = mapper.bookDetail2(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	public String getLikeChk(HashMap<String, Object> map) {
		String result =null;
		BookListMapper mapper = null;
		
		try {
			mapper = session.getMapper(BookListMapper.class);
			result = mapper.getLikeChk(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	public BookVO bookView(int bookNum) {
		BookVO result = null;
		BookListMapper mapper = null;
		
		try {
			mapper = session.getMapper(BookListMapper.class);
			result = mapper.bookView(bookNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	public void updateBookCk(int bookNum) {
		BookListMapper mapper = null;
		try {
			mapper = session.getMapper(BookListMapper.class);
			mapper.updateBookCk(bookNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	public int insertReadBook(ReadVO newRead) {
		int result = 0;
		BookListMapper mapper = null;
		
		try {
			mapper = session.getMapper(BookListMapper.class);
			result = mapper.insertReadBook(newRead);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	public int insertLike(HashMap<String, Object> map) {
		int result = 0;
		BookListMapper mapper = null;
		try {
			mapper = session.getMapper(BookListMapper.class);
			result = mapper.insertLike(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	public void updateLikeChk(HashMap<String, Object> map) {
		BookListMapper mapper = null;
		try {
			mapper = session.getMapper(BookListMapper.class);
			mapper.updateLikeChk(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int deleteLike(HashMap<String, Object> map) {
		int result = 0;
		BookListMapper mapper = null;
		try {
			mapper = session.getMapper(BookListMapper.class);
			result = mapper.deleteLike(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	public int starUpdate(StarVO star) 
	{
		int result = 0;
		BookListMapper mapper = null;
		try {
			mapper = session.getMapper(BookListMapper.class);
			result = mapper.starUpdate(star);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	public double avgScore(int bookNum) 
	{
		double result = 0.0;
		BookListMapper mapper = null;

		try {
			mapper = session.getMapper(BookListMapper.class);
			result = mapper.avgScore(bookNum);
			
			//평균을 위에서 구했으니까 그 값을 게시판 테이블에도 넣어주려고 하는거↓↓
			HashMap<String, Object> map = new HashMap<>();
			logger.info("bookStarAvg : {} " , result);
			map.put("bookStarAvg", result);
			logger.info("bookNum : {} " , bookNum);
			map.put("bookNum", bookNum);
			mapper.updateAvgScore(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	public ArrayList<BookVO> homeBookList() {
		ArrayList<BookVO> result = null;
		BookListMapper mapper = null;
		
		try {
			mapper = session.getMapper(BookListMapper.class);
			result = mapper.homeBookList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	public StarVO starChk(HashMap<String, Object> map) {
		StarVO result = null;
		BookListMapper mapper = null;
		try {
			mapper = session.getMapper(BookListMapper.class);
			result = mapper.starChk(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	public StarVO star(HashMap<String, Object> map) 
	{
		StarVO result = null;
		BookListMapper mapper = null;
		
		try {
			mapper = session.getMapper(BookListMapper.class);
			result = mapper.star(map);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	public int starInsert(StarVO star) 
	{
		int result = 0;
		BookListMapper mapper = null;
		try {
			mapper = session.getMapper(BookListMapper.class);
			result = mapper.starInsert(star);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	public String subEnd(String userId) {
		String result =null;
		BookListMapper mapper = null;
		
		try {
			mapper = session.getMapper(BookListMapper.class);
			result = mapper.subEnd(userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	public BookVO bookDetail3(int bookNum) {
		BookVO result = null;
		BookListMapper mapper = null;
		
		try {
			mapper = session.getMapper(BookListMapper.class);
			result = mapper.bookDetail3(bookNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

}
