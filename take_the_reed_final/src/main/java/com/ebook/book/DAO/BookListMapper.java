package com.ebook.book.DAO;

import java.util.ArrayList;
import java.util.HashMap;

import com.ebook.book.vo.BookVO;
import com.ebook.book.vo.ReadVO;
import com.ebook.book.vo.StarVO;

public interface BookListMapper 
{
	int getTotalRecordsCount(HashMap<String, Object> map);	// 전체게시글 카운트
	
	ArrayList<BookVO> bookListSearch(HashMap<String, Object> map);	//검색

	ArrayList<BookVO> bookList(HashMap<String, Object> map);	//정렬

	BookVO bookDetail(HashMap<String, Object> map); //북 상세 페이지

	String getLikeChk(HashMap<String, Object> map); //찜목록 체크

	BookVO bookView(int bookNum); //책 팝업화면 보기

	void updateBookCk(int bookNum); // 책 수정 체크

	int insertReadBook(ReadVO newRead); //책 읽기

	int insertLike(HashMap<String, Object> map); // 책 찜

	void updateLikeChk(HashMap<String, Object> map); // 찜 수정 체크

	int deleteLike(HashMap<String, Object> map); // 찜삭제

	int starUpdate(StarVO star); // 추천

	double avgScore(int bookNum); // 추천2

	void updateAvgScore(HashMap<String, Object> map); //추천3

	ArrayList<BookVO> homeBookList(); // 홈 북 리스트

	StarVO starChk(HashMap<String, Object> map); // 스타 확인

	BookVO bookDetail2(HashMap<String, Object> map); // 별점 입력시 보여줄 별점 게시글

	StarVO star(int bookNum, String userId); // 별점 테이블

	int starInsert(StarVO star); // 추천 입력

	String subEnd(String userId);	// 구독 여부

	BookVO bookDetail3(int bookNum);

	StarVO star(HashMap<String, Object> map);

}
