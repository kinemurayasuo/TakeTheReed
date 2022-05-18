package com.ebook.book.DAO;

import java.util.ArrayList;
import java.util.HashMap;

import com.ebook.book.vo.AskVO;
import com.ebook.book.vo.ReplyVO;

public interface AskListMapper 
{

	int insertAskWrite(AskVO newAskList); // 글쓰기

	int getTotalRecordsCount(HashMap<String, Object> map); // 게시글 전체 가져오기

	AskVO selectAsk(int askNum); // 글 읽기

	ArrayList<AskVO> askListSearch(HashMap<String, Object> map);	//검색

	int deleteAsk(int askNum);		//글 삭제

	int updateAsk(AskVO askList);	//글 수정 하기

	ArrayList<AskVO> askList(HashMap<String, Object> map); //정렬

	int replyWrite(ReplyVO reply); //댓글 쓰기

	int deleteReply(int replyNum); //댓글 삭제

	int updateReply(ReplyVO updateReply); //댓글 수정

	int deleteQuestionReply(int askNum); // 댓글 삭제

	ArrayList<ReplyVO> readAllReply(int askNum); // 글안에 댓글 불러오기

}
