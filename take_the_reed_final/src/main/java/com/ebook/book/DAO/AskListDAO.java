package com.ebook.book.DAO;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ebook.book.controller.AskController;
import com.ebook.book.vo.AskVO;
import com.ebook.book.vo.ReplyVO;

@Repository
public class AskListDAO 
{
	@Autowired
	private SqlSession session;
	
	private static final Logger logger = LoggerFactory.getLogger(AskController.class);
	
	public int insertAskWrite(AskVO newAskList) 
	{
		int result = 0;
	      AskListMapper mapper = null;
	      
	      try 
	      {
	         mapper = session.getMapper(AskListMapper.class);
	         result = mapper.insertAskWrite(newAskList);
	      } catch (Exception e) 
	      {
	         e.printStackTrace();
	      }      
	      return result;
	}

	public int getTotalRecordCount(HashMap<String, Object> map) 
	{
		int result = 0;
		AskListMapper mapper = null;
		
		try {
			mapper = session.getMapper(AskListMapper.class); 
			result = mapper.getTotalRecordsCount(map);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;	
	}

	public AskVO selectask(int askNum) 
	{
		AskVO result = null;		
		AskListMapper mapper = null;
		try {
			mapper = session.getMapper(AskListMapper.class);
			result = mapper.selectAsk(askNum);
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return result;
	}

	// 검색
	public ArrayList<AskVO> askListSearch(HashMap<String, Object> map) 
	{
		ArrayList<AskVO> result = null;
		AskListMapper mapper = null;
		
		try {
			mapper = session.getMapper(AskListMapper.class);
			result = mapper.askListSearch(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	public int deleteAsk(int askNum) 
	{
		int result = 0;
		AskListMapper mapper = null;
		
		try {
			mapper = session.getMapper(AskListMapper.class);
			result = mapper.deleteAsk(askNum);
		} catch (Exception e) {
			e.printStackTrace();			
	}
		return result;
	}


	public int updateAsk(AskVO askList) 
	{
		int result = 0;
		AskListMapper mapper = null;
		
		try {
			mapper = session.getMapper(AskListMapper.class);
			
			result = mapper.updateAsk(askList);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}


	public ArrayList<AskVO> askList(HashMap<String, Object> map) {
		ArrayList<AskVO> result = null;
		AskListMapper mapper = null;
		
		try {
			mapper = session.getMapper(AskListMapper.class);
			result = mapper.askList(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	public int replyWrite(ReplyVO reply) 
	{
		logger.info("reply", reply);
		int result = 0;
		AskListMapper mapper = null;
		try {
			mapper = session.getMapper(AskListMapper.class);
			result = mapper.replyWrite(reply);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public int deleteReply(int replyNum) 
	{
		int result = 0;
		AskListMapper mapper = null;
		try {
			mapper = session.getMapper(AskListMapper.class);
			result = mapper.deleteReply(replyNum);
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return result;
	}

	public int updateReply(ReplyVO updateReply) 
	{
		int result = 0;
		AskListMapper mapper = null;
		try {
			mapper = session.getMapper(AskListMapper.class);
			result = mapper.updateReply(updateReply);
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return result;
	}

	public int deleteQuestionReply(int askNum) 
	{
		int result = 0;
		AskListMapper mapper = null;
		try {
			mapper = session.getMapper(AskListMapper.class);
			result = mapper.deleteQuestionReply(askNum);
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return result;
	}

	public ArrayList<ReplyVO> readAllReply(int askNum) 
	{
		ArrayList<ReplyVO> result = null;
		AskListMapper mapper = null;
		try {
			mapper = session.getMapper(AskListMapper.class);
			result = mapper.readAllReply(askNum);
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return result;
	}
	

}


