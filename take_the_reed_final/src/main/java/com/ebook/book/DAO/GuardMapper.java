package com.ebook.book.DAO;

import java.util.ArrayList;
import java.util.HashMap;

import com.ebook.book.vo.BookVO;
import com.ebook.book.vo.UserVO;

public interface GuardMapper {

	ArrayList<UserVO> userList(HashMap<String, Object> map); //유저 전체보기

	int bookUpload(BookVO newBook); // 책 관련 정보 업로드

	BookVO bookView(int bookNum); // 책 보기

	int getTotalRecordsCount(HashMap<String, Object> map); // 책 전체 보기

	ArrayList<BookVO> bookList(HashMap<String, Object> map); // 책 정보

	BookVO bookListDetail(int bookNum); // 북 상세

	String getLikeChk(HashMap<String, Object> map); //찜 체크

	int userDelete(String userId);	// 회원삭제

	int bookListDelete(String bookNum); // 책 삭제

	int bookListUpdate(BookVO bookList); // 책 수정

	String starUpdate(int bookStar); // 책 추천

	


}
