package com.ebook.book.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ebook.book.DAO.AskListDAO;
import com.ebook.book.controller.AskController;
import com.ebook.book.vo.AskVO;
import com.ebook.book.vo.ReplyVO;

@Service
public class AskListService 
{
	@Autowired
	private AskListDAO dao;
	
	private static final Logger logger = LoggerFactory.getLogger(AskController.class);
	
	// 문의사항 쓰기
	public boolean insertAskWrite(String askTitle, String askCon, String userId, String userNm) 
	{
		AskVO newAskList = new AskVO();
		
		newAskList.setAskTitle(askTitle);
		newAskList.setAskCon(askCon);
		newAskList.setUserId(userId);
		newAskList.setUserNm(userNm);
		
		logger.info("userId: {}" , userId);
		logger.info("userNm: {}", userNm);
		logger.info("newAskList: {}", newAskList); 
		
		
		return dao.insertAskWrite(newAskList) > 0;
	}

	
	// 문의사항 페이지
	public int getTotalRecordsCount(String searchType, String searchWord) 
	{
		HashMap<String, Object> map = new HashMap<>();
		map.put("searchType", searchType);
		map.put("searchWord", searchWord);
		
		return dao.getTotalRecordCount(map);
		
	}
	
	// 글 읽기
	public AskVO selectAsk(int askNum) 
	{
		return dao.selectask(askNum);
	}

	
	//검색
	
	public ArrayList<AskVO> askListSearch(String searchType, String searchWord, String sort, int startRecord, int countPerPage) 
	{
		HashMap<String, Object> map = new HashMap<>();
		map.put("searchType", searchType);
		map.put("searchWord", searchWord);
		map.put("startRecord", startRecord);
		map.put("countPerPage", countPerPage);
		map.put("sort", sort);
		
		return dao.askListSearch(map);
	}

	
	//글삭제
	public boolean deleteAsk(int askNum) 
	{
		return dao.deleteAsk(askNum) >0;
	}

	
	// 수정하기
	public boolean updateAsk(AskVO askList, String userId) 
	{
		logger.info("userId {} " , userId);
		askList.setUserId(userId);
		return dao.updateAsk(askList) >0;
	}

	//검색2
	public ArrayList<AskVO> askList(String searchType, String searchWord, String sort, int startRecord, int countPerPage) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("searchType", searchType);
		map.put("searchWord", searchWord);
		map.put("startRecord", startRecord);
		map.put("countPerPage", countPerPage);
		map.put("sort", sort);
		
		return dao.askList(map);
	}


	// 댓글 쓰기
	public boolean replyWrite(String replyContent, int askNum, String userId, String userNm) 
	{
		logger.info("userId {} " , userId);
		
		ReplyVO reply = new ReplyVO();
		reply.setReplyContent(replyContent);
		reply.setAskNum(askNum);
		reply.setUserId(userId);
		reply.setUserNm(userNm);
		return dao.replyWrite(reply) > 0;
	}


	// 댓글 삭제
	public boolean deleteReply(int replyNum) 
	{
		return dao.deleteReply(replyNum) > 0;
	}


	// 댓글 수정
	public boolean updateReply(ReplyVO updateReply) 
	{
		return dao.updateReply(updateReply) > 0; 
	}

	// 게시판에서 댓글 수정
	public boolean deleteAskReply(int askNum) 
	{
		return dao.deleteQuestionReply(askNum) > 0;
	}


	public ArrayList<ReplyVO> readAllReply(int askNum) 
	{
		return dao.readAllReply(askNum);
	}
	


	

	/*
	 * public boolean deleteAskWrite(int askNum) { // TODO Auto-generated method
	 * stub return false; }
	 */

}
